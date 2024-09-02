#!/bin/bash

# Pindah ke direktori imagebuilder untuk Raspberry Pi 1
cd $GITHUB_WORKSPACE/$VENDOR-imagebuilder-$VERSION-bcm27xx-bcm2708.Linux-x86_64 || exit

# Hapus paket default yang tidak diperlukan
sed -i "/luci-app-cpufreq/d" include/target.mk

# Paksa opkg untuk menimpa file yang sudah ada
sed -i "s/install \$(BUILD_PACKAGES)/install \$(BUILD_PACKAGES) --force-overwrite/" Makefile

# Jangan menghasilkan gambar ISO karena ukurannya terlalu besar
sed -i "s/CONFIG_ISO_IMAGES=y/# CONFIG_ISO_IMAGES is not set/" .config

# Jangan menghasilkan gambar VHDX
sed -i "s/CONFIG_VHDX_IMAGES=y/# CONFIG_VHDX_IMAGES is not set/" .config

# Tingkatkan ukuran partisi rootfs menjadi 1024M
sed -i "s/CONFIG_TARGET_ROOTFS_PARTSIZE=.*/CONFIG_TARGET_ROOTFS_PARTSIZE=1024/" .config
