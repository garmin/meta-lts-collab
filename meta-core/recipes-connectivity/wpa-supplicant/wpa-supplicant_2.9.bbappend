FILESEXTRAPATHS_prepend := '${THISDIR}/files:'

SRC_URI += " \
    file://CVE-2023-52160.patch \
    file://CVE-2024-5290.patch \
    "
