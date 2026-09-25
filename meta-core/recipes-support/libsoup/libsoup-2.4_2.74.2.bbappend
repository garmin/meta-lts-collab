FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
    file://CVE-2026-1467.patch \
    file://CVE-2026-1539.patch \
    file://CVE-2026-1801.patch \
    file://CVE-2026-2443.patch \
    file://CVE-2026-5119.patch \
    file://CVE-2026-3633-1.patch \
    file://CVE-2026-3633-2.patch \
    file://CVE-2026-3633-3.patch \
    file://CVE-2026-3633-4.patch \
"

# CVE was reported against the common header workflow within the Libsoup 3 library.
# Libsoup 2.4 does not differentiate between common and uncommon headers and has a
# single header processing workflow which prevents CR/LF characters in header values
# and names.
CVE_CHECK_IGNORE += "CVE-2026-1536 CVE-2026-3634"
