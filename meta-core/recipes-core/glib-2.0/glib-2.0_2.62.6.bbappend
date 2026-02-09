FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2024-52533.patch \
    file://CVE-2024-34397-01.patch \
    file://CVE-2024-34397-02.patch \
    file://CVE-2024-34397-03.patch \
    file://CVE-2024-34397-04.patch \
    file://CVE-2024-34397-05.patch \
    file://CVE-2024-34397-06.patch \
    file://CVE-2024-34397-07.patch \
    file://CVE-2024-34397-08.patch \
    file://CVE-2024-34397-09.patch \
    file://CVE-2024-34397-10.patch \
    file://CVE-2024-34397-11.patch \
    file://CVE-2024-34397-12.patch \
    file://CVE-2024-34397-13.patch \
    file://CVE-2024-34397-14.patch \
    file://CVE-2024-34397-15.patch \
    file://CVE-2024-34397-16.patch \
    file://CVE-2024-34397-17.patch \
    file://CVE-2024-34397-18.patch \
    file://CVE-2025-13601-01.patch \
    file://CVE-2025-13601-02.patch \
    file://CVE-2025-14087-01.patch \
    file://CVE-2025-14087-02.patch \
    file://CVE-2025-14087-03.patch \
    "
