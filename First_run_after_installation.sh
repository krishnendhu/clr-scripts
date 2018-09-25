#!/bin/bash

echo -e "Adding the root ssh feature \n"
mkdir -p /etc/ssh
if [! -f /etc/ssh/sshd_config ]; then
	echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
fi

name="N"
read -e -i "$name" -p "Do you want a new user to be created (y/N): " input
name="${input:-$name}"
if [ "$name" = "Y" ];then
	echo "Enter username:"
	read username
	echo "Enter passwd:"
	read password
	useradd $username; echo -e "$password\n$password" | passwd $username
	usermod -G wheel -a $name
fi
swupd bundle-add os-clr-on-clr desktop-autostart openssh-server os-utils-gui vim
