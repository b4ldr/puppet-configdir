class configdir (
    Stdlib::Host $basdir = '/var/tmp/puppet-configdir'
) {
    file {$basdir:
        ensure => directory,
        purge  => true,
    }
}
