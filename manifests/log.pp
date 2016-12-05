# == Define: syslog_ng::source
#
# This define configures a single log definition in the syslog_ng configuration file
#
# === Parameters
#
define syslog_ng::log (
  $destinations,
  $sources,
  $filters=undef,
  ){

  $data = {
    'title'        => $title,
    'destinations' => $destinations,
    'sources'      => $sources,
    'filters'      => $filters,
  }

  concat::fragment { "/etc/syslog-ng/syslog-ng.conf-main-log-${title}":
    target  => '/etc/syslog-ng/syslog-ng.conf',
    content => epp("${module_name}/log.epp", $data),
    order   => 5,
  }
}
