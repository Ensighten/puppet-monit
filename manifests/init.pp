#
class monit(
  $interval       = 120,
  $interval_delay = undef,
  $httpd          = false,
) {

  class {'monit::package':
    notify  => Class['monit::service'],
  }

  class {'monit::config':
    interval       => $interval,
    interval_delay => $interval_delay,
    httpd          => $httpd,
    notify         => Class['monit::service'],
    require        => Class['monit::package'],
  }

  class {'monit::service':
    require => Class['monit::config'],
  }

}
