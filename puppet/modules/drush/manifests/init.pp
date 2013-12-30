class drush {

  if !$drush_dev_build {
    php::pear::module { 'drush-6.2.0.0':
      repository  => 'pear.drush.org',
      use_package => 'no',
    }
  }
  else {
    if !$drush_git_branch {$drush_git_branch = '8.x-6.x'}
    if !$drush_git_tag {$drush_git_tag_string = ''}
    else {$drush_git_tag_string = "&& cd drush && git checkout $drush_git_tag"}
    exec {'clone drush':
      command => "/usr/bin/git clone --branch ${drush_git_branch} http://git.drupal.org/project/drush.git ${drush_git_tag_string}" ,
      cwd     => '/usr/share/',
      creates => '/usr/share/drush/',
    }
    file {'symlink drush':
      ensure => link,
      path   => '/usr/bin/drush',
      target => '/usr/share/drush/drush.php',
      require => Exec['clone drush'],
    }
    exec {'run drush':
    # Needed to download a Pear library
      command => '/usr/bin/drush status',
      require => File['symlink drush'],
    }
  }

}
