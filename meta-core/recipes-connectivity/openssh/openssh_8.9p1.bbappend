FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
    file://CVE-2026-35385.patch \
    file://CVE-2026-35386.patch \
    file://CVE-2026-35387.patch \
    file://CVE-2026-35388.patch \
    file://CVE-2026-35414.patch \
"
