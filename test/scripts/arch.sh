#!/usr/bin/sh

set -e

IMAGE="../image/arch-x86_64"
IMAGE_SIZE="20G"

ISO="../iso/archlinux-x86_64.iso"

qemu-img create \
  -f qcow2 \
  "$IMAGE" \
  "$IMAGE_SIZE"

if [[ $? -eq 0 ]];then
  qemu-system-x86_64 \
    -enable-kvm \
    -m 3072 \
    -hda "$IMAGE" \
    -cdrom "$ISO"
    -boot d
fi
