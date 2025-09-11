FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-27363.patch \
    "
