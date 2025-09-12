FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2023-53154.patch \
    "
