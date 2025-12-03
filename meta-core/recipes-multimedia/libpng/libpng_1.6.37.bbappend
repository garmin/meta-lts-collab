FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-64505.patch \
    file://CVE-2025-64506.patch \
    file://CVE-2025-64720.patch \
    "
