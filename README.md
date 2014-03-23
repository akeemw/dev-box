dev-box
=======

# Vagrant LAMP environment using Puppet for configuration (Ubuntu)
A very early version of something to simplify the creation of personal local development environments for Drupal

## Features
* Auto-create and import databases /web/[projectname]/puppet/import.sql
* Auto-clone a git repository in the docroot /web/[projectname]/docroot
* Automatically create vhosts

## Notable Installs
* NodeJS & NPM
** GulpJS
** GruntJS
** Bower
* Ruby & RubyGems
** SASS & Compass
** Bundler
* PHP & Composer
** Drush 7.x
** XDebug
* htop

## Documentation
* [Puppet Docs](http://docs.puppetlabs.com/learning/index.html)
* [Vagrant Docs](http://docs.vagrantup.com/v2/)

## Vagrant Plugins
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
* [PuPHPet XDebug](https://github.com/puphpet/puphpet-xdebug)
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
