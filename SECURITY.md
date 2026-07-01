# Security Policy

## Supported Versions

| Version | Codename  | Supported          |
| ------- | --------- | ------------------ |
|   3.1   | Dunfell   | :white_check_mark: |
|   4.0   | Kirkstone | :white_check_mark: |

## Scope

meta-lts-collab is a Yocto Project metadata layer (bbappend files only —
no bbclasses, recipes with custom `do_*` task overrides, or other code
executed by BitBake). Given this, the primary security concern for this
project is not a runtime vulnerability in layer code, but the integrity
of the patches distributed through it: a patch that is claimed to fix a
CVE but does not, or that introduces a new vulnerability (intentionally
or accidentally) into a recipe it modifies.

## Disclaimer

This layer does not guarantee that firmware built with it is secure or
CVE-free. It is a community effort to share security fixes for older,
EOL Yocto versions, provided on a best-effort basis. Users are
responsible for evaluating the security of their own builds, including
verifying that patches in this layer apply cleanly and correctly to
their specific configuration.

This applies to the vulnerability handling process below as well:
response times and fixes are best-effort, not a service-level
commitment.

## Reporting a Vulnerability

**If you are reporting a CVE affecting a recipe covered by this layer**
(i.e. you want it tracked for backporting), please open a public issue
using the CVE issue template. These are already public vulnerabilities,
so there is no need for a private report.

**If you are reporting a security concern about the layer itself** —
for example, a merged patch that you believe introduces a vulnerability,
mislabels a fix, or was submitted in bad faith — please use
[GitHub's private vulnerability reporting](../../security/advisories/new)
for this repository rather than a public issue, so it can be triaged
before any further discussion.

You should expect an initial response within 14 days. After triage:

- If confirmed, we will work with you on a fix and, if the issue affects
  already-released patches, publish a GitHub Security Advisory once a
  correction is available.
- If declined, we will explain why (e.g. not reproducible, not
  applicable to the supported recipe versions, working as intended).

## Response Timeline for Layer-Introduced Vulnerabilities

If a patch merged into this layer is found to not fix the CVE it claims
to, or to introduce a new vulnerability into a recipe it modifies, we
will publish a corrected patch within 60 days of the issue becoming
publicly known. This project does not commit to a fix timeline for
vulnerabilities in upstream recipes that have not yet been addressed by
this layer — see Disclaimer above.

## Patch Review Process

To mitigate the risk of a malicious or incorrect patch being merged:

- All bbappend/patch contributions require review and approval from a
  maintainer who is not the author before merging.
- Patches claiming to fix a CVE must reference the CVE ID and, where
  possible, link to the upstream commit or advisory the patch is derived
  from, so provenance can be checked against the claimed fix.
- Patches are expected to match (or be a minimal backport of) an
  upstream/NVD-referenced fix; patches that diverge from the referenced
  fix without explanation are treated as higher risk and are subject to
  closer review.
