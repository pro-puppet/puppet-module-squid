# Puppet module to manage the squid http proxy server
# Source: https://github.com/pro-puppet/puppet-module-squid

class squid (
  $cache_dir = '/var/spool/squid3',
  $cache_dir_size = '5000',
  $port      = '3128',
  $maximum_object_size = '1024',
){

  package {'squid':
    ensure => present,
  }

  file { '/etc/squid3/squid.conf':
    ensure  => file,
    content => template('squid/squid.conf.erb'),
    require => Package['squid'],
  }

  service {'squid3':
    ensure  => running,
    enable  => true,
    require => File['/etc/squid3/squid.conf'],
  }

}
