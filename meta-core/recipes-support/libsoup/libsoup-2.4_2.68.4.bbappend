FILESEXTRAPATHS_append := ":${THISDIR}/libsoup"

SRC_URI_append = " \
    file://CVE-2025-2784-01.patch \
    file://CVE-2025-2784-02.patch \
    "
