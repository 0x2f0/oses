#!/usr/bin/env bash 

set -e

IMAGE="../images/dhh-arch"
IMAGE_SIZE="20G"

ISO="../iso/dhh-arch-x86_64.iso"
MEMORY="3072"

qemu-img create \
  -f qcow2 \
  "$IMAGE" \
  "$IMAGE_SIZE"

if [[ $? -eq 0 ]];then
  qemu-system-x86_64 \
    -enable-kvm \
    -m "$MEMORY" \
    -hda "$IMAGE" \
    -cdrom "$ISO"
    -boot d
fi
