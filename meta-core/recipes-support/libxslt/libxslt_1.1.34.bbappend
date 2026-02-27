FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2024-55549.patch \
    file://CVE-2025-24855.patch \
    "
