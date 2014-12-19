# = Class: squid
#
# Base Squid class
#
# == Parameters
#
# [*cache_dir*]
#   String.  Filesystem location to locate cache
#   Default: /var/spool/squid3
#
# [*cache_dir_size*]
#   Integer.  Size in MB of cache to keep
#   Default: 5000
#
# [*port*]
#   Integer.  Port for squid to listen on
#   Default: 3128
#
# [*maximum_object_size*]
#   Integer. Biggest object to cache in MB
#   Default: 3128
#
# [*http_access*]
#   Array of strings. HTTP access list rules.
#   Default: []
#   Example: [ 'allow localnet', 'deny mynet'  ]
#
# [*cache_peer*]
#   Array of strings. Upstream caches to peer with
#   Default: []
#   Example: [ 'squid3.example.com' ]
#
# [*cache_peer_access*]
#   Array of strings. ACL entries for cache peers
#   Default: []
#
# [*never_direct*]
#   Array of strings. Hosts to connect directly to
#   Default: []
#   Example: [ 'directconnect1.example.com' ]
#
# [*cache_only*]
#   Boolean. Use the cache never
#   Default: false
#
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
  $cache_only          = false,
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
