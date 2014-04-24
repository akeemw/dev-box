class vagrant (
    $source = '/vhome',
    $ssh = true,
    $git = true,
    $vim = true
) {

    if $ssh {
        class { '::vagrant::ssh': source => $source }
    }

    if $git {
        class { '::vagrant::git': source => $source }
    }

    if $vim {
        class { '::vagrant::vim': source => $source }
    }
}
