# Edit /etc/modprobe.d/blacklist.conf
# blacklist elan_i2c

pacman -S \

# System Boot and Management
grub \ # Bootloader for managing the system boot process.
grub-btrfs \
efibootmgr \ # EFI boot entry management tool.

# Network Utilities
networkmanager \ # Network management tool.
avahi \
nss-mdns \
reflector \

# File Sharing and Access
gvfs \ # Virtual filesystem interface.

# Audio and Multimedia
alsa-utils \ # Audio management tools using ALSA.
pipewire \ # Modern multimedia server for audio and video.
pipewire-alsa \ # ALSA interface for PipeWire.
pipewire-pulse \ # PulseAudio interface for PipeWire.
pipewire-jack \ # JACK interface for PipeWire.

# Energy Management
tlp \ # Power management tools for laptops.
acpi \ # Displays ACPI information.
acpi_call \ # Kernel module for managing ACPI calls.
acpid \ # Daemon for handling ACPI events.

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB #change the directory to /boot/efi is you mounted the EFI partition at /boot/efi
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable tlp 
systemctl enable avahi-daemon.service
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable acpid

# Edit /etc/mkinitcpio.conf
# If you are using 2 disks with BTRFS
# MODULES(btrfs)
# For intel MODULES(i915)
mkinitcpio -P vmlinuz-linux

# Exit and reboot
exit
umount -R /mnt
reboot
