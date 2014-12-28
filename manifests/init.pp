# == Class: logwatch
#
# This class configures Logwatch
#
# Parameters
# $package_ensure
# $package_name
#
class logwatch (
  $format         = $logwatch::params::format,
  $mail_to        = $logwatch::params::mail_to,
  $mail_from      = $logwatch::params::mail_from,
  $range          = $logwatch::params::range,
  $detail         = $logwatch::params::detail,
  $service        = $logwatch::params::service,
  $package_ensure = $logwatch::params::package_ensure,
  $package_name   = $logwatch::params::package_name,
) inherits logwatch::params {

  validate_string($format)
  validate_string($mail_to)
  validate_string($mail_from)
  validate_re($range, ['^All$', '^Today$', '^Yesterday$'])
  validate_re($detail, ['^Low$', '^Med$', '^High$'])
  validate_array($service)
  validate_string($package_ensure)
  validate_string($package_name)

  anchor { 'logwatch::begin': } ->
  class { 'logwatch::install': } ->
  class { 'logwatch::config': } ->
  anchor { 'logwatch::end': }

}