class profile::platform::windows::base {

  user { 'Art Vandelay':
    ensure => 'present',
    name => 'ArtVandelay',
    groups => 'Administrators',
  }

}
