FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2021-3575.patch \
"

# cpe-incorrect:
# Introduced in v2.5.1 by commit 0f528e9
# https://github.com/uclouvain/openjpeg/pull/1573
CVE_CHECK_WHITELIST += "CVE-2025-54874"
