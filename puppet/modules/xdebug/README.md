puphpet-xdebug
=============

Puppet module for installing XDEBUG PHP Extension

Installs Xdebug Support.

Example usage:

    class { 'xdebug':
      service => 'httpd'
    }

It automatically installs a handy shortcut for CLI debugging:

    $ xdebug foo.php

To disable it, install xdebug as:

    class { 'xdebug':
      service     => 'httpd',
      install_cli => false
    }

Created by: PuPHPet

GitHub: https://github.com/puphpet/puphpet-xdebug
