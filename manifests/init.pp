# Puppet module to manage the squid http proxy server
# Source: https://github.com/pro-puppet/puppet-module-squid

class squid (
){

  package {'squid':
    ensure => present,
  }

  file { '/etc/squid3/squid.conf':
    ensure  => file,
    source  => 'puppet:///modules/squid/squid.conf',
    require => Package['squid'],
  }

  service {'squid3':
    ensure  => running,
    enable  => true,
    require => File['/etc/squid3/squid.conf'],
  }

}
