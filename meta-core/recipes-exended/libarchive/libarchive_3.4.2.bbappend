FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-5914.patch \
    file://CVE-2025-25724.patch \
    "

# cpe-incorrect:
# The out-of-bounds access in question was introduced after 3.7.3 and fixed in
# 3.7.4, so it does not apply to our version and we can safely ignore it.
CVE_CHECK_CVE_WHITELIST += "CVE-2024-37407 CVE-2024-26256 CVE-2024-48957 CVE-2024-48958"

# cpe-incorrect:
# The null pointer dereference vulnerability was introduced after 3.7.5 and was
# fixed by commit 565b5aea, so it does not apply to our version and we can mark
# 3.4.2 as fixed.
# https://github.com/libarchive/libarchive/issues/2559
CVE_CHECK_CVE_WHITELIST += "CVE-2024-48615"

# cpe-incorrect:
# The null pointer dereference vulnerability was introduced in 3.7.0 (c157e4c)
# when the bsdunzip command was ported to libarchive. This version is unaffected
# so this CVE can be dismissed.
CVE_CHECK_CVE_WHITELIST += "CVE-2025-1632"
