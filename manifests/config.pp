#
class logwatch::config inherits logwatch {

  file { 'logwatch.conf':
    ensure  => file,
    path    => '/etc/logwatch/conf/logwatch.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('logwatch/logwatch.conf.erb'),
  }

  concat { $ignore_conf:
    path  => $logwatch::params::ignore_conf,
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  concat::fragment { 'header':
    target  => $ignore_conf,
    content => "###### REGULAR EXPRESSIONS IN THIS FILE WILL BE TRIMMED FROM REPORT OUTPUT #####\n",
    order   => '01',
  }
}
