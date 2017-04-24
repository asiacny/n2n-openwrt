#
# Copyright (C) 2007-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

#PKG_BRANCH:=trunk
PKG_SOURCE_URL:=git@github.com:asiacny/n2n_v2.git
PKG_SOURCE_VERSION:=6a2333f62c02b72fcd4809cd4bd73014dfe989dd
#PKG_REV:=5633

PKG_NAME:=n2n_v2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git

PKG_BUILD_DEPENDS:=libopenssl

include $(INCLUDE_DIR)/package.mk

define Package/n2n_v2
  SECTION:=net
  CATEGORY:=Network
  TITLE:=VPN tunneling daemon(v2)
  URL:=http://www.ntop.org/n2n/n2n_v2
  SUBMENU:=VPN
  DEPENDS:=+libpthread +kmod-tun +libopenssl
endef


define Build/Compile
	$(MAKE) -C "$(PKG_BUILD_DIR)" \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
		INSTALL_PROG=":"
endef

define Package/n2n_v2/install
	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/edge $(1)/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/supernode $(1)/sbin/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/n2n_v2.config $(1)/etc/config/n2n
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/n2n_v2.init $(1)/etc/init.d/n2n
endef

define Package/n2n/conffiles
/etc/config/n2n
endef

$(eval $(call BuildPackage,n2n_v2))
