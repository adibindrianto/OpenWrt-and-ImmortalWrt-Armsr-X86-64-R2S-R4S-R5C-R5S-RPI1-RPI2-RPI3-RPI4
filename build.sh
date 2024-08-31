#!/bin/bash

# Print OpenWrt build info
make info

# Set profile for NanoPi R2S
PROFILE="friendlyarm_nanopi-r2s"

# Define packages
PACKAGES="
base-files busybox ca-bundle dnsmasq dropbear e2fsprogs firewall4 fstools kmod-gpio-button-hotplug kmod-nft-offload kmod-usb-net-rtl8152 libc libgcc libustream-mbedtls logd luci mkf2fs mtd netifd nftables odhcp6c odhcpd-ipv6only opkg partx-utils ppp ppp-mod-pppoe procd procd-seccomp procd-ujail uboot-envtools uci uclient-fetch urandom-seed urngd

# USB drivers
kmod-usb-core kmod-usb-ohci kmod-usb2 kmod-usb3 kmod-usb-net kmod-usb-net-asix kmod-usb-net-rtl8152 kmod-usb-net-rtl8153 kmod-usb-net-cdc-ether kmod-usb-net-cdc-mbim kmod-usb-net-cdc-ncm kmod-usb-net-hso kmod-usb-net-qmi-wwan kmod-usb-net-sieral kmod-usb-net-sierra kmod-usb-net-wwan kmod-usb-serial kmod-usb-serial-omni kmod-usb-serial-xt kmod-usb-serial-qualcomm

# Wireless drivers
kmod-ath kmod-ath9k kmod-ath9k-common kmod-ath9k-htc kmod-cfg80211 kmod-crypto-acompress kmod-crypto-crc32c kmod-crypto-hash kmod-fs-btrfs kmod-mac80211 kmod-rt2800-usb kmod-rtl8812au-ct kmod-mt7601u

# Additional tools
iperf3 curl nano htop
"

# Files directory for custom configurations or files
FILES="files"

# Generate the image with specified profile and packages
make image PROFILE="$PROFILE" PACKAGES="$PACKAGES" FILES="$FILES"
