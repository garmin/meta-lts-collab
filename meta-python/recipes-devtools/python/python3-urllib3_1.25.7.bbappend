FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-50181.patch \
    file://CVE-2025-66418.patch \
"
