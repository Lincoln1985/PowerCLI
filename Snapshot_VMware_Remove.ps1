$vmlist = Get-Content C:\Users\gemela\Desktop\snap.txt

foreach($VM in $VMlist) {

    Get-Snapshot -VM $vm |

    Remove-Snapshot -Confirm:$false

}

 

Disconnect-VIServer -Confirm:$false 