define configdir::file (
    String $configdir_dir,
    Hash $parasm = {},
) {
    include configdir
    if ! defined("Configdir::Dir[$configdir_dir]") {
        fail('need to define configdir_dir')
    }
    $test_file = "${configdir::basedir}/${configdir_dir}/${title.basename}"
    @file {$test_file:
        *      => $params,
        notify => Exec["configdir__dir_${configdir_dir}"],
    }
    @file {$title:
        *      => $params,
        require => Exec["configdir__dir_${configdir_dir}"],
    }

}
