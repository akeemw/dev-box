class vagrant::drush ( $source = '/vhome') {

    file { "$source/.drush":
        ensure => directory,
    }

    file { '/home/vagrant/.drush':
        ensure  => directory,
        owner   => vagrant,
        group   => vagrant,
        source  => "$source/.drush",
        recurse => true,
        require => File["$source/.drush"],
    }

}
