import json
import subprocess
import sys
import unittest
from pathlib import Path
from tempfile import TemporaryDirectory

from merge_cve_reports import merge


def issue(number, status, **fields):
    cve = f"CVE-2000-{number:04d}"
    return {
        "id": cve,
        "status": status,
        "summary": "Fixture",
        "scorev2": "0.0",
        "scorev3": "7.5",
        "vector": "NETWORK",
        "link": f"https://nvd.nist.gov/vuln/detail/{cve}",
        **fields,
    }


def package(name, *issues):
    return {
        "name": name,
        "version": "1.0",
        "layer": "meta",
        "products": [{"product": name, "cvesInRecord": "Yes"}],
        "issue": list(issues),
    }


class MergeReportsTest(unittest.TestCase):
    def setUp(self):
        tmp = TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.default = Path(tmp.name, "sysvinit.json")
        self.systemd = Path(tmp.name, "systemd.json")

    def write(self, path, *packages):
        path.write_text(json.dumps({"version": "1", "package": packages}))

    def test_union_preserves_both_report_formats(self):
        # Kirkstone emits additional CVSS fields; Dunfell doesn't.
        for extra in ({}, {"scorev4": "5.9", "vectorString": "CVSS:3.1/AV:N"}):
            with self.subTest(extra=extra):
                a, b, c = (
                    issue(n, status, **extra)
                    for n, status in enumerate(("Patched", "Ignored", "Unpatched"), 1)
                )
                left, right = package("zlib", a, b), package("zlib", a, c)
                yes = {"product": "zlib", "cvesInRecord": "Yes"}
                no = {"product": "zlib", "cvesInRecord": "No"}
                left["products"] = [yes, no, yes]
                right["products"] = [no, yes, no]
                sysv = package("sysvinit")
                enabled = package("systemd", c)
                native = package("zlib-native", a)
                self.write(self.default, left, sysv, native)
                self.write(self.systemd, right, enabled, native)
                expected = dict(left, products=[yes, no, yes, no], issue=[a, b, c])
                self.assertEqual(
                    merge(self.default, self.systemd),
                    {"version": "1", "package": [enabled, sysv, expected, native]},
                )

    def test_ambiguous_package_or_finding_does_not_publish(self):
        finding = issue(1, "Unpatched")
        shared = package("zlib", finding)
        self.write(self.default, shared)
        for change, diagnostic in (
            ({"version": "2"}, "zlib: conflicting version"),
            ({"layer": "meta-oe"}, "zlib: conflicting layer"),
            ({"issue": [dict(finding, status="Ignored")]}, "conflicting status"),
            ({"issue": [dict(finding, scorev3="0.0")]}, "conflicting scorev3"),
        ):
            with self.subTest(change=change):
                self.write(self.systemd, package("systemd"), dict(shared, **change))
                output = self.default.with_name("kirkstone-cve-summary.json")
                result = subprocess.run(
                    [
                        sys.executable,
                        Path(__file__).with_name("merge_cve_reports.py"),
                        self.default,
                        self.systemd,
                        output,
                    ],
                    capture_output=True,
                    text=True,
                    check=False,
                )
                self.assertNotEqual(result.returncode, 0)
                self.assertIn(diagnostic, result.stderr)
                self.assertFalse(output.exists())

    def test_missing_or_malformed_scan_is_not_an_empty_configuration(self):
        self.write(self.default, package("sysvinit"))
        with self.assertRaises(FileNotFoundError):
            merge(self.default, self.systemd)
        valid = package("systemd")
        finding = issue(1, "Patched")
        for report in (
            {"version": "2", "package": [valid]},
            {"version": "1", "package": []},
            {"version": "1", "package": [package("sysvinit")]},
            {"version": "1", "package": [valid, valid]},
            {"version": "1", "package": [dict(valid, issue=None)]},
            {"version": "1", "package": [dict(valid, issue=[finding, finding])]},
            {"version": "1", "package": [package("systemd", issue(1, "Unknown"))]},
        ):
            with self.subTest(report=report):
                self.systemd.write_text(json.dumps(report))
                with self.assertRaises((TypeError, ValueError)):
                    merge(self.default, self.systemd)
        self.write(self.systemd, valid)
        self.write(self.default, valid)
        with self.assertRaisesRegex(ValueError, "exclude the systemd recipe"):
            merge(self.default, self.systemd)


if __name__ == "__main__":
    unittest.main()
