FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-23419.patch \
    file://CVE-2026-1642.patch \
    file://CVE-2026-42945.patch \
    file://CVE-2026-9256.patch \
"

CVE_PRODUCT = "nginx:nginx f5:nginx_open_source f5:nginx"
