FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-4802-01.patch \
    file://CVE-2025-4802-02.patch \
    file://CVE-2025-4802-03.patch \
    file://CVE-2025-4802-04.patch \
    file://CVE-2024-33599.patch \
    file://CVE-2024-33600-01.patch \
    file://CVE-2024-33600-02.patch \
    file://CVE-2024-33601-CVE-2024-33602.patch \
    file://CVE-2026-0915.patch \
    file://CVE-2026-0861.patch \
    file://CVE-2025-15281.patch \
    file://CVE-2024-2961.patch \
    file://CVE-2026-4046.patch \
    file://CVE-2026-5450.patch \
    file://CVE-2026-5928.patch \
    "

# glibc https://nvd.nist.gov/vuln/detail/CVE-2026-6238
# glibc https://nvd.nist.gov/vuln/detail/CVE-2026-5435
# Affects deprecated debugging functions in the GNU C Library
#
# These functions are for application debugging only and hence not in the
# path of code executed by the DNS resolver.
# https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2026-0012
# https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2026-0011
CVE_CHECK_WHITELIST += "CVE-2026-6238 CVE-2026-5435"
