PRLCTL_VERSION=$(cat /home/vagrant/.prlctl_version)
cd /tmp
mount -o loop /home/vagrant/prl-tools-lin.iso /mnt
sh /mnt/prl-tools-lin/install
umount /mnt
rm -rf /home/vagrant/prl-tools-*.iso

