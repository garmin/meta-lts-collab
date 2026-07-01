FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
    file://CVE-2026-4424-1.patch \
    file://CVE-2026-4424-2.patch \
    file://CVE-2026-4426_CVE-2026-5121.patch \
"
