FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
           file://CVE-2026-32776.patch \
           file://CVE-2026-32777.patch \
           file://CVE-2026-32778.patch \
"
