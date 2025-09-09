FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://CVE-2024-9287.patch \
"

CVE_PRODUCT = "python:python python_software_foundation:python"

