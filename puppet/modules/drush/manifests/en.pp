define drush::en ($site_path, $site_alias = "", $log = undef) {
  include drush

  if $log { $log_output = " >> ${log} 2>&1" }

  exec {"drush-en-${name}":
    command     => "drush ${site_alias} en ${name} -y ${log_output}",
    cwd         => $site_path,
    refreshonly => true,
  }
                          
}
