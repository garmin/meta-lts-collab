FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://CVE-2024-28085-0001.patch \
    file://CVE-2024-28085-0002.patch \
    file://CVE-2024-28085-0003.patch \
    file://CVE-2024-28085-0004.patch \
    file://CVE-2024-28085-0005.patch \
"
