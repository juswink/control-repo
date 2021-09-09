class profile::base {

  include chocolatey

  package { '7zip':
    ensure   => latest,
    provider => 'chocolatey',
    install_options => '/INSTALLDIR=""C:\Program Files\7-zip""',
  }

}
