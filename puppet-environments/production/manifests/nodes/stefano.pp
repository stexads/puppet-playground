class nodes::stefano (
  String $version = '0.0.1'
) {

  notify { "Hello, I am node '${::hostname}'": }
  notify { "This message is coming from <production>/manifests/node/stefano.pp": }


  ##### MOTD module ######
  # If we include 'include motd' here, the module will use the template to generate the
  # /etc/motd file.
  include motd
  # Alternativel, we can define the class here and pass out parameters:
  #class { 'motd':
  #  content => "Welcome to stefano's node...\n"
  #}

  # Add a user 'stefano' to the system:
  user { 'stefano':
    ensure => 'present',
    # to remove the user:
    #ensure => 'absent',
    #system => true,
    shell => '/bin/bash',
    home => '/home/stefano',
    managehome => true,
    # following does not work (at least with this Puppet version)
    #managehome => $ensure ? { present => true, default => false, },
  }

  include geoipupdate
}
