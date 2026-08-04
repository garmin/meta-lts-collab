FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-64505.patch \
    file://CVE-2025-64506.patch \
    file://CVE-2025-64720.patch \
    file://CVE-2025-65018-01.patch \
    file://CVE-2025-65018-02.patch \
    file://CVE-2025-66293-01.patch \
    file://CVE-2025-66293-02.patch \
    file://CVE-2026-22801.patch \
    file://CVE-2026-25646.patch \
    file://CVE-2026-33636.patch \
    file://CVE-2026-33416-01.patch \
    file://CVE-2026-33416-02.patch \
    file://CVE-2026-33416-03.patch \
    file://CVE-2026-33416-04.patch \
    file://CVE-2026-34757-01.patch \
    file://CVE-2026-34757-02.patch \
    "
