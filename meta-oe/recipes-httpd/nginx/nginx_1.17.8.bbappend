FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://0001-CVE-2022-41741-CVE-2022-41742.patch \
    "
