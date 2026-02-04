FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2024-9287.patch \
    file://CVE-2025-13836.patch \
"

CVE_PRODUCT = "python:python python_software_foundation:python"

