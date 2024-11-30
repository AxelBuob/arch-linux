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
foot wmenu dmenu i3status\
swaylock swayidle swaybg \
archlinux-wallpaper \

# Config file
mkdir .config/sway
cp /edit/sway/config ~/.config/sway/config

# Input
#input * {
#    xkb_layout "fr"
#    xkb_variant "latin9"
#    xkb_model "pc104"
#    xkb_options ""
#
#}
# i3statusbar
# ~/.config/sway/config
# 
# bar {
#     status_command i3status
# }
# 






# Audio and Multimedia
alsa-utils \ # Audio management tools using ALSA.
pipewire \ # Modern multimedia server for audio and video.
pipewire-alsa \ # ALSA interface for PipeWire.
pipewire-pulse \ # PulseAudio interface for PipeWire.
pipewire-jack \ # JACK interface for PipeWire.
terminator terminator thunar code vlc firefox transmission-gtk xreader xed \
nerd-fonts-inter nerd-fonts-sf-mono \