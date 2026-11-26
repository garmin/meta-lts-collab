FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
    file://CVE-2026-117610.patch \
    file://storeAtts-unsigned-namespace-index.patch \
    file://CVE-2026-118370-01.patch \
    file://CVE-2026-118370-02.patch \
"
