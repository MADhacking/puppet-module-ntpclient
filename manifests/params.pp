# ntpclient::params provides OS specific parameters used internally

class ntpclient::params {
  case $::operatingsystem {
    'Gentoo' : {
      $package = ['net-misc/ntp']

      case $::initsystem {
        'systemd' : { $service = 'ntpdate' }
        default   : { $service = 'ntp-client' }
      }

      $conf_d = '/etc/conf.d/ntp-client'
    }
    default  : {
      fail("${::operatingsystem} not supported!")
    }
  }
}
