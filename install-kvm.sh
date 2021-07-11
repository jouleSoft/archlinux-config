#!/bin/bash

# Archlinux configuration script
# 
# REQUIREMENTS:
# 
# 

# --Date and Time--
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
hwclock --systohc

# --Locales--
#sed -i '177s/#//' /etc/locale.gen          #US English
sed -i '200s/#//' /etc/locale.gen           #SP Spanish
locale-gen
#
echo "LANG=es_ES.UTF-8" >> /etc/locale.conf
echo "KEYMAP=es" >> /etc/vconsole.conf

# --Network
echo "archie" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/host
echo "::1       localhost" >> /etc/host
echo "127.0.1.1 arch.localdomain archie" >> /etc/hosts

# --root user password--
echo root:password | chpasswd

# Refresh server list
pacman -Syy
# --bootloader
pacman -S --needed --noconfirm grub os-prober
# --system utils--
pacman -S --needed --noconfirm xdg-users-dirs xdg-utils apparmor ntfs-3g reflector mtools dosfstools base-devel linux-headers flatpak sudo 
# --services
pacman -S --needed --noconfirm pulseaudio sof-firmware acpi acpi_call acpid alsa-utils
# --network
pacman -S --needed --noconfirm dialog wpa_supplicant avahi openssh networkmanager
# --tools--
pacman -S --needed --noconfirm bash-completion alacritty git xfce4-terminal
# --Graphical environment--

# --video drivers--
# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

# --wirelwss drivers--
# pacman -S broadcom-wl-dkms

# --GRUB installation--
grub-install --target=i386-pc /dev/vda
grub-mkconfig -o /boot/grub/grub.cfg

# --Services--
systemctl enable NetworkManager
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable acpid

# --User configuration--
useradd -m jjimenez
echo jjimenez:password | chpasswd

# --sudo configuration--
echo "jjimenez ALL=(ALL) ALL" >> /etc/sudoers.d/jjimenez

# --Finished--
echo "Done! Type exit, umount -a and reboot."

