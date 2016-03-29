#!/usr/bin/env bash

# Clean up unneeded packages.
yum -y clean all

rm -rf VBoxGuestAdditions_*.iso
rm -rf /tmp/rubygems-*
