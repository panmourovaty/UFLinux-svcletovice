#!/bin/zsh
if [ $(hostname) -eq "uflinux-live" ]
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
apt-get autoremove uf-calamares-settings calamares -y
rm -f /etc/apt/sources.list.d/uflinuxofflinepackages.list
rm -f /etc/cron.d/uflinuxofflinepackages
rm -rf /var/uflinuxofflinepackages
fi
