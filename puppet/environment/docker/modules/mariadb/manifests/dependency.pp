###
### dependency.pp, ensure directories.
###
class mariadb::dependency {
    ## python dependencies
    contain python

    ## local variables
    $root_dir       = $::mariadb::root_dir
    $pyyaml_version = $::mariadb::pyyaml_version

    ## install dependency
    package { 'pyyaml':
        ensure      => $pyyaml_version,
        provider    => 'pip',
        require     => Class['python'],
    }

    $directories = [
        "${root_dir}/log",
        "${root_dir}/log/database",
    ]

    ## create log directories
    file { $directories:
        ensure => 'directory',
    }
}
