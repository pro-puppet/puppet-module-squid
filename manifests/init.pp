# Puppet module to manage the squid http proxy server
# Source: https://github.com/pro-puppet/puppet-module-squid

class squid (
){

  package {'squid':
    ensure => present,
  }

  service {'squid3':
    ensure => running,
    enable => true,
  }

}
