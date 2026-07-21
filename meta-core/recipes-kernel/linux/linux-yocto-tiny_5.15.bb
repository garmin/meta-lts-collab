KBRANCH ?= "v5.15/standard/tiny/base"

LINUX_KERNEL_TYPE = "tiny"
KCONFIG_MODE = "--allnoconfig"

# nooelint: oelint.file.requirenotfound
require recipes-kernel/linux/linux-yocto.inc
# nooelint: oelint.file.requirenotfound
require recipes-kernel/linux/cve-exclusion_5.15.inc

LINUX_VERSION ?= "5.15.211"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
DEPENDS += "openssl-native util-linux-native"

KMETA = "kernel-meta"
KCONF_BSP_AUDIT_LEVEL = "2"

SRCREV_machine ?= "79899f86224c7a024d144ffe6b66edbc0b7fe122"
SRCREV_meta ?= "73e7c4ea36642d31ee39ec35ab6b5cf55f139ed1"

PV = "${LINUX_VERSION}+git${SRCPV}"

SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;branch=${KBRANCH};name=machine \
           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"

COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"

# Functionality flags
KERNEL_FEATURES = ""

# nooelint: oelint.vars.mispell
KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
