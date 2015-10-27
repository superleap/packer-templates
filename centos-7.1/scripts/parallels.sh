#!/usr/bin/env bash
PRLCTL_VERSION=$(cat /home/vagrant/.prlctl_version)
mkdir -p /mnt/parallels
mount -o loop /home/vagrant/prl-tools-lin.iso /mnt/parallels
/mnt/parallels/install --install-unattended-with-deps --progress
umount /mnt/parallels
rm -rf /home/vagrant/prl-tools-lin.iso
