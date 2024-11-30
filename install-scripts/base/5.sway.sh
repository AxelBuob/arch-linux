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
pacman -S \ 
wayland \ # Xserver
ly \ # Session manager
sway \ # window manager or compositor
swaybar \ # status bar
swayidle \ #idle daemon
swaylock \ # lock screen
wmenu dmenu \ # app launcher
foot \ # terminal emulator
thunar thunar-archive-plugin \ # file manager and archive plugin
pipewire pipewire-alsa pipewire-jack pipewire-pulse alsa-utils \ # audio

# Extra
firefox \
terminator code vlc transmission-gtk xreader xed \
nerd-fonts-inter nerd-fonts-sf-mono \
