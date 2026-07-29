FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
    file://CVE-2026-4046.patch \
    file://CVE-2026-4437.patch \
    file://CVE-2026-4438.patch \
    file://CVE-2026-5450.patch \
    file://CVE-2026-5928.patch \
    file://CVE-2026-5435.patch \
"

# glibc https://nvd.nist.gov/vuln/detail/CVE-2026-3904
# The fix was backported upstream as commit
# 6bcd5d8e3668d52388a6e0580611749f93e6871f
CVE_CHECK_IGNORE += "CVE-2026-3904"

# glibc https://nvd.nist.gov/vuln/detail/CVE-2026-6238
# Affects deprecated debugging functions in the GNU C Library
#
# These functions are for application debugging only and hence not in the
# path of code executed by the DNS resolver.
# https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2026-0012
CVE_CHECK_IGNORE += "CVE-2026-6238"
