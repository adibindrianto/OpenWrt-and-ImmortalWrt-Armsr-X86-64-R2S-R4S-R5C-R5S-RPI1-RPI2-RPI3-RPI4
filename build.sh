#!/bin/bash

# Print info
make info

# Set the profile to NanoPi R2S
PROFILE="nanopi-r2s"

# Initialize package list
PACKAGES=""

# Basic configuration
# Add basic drivers and necessary utilities for NanoPi R2S

# USB drivers
PACKAGES="$PACKAGES kmod-usb-core kmod-usb-ohci kmod-usb2 kmod-usb3"

# USB to LAN driver (if needed)
PACKAGES="$PACKAGES kmod-usb-net kmod-usb-net-asix kmod-usb-net-rtl8152"

# Wireless support (generic Wi-Fi drivers, adjust as per your hardware specifics)
PACKAGES="$PACKAGES kmod-mt7601u kmod-rtl8812au-ct kmod-ath9k-htc kmod-rtl8188eu kmod-rt2800-usb"

# Luci Bootstrap theme
PACKAGES="$PACKAGES luci-theme-bootstrap"

# Custom files
FILES="files"

# Generate the image for NanoPi R2S
make image PROFILE="$PROFILE" PACKAGES="$PACKAGES" FILES="$FILES"
