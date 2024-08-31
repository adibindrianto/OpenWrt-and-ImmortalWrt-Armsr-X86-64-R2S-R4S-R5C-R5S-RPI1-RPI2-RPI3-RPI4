#!/bin/bash

# Print OpenWrt build info
make info

# Set profile for NanoPi R2S
PROFILE="friendlyarm_nanopi-r2s"

# Initialize package list
PACKAGES=""

# Basic configuration for NanoPi R2S with OpenWrt 23.05.4

# USB drivers
PACKAGES="$PACKAGES kmod-usb-core kmod-usb-ohci kmod-usb2 kmod-usb3"

# USB to LAN drivers (commonly used)
PACKAGES="$PACKAGES kmod-usb-net kmod-usb-net-asix kmod-usb-net-rtl8152"

# Wireless drivers (generic, modify as per your specific wireless needs)
PACKAGES="$PACKAGES kmod-mt7601u kmod-rtl8812au-ct kmod-ath9k-htc kmod-rt2800-usb"

# Basic OpenWrt packages
PACKAGES="$PACKAGES luci luci-ssl luci-app-opkg luci-app-firewall luci-base luci-lib-base luci-lib-ip luci-lib-jsonc luci-lib-nixio luci-mod-admin-full luci-mod-network luci-mod-status luci-mod-system luci-proto-ipv6 luci-proto-ppp"

# Luci Bootstrap theme
PACKAGES="$PACKAGES luci-theme-bootstrap"

# Networking tools
PACKAGES="$PACKAGES iperf3 curl nano htop"

# Firewall and security tools
PACKAGES="$PACKAGES iptables-mod-extra iptables-mod-tproxy"

# Essential utilities
PACKAGES="$PACKAGES openssh-server openssh-client"

# Additional packages
PACKAGES="$PACKAGES cgi-io libiwinfo libiwinfo-data libiwinfo-lua liblua liblucihttp liblucihttp-lua libubus-lua lua px5g-wolfssl rpcd rpcd-mod-file rpcd-mod-iwinfo rpcd-mod-luci rpcd-mod-rrdns uhttpd uhttpd-mod-ubus luci-compat ath9k-htc-firmware btrfs-progs hostapd hostapd-utils kmod-ath kmod-ath9k kmod-ath9k-common kmod-ath9k-htc kmod-cfg80211 kmod-crypto-acompress kmod-crypto-crc32c kmod-crypto-hash kmod-fs-btrfs kmod-mac80211 wireless-tools wpa-cli wpa-supplicant"

# Default OpenWrt packages
# Add default packages installed by official OpenWrt
PACKAGES="$PACKAGES base-files busybox dnsmasq dropbear fstools jshn libblobmsg-json libiwinfo-lua libjson-c liblua libubox-lua libubus-lua logd mtd netifd procd uci uclient-fetch uhttpd zlib"

# Define the files directory for custom configurations or files
FILES="files"

# Disable unnecessary services if any (adjust as needed)
DISABLED_SERVICES=""

# Generate the image with specified profile and packages
make image PROFILE="$PROFILE" PACKAGES="$PACKAGES" FILES="$FILES" DISABLED_SERVICES="$DISABLED_SERVICES"
