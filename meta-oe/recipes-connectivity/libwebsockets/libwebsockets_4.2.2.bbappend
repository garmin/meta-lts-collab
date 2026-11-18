FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
    file://CVE-2026-19773-1.patch \
    file://CVE-2026-19773-2.patch \
"
