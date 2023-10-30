#!/bin/bash
set -euo pipefail

# ISO file can be passed on the command line
# if no file is passed, try to find the latest
ISO=${1:-$(ls *.iso|tail -n 1)}

SELF=$(realpath "${0}")
SELF_PATH=$(dirname "${SELF}")

MACADDR_FILE="${SELF_PATH}/.qemu-macaddr"

if [ -f "${MACADDR_FILE}" ]; then
    . "${MACADDR_FILE}"
fi

if [ -z "${QEMU_MACADDR-}" ]; then
    QEMU_MACADDR="52:54:00$(dd bs=1 count=3 if=/dev/random 2>/dev/null |hexdump -v -e '/1 ":%02X"')"
    echo "QEMU_MACADDR=${QEMU_MACADDR}" > .qemu-macaddr
fi

qemu-system-x86_64 \
    --enable-kvm \
    -boot d \
    -cdrom ${ISO} \
    -smp 2 \
    -m 4096 \
    -audio pa,model=hda \
    -drive file=disk.img,if=ide,format=raw \
    -nic bridge,model=virtio-net-pci,mac=${QEMU_MACADDR} \
    -usb \
      -device qemu-xhci \
      -device usb-host,vendorid=0x0bda,productid=0x2838 \
      #-device usb-host,hostbus=1,hostaddr=25 \
