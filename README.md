dev-box
=======

# Vagrant LAMP environment using Puppet for configuration (Ubuntu)
Simplify the creation of a local development environment for Drupal. A drop in replacement for MAMP.

## Installation Instructions
1. Install [Virtual Box](https://www.virtualbox.org/)
2. Install [Vagrant](http://www.vagrantup.com/)
3. Install [Vagrant DNS](https://github.com/BerlinVagrant/vagrant-dns) `vagrant plugin install vagrant-dns`
4. Clone this repository and `cd` into the directory
5. Run `vagrant dns --install`
6. Run `vagrant up`

## Features

* Fast new project set up
	* Copy certain dotfiles from host (.ssh, .vimrc, .gitconfig)
  * Automatically created Virtual Hosts & Document Root
	* Auto-clone a git repository in the docroot (/web/[projectname]/[docroot])
	* Auto-create and optionally import databases (/web/[projectname]/puppet/import.sql)
  * Automatically create Drupal 7 settings.php file with - (/web/[projectname]/puppet/local.settings.php)
  *

## Notable Installs
* NodeJS & NPM
  * GulpJS
  * GruntJS
  * Bower
* Ruby & RubyGems
  * SASS & Compass
  * Bundler
* PHP 5.3 & Composer
  * Drush 7.x
  * XDebug
* htop

## Documentation
* [Puppet Docs](http://docs.puppetlabs.com/learning/index.html)
* [Vagrant Docs](http://docs.vagrantup.com/v2/)

## Required Vagrant Plugins
* https://github.com/BerlinVagrant/vagrant-dns

## Contributed Puppet Modules
* [Example42 Apache](http://forge.puppetlabs.com/example42/apache)
* [Puppet Labs apt](https://github.com/puppetlabs/puppetlabs-apt)
* [Puppet Labs Concat](http://forge.puppetlabs.com/puppetlabs/concat)
* [willdurand Composer](https://github.com/willdurand/puppet-composer)
* [Puppet Labs git](http://forge.puppetlabs.com/example42/git)
* [Puppet Labs MySQL](http://forge.puppetlabs.com/puppetlabs/mysql)
* [willdurand NodeJS](https://forge.puppetlabs.com/willdurand/nodejs)
* [Puppet Labs NTP](http://forge.puppetlabs.com/puppetlabs/ntp)
* [Example42 PHP](http://forge.puppetlabs.com/example42/php)
* [Example42 Puppi](http://forge.puppetlabs.com/example42/puppi)
* [Puppet Labs stdlib](http://forge.puppetlabs.com/puppetlabs/stdlib)
* [Lullabot Vagrant](https://github.com/Lullabot/lullapuppet)
* [Puppet Labs vcsrepo](http://forge.puppetlabs.com/puppetlabs/vcsrepo)
* [gabrielbull XDebug](https://github.com/gabrielbull/puppet-module-xdebug)
* [maestrodev wget](http://forge.puppetlabs.com/maestrodev/wget)

## Connection to the Database
* Connect via SSH
* MySQL User: root
* MySQL Password: root
* SSH User: vagrant
* SSH Password: vagrant

## Inspired by and borrows from:
* https://github.com/Lullabot/rome
* https://github.com/Luukyb/drupal-puppet
* https://github.com/drupalboxes/drupal-puppet
* https://github.com/mikebell/drupaldev-apache
* https://github.com/cyberswat/drupal-lamp
* https://github.com/Lullabot/lullapuppet
* https://puphpet.com/
