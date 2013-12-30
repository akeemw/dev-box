class xdebug (
  $service = 'httpd',
  $install_cli = $xdebug::params::install_cli
) inherits xdebug::params {

  if defined(Package[$method_package]) == false {
    package { 'xdebug':
      name    => $xdebug::params::pkg,
      ensure  => installed,
      require => Package[$xdebug::params::php],
      notify  => Service[$service],
    }
  }

  # shortcut for xdebug CLI debugging
  if $xdebug::params::install_cli and defined(File['/usr/bin/xdebug']) == false {
    file { '/usr/bin/xdebug':
      ensure  => present,
      mode    => '+X',
      source  => 'puppet:///modules/xdebug/cli_alias.erb',
      require => [
        Package[$xdebug::params::php],
        Package[$xdebug::params::pkg]
      ]
    }
  }

}
