# Aptitide

# Avoid a apt:ppa dependancy cycle and the fact that the current apt list doesn't have 
# 'python-software-properties' in it. https://tickets.puppetlabs.com/browse/MODULES-1258
exec { 'first_apt_update':
  command     => "/usr/bin/apt-get update",
} -> Package <||>

class { 'apt': }

#PHP 5.4 for Ubuntu 12.04
#apt::ppa {'ppa:ondrej/php5-oldstable': }

class { 'dotfiles': }

# Version Control
class { 'git': }

package { ['subversion']:
  ensure => 'installed',
}

# Ruby
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
 #require => Apt::Ppa['ppa:ondrej/php5-oldstable']
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
  user => "vagrant",
  path    => '/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin',
  provider => 'posix',
  environment => 'HOME=/home/vagrant',
  require => Class['composer'],
}

#Install Drush 6.x
exec { 'install-drush':
  command => "composer global require drush/drush:6.*",
  user => "vagrant",
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
package { ['htop', 'pv', 'libnotify-bin']:
  ensure => 'installed',
}

#Projects
class {'projects': }
