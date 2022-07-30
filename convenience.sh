#!/bin/sh
echo "This computer will be rebooted after the convenience script has finished working!"
sleep 10
pacman -S packagekit-qt5
pacman -S alsa-firmware sof-firmware alsa-ucm-conf dhcpcd networkmanager iwd dhcpcd alsa-utils
systemctl stop dhcpcd
systemctl stop wpa_supplicant
systemctl disable dhcpcd
systemctl stop wpa_supplicant
systemctl enable iwd
systemctl start iwd
systemctl start NetworkManager
systemctl enable NetworkManager
pacman -S xorg plasma plasma-wayland-session kde-applications 
systemctl enable sddm.service
pacman -R dhcpcd
reboot
