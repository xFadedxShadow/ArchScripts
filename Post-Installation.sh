#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Detroit /etc/localtime
hwclock --systohc
nano /etc/locale.gen
locale-gen
nano /etc/locale.conf
nano /etc/hostname
nano /etc/hosts
passwd
pacman -S grub efibootmgr networkmanager network-manager-applet dialog mtools dosfstools base-devel linux-zen-headers bluez bluez-utils alsa-utils pulseaudio pulseaudio-bluetooth git reflector xdg-utils xdg-user-dirs firefox-developer-edition
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ARCH
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
systemctl enable bluetooth
useradd -mG wheel xfadedxshadow
passwd xfadedxshadow
EDITOR=nano visudo