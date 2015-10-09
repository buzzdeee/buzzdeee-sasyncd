# private class, do not use directly
# takes care about service management

class sasyncd::service (
  $ensure,
  $enable,
  $flags,
) {
  service { 'sasyncd':
    ensure => $ensure,
    enable => $enable,
    flags  => $flags,
  }
}
