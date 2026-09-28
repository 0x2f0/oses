#!/usr/bin/env bash 

set -e

IMAGE="../images/windows"
IMAGE_SIZE="40G"

ISO="../iso/windows.iso"
MEMORY="8192"

# this is important in case the image already exists to set a 0 value for $? 
# true

if [ ! -f "$IMAGE" ]; then
	qemu-img create \
		-f qcow2 \
		"$IMAGE" \
		"$IMAGE_SIZE"
fi

if [[ $? -eq 0 ]];then
	qemu-system-x86_64 \
    -display gtk,full-screen=on,zoom-to-fit=on \
		-enable-kvm \
		-m "$MEMORY" \
		-hda "$IMAGE" \
		-cdrom "$ISO" \
		-boot c \
		-device qemu-xhci,id=usb -device usb-tablet,bus=usb.0 \
		-smp cpus=4,sockets=1,cores=4,threads=1
fi
