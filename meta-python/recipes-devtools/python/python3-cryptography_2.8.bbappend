# CVE-2024-26130.patch does not apply to 2.8: it only adds dead code to
# the backend and breaks test_pkcs12.py, so the ptest fails to collect.
SRC_URI_remove = "file://CVE-2024-26130.patch"

# not-applicable-version: 2.8 has no pkcs12.serialize_key_and_certificates()
CVE_CHECK_WHITELIST += "CVE-2024-26130"

# hypothesis is not available in dunfell, so these tests can't be collected
do_install_ptest_append() {
    rm -rf ${D}${PTEST_PATH}/tests/hypothesis
}

# pytest's tmpdir fixture imports getpass, which is in python3-unixadmin
RDEPENDS_${PN}-ptest += "${PYTHON_PN}-unixadmin"
