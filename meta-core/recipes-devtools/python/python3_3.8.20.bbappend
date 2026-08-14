FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

# This patch exists upstream but has been removed from SRC_URI.
# It's required for ptests to pass.
SRC_URI_append = " \
    file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch \
"

SRC_URI_append = " \
    file://CVE-2024-9287.patch \
    file://CVE-2025-13836.patch \
"

CVE_PRODUCT = "python:python python_software_foundation:python"
