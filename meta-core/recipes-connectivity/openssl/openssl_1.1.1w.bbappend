FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-68160.patch \
    file://CVE-2025-69418.patch \
    file://CVE-2025-69419.patch \
    file://CVE-2025-69420.patch \
    file://CVE-2026-22795-CVE-2026-22796.patch \
    file://CVE-2026-28387.patch \
    file://CVE-2025-69421.patch \
    file://CVE-2026-7383-01.patch \
    file://CVE-2026-7383-02.patch \
    file://CVE-2026-9076-01.patch \
    file://CVE-2026-9076-02.patch \
    file://binary-CVE-2026-9076.tar;subdir=${BP} \
    file://CVE-2026-28388-01.patch \
    file://CVE-2026-28388-02.patch \
    file://CVE-2026-28389-01.patch \
    file://CVE-2026-28389-02.patch \
    file://binary-CVE-2026-28389.tar;subdir=${BP} \
    "
