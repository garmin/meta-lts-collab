FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

SRC_URI_append = " \
    file://CVE-2022-28321-0001.patch \
    file://CVE-2022-28321-0002.patch \
    "
