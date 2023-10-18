#!/bin/bash
set -euo pipefail

# ISO file can be passed on the command line
# if no file is passed, try to find the latest
ISO=${1:-$(ls *.iso|tail -n 1)}

qemu-system-x86_64 \
    --enable-kvm \
    -boot d \
    -cdrom ${ISO} \
    -smp 2 \
    -m 4096 \
    -audio pa,model=hda \
    -drive file=disk.img,if=ide,format=raw \
    -usb \
      -device qemu-xhci \
      -device usb-host,vendorid=0x0bda,productid=0x2838 \
      #-device usb-host,hostbus=1,hostaddr=25 \
