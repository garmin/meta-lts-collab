# not-applicable-config:
# vulnerable file is not compiled
CVE_CHECK_WHITELIST += "CVE-2026-22184"

# Adding 'CVE_PRODUCT' to avoid false detection of CVEs
CVE_PRODUCT = "zlib:zlib gnu:zlib"
