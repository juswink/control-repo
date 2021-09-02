class profile::platform::windows::base::install:MobaXterm {

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
}
