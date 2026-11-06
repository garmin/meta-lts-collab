FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2024-38428.patch \
    file://CVE-2026-58469.patch \
    file://CVE-2026-58470.patch \
    file://CVE-2026-58471.patch \
    file://CVE-2026-58472.patch \
"
