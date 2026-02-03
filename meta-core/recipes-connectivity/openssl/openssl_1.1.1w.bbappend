FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-68160.patch \
    file://CVE-2025-69418.patch \
    file://CVE-2025-69419.patch \
    file://CVE-2025-69420.patch \
    file://CVE-2026-22795-CVE-2026-22796.patch \
    "
