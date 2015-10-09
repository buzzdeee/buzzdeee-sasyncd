# private class, do not use directly
# defines default values for the module

class sasyncd::params {
  $interface = undef
  $interfacegroup = 'carp'
  $flushmode = 'startup'
  $control = 'isakmpd'
  $listen_on = undef
  $mode = undef
  $service_ensure = 'running'
  $service_enable = true
  $service_flags = undef
}
