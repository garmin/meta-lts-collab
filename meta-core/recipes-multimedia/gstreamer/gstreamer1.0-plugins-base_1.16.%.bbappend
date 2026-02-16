FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += " \
    file://CVE-2024-47600.patch \
    file://CVE-2023-37327.patch \
    file://CVE-2023-37328.patch \
    file://CVE-2024-47615.patch \
    file://CVE-2024-47607.patch \
    file://CVE-2024-47538.patch \
    file://CVE-2025-47806.patch \
"
