class dotfiles (
    $source = '/vhome',
    $ssh = true,
    $git = true,
    $vim = true,
    $drush = false,
) {

    if $ssh {
        class { '::dotfiles::ssh': source => $source }
    }

    if $git {
        class { '::dotfiles::git': source => $source }
    }

    if $vim {
        class { '::dotfiles::vim': source => $source }
    }
    
    if $drush {
        class { '::dotfiles::drush': source => $source }
    }
}
