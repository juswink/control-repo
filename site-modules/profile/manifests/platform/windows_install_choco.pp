class profile::platform::windows::base::install::choco {

  use_7zip => false,

  include chocolatey

  exec { '7-zip':
    command => 'C:\ProgramData\chocolatey\choco.exe install 7zip',
  }
}
