# == Class: syslog_ng::install
#
# This module installs syslog_ng
#

class syslog_ng::install {
  
  package { 'epel-release': }
  
  package { 'syslog-ng':
    ensure => installed,
    require => Package['epel-release'],
  }
  package { 'rsyslog':
    ensure => absent,
  }

}
