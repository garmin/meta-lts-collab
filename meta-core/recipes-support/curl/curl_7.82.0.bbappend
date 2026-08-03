FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

inherit ptest

SRC_URI += "\
    file://run-ptest \
    file://disable-tests \
    file://no-test-timeout.patch \
    file://makefile-getvar \
    file://CVE-2026-8927.patch \
    file://CVE-2026-8927-test.patch \
    file://CVE-2026-5773.patch \
    file://CVE-2026-7168.patch \
"

do_configure:append() {
    install -m 0755 ${WORKDIR}/makefile-getvar ${STAGING_BINDIR_NATIVE}/makefile-getvar
}

# Force the source checking (checksrc) to be skipped
EXTRA_OEMAKE += "CHECKSRC='true || '"

# Needed for test1647 (see 'features' in tests/data/test1647)
PACKAGECONFIG:append:class-target = " ${@bb.utils.contains('PTEST_ENABLED', '1', 'debug', '', d)}"

do_compile_ptest() {
       oe_runmake -C ${B}/tests
}

do_install_ptest() {
       install -d ${D}${PTEST_PATH}/tests
       cp ${S}/tests/*.p[lmy] ${D}${PTEST_PATH}/tests/

       install -d ${D}${PTEST_PATH}/tests/libtest
       for name in $(makefile-getvar ${B}/tests/libtest/Makefile noinst_PROGRAMS noinst_LTLIBRARIES); do
               ${B}/libtool --mode=install install ${B}/tests/libtest/$name ${D}${PTEST_PATH}/tests/libtest
       done
       rm -f ${D}${PTEST_PATH}/tests/libtest/libhostname.la

       install -d ${D}${PTEST_PATH}/tests/server
       for name in $(makefile-getvar ${B}/tests/server/Makefile noinst_PROGRAMS); do
               ${B}/libtool --mode=install install ${B}/tests/server/$name ${D}${PTEST_PATH}/tests/server
       done

       install -m 0644 ${S}/tests/stunnel.pem ${D}${PTEST_PATH}/tests/stunnel.pem

       cp -r ${S}/tests/data ${D}${PTEST_PATH}/tests/

       # More tests that we disable for automated QA as they're not reliable
       cat ${WORKDIR}/disable-tests >>${D}${PTEST_PATH}/tests/data/DISABLED
}

DEPENDS:append:class-target = " ${@bb.utils.contains('PTEST_ENABLED', '1', 'openssl-native', '', d)}"

RDEPENDS:${PN}-ptest += "\
    locale-base-en-us \
    perl-module-b \
    perl-module-base \
    perl-module-cwd \
    perl-module-digest \
    perl-module-digest-md5 \
    perl-module-digest-sha \
    perl-module-file-basename \
    perl-module-file-spec \
    perl-module-file-temp \
    perl-module-i18n-langinfo \
    perl-module-io-socket \
    perl-module-ipc-open2 \
    perl-module-list-util \
    perl-module-memoize \
    perl-module-storable \
    perl-module-time-hires \
"

# stunnel is required by test1647, but provided outside of oe-core, at meta-networking
RRECOMMENDS:${PN}-ptest += "\
    stunnel \
"
