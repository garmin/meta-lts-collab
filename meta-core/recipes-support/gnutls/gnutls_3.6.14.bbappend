FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-32988.patch \
    "

# cpe-incorrect:
# The vulnerability was introduced in commit 242abb69 (3.7.3)
# https://gitlab.com/gnutls/gnutls/-/issues/1695
CVE_CHECK_WHITELIST += "CVE-2025-32989"
