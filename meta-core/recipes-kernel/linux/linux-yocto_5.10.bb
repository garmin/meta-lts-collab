KBRANCH ?= "v5.10/standard/base"

# nooelint: oelint.file.requirenotfound
require recipes-kernel/linux/linux-yocto.inc
# nooelint: oelint.file.requirenotfound
require recipes-kernel/linux/cve-exclusion_5.10.inc

# board specific branches
KBRANCH:qemuarm ?= "v5.10/standard/arm-versatile-926ejs"
KBRANCH:qemuarm64 ?= "v5.10/standard/qemuarm64"
KBRANCH:qemumips ?= "v5.10/standard/mti-malta32"
KBRANCH:qemuppc ?= "v5.10/standard/qemuppc"
KBRANCH:qemuriscv64 ?= "v5.10/standard/base"
KBRANCH:qemuriscv32 ?= "v5.10/standard/base"
KBRANCH:qemux86 ?= "v5.10/standard/base"
KBRANCH:qemux86-64 ?= "v5.10/standard/base"
KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"

SRCREV_machine:qemuarm ?= "3be4a87b18adbb7b600c46f1544b663402ab504c"
SRCREV_machine:qemuarm64 ?= "25eca3b5ff1826eef4da6785d78dcd08c0f50450"
SRCREV_machine:qemumips ?= "0819ea880e6dc59fdbae66811e6ebd6bdd0751ed"
SRCREV_machine:qemuppc ?= "9c2e71cac268469b496ac5791d85ba2accc235eb"
SRCREV_machine:qemuriscv64 ?= "211f1d49424743b389ba218998208cca23777132"
SRCREV_machine:qemuriscv32 ?= "211f1d49424743b389ba218998208cca23777132"
SRCREV_machine:qemux86 ?= "211f1d49424743b389ba218998208cca23777132"
SRCREV_machine:qemux86-64 ?= "211f1d49424743b389ba218998208cca23777132"
SRCREV_machine:qemumips64 ?= "3ea857a9e76bb0221dfd445156f6638789cfb951"
SRCREV_machine ?= "211f1d49424743b389ba218998208cca23777132"
SRCREV_meta ?= "cdb0a7664caa4bd92eb5fb746e4497b0cf16d8c7"

SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;protocol=https;name=machine;branch=${KBRANCH}; \
           git://git.yoctoproject.org/yocto-kernel-cache;protocol=https;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
LINUX_VERSION ?= "5.10.260"

DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
DEPENDS += "openssl-native util-linux-native"
# nooelint: oelint.vars.dependsordered
DEPENDS += "gmp-native libmpc-native"

PV = "${LINUX_VERSION}+git${SRCPV}"

KMETA = "kernel-meta"
KCONF_BSP_AUDIT_LEVEL = "1"

# nooelint: oelint.vars.mispell
KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"

COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32)$"

# Functionality flags
KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
KERNEL_FEATURES:append:qemuall = " cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
KERNEL_FEATURES:append:qemux86 = " cfg/sound.scc cfg/paravirt_kvm.scc"
KERNEL_FEATURES:append:qemux86-64 = " cfg/sound.scc cfg/paravirt_kvm.scc"
KERNEL_FEATURES:append:powerpc = " arch/powerpc/powerpc-debug.scc"
KERNEL_FEATURES:append:powerpc64 = " arch/powerpc/powerpc-debug.scc"
KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
KERNEL_FEATURES:append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
