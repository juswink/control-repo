class profile::platform::windows::base {

  include chocolatey

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

  exec { '7-zip':
    command => 'C:\ProgramData\chocolatey\choco.exe install 7zip -y',
  }

  exec { 'curl':
    command => 'C:\ProgramData\chocolatey\choco.exe install curl -y',
  }

  exec { 'copy':
    command => 'C:\ProgramData\chocolatey\bin\curl.exe -o C:\Temp\index.html https://gist.githubusercontent.com/dylanratcliffe/af0e24303d241b888152bd1cd7c9063d/raw/ad273bebc01c6dac176da7a5f3c38c4d9a584521/index.html',
  }

}
