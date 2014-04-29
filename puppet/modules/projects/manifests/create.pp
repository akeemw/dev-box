define projects::create (
  $basepath = "/srv/web",
  $docroot = "docroot",
  $git_url = "",
  $git_branch = "master",
  $conf = {}
) {

  file { "${basepath}/${name}":
    ensure => "directory",
  }

  file { "${basepath}/${name}/puppet":
    ensure => "directory",
  }

  /*
   * Clone a repository if we receive one otherwise just create a new folder with
   * the project name.
   */

  if($git_url) {
    vcsrepo { "${basepath}/${name}/docroot":
      ensure => present,
      provider => git,
      source => $git_url,
      revision => $git_branch,
      user => 'vagrant'
    }
  }

  else {
    file { "${basepath}/${name}/docroot":
      ensure => "directory",
    }
  }

  /*
   * Create the virtual host
   */

  apache::vhost { "${name}.alpha.dev":
    server_name   => "${name}.alpha.dev",
    serveraliases => [],
    docroot       => "${basepath}/${name}/$docroot",
    port          => '80',
    env_variables => [],
  }

  /*
   * Import a database if we find one otherwise just create a new database with
   * the project name.
   */

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
  else {
    mysql::db { $name:
      user     => $name,
      password => $name,
      host     => 'localhost',
      grant    => ['all'],
    }
  }
}
