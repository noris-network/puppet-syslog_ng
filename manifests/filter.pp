# == Define: syslog_ng::source
#
# This define configures a single filter definition in the syslog_ng configuration file
#
# === Parameters
#
define syslog_ng::filter ( $definition ){

  $data = {
    'title'      => $title,
    'type'       => 'filter',
    'definition' => $definition,
  }

  concat::fragment { "/etc/syslog-ng/syslog-ng.conf-main-filter-${title}":
    target  => '/etc/syslog-ng/syslog-ng.conf',
    content => epp("${module_name}/statement.epp", $data),
    order   => 3,
  }
}
