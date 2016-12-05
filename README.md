# puppet-syslog\_ng

The syslog\_ng puppet module installes and configures syslog\_ng.
The goal is to support the most complex configurations and compile them
into a nice, easy to read, single configuration file.

## Usage

To build your configuration, you'll need the main class, and at least one source, destination and log statement.

Here is an example for a simple configuration which logs everything to /var/log/messages:

Load the main class.
```puppet
  include ::syslog_ng
  # or
  class{'::syslog_ng':}
```

Create a source:
```puppet
  syslog_ng::source {'s_src':
    definition => 'internal(); unix-stream("/dev/log" max-connections(1024)); file("/proc/kmsg" program_override("kernel: "));',
  }
```

Create a destination:
```puppet
  syslog_ng::destination {'d_messages':
    definition => 'file("/var/log/messages");',
  }
```

Link them together with a log statement:
```puppet
  syslog_ng::log {'messages':
    sources      => [ 's_src' ],
    destinations => [ 'd_messages' ]',
  }
```

You can also create filter definitions with the syslog\_ng::filter define:

```puppet
  syslog_ng::filter {'f_sshd':
    definition => 'program(sshd);',
  }
```

and add this filter to a log statement:

```puppet
  syslog_ng::log {'sshd':
    sources      => [ 's_src' ],
    filters      => [ 'f_sshd' ]',
    destinations => [ 'd_sshd' ]',
  }
```
