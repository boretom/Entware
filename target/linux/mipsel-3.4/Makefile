#
# Copyright (C) 2011-2016 Entware
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

ARCH:=mipsel
CPU_TYPE:=mips32r2
BOARD:=mipsel-3.4
BOARDNAME:=Entware (mipsel, soft float, kernel-3.4)
FEATURES:=audio gpio pci usb
KERNEL_PATCHVER:=3.4
DEFAULT_PACKAGES := toolchain

include $(INCLUDE_DIR)/target.mk

define Target/Description
	Build Software Repository for MIPSEL soft float routers.
endef

$(eval $(call BuildTarget))
