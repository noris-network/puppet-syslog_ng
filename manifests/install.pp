# == Class: syslog_ng::install
#
# This module installs syslog_ng
#

class syslog_ng::install {

  package { 'syslog-ng':
    ensure => installed,
  }

}
