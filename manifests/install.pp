#
class logwatch::install inherits logwatch {

  package { 'logwatch':
    ensure => $logwatch::package_ensure,
    name   => $logwatch::package_name,
  }

}
