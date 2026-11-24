FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2024-45490.patch \
    file://CVE-2024-45491.patch \
    file://CVE-2024-45492.patch \
    file://CVE-2024-28757.patch \
    file://CVE-2024-50602-01.patch \
    file://CVE-2024-50602-02.patch \
    file://CVE-2026-24515.patch \
    file://CVE-2026-25210-01.patch \
    file://CVE-2026-25210-02.patch \
    file://CVE-2026-25210-03.patch \
    file://CVE-2026-117610.patch \
    file://storeAtts-unsigned-namespace-index.patch \
    file://CVE-2026-118370-01.patch \
    file://CVE-2026-118370-02.patch \
    "
