class profile::platform::windows::base {

  #include chocolatey

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

  dsc_cuserright { 'Log on as a service':
    dsc_ensure => 'Present',
    dsc_principal => 'ArtVandelay',
    dsc_constant => 'SeServiceLogonRight',
  }

 registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled': 
    ensure => present,
    type => dword,
    data => 0,
 }

 registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled': 
    ensure => present,
    type => dword,
    data => 0,
 }

 registry_value { 'ShutdownReasonUI':
    path => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Reliability',
    ensure => present,
    type => dword,
    data => 1,
  }

  file { 'C:/Temp':
    ensure => 'directory',
  }

  archive { 'MobaXterm':
    ensure => present,
    path => 'C:/Temp/MobaXterm_Installer_v21.3.zip',
    extract => true,
    extract_path => 'C:/Temp',
    source => 'https://download.mobatek.net/2132021082033134/MobaXterm_Installer_v21.3.zip',
  }

  exec { 'MobaXterm':
    command => 'C:\Windows\System32\msiexec.exe /i C:\Temp\MobaXterm_installer_21.3.msi /qn /norestart',
  }

  #package { '7zip':
  #  ensure   => latest,
  #  provider => 'chocolatey',
  #}

 # exec { '7-zip':
 #   command => 'C:\ProgramData\chocolatey\choco.exe install 7zip -y',
 # }

 # exec { 'curl':
 #   command => 'C:\ProgramData\chocolatey\choco.exe install curl -y',
 # }

}
