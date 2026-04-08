FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2024-56326-01.patch \
    file://CVE-2024-56326-02.patch \
    file://CVE-2025-27516.patch \
"
