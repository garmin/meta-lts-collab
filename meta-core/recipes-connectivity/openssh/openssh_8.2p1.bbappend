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
    file://CVE-2026-59995.patch \
    file://CVE-2026-60001.patch \
    file://CVE-2026-60000.patch \
    "

# Upstream does not consider CVE-2023-51767 a bug underlying in OpenSSH and
# does not intent to address it in OpenSSH
# https://security-tracker.debian.org/tracker/CVE-2023-51767
CVE_CHECK_WHITELIST += "CVE-2023-51767"

# https://nvd.nist.gov/vuln/detail/CVE-2026-3497
# not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh.
CVE_CHECK_WHITELIST += "CVE-2026-3497"

# https://nvd.nist.gov/vuln/detail/CVE-2026-59998
# Only relevant when Kerberos support is disabled.
# not-applicable-config: GSSAPI/Kerberos support is disabled in the default OpenSSH configuration
CVE_CHECK_WHITELIST += "${@bb.utils.contains('PACKAGECONFIG', 'kerberos', '', 'CVE-2026-59998', d)}"

# https://nvd.nist.gov/vuln/detail/CVE-2026-59996
# The affected function does not exist in OpenSSH 8.2p1
# Debian treats this CVE as minor and does not provide fixes.
# https://security-tracker.debian.org/tracker/CVE-2026-59996
CVE_CHECK_WHITELIST += "CVE-2026-59996"

# https://nvd.nist.gov/vuln/detail/CVE-2026-60002
# The affected code is quite different in OpenSSH 8.2p1 and the upstream fix is not applicable.
# Debian treats this CVE as minor and does not provide fixes.
# https://security-tracker.debian.org/tracker/CVE-2026-60002
CVE_CHECK_WHITELIST += "CVE-2026-60002"
