class profile::platform::windows::profile::base {

  user { 'Art Vandelay':
    name => 'ArtVandelay',
    ensure => 'present',
    groups => [ 'Administrators', 'NT_SERVICE\ALL SERVICES' ],
  }

}
