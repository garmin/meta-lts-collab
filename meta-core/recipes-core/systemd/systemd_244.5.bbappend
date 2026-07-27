FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2026-29111-01.patch \
    file://CVE-2026-29111-02.patch \
    file://CVE-2026-29111-03.patch \
    file://CVE-2026-29111-04.patch \
    file://CVE-2026-40225.patch \
    file://CVE-2026-40226-01.patch \
    file://CVE-2026-40226-02.patch \
    "
