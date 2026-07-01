FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = "\
    file://CVE-2023-52425.patch \
    file://CVE-2025-59375.patch \
"
