# CVE was reported against the common header workflow within the Libsoup 3 library.
# Libsoup 2.4 does not differentiate between common and uncommon headers and has a
# single header processing workflow which prevents CR/LF characters in header values
# and names.
CVE_CHECK_IGNORE += "CVE-2026-1536 CVE-2026-3634"
