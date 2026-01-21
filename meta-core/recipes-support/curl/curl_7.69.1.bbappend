FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2024-7264.patch \
    file://CVE-2024-8096.patch \
    file://CVE-2025-10966.patch \
    file://CVE-2025-14524.patch \
    "

# The use-after-free in question doesn't appear until 7.81.0, therefore we can
# safely ignore it for this version.
CVE_CHECK_WHITELIST += "CVE-2023-28319"

# not-applicable-platform: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack
CVE_CHECK_WHITELIST += "CVE-2024-32928"

# not-applicable-config: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older
CVE_CHECK_WHITELIST += "CVE-2025-0725"
