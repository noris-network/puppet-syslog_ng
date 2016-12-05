# == Class: syslog_ng::config
#
# This module configures syslog
#
class syslog_ng::config {

  concat { '/etc/syslog-ng/syslog-ng.conf': }

  concat::fragment { '/etc/syslog-ng/syslog-ng.conf-main':
    target  => '/etc/syslog-ng/syslog-ng.conf',
    content => epp("${module_name}/main.epp"),
    order   => '1',
  }

}
