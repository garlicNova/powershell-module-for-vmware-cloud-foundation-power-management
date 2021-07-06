$moduleLoaded = Get-Module | Where-Object {$_.Name -eq "VMware.PowerManagement"}
if ($moduleLoaded) {
    Remove-module VMware.PowerManagement
}
Import-Module .\VMware.PowerManagement.psm1

#Clear-Host
Start-SetupLogFile -Path $PSScriptRoot -ScriptName $MyInvocation.MyCommand.Name


$vcServer = "ldn-w01-vc01.ldn.cloudy.io"
$vcUser = "administrator@vsphere.local"
$vcPass = "VMw@re1!"

$edgeNodes = "ldn-w01-en01", "ldn-w01-en02"

#### Edge

#Get Virtual Machine to Host Mapping in the Virtual Infrastructure Workload Domain
#It is already in powershell

#Shut Down the NSX-T Edge Nodes in the Virtual Infrastructure Workload Domain

Stop-CloudComponent -server $vcServer -user $vcUser -pass $vcPass -nodes $edgeNodes -timeout 600
Start-CloudComponent -server $vcServer -user $vcUser -pass $vcPass -nodes $edgeNodes -timeout 600