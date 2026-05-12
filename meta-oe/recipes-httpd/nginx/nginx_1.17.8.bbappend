FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://0001-CVE-2022-41741-CVE-2022-41742.patch \
    file://CVE-2025-23419.patch \
    file://CVE-2025-53859.patch \
    file://CVE-2026-1642.patch \
    "

CVE_PRODUCT = "nginx:nginx f5:nginx_open_source f5:nginx"
