#!/usr/bin/env bash 

set -e

filePath=$(realpath $0 )
dirPath=$(dirname "$filePath")

if [[ "$PWD" != "$dirPath" ]];then 
 cd "$dirPath"
fi

IMAGE="../images/ubuntu-26"
IMAGE_SIZE="40G"

ISO="../iso/ubuntu-26.iso"

qemu-img create \
  -f qcow2 \
  "$IMAGE" \
  "$IMAGE_SIZE"

if [[ $? -eq 0 ]];then
  qemu-system-x86_64 \
    -display gtk,full-screen=on,zoom-to-fit=on \
    -enable-kvm \
    -m 3072 \
    -hda "$IMAGE" \
    -cdrom "$ISO" \
		-device qemu-xhci,id=usb -device usb-tablet,bus=usb.0 \
		-smp cpus=4,sockets=1,cores=4,threads=1 \
    -boot d
fi
