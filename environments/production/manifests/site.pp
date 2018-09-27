## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#

## Active Configurations ##

# Disable filebucket by default for all File resources:
File { backup => false }


package { 'hocon':
  ensure          => present,
  install_options => ['--no-ri', '--no-rdoc'],
  provider        => gem,
}


# VM Provision from template or machine in resource pool network
#vsphere_vm { '/HQ-DATACENTER/vm/PuppetServer/agent-2':
#  ensure => running,
#  resource_pool => '/ArkV-Developer/PuppetVM',
#  customization_spec => 'PuppetVM-Windows2016',
#  source => '/HQ-DATACENTER/vm/ArkV-Employees Folders/Kumar/Kur-win2016',
#}

exec { 'Wait for custom spec configuration':
  command => "sleep 1",
  path => "/usr/bin:/bin",
  timeout => 0,
}


node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
}

node 'agent-1.arklab.local' {
  include 'mssqlserver'
}

node 'agent-2.arklab.local' {
 include 'mssqlserver'
}
