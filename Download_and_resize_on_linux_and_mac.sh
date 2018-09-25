#!/bin/bash

echo -ne "Removing previous images \\n" 
rm -rf clear*
echo -ne "Downloading latest image\\n"
curl -O -s https://download.clearlinux.org/image/clear-$(curl -s https://download.clearlinux.org/latest)-live.img.xz
IMAGE_NAME=`ls clear-* | awk -F'-' '{print $2} '`
echo -ne "Image name is $IMAGE_NAME \\n"
echo -ne "Unzipping $IMAGE_NAME \\n"
xz -d clear-$IMAGE_NAME-live.img.xz

echo -ne "Converting .img to .vdi \\n"
VBoxManage convertfromraw clear-$IMAGE_NAME-live.img clear-$IMAGE_NAME-live.vdi --format VDI
echo "Input the resize in (MB), followed by [ENTER]:"
read IMAGE_SIZE
echo -ne "Modifying the image size to $IMAGE_SIZE\\n"
VBoxManage modifyhd --resize $IMAGE_SIZE clear-$IMAGE_NAME-live.vdi
rm -rf clear-$IMAGE_NAME-live.img 



