FILESEXTRAPATHS_append := ":${THISDIR}/libxml2"

SRC_URI_append = " \
    file://CVE-2025-27113.patch \
    file://CVE-2025-32414.patch \
    file://CVE-2025-32415.patch \
    "
