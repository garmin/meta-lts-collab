FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://CVE-2025-69649.patch \
            file://CVE-2025-69652.patch \
            file://CVE-2026-4647.patch \
"
