define xdebug::augeas (
  $value    = '',
  $ini_file = $xdebug::params::ini_file,
  $ensure   = present,
  $service = 'httpd'
  ) {

  include xdebug

  $changes = $ensure ? {
    present => [ "set 'Xdebug/${name}' '${value}'" ],
    absent  => [ "rm 'Xdebug/${name}'" ],
  }

  augeas { "xdebug_ini-${name}":
    incl    => "${ini_file}",
    lens    => 'Php.lns',
    changes => $changes,
    notify  => Service[$service],
    require => [
      Package[$xdebug::params::php],
      Package[$xdebug::params::pkg]
    ]
  }
}
