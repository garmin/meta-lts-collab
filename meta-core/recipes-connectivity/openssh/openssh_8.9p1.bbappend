FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
    file://CVE-2025-61984-tests.patch \
    file://CVE-2026-35385.patch \
    file://CVE-2026-35387.patch \
    file://CVE-2026-35386-01.patch \
    file://CVE-2026-35386-02.patch \
    file://CVE-2026-35386-03.patch \
    "
