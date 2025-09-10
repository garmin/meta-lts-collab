FILESEXTRAPATHS_append := ":${THISDIR}/openssh"

SRC_URI_append = " \
    file://CVE-2025-26465.patch \
    file://CVE-2025-32728.patch \
    "

# Upstream does not consider CVE-2023-51767 a bug underlying in OpenSSH and
# does not intent to address it in OpenSSH
# https://security-tracker.debian.org/tracker/CVE-2023-51767
CVE_CHECK_WHITELIST += "CVE-2023-51767"
