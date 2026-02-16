FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

SRC_URI += " \
    file://CVE-2023-37327.patch \
    file://CVE-2024-47613.patch \
    file://CVE-2024-47537.patch \
    file://CVE-2024-47606.patch \
    file://CVE-2024-47775.patch \
    file://CVE-2024-47774.patch \
    file://CVE-2024-47540.patch \
    file://CVE-2025-47219.patch \
    file://CVE-2025-47183.patch \
"
