# private class, do not use directly
# takes care about service management

class sasyncd::service (
  ensure,
  flags,
) {
  service { 'sasyncd':
    ensure => $ensure,
    flags  => $flags,
  }
}
