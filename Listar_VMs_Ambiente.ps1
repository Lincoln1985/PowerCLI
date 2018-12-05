Clear-Host
Write-Host "Listando Maquinas Linux do Ambiente" -ForegroundColor Yellow
$VMLinux = Get-VM | Get-VMGuest | Sort-Object | Where-Object {$_.OSFullName -like "*Linux*"} | Select VmName, OSFullName, State
$VMLinux
Write-Host "Você possui "$VMLinux.Count" maquinas Linux Ligadas no ambiente." -ForegroundColor Green

Write-Host "Listando os Servidores Windows do Ambiente" -ForegroundColor Yellow
$VMWin = Get-VM | Get-VMGuest | Sort-Object | Where-Object {$_.OSFullName -like "*Windows*"} | Select VmName, OSFullName, State
$VMWin
Write-Host "Você possui "$VMWin.Count" maquinas Windows Ligadas no ambiente." -ForegroundColor Green

$VM = Get-VM
Write-Host "Você possui um total de "$VM.Count" Maquinas Virtuais no ambiente." -ForegroundColor Cyan
Write-Host "Developed by Luiz Pontes" -foregroundcolor Cyan