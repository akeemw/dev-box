# Stages
stage { 'first': }

Stage['first'] -> Stage['main']

# Aptitide
class { 'apt':
  always_apt_update => true,
  stage   => 'first',
}

# Version Control
class { 'git': }

# Ruby Gems
package { ['sass', 'compass', 'bundler']:
  ensure => 'installed',
  provider => 'gem',
}

# Apache
class {'apache': }

apache::module { 'rewrite': }

#PHP
class { 'php':
  service             => 'apache',
  service_autorestart => false,
  module_prefix       => '',
}

php::module {
  [
    'php5-mysql',
    'php5-cli',
    'php5-curl',
    'php5-mcrypt',
    'php5-gd',
  ]:
}

class { 'php::pear':
  require => Class['php'],
}

class { 'xdebug':
  service => 'apache',
}

#Drush
include drush

#NodeJS
include nodejs

package { 'grunt-cli':
  provider => 'npm',
}

package { 'bower':
  provider => 'npm',
}

package { 'canvas':
  provider => 'npm',
}

package { 'css-sprite':
  provider => 'npm',
}

package { 'gulp':
  provider => 'npm',
}

package { 'gulpif':
  provider => 'npm',
}

package { 'gulp-sass':
  provider => 'npm',
}

package { 'gulp-uglify':
  provider => 'npm',
}

package { 'gulp-imageoptim':
  provider => 'npm',
}

#MySQL
class { '::mysql::server':
  root_password   => 'root',
}

#Misc
package { ['htop']:
  ensure => 'installed',
}

#Projects
include projects

projects::create { 'sample_html': }

/* Install Drupal 7 from GIT

projects::create { 'sample':
  git_url => 'http://git.drupal.org/project/drupal.git',
  git_branch => '7.x',
  conf => {
    'securepages_enable' => 0,
  },
}

*/
