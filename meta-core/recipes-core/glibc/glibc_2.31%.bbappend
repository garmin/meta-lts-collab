FILESEXTRAPATHS_append := ":${THISDIR}/glibc"

SRC_URI_append = " \
    file://CVE-2025-4802-01.patch \
    file://CVE-2025-4802-02.patch \
    file://CVE-2025-4802-03.patch \
    file://CVE-2025-4802-04.patch \
    file://CVE-2024-33599.patch \
    file://CVE-2024-33600-01.patch \
    file://CVE-2024-33600-02.patch \
    file://CVE-2024-33601-CVE-2024-33602.patch \
    "
