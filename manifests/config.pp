# == Class: syslog_ng::config
#
# This module configures syslog
#
class syslog_ng::config {

  $version        = $::syslog_ng::version
  $perm           = $::syslog_ng::perm
  $dir_perm       = $::syslog_ng::dir_perm
  $use_dns        = $::syslog_ng::use_dns
  $use_fqdn       = $::syslog_ng::use_fqdn
  $frac_digits    = $::syslog_ng::frac_digits
  $keep_timestamp = $::syslog_ng::keep_timestamp

  concat { '/etc/syslog-ng/syslog-ng.conf':
  }

  concat::fragment { '/etc/syslog-ng/syslog-ng.conf-main':
    target  => '/etc/syslog-ng/syslog-ng.conf',
    content => template("${module_name}/main.erb"),
    order   => '1',
  }

}
