Connect-VIServer -Server YourVC

 

#VM Server List

$vmlist = Get-Content C:\Users\lju012\Documents\Servers.txt

 

foreach($VM in Get-VM $VMlist) {

    New-Snapshot -VM $vm -Name "$($vm.Name)_BEFOREPATCH" -description 'exemple'

}

Disconnect-VIServer -Confirm:$false 