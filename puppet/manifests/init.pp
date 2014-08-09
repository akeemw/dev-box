# Stage direction
stage { 'first': }

Stage['first'] -> Stage['main']

# Aptitide
class { 'apt':
  stage   => 'first',
  always_apt_update => true
}

class { 'vagrant':
  stage   => 'first',
}

# Version Control
class { 'git': }
package { ['subversion']:
  ensure => 'installed',
}

# Ruby Gems
package { ['sass', 'compass', 'bundler', 'jekyll']:
  ensure => 'latest',
  provider => 'gem',
}

# Apache
class {'apache': }

apache::module { 'rewrite': }

#MySQL
class { '::mysql::server':
  root_password   => 'root',
}

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

class { 'composer': }

exec { 'add-composer-path':
  command => 'sed -i \'1i export PATH="$HOME/.composer/vendor/bin:$PATH"\' $HOME/.bashrc',
  path    => '/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin',
  provider => 'posix',
  environment => 'HOME=/home/vagrant',
  require => Class['composer'],
}

exec { 'install-drush':
  command => "composer global require drush/drush:dev-master",
  path    => '/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin',
  provider => 'posix',
  environment => 'HOME=/home/vagrant',
  require => Class['composer'],
}

class { 'xdebug': }

#NodeJS
class { 'nodejs':
  version => 'stable',
}

package { ['grunt-cli', 'bower', 'gulp']:
  provider => 'npm',
  require => Class['nodejs'],
}

#Misc
package { ['htop']:
  ensure => 'installed',
}

#Projects
include projects

import "site"
