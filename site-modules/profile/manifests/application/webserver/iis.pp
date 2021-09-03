class profile::application::webserver::iis (
  Boolean $default_website = true,
  String $doc_root           = 'C:\inetpub\wwwroot\sample_website',
  Integer $webserver_port    = 80,   # change this default value in Hiera common.yaml
  String $apppool            = 'sample_website',
  String $website_source_dir = 'puppet:///modules/profile/app/sample_website',

){

  if $::kernel != 'windows' {
    fail('Unsupported OS')
  }

  $iis_features = [
    'Web-Server',
    'Web-WebServer',
    'Web-Http-Redirect',
    'Web-Mgmt-Console',
    'Web-Mgmt-Tools',
  ]

  windowsfeature { $iis_features:
    ensure => present,
  }

  if $default_website != true {
    iis_site { 'Default Web Site':
      ensure => 'absent',
    }
  }

  iis_site { 'sample_website':
    ensure          => 'started',
    physicalpath    => $doc_root,
    applicationpool => $apppool,
    bindings        => [
      {
         'bindinginformation'   => "*:$webserver_port:",
         'protocol'             => 'http',
      },
    ],
  }

  file { $website_source_dir:
    ensure  => directory,
    path    => $doc_root,
    #source  => $website_source_dir,
    recurse => true,
  }

  file { "${doc_root}/index.html":
    ensure  => file,
    #content => epp('profile/app/sample_website.html.epp'),
  }


}

