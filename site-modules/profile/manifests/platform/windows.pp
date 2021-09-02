class profile::platform::windows::base {

  registry_value { 'HKLM\System\CurrentControlSet\Control\FileSystem\LongPathsEnabled':
    ensure   => 'present',
    data     => [1],
    provider => 'registry',
    type     => 'dword',
  }
  
  user { 'Art Vandelay':
    ensure => 'present',
    name   => 'ArtVandelay',
    groups => 'Administrators',
  }

  file { 'C:/adminTools':
    ensure => 'directory',
  }

  acl { 'C:/adminTools':
    purge       => true,
    permissions => [
      { identity => 'Administrators', rights => ['read','execute'] },
      { identity => 'ArtVandelay', rights => ['full'] }
    ],
  }
}
