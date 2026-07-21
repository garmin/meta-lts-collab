KBRANCH ?= "v5.10/standard/preempt-rt/base"

# nooelint: oelint.file.requirenotfound
require recipes-kernel/linux/linux-yocto.inc
# nooelint: oelint.file.requirenotfound
require recipes-kernel/linux/cve-exclusion_5.10.inc

# Skip processing of this recipe if it is not explicitly specified as the
# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
# to build multiple virtual/kernel providers, e.g. as dependency of
# core-image-rt-sdk, core-image-rt.
python () {
    if d.getVar("KERNEL_PACKAGE_NAME") == "kernel" and d.getVar("PREFERRED_PROVIDER_virtual/kernel") != "linux-yocto-rt":
        raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
}

SRCREV_machine ?= "ffac2f938d5be10761ff7143ec797b0f3ab2bbf0"
SRCREV_meta ?= "cdb0a7664caa4bd92eb5fb746e4497b0cf16d8c7"

SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;branch=${KBRANCH};name=machine \
           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"

LINUX_VERSION ?= "5.10.260"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
DEPENDS += "openssl-native util-linux-native"

PV = "${LINUX_VERSION}+git${SRCPV}"

KMETA = "kernel-meta"
KCONF_BSP_AUDIT_LEVEL = "1"

LINUX_KERNEL_TYPE = "preempt-rt"

COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)$"

# nooelint: oelint.vars.mispell
KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"

# Functionality flags
KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
KERNEL_FEATURES:append:qemuall = " cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
KERNEL_FEATURES:append:qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
KERNEL_FEATURES:append:qemux86-64 = " cfg/sound.scc cfg/paravirt_kvm.scc"
KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "features/scsi/scsi-debug.scc", "", d)}"
KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", "features/gpio/mockup.scc", "", d)}"
