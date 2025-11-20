FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-27113.patch \
    file://CVE-2025-32414.patch \
    file://CVE-2025-32415.patch \
    file://CVE-2024-34459.patch \
    file://CVE-2024-56171.patch \
    "
