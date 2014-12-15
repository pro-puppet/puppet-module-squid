class squid::params {

  case $::osfamily {
    'Debian': {
      $package_name = 'squid3'
      $service_name = 'squid3'
      $config_dir   = '/etc/squid3'
     }
    'Redhat': {
      $package_name = 'squid'
      $service_name = 'squid'
      $config_dir   = '/etc/squid'
    }
    default: {
      fail("${::osfamily} is not supported by the apache module")
    }
  }

}
