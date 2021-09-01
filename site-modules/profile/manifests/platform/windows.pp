class profile::platform::windows::base {

  user { 'Art Vandelay':
    ensure => 'present',
    name   => 'ArtVandelay',
    groups => 'Administrators',
  }

 file { 'C:/adminTools':
    ensure => 'directory',
  }

  acl { ':/adminTools':
    purge       => true,
    permissions => [
      { identity => 'Administrators', rights => ['read','execute'] },
      { identity => 'ArtVandelay', rights => ['full'] }
    ],
  }
}
