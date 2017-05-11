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

  file { 'ignore.conf':
    ensure  => file,
    path    => '/etc/logwatch/conf/ignore.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('logwatch/ignore.conf.erb'),
  }

}
