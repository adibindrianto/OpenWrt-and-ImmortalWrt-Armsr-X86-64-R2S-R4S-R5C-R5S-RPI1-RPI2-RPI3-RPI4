#!/bin/bash

# Print OpenWrt build info
make info

# Set profile for NanoPi R2S
PROFILE="friendlyarm_nanopi-r2s"

# Define packages
PACKAGES="luci-compat luci-lua-runtime dnsmasq dnsmasq-full cgi-io libiwinfo libiwinfo-data libiwinfo-lua liblua \
liblucihttp liblucihttp-lua libubus-lua lua luci luci-app-firewall luci-app-opkg \
luci-base luci-lib-base luci-lib-ip luci-lib-jsonc luci-lib-nixio luci-mod-admin-full \
luci-mod-network luci-mod-status luci-mod-system luci-proto-ipv6 luci-proto-ppp luci-ssl \
luci-theme-bootstrap px5g-wolfssl rpcd rpcd-mod-file rpcd-mod-iwinfo rpcd-mod-luci \
rpcd-mod-rrdns uhttpd uhttpd-mod-ubus usbutils htop \
kmod-usb-net kmod-usb-net-huawei-cdc-ncm kmod-usb-net-cdc-ether kmod-usb-acm kmod-usb-net-qmi-wwan \
kmod-usb-net-rndis kmod-usb-serial-qualcomm kmod-usb-net-sierrawireless kmod-usb-ohci kmod-usb-serial \
kmod-nls-utf8 kmod-usb-serial-option kmod-usb-serial-sierrawireless kmod-usb-uhci kmod-usb2 \
kmod-usb-net-ipheth kmod-usb-net-cdc-mbim usbmuxd libusbmuxd-utils libimobiledevice-utils \
usb-modeswitch nano picocom minicom wget \
ath9k-htc-firmware btrfs-progs hostapd hostapd-utils kmod-ath kmod-ath9k kmod-ath9k-common kmod-ath9k-htc kmod-cfg80211 kmod-crypto-acompress kmod-crypto-crc32c kmod-crypto-hash kmod-fs-btrfs kmod-mac80211 \
kmod-usb-net-asix kmod-usb-net-asix-ax88179 kmod-usb-net-rtl8150 kmod-usb-net-rtl8152 \
kmod-fs-ext4 kmod-fs-vfat kmod-fs-xfs kmod-fs-btrfs kmod-fs-f2fs kmod-fs-squashfs \
kmod-fs-ntfs kmod-fs-ntfs3 kmod-usb-storage kmod-usb-storage-extras \
kmod-nft-fib kmod-nft-bridge kmod-nft-nat \
blockd block-mount e2fsprogs fdisk parted blkid kmod-fs-cifs kmod-fs-exfat gdisk tune2fs resize2fs losetup cfdisk f2fs-tools kmod-usb-storage-uas kmod-usb-ledtrig-usbport"

# Files directory for custom configurations or files
FILES="files"

# Generate the image with specified profile and packages
make image PROFILE="$PROFILE" PACKAGES="$PACKAGES" FILES="$FILES"
