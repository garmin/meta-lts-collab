FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI:append = " \
    file://CVE-2025-61984-tests.patch \
    file://CVE-2026-35385.patch \
    file://CVE-2026-35387.patch \
    file://CVE-2026-35386-01.patch \
    file://CVE-2026-35386-02.patch \
    file://CVE-2026-35386-03.patch \
    file://CVE-2026-60002.patch \
    file://CVE-2026-35388.patch \
    file://CVE-2026-35414.patch \
    file://CVE-2026-59999.patch \
    file://CVE-2026-59997.patch \
    file://CVE-2026-59996.patch \
    file://CVE-2026-59995.patch \
    file://CVE-2026-60001.patch \
    file://CVE-2026-60000.patch \
    "

# https://nvd.nist.gov/vuln/detail/CVE-2026-3497
# not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh.
CVE_CHECK_IGNORE += "CVE-2026-3497"
