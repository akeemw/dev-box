class projects {
  file { [ "/srv/web/"  ]:
    ensure => directory
  }
  
  # Get the structured data
  $projects = hiera('projects')
  
  create_resources(projects::create, $projects)
}
