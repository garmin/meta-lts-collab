PTESTS_PROBLEMS ??= ""

python () {
    ptest_problems = set(d.getVar("PTESTS_PROBLEMS").split())
    if "{}-ptest".format(d.getVar("BPN")) in ptest_problems:
        d.setVar("PTEST_ENABLED", "0")
}
