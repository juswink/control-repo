class profile::platform::windows::base {

  user { 'Art Vandelay':
    ensure => 'present',
    name   => 'ArtVandelay',
    groups => 'Administrators',
  }

 file { 'C:/adminTools':
    ensure => 'directory',
    mode   => '0650',
    owner  => 'ArtVandelay',
    group  => 'Administrators',
  }
}
