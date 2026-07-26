FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-27113.patch \
    file://CVE-2025-32414.patch \
    file://CVE-2025-32415.patch \
    file://CVE-2024-34459.patch \
    file://CVE-2024-56171.patch \
    file://CVE-2025-24928.patch \
    file://CVE-2025-6021.patch \
    file://CVE-2022-49043.patch \
    file://CVE-2025-9714.patch \
    file://CVE-2025-8732.patch \
    file://CVE-2026-0989.patch \
    file://CVE-2026-0990.patch \
    file://CVE-2026-0992-01.patch \
    file://CVE-2026-0992-02.patch \
    "
