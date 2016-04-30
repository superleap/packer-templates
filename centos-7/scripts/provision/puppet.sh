#!/usr/bin/env bash

# Install puppet 4.4 from puppetlabs repo
if [[ ! -f '/.leap/installed.puppet' ]]; then
    yum -y --nogpgcheck install https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
    yum -y install puppet-agent
    /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true
    service puppet restart
    printf "Finished installing puppet\n"

    if [[ -f '/root/.bashrc' ]] && ! grep -q 'export PATH=/opt/puppetlabs/bin:$PATH' /root/.bashrc; then
        echo 'export PATH=/opt/puppetlabs/bin:$PATH' >> /root/.bashrc
    fi

    if [[ -f '/etc/profile' ]] && ! grep -q 'export PATH=/opt/puppetlabs/bin:$PATH' /etc/profile; then
        echo 'export PATH=/opt/puppetlabs/bin:$PATH' >> /etc/profile
    fi

    source ~/.bashrc

    /opt/puppetlabs/puppet/bin/gem install r10k deep_merge semver --source http://rubygems.org
    ln -s /opt/puppetlabs/puppet/bin/gem /usr/bin/gem
    printf "Finished installing r10k, deep_merge, semver\n"

    touch '/.leap/installed.puppet'
else
    printf "Puppet installed already, skipping\n"
fi
