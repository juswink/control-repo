class profile::platform::windows::base::install:choco { 'chocolatey':
  include chocolatey

  use_7zip => true,
}
