class profile::platform::windows::base {

  user { 'Art Vandelay':
    ensure => 'present',
    name => 'ArtVandelay',
    groups => 'Administrators',
  }

  local_security_policy { 'Log on as a service':
    ensure => present,
    policy_value => 'ArtVandelay',
  }
}
