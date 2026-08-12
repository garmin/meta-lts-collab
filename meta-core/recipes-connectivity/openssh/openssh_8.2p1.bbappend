FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI_append = " \
    file://CVE-2025-26465.patch \
    file://CVE-2025-32728.patch \
    file://CVE-2025-61984.patch \
    file://CVE-2026-35385.patch \
    file://CVE-2026-35387.patch \
    file://CVE-2026-35386-01.patch \
    file://CVE-2026-35386-02.patch \
    file://CVE-2026-35388.patch \
    file://CVE-2026-35414.patch \
    file://CVE-2026-59999.patch \
    file://CVE-2026-59997.patch \
    "

# Upstream does not consider CVE-2023-51767 a bug underlying in OpenSSH and
# does not intent to address it in OpenSSH
# https://security-tracker.debian.org/tracker/CVE-2023-51767
CVE_CHECK_WHITELIST += "CVE-2023-51767"
