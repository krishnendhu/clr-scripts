#!/bin/bash

useradd tester; echo -e "Aw3s0m3!\nAw3s0m3!" | passwd tester
swupd bundle-add os-clr-on-clr desktop-autostart openssh-server os-utils-gui vim
usermod -G wheel -a tester
