FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
    file://CVE-2026-4046.patch \
    file://CVE-2026-4437.patch \
    file://CVE-2026-4438.patch \
"

# glibc https://nvd.nist.gov/vuln/detail/CVE-2026-3904
# The fix was backported upstream as commit
# 6bcd5d8e3668d52388a6e0580611749f93e6871f
CVE_CHECK_IGNORE += "CVE-2026-3904"
