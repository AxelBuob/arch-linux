#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc
sed -i '242s/.//' /etc/locale.gen
locale-gen
echo "LANG=fr_FR.UTF-8" >> /etc/locale.conf
echo "KEYMAP=fr_FR-UTF-8" >> /etc/vconsole.conf
echo "FONT=ter-132n" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:password | chpasswd


# System Boot and Management
grub \ # Bootloader for managing the system boot process.
efibootmgr \ # EFI boot entry management tool.
os-prober \ # Detects operating systems on other partitions.

# Network Utilities
networkmanager \ # Network management tool.
network-manager-applet \ # Graphical applet for NetworkManager.
dialog \ # Command-line dialog box tool.
wpa_supplicant \ # Tool for connecting to secure Wi-Fi networks.
inetutils \ # Basic networking utilities suite.
dnsutils \ # Tools for DNS queries.
nss-mdns \ # DNS resolution for Multicast DNS (mDNS).
bridge-utils \ # Tools for managing network bridges.
dnsmasq \ # Lightweight DHCP/DNS server.
openssh \ # Secure Shell (SSH) connectivity tool.

# File Sharing and Access
mtools \ # Tools for accessing DOS/Windows file systems.
dosfstools \ # Tools for creating and managing FAT file systems.
gvfs \ # Virtual filesystem interface.
gvfs-smb \ # SMB/CIFS support for GVFS.
nfs-utils \ # Tools for file sharing via NFS.
ntfs-3g \ # Read/write support for NTFS file systems.

# Development Tools
base-devel \ # Essential development tools for Arch Linux.
linux-headers \ # Kernel headers for compiling kernel modules.
bash-completion \ # Auto-completion support for Bash.

# Audio and Multimedia
alsa-utils \ # Audio management tools using ALSA.
pipewire \ # Modern multimedia server for audio and video.
pipewire-alsa \ # ALSA interface for PipeWire.
pipewire-pulse \ # PulseAudio interface for PipeWire.
pipewire-jack \ # JACK interface for PipeWire.
sof-firmware \ # Firmware for modern audio hardware (Sound Open Firmware).

# Printing
cups \ # Printing system for Linux.
hplip \ # HP printer drivers and support.

# Bluetooth
bluez \ # Bluetooth protocol stack for Linux.
bluez-utils \ # Utilities for managing Bluetooth devices.

# Virtualization
virt-manager \ # Graphical interface for managing virtual machines.
qemu \ # Emulator and virtualizer.
qemu-arch-extra \ # Additional architecture support for QEMU.
edk2-ovmf \ # UEFI firmware for virtual machines.
vde2 \ # Tools for creating virtual networks.

# Energy Management
tlp \ # Power management tools for laptops.
acpi \ # Displays ACPI information.
acpi_call \ # Kernel module for managing ACPI calls.
acpid \ # Daemon for handling ACPI events.

# Firewall and Security
iptables-nft \ # Firewall based on Netfilter tables.
ipset \ # Tool for manag

# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB #change the directory to /boot/efi is you mounted the EFI partition at /boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp 
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

useradd -m -G wheel,libvirt -s /bin/bash axel
echo axel:password | chpasswd

echo "axel ALL=(ALL) ALL" >> /etc/sudoers.d/axel


printf "\e[1;32mDone! Type exit, umount -R /mnt and reboot.\e[0m"




