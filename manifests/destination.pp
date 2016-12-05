# == Define: syslog_ng::destination
#
# This define configures a single destination definition in the syslog_ng configuration file
#
# === Parameters
#
define syslog_ng::destination ( $definition ){

  $data = {
    'title'      => $title,
    'type'       => 'destination',
    'definition' => $definition,
  }

  concat::fragment { "/etc/syslog-ng/syslog-ng.conf-main-destination-${title}":
    target  => '/etc/syslog-ng/syslog-ng.conf',
    content => epp("${module_name}/statement.epp", $data),
    order   => 4,
  }
}
