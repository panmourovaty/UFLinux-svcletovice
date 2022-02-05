#!/bin/bash
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
rm -f /etc/apt/sources.list.d/uflinuxofflinepackages.list
rm -rf /var/uflinuxofflinepackages
