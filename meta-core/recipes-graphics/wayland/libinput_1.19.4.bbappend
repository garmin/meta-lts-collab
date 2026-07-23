FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
    file://CVE-2026-50292-01.patch \
    file://CVE-2026-50292-02.patch \
    "

# cpe-incorrect:
# The lua plugin was not even added until 1.29.901~96, therefore this CVE does
# not apply to our version and we can safely ignore it.
CVE_CHECK_IGNORE += "CVE-2026-35093 CVE-2026-35094"
