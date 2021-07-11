#!/bin/bash

# Archlinux configuration script
# 
# REQUIREMENTS:
# 
# 

# --Timezone--
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
hwclock --systohc

# --Locales--
#sed -i '177s/#//' /etc/locale.gen          #US English
sed -i '200s/#//' /etc/locale.gen           #SP Spanish
locale-gen

echo "LANG=es_ES.UTF-8" >> /etc/locale.conf
echo "KEYMAP=es" >> /etc/vconsole.conf

# --Network
echo "archie" >> /etc/hostname

echo "127.0.0.1 localhost" >> /etc/host
echo "::1       localhost" >> /etc/host
echo "127.0.1.1 arch.localdomain archie" >> /etc/hosts

# --root user password--
echo root:password | chpasswd

# --tools and software--
# pacman -S gvfs gvfs-smb nfs-utils inetutils dnsutils hplip pipewire pipewire-alsa pipewire-pulse pipewire-jack openssh rsync tlp vde2 openbsd-netcat iptables-nft ipset firewalld nss-mdns terminus-font

pacman -Syy
pacman -S --needed --noconfirm grub os-prober networkmanager acpi acpi_call acpid
pacman -S --needed --noconfirm xdg-users-dirs xdg-utils alsa-utils dialog wpa_supplicant 
pacman -S --needed --noconfirm pulseaudio git reflector bash-completion alacritty
pacman -S --needed --noconfirm apparmor ntfs-3g mtools dosfstools base-devel linux-headers
pacman -S --needed --noconfirm flatpak sof-firmware avahi

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
#systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable acpid

# --User configuration--
useradd -m jjimenez
echo jjimenez:password | chpasswd
usermod -aG libvirt jjimenez

# --sudo configuration--
echo "jjimenez ALL=(ALL) ALL" >> /etc/sudoers.d/jjimenez

# --Finished--
echo "Done! Type exit, umount -a and reboot."

