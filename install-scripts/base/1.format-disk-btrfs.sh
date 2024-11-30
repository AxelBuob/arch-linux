#!/bin/bash

$SSID="ssid-xx"
$PASSPHRASE="passphrase"

loadkeys fr-pc
setfont ter-132n

iwctl --passphrase "$PASSPHRASE" station wlan0 connect $SSID

gdisk /dev/sda

# EFI partition
# n
# +300M
# ef00

# Root FS
# n
# +115G
# 8300

# Write on the disk
# w

# Formats disks
mkfs.vfat /dev/sda1
mkfs.btrfs /dev/sda2

# Mount disk and create subvolume
mount /dev/sda2 /mnt
cd /mnt
btrfs subvolume create @
btrfs subvolume create @home
btrfs subvolume create @var

# Back to home directory
cd /

# Mount your disks
umount /mnt
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@ /dev/sda2 /mnt
mkdir /mount/{boot,home,var}
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@home /dev/sda2 /mnt/home
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@var /dev/sda2 /mnt/var
mount /dev/sda1 /mnt/boot


# Base packages install
pactrap /mnt base base-devel linux linux-firmware  linux-headers git vim intel-ucode btrfs-progs terminus-font less sudo bash-completion
 
# Partition table generation
genftsab -U /mnt >> /etc/fstab

arch-chroot /mnt