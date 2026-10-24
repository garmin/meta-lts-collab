FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2023-32681.patch \
    file://CVE-2026-25645.patch \
"
