#!/bin/bash

# Versi kernel yang diinginkan
KERNEL_VERSION="6.1"

# Direktori sumber kernel OpenWrt
KERNEL_SRC_DIR="package/kernel/linux"

# URL patch kernel (pastikan untuk mengganti URL ini dengan URL yang sesuai untuk versi dan patch Anda)
PATCH_URL="https://downloads.openwrt.org/releases/23.05.4/targets/rockchip/armv8/patches/kernel-6.1.patch"
PATCH_FILE="999-kernel-${KERNEL_VERSION}.patch"

# Memeriksa apakah direktori sumber kernel ada
if [ ! -d "$KERNEL_SRC_DIR" ]; then
  echo "Direktori sumber kernel tidak ditemukan: $KERNEL_SRC_DIR"
  exit 1
fi

# Membuat direktori untuk menyimpan patch jika belum ada
mkdir -p $KERNEL_SRC_DIR/patches

# Mengunduh patch kernel
echo "Mengunduh patch kernel dari $PATCH_URL"
wget -q $PATCH_URL -O $KERNEL_SRC_DIR/patches/$PATCH_FILE

if [ $? -ne 0 ]; then
  echo "Gagal mengunduh patch kernel."
  exit 1
fi

# Menerapkan patch kernel
echo "Menerapkan patch kernel $PATCH_FILE"
cd $KERNEL_SRC_DIR
patch -p1 < patches/$PATCH_FILE

if [ $? -ne 0 ]; then
  echo "Gagal menerapkan patch kernel."
  exit 1
fi

# Kembali ke direktori awal
cd ../..

# Konfigurasi kernel untuk versi yang diinginkan (misalnya, jika perlu)
echo "Mengonfigurasi kernel untuk versi $KERNEL_VERSION"
make kernel_menuconfig

echo "Selesai menerapkan patch kernel dan konfigurasi."
