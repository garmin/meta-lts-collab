KBRANCH ?= "v5.10/standard/tiny/base"
KBRANCH:qemuarm ?= "v5.10/standard/tiny/arm-versatile-926ejs"

LINUX_KERNEL_TYPE = "tiny"
KCONFIG_MODE = "--allnoconfig"

# nooelint: oelint.file.requirenotfound
require recipes-kernel/linux/linux-yocto.inc
# nooelint: oelint.file.requirenotfound
require recipes-kernel/linux/cve-exclusion_5.10.inc

LINUX_VERSION ?= "5.10.260"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
DEPENDS += "openssl-native util-linux-native"

KMETA = "kernel-meta"
KCONF_BSP_AUDIT_LEVEL = "2"

SRCREV_machine:qemuarm ?= "7c2242c9afe5e886d046062ec30d81991b43a02e"
SRCREV_machine ?= "b5ab1aa85c9fd114131ab3b8c7528a2d38bad5f7"
SRCREV_meta ?= "cdb0a7664caa4bd92eb5fb746e4497b0cf16d8c7"

PV = "${LINUX_VERSION}+git${SRCPV}"

SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;branch=${KBRANCH};name=machine \
           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"

COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5)$"

# Functionality flags
KERNEL_FEATURES = ""

# nooelint: oelint.vars.mispell
KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
