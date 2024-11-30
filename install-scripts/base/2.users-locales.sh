#!/bin/bash

HOSTNAME=arch
PASSWORD=password
LANG=fr_FR.UTF-8
KEYMAP=fr-pc
FONT=ter-132n
USER=axel
SHELL=bash
TIMEZONE="Europe/Paris"

ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime
timedatectl set-ntp true
hwclock --systohc

sed -i '242s/.//' /etc/locale.gen
locale-gen
echo "LANG=$LANG" >> /etc/locale.conf

echo "KEYMAP=$KEYMAP" >> /etc/vconsole.conf
echo "FONT=$FONT" >> /etc/vconsole.conf

echo "$HOSTNAME" > /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 $HOSTNAME.localdomain $HOSTNAME" >> /etc/hosts

echo root:$PASSWORD | chpasswd

useradd -m -s /bin/$SHELL $USER
echo $USER:$PASSWORD | chpasswd

echo "$USER ALL=(ALL) ALL" >> /etc/sudoers.d/axel