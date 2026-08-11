FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-70873.patch \
    file://CVE-2026-11822_CVE-2026-11824.patch \
"
