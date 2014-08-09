# Stages
stage { 'first': }

Stage['first'] -> Stage['main']

# Aptitide
class { 'apt':
  always_apt_update => true,
  stage   => 'first',
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

class { 'xdebug':
  service              => "apache",
  ini_file_path        => "/etc/php5/conf.d/xdebug.ini",
  default_enable       => '1',
  remote_enable        => '1',
  remote_handler       => 'dbgp',
  remote_host          => '33.33.33.1',
  remote_port          => '9000',
  remote_autostart     => '0',
  remote_connect_back  => '1'
}

#NodeJS
include nodejs

package { 'grunt-cli':
  provider => 'npm',
}

package { 'bower':
  provider => 'npm',
}

package { 'gulp':
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

import "site"
