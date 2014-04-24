class projects {
  file { [ "/srv/web/"  ]:
    ensure => directory
  }
}
