#!/usr/bin/env bash
PARALLELS_TOOLS_ISO=/home/vagrant/prl-tools-lin.iso
mount -o ro -o loop $PARALLELS_TOOLS_ISO /media/cdrom
/media/cdrom/install --install-unattended-with-deps --progress
umount /media/cdrom
