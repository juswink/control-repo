class profile::base {

  include chocolatey

  package { '7zip':
    ensure   => latest,
    provider => 'chocolatey',
  }

}
