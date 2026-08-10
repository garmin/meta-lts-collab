FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
    file://CVE-2026-58016-1.patch \
    file://CVE-2026-58016-2.patch \
    file://CVE-2026-58010.patch \
    file://CVE-2026-58011.patch \
    file://CVE-2026-58012.patch \
    file://CVE-2026-58013.patch \
    file://CVE-2026-58014.patch \
"
