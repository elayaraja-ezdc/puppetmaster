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
vsphere_vm { '/HQ-DATACENTER/vm/PuppetServer/puppetagent-1':
 ensure => running,
 resource_pool => '/ArkV-Developer/PuppetVM',
 customization_spec => 'PuppetVM-Windows2016',
 source => '/HQ-DATACENTER/vm/ArkV-Employees Folders/Kumar/Kur-win2016',
}

exec { 'Wait for custom spec configuration':
  command => "sleep 1800",
  path => "/usr/bin:/bin",
  timeout => 0,
}
notice("The value is: ------------------------------------- testing")
# sqlserver_instance{ 'MSSQLSERVER':
#   source                  => 'C:/Sqlserver/Setup/SQL_Server_2016/',
#   sa_pwd                  => 'VMware1!',
#   sql_sysadmin_accounts   => ['Administrator'],
#   install_switches        => {
#     'TCPENABLED'          => 1,
#     'SQLBACKUPDIR'        => 'C:\\MSSQLSERVER\\backupdir',
#     'SQLTEMPDBDIR'        => 'C:\\MSSQLSERVER\\tempdbdir',
#     'INSTALLSQLDATADIR'   => 'C:\\MSSQLSERVER\\datadir',
#     'INSTANCEDIR'         => 'C:\\Program Files\\Microsoft SQL Server',
#     'INSTALLSHAREDDIR'    => 'C:\\Program Files\\Microsoft SQL Server',
#     'INSTALLSHAREDWOWDIR' => 'C:\\Program Files (x86)\\Microsoft SQL Server',
#   }
# }

#$source = '\\192.168.20.141\ViewNAS-ISO\ISO\SQL Server\SQL2016\Setup\'

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
 
}

# node 'agent-1.arklab.local' {
#   include 'mssqlserver'
# }

