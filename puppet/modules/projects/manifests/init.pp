# Original: https://github.com/mikebell/drupaldev-apache
# Added Flavor: https://github.com/drupalboxes/drupal-puppet

class projects {
  file { [ "/srv/web/"  ]:
    ensure => directory
  }
}
