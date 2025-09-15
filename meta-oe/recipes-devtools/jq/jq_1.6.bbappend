FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2024-23337.patch \
    file://CVE-2025-48060.patch \
    "

# fixed-version: Does not affect jq 1.6.
# Introduced by: https://github.com/jqlang/jq/commit/cf4b48c7ba30cb30e116b523cff036ea481459f6 (jq-1.7rc1)
CVE_CHECK_WHITELIST += "CVE-2024-53427"
