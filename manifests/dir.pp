define configdir::dir (
    String                  $validate_cmd,
    Array[Stdlib::Unixpath] $unmanaged_files = []
) {
    include configdir
    # this makes if unix specific
    # TODO: safe title
    $basdir = "${configdir::basedir}/${title.basename}"
    file {$basdir:
        ensure => directory,
    }
    $unmanaged_files.each |$file| {
        $test_file = "${basedir}/${file.basename}"
        file {$test_file:
            ensur  => link,
            target => $file,
        }
    }
    exec {"configdir__dir__${title}":
        command     => $validate_cmd,
        refreshonly => true,
    }
}
