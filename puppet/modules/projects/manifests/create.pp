define projects::create ($basepath = "/srv/web", $git_url = "", $git_branch = "", $conf = {}) {
  file { "${basepath}/${name}":
    ensure => "directory",
  }

  file { "${basepath}/${name}/puppet":
    ensure => "directory",
  }

  if($git_url) {
    git::reposync { $name:
      source_url      => $git_url,
      branch          => $git_branch,
      destination_dir => "${basepath}/${name}/docroot",
    }
  }
  else {
    file { "${basepath}/${name}/docroot":
      ensure => "directory",
    }
  }

  apache::vhost { "${name}.alpha.dev":
    server_name   => "${name}.alpha.dev",
    serveraliases => [],
    docroot       => "${basepath}/${name}/docroot",
    port          => '80',
    env_variables => [],
  }

  $import_exists = file("${basepath}/${name}/puppet/import.sql", '/dev/null')

  if($import_exists != '') {
    file { "${basepath}/${name}/puppet/import.sql":
      replace => false,
    }

    mysql::db { $name:
      user     => $name,
      password => $name,
      host     => 'localhost',
      grant    => ['all'],
      sql      => "${basepath}/${name}/puppet/import.sql",
      require  => File["${basepath}/${name}/puppet/import.sql"]
    }

    file { "${name}_settings":
      ensure  => present,
      path    => "${basepath}/${name}/puppet/local.settings.php",
      content => template("projects/local.settings.php.erb"),
      require => File["${basepath}/${name}/puppet"],
    }
  }
}
