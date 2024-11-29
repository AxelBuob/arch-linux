#!/bin/bash

sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload

yay -S --noconfirm xviewer
yay -S --noconfirm xplayer
yay -S --noconfirm pix

#pikaur -S --noconfirm system76-power
#sudo systemctl enable --now system76-power
#sudo system76-power graphics integrated
#pikaur -S --noconfirm gnome-shell-extension-system76-power-git

# See https://github.com/AdnanHodzic/auto-cpufreq?tab=readme-ov-file
#pikaur -S --noconfirm auto-cpufreq
#sudo systemctl enable --now auto-cpufreq

# Display Server and Display Manager
xorg \ # X.Org server, the display server for Linux systems.
ly \ # Lightweight terminal-based display manager.

# Desktop Environment
cinnamon \ # Cinnamon desktop environment, offering a traditional and user-friendly interface.

# Web Browser
firefox \ # Open-source web browser.

# Screen Recording and Streaming
simplescreenrecorder \ # Lightweight tool for recording desktop sessions.
obs-studio \ # Software for live streaming and screen recording.

# Multimedia
vlc \ # Versatile media player supporting a wide range of formats.

# Themes and Appearance
arc-gtk-theme \ # GTK theme for a modern and clean look.
arc-icon-theme \ # Matching icon set for the Arc GTK theme.

# Text and Document Management
xed \ # Simple text editor from the Cinnamon desktop environment.
xreader \ # Lightweight document viewer for PDFs and other formats.

# Window Manager and Shell
metacity \ # Simple window manager, often used as a fallback for GNOME.
gnome-shell \ # GNOME's graphical shell providing the user interface.


sudo systemctl enable ly
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot
