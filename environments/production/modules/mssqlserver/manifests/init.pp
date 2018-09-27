class mssqlserver {
  $source = '\\192.168.20.141\ViewNAS-ISO\ISO\SQL Server\SQL2016\Setup\'
  sqlserver_instance{‘MSSQLSERVER’:
    source   => $source,
    features => [‘SQL’],
  }

#   file { "C:\\tmp\\script.ps1":
#        mode => "777",
#        source => 'puppet:///modules/mssqlserver/script.ps1',
#        #notify => Exec['run_my_script'],
#    }
#  exec { "run_my_script":
#    command => "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -executionpolicy remotesigned -file C:\\tmp\\script.ps1",
#    timeout => 0,
#  }
}
