FILESEXTRAPATHS_append := ":${THISDIR}/expat"

SRC_URI_append = " \
    file://CVE-2024-45490.patch \
    file://CVE-2024-45491.patch \
    file://CVE-2024-45492.patch \
    file://CVE-2024-28757.patch \
    "
