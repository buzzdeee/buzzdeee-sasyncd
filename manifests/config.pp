# private class, do not use directly
# takes care to maintain the configuration file
class sasyncd::config (
  $ensure,
  $peers,
  $sharedkey,
  $interface,
  $interfacegroup,
  $flushmode,
  $control, 
  $listen_on,
  $mode,
) {
  file { '/etc/sasyncd.conf':
    owner    => 'root',
    group    => '0',
    mode     => '0600',
    template => 'sasyncd/sasyncd.conf.erb',
  }
}
