class mssqlserver {

   file { "C:\\tmp\\script.ps1":
        mode => "777",
        source => 'puppet:///modules/mssqlserver/script.ps1',
        #notify => Exec['run_my_script'],
    }
  exec { "run_my_script":
    command => "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -executionpolicy remotesigned -file C:\\tmp\\script.ps1",
    timeout => 0,
  }
}
