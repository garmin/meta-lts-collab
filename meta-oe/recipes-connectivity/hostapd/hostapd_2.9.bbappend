FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2022-23303-CVE-2022-23304-0001.patch \
    file://CVE-2022-23303-CVE-2022-23304-0002.patch \
    file://CVE-2022-23303-CVE-2022-23304-0003.patch \
    file://CVE-2022-23303-CVE-2022-23304-0004.patch \
    file://CVE-2022-37660.patch \
    "
