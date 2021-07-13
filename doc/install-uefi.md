<!-- start project-info -->
<!--
project_title: archlinux-config
github_project: https://github.com/jouleSoft/archlinux-config
license: MIT
license-badge: True
contributors-badge: True
lastcommit-badge: True
codefactor-badge: True
--->
<!-- end project-info -->

<!-- start badges -->
![License MIT](https://img.shields.io/badge/license-MIT-green)
![Contributors](https://img.shields.io/github/contributors-anon/jouleSoft/archlinux-config)
![Last commit](https://img.shields.io/github/last-commit/jouleSoft/archlinux-config)
<!-- end badges -->

<!-- start description -->
<h1 align="center"><span id="project_title">archlinux-config</span></h1>
<p><span id="project_title">archlinux-config</span> is a set of scripts to automate Arch Linux configuration after the installation of its base system process.</p>
<!-- end description -->

<!-- start prerequisites -->
## Prerequisites from installation media
1. Change (or load) your keymap
2. Configure the network (if needed)
3. Set the time and date
4. Refresh the server list: `pacman -Syy`
5. Manage the disk (partition and format)
6. Mount the partitions (`/mnt` as root partition)
7. Install base packages into `/mnt`
  * base
  * linux
  * linux-firmware
  * git
  * vim
  * intel-ucode (or amd-ucode)
8. Generate FSTAB file (`genfstab -U /mnt >> /mnt/etc/fstab`)
9. Chroot in `/mnt` (`arch-chroot /mnt`)
10. Clone this repo: `git clone https://github.com/joulesoft/archlinux-config.git`
11. Give execution privileges to the script that you want to use (`chmod +x <script>`)
12. Run the script
<!-- end prerequisites -->

<!-- start examples -->
## What does the script do?

Every script has a common configuration among the others and a specific one. The former make the following changes:

* Set timezone and hardware clock
* Create `/etc/locale.conf` file
* Create `/etc/vconsole.conf` file
* Create `/etc/hostname` file
* Create `/etc/host` file
* Set root user password
* Create main user
* Set main user password

The latter makes configurations according to the script. See the differences following the links below:

* [install-kvm.sh](doc/install-kvm.md)
* [install-uefi.sh](doc/install-uefi.md)

| PACKAGE | DESCRIPTION |
|---------|-------------|
|         |             |

<!-- end examples -->
