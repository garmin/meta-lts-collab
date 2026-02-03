FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-68160.patch \
    file://CVE-2025-69418.patch \
    file://CVE-2025-69419.patch \
    "
