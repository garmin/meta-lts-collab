FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2023-35945.patch \
    file://CVE-2023-44487.patch \
    "
