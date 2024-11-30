#!/bin/bash

# Install yay to access the AUR
# git clone https://aur.archlinux.org/yay.git

# Install paru - AUR
#git clone https://aur.archlinux.org/paru-bin

# Activate zram
yay -S zramd

# Edit /etc/default/zramd

# Enable the service 
systemctl enable --now zramd.service

# Install the Destktop Environnement
pacman -S wayland ly sway \
pipewire pipewire-alsa pipewire-jack pipewire-pulse alsa-utils \
terminator code vlc firefox transmission-gtk xreader xed \
nerd-fonts-inter nerd-fonts-sf-mono \