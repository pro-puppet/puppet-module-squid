file { '/disk':
  ensure => directory,
} ->

file { '/disk/trump':
  ensure => directory,
} ->

file { '/disk/trump/squid':
  ensure => directory,
} ->

class { 'squid':
  cache_dir => '/disk/trump/squid',
  port      => '8080',
}
