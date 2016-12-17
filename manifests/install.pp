# == Class: syslog_ng::install
#
# This module installs syslog_ng
#

class syslog_ng::install {

  package { 'syslog-ng':
    ensure => installed,
  }
  package { 'syslog-ng-libdbi':
    ensure => installed,
    required => Package['syslog-ng'],
  }
  package { 'rsyslog':
    ensure => absent,
  }

}
