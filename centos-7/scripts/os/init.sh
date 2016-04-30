#!/usr/bin/env bash

# Create base junk folder
if [[ ! -d '/.leap' ]]; then
    mkdir -p '/.leap'

    printf "Created base /.leap folder\n"
fi

# CentOS comes with tty enabled. Disabling it improves security, apparently
if [[ ! -f '/.leap/disabled.tty' ]]; then
    perl -pi'~' -e 's@Defaults(\s+)requiretty@Defaults !requiretty@g' /etc/sudoers

    printf "Disabled tty\n"

    touch '/.leap/disabled.tty'
else
    printf "CentOS tty was already disabled, skipping\n"
fi

# Iptables fixes
if [[ ! -f '/.leap/enabled.firewall' ]]; then
    touch /etc/sysconfig/ip6tables
    yum install -y iptables-services
    systemctl mask firewalld
    systemctl enable iptables
    systemctl enable ip6tables
    systemctl stop firewalld
    systemctl start iptables
    systemctl start ip6tables

    printf "Enabled firewall\n"

    touch '/.leap/enabled.firewall'
else
    printf "CentOS firewall through iptables was already enabled, skipping\n"
fi
