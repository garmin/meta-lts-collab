FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-61144.patch \
    file://CVE-2026-4775.patch \
    "
