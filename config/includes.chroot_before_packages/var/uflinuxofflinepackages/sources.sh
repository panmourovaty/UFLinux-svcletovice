#!/bin/zsh
if [ $(hostname) = "uflinux-live" ]
then
	echo "Live Mode detected, script wont be executed"
else
echo "Live Mode was not detected, assuming this is first boot"
echo "
deb http://deb.debian.org/debian/ bullseye main contrib non-free
#deb-src http://deb.debian.org/debian/ bullseye main contrib non-free

deb http://deb.debian.org/debian-security/ bullseye-security main contrib non-free
#deb-src http://security.debian.org/ bullseye-security main contrib non-free

deb http://deb.debian.org/debian/ bullseye-updates main contrib non-free
#deb-src http://ftp.debian.org/debian/ bullseye-updates main contrib non-free

deb http://deb.debian.org/debian bullseye-backports main contrib non-free
#deb-src http://ftp.debian.org/debian/ bullseye-backports main contrib non-free
" > /etc/apt/sources.list
echo 'GRUB_DEFAULT="saved"
GRUB_DISABLE_RECOVERY="true"
GRUB_DISABLE_SUBMENU="true"
GRUB_HIDDEN_TIMEOUT="0"
GRUB_HIDDEN_TIMEOUT_QUIET="true"
GRUB_RECORDFAIL_TIMEOUT="$GRUB_TIMEOUT"
GRUB_TERMINAL_OUTPUT="console"
GRUB_TIMEOUT="0"
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_DISTRIBUTOR="UFlinux"' > /etc/default/grub
plymouth-set-default-theme uf-plymouth-theme -R
cat /etc/default/locale | grep 'KEYMAP='
if [ $? -eq 1 ]
then
echo "KEYMAP=us" >> /etc/default/locale
else
fi
sed 's/XKBMODEL=""/XKBMODEL="pc105"/g' /etc/default/keyboard
/usr/sbin/update-grub
apt-get autoremove uf-calamares-settings calamares -y
flatpak update --assumeyes --noninteractive
aa-enforce /etc/apparmor.d/*
rm -f /etc/apt/sources.list.d/uflinuxofflinepackages.list
rm -f /etc/cron.d/uflinuxofflinepackages
rm -rf /var/uflinuxofflinepackages
fi
