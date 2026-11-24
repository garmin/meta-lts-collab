"""Merge sysvinit and systemd Poky v1 CVE summaries for one dashboard branch."""

import argparse
import json
from pathlib import Path


def index(rows, key, where):
    if not isinstance(rows, list):
        raise TypeError(f"{where}: expected an array")
    result = {}
    for row in rows:
        value = row.get(key) if isinstance(row, dict) else None
        if not isinstance(value, str) or not value:
            raise ValueError(f"{where}: missing or invalid {key}")
        if value in result:
            raise ValueError(f"{where}: duplicate {key} {value}")
        result[value] = row
    return result


def read_report(path, systemd):
    with path.open(encoding="utf-8") as src:
        report = json.load(src)
    if not isinstance(report, dict) or report.get("version") != "1":
        raise ValueError(f"{path}: expected a Poky v1 summary")
    packages = index(report.pop("package", None), "name", f"{path}: package")
    if not packages:
        raise ValueError(f"{path}: empty universe summary")
    if ("systemd" in packages) != systemd:
        expected = "include" if systemd else "exclude"
        raise ValueError(f"{path}: scan must {expected} the systemd recipe")
    for name, pkg in packages.items():
        where = f"{path}: {name}"
        for key in ("layer", "version"):
            if not isinstance(pkg.get(key), str) or not pkg[key]:
                raise ValueError(f"{where}: missing or invalid {key}")
        products = pkg.get("products")
        if not isinstance(products, list) or any(
            not isinstance(p, dict)
            or not isinstance(p.get("product"), str)
            or not p["product"]
            or p.get("cvesInRecord") not in ("Yes", "No")
            for p in products
        ):
            raise ValueError(f"{where}: invalid products")
        pkg["issue"] = index(pkg.get("issue"), "id", f"{where}: issue")
        for cve, issue in pkg["issue"].items():
            if issue.get("status") not in ("Patched", "Unpatched", "Ignored"):
                raise ValueError(
                    f"{where}/{cve}: invalid status {issue.get('status')!r}"
                )
    return report, packages


def require_match(left, right, where, except_keys=()):
    for key in sorted((left.keys() | right.keys()).difference(except_keys)):
        if key not in left or key not in right or left[key] != right[key]:
            raise ValueError(
                f"{where}: conflicting {key}: {left.get(key)!r} vs {right.get(key)!r}"
            )


def merge(sysvinit, systemd):
    header, packages = read_report(sysvinit, False)
    other_header, other_packages = read_report(systemd, True)
    require_match(header, other_header, "summary")
    for name, other in other_packages.items():
        if name not in packages:
            packages[name] = other
            continue
        pkg = packages[name]
        require_match(pkg, other, name, except_keys=("products", "issue"))

        # Poky omits the vendor from each product observation. Even identical
        # rows can occur multiple times; take the multiset union of whole rows.
        unmatched = pkg["products"].copy()
        for product in other["products"]:
            if product in unmatched:
                unmatched.remove(product)
            else:
                pkg["products"].append(product)

        for cve, issue in other["issue"].items():
            if cve in pkg["issue"]:
                require_match(pkg["issue"][cve], issue, f"{name}/{cve}")
            else:
                pkg["issue"][cve] = issue

    if len({name.lower() for name in packages}) != len(packages):
        raise ValueError("ambiguous case-insensitive package lookup on the dashboard")
    header["package"] = [packages[name] for name in sorted(packages)]
    for pkg in header["package"]:
        pkg["issue"] = [pkg["issue"][cve] for cve in sorted(pkg["issue"])]
    return header


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    for arg in ("sysvinit", "systemd", "output"):
        parser.add_argument(arg, type=Path)
    args = parser.parse_args()
    try:
        summary = merge(args.sysvinit, args.systemd)
        with args.output.open("w", encoding="utf-8") as output:
            json.dump(summary, output, indent=2)
            output.write("\n")
    except (OSError, TypeError, ValueError) as error:
        parser.exit(1, f"{args.output}: {error}\n")
