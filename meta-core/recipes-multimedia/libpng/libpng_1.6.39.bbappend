FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "\
    file://CVE-2026-33416-01.patch \
    file://CVE-2026-33416-02.patch \
    file://CVE-2026-33416-03.patch \
    file://CVE-2026-33416-04.patch \
    file://CVE-2026-34757-01.patch \
    file://CVE-2026-34757-02.patch \
"

do_install_ptest:append() {
    # Install .libs directory binaries to ptest path
    install -m 755 ${B}/.libs/pnggetset ${D}${PTEST_PATH}/src
}
