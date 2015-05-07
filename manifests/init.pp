# ntpclient is used to manage an ntp client (net-misc/ntp on Gentoo)

class ntpclient ($servers) {
  include ntpclient::params
  include ntp::install

  service { $ntpclient::params::service:
    ensure    => running,
    enable    => true,
    subscribe => [File['ntp_client_server_conf']],
  }

  file { 'ntp_client_server_conf':
    ensure  => file,
    path    => $ntpclient::params::conf_d,
    owner   => root,
    group   => root,
    content => template('ntpclient/ntp-client.conf.d.erb'),
  }
}
