# == Define: syslog_ng::source
#
# This define configures a single source definition in the syslog_ng configuration file
#
# === Parameters
#
define syslog_ng::source ( $definition ){

  $data = {
    'title'      => $title,
    'type'       => 'source',
    'definition' => $definition,
  }

  concat::fragment { "/etc/syslog-ng/syslog-ng.conf-main-source-${title}":
    target  => '/etc/syslog-ng/syslog-ng.conf',
    content => epp("${module_name}/statement.epp", $data),
    order   => 2,
  }
}
