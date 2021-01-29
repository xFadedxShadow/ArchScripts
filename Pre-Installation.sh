#!/bin/bash

timedatectl set-ntp true
sleep 1
clear
dd if=/dev/zero of=/dev/sda bs=64K status=progress
sync
curl "https://archlinux.org/mirrorlist/?country=US&protocol=https&ip_version=4&use_mirror_status=on" >> mirrorlist
mv mirrorlist /etc/pacman.d/mirrorlist
cfdisk /dev/sda
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
pacstrap /mnt base linux-zen linux-firmware nano intel-ucode
genfstab -U /mnt >> /mnt/etc/fstab