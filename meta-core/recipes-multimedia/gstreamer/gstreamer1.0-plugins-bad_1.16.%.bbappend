FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += "\
    file://CVE-2023-40474.patch \
    file://CVE-2023-40476.patch \
    file://CVE-2023-44446.patch \
    file://CVE-2023-37329.patch \
    file://CVE-2025-3887.patch \
"
