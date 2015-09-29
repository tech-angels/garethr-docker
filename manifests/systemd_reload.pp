# == Class: docker::systemd_reload
#
# For systems that have systemd
#
class docker::systemd_reload {
  $systemctl = $::osfamily ? {
    'Debian' => '/bin/systemctl',
    default  => '/usr/bin/systemctl',
  }

  exec { 'docker-systemd-reload':
    command     => "${systemctl} daemon-reload",
    refreshonly => true,
  }
}
