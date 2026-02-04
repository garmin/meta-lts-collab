FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-4802-01.patch \
    file://CVE-2025-4802-02.patch \
    file://CVE-2025-4802-03.patch \
    file://CVE-2025-4802-04.patch \
    file://CVE-2024-33599.patch \
    file://CVE-2024-33600-01.patch \
    file://CVE-2024-33600-02.patch \
    file://CVE-2024-33601-CVE-2024-33602.patch \
    file://CVE-2026-0915.patch \
    file://CVE-2026-0861.patch \
    "
