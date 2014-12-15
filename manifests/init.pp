# Puppet module to manage the squid http proxy server
# Source: https://github.com/pro-puppet/puppet-module-squid

class squid (
  $cache_dir           = '/var/spool/squid3',
  $cache_dir_size      = '5000',
  $port                = '3128',
  $maximum_object_size = '1024',
  $http_access         = undef,
  $cache_peer          = undef,
  $cache_peer_access   = undef,
  $never_direct        = undef,
  $cache_only          = undef,
) inherits squid::params {


  package { $::squid::params::package_name:
    ensure => present,
  }

  file { "${::squid::params::config_dir}/squid.conf":
    ensure  => file,
    content => template('squid/squid.conf.erb'),
    require => Package[$::squid::params::package_name],
  }

  service { $::squid::params::service_name:
    ensure  => running,
    enable  => true,
    require => File["${::squid::params::config_dir}/squid.conf"],
  }

}
