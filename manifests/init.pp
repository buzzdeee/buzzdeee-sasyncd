# == Class: sasyncd
#
# Full description of class sasyncd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'sasyncd':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class sasyncd (
  $sharedkey,
  $peers,
  $interface = $::sasyncd::params::interface,
  $interfacegroup = $::sasyncd::params::interfacegroup,
  $flushmode = $::sasyncd::params::flushmode,
  $control = $::sasyncd::params::control,
  $listen_on = $::sasyncd::params::listen_on,
  $mode = $::sasyncd::params::mode,
  $service_ensure = $::sasyncd::params::service_ensure,
  $service_enable = $::sasyncd::params::service_enable,
  $service_flags = $::sasyncd::params::service_flags,
) inherits sasyncd::params {

  if $service_ensure == 'running' {
    $config_ensure = 'present'
  } else {
    $config_ensure = 'absent'
  }

  class { '::sasyncd::config':
    ensure         => $config_ensure,
    peers          => $peers,
    sharedkey      => $sharedkey,
    interface      => $interface,
    interfacegroup => $interfacegroup,
    flushmode      => $flushmode,
    control        => $control,
    listen_on      => $listen_on,
    mode           => $mode,
  }

  class { '::sasyncd::service':
    ensure => $service_ensure,
    enable => $service_enable,
    flags  => $service_flags,
  }

  Class['sasyncd::config'] ~>
  Class['sasyncd::service']

}
