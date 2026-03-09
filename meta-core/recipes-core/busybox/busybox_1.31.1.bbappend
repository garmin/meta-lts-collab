FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-46394-01.patch \
    file://CVE-2025-46394-02.patch \
    file://CVE-2025-60876.patch \
"
