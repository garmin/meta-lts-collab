FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-2784-1.patch \
    file://CVE-2025-2784-2.patch \
    file://CVE-2024-52530.patch \
    "
