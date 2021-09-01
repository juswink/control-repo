class profile::platform::windows::profile::base {

  user { 'Art Vandelay':
    ensure => 'present',
    name => 'ArtVandelay',
    groups => [ 'Administrators', 'NT_SERVICE\ALL SERVICES' ],
  }

}
