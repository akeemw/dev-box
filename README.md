Dev Box Alpha
=======

A personal LAMP (Ubuntu) development environment powered by [Vagrant](http://www.vagrantup.com/) and [Puppet](http://puppetlabs.com/puppet/what-is-puppet).

## Purpose
Simplify the creation of a local development environments for multi-project Drupal development. A drop in replacement for MAMP.

## Features
* Copy certain dotfiles from host (.ssh, .vimrc, .gitconfig)
* Automatically created Virtual Hosts & Document Roots
* Automatically clone a git repository in the docroot
* Automatically create and optionally import databases
* Automatically create Drupal 7 settings.php file


## Installation Instructions
1. Install [Virtual Box](https://www.virtualbox.org/)
2. Install [Vagrant](http://www.vagrantup.com/)
3. Install [Vagrant DNS](https://github.com/BerlinVagrant/vagrant-dns) `vagrant plugin install vagrant-dns`
4. Run `git clone https://github.com/akeemw/dev-box.git`
5. Run `cd dev-box`
5. Run `vagrant dns --install`
6. Run `vagrant up`

## Creating a new project

Create a new project by adding a new `project::create` call in `puppet/manifests/site.pp`. Adding a new project will:

* Create a create a Apache virtual host
* An empty MySQL database or one with import data
	*  A database for a project will be imported if `web/[projectname]/puppet/import.sql` exists before a `vagrant up` or `vagrant provision` is ran
* Document root for the project in `web/[projectname]/[docroot]`
* Create a Drupal 7 settings.php file with the database credentials in `web/[projectname]/puppet/local.settings.php`

### Examples:

Install Drupal 7 from GIT

	projects::create { 'd7':
		git_url => 'http://git.drupal.org/project/drupal.git',
		git_branch => '7.x',
	}

Create blank new project

	projects::create { 'projectname': }

## Connection to the Database
Connect to the MySQL database via SSH
* MySQL
	* Username: root
	* Password: root
* SSH
	* Username: vagrant
	* Password: vagrant

## Notable Machine Installations
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

## Other Documentation
* [Puppet Docs](http://docs.puppetlabs.com/learning/index.html)
* [Vagrant Docs](http://docs.vagrantup.com/v2/)

## Required Vagrant Plugins
* [Vagrant DNS](https://github.com/BerlinVagrant/vagrant-dns)

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


## Inspired by and borrows from:
* https://github.com/Lullabot/rome
* https://github.com/Luukyb/drupal-puppet
* https://github.com/drupalboxes/drupal-puppet
* https://github.com/mikebell/drupaldev-apache
* https://github.com/cyberswat/drupal-lamp
* https://github.com/Lullabot/lullapuppet
* https://puphpet.com/
