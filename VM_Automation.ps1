#### COMENTÁRIOS ####
 
 ####Write-Host "Carregando módulo do VMware no PowerShell" -ForegroundColor Yellow
 ####Add-PSSnapin VMware.VimAutomation.Core
 ####Write-Host "Coletando Credenciais" -ForegroundColor Yellow
 ####$CRED = Get-Credential
 ####Write-Host "Conectando no vCenter" -ForegroundColor Yellow
 ####Connect-VIServer -Server vcenter.azulseguros.com.br -Credential $CRED
 
 Clear-Host
 $Lista = Import-Csv "C:\Scripts\Windows\Windows.csv" #Preencher com o Caminho do Arquivo CSV.
 
 #####################################
 #### NÃO EDITAR AS LINHAS ABAIXO ####
 #####################################
 
 foreach ($Lista in $Lista)
 {
 
 $Vmname = $Lista.Vmname
 $Template = $Lista.Template
 $Cluster = $Lista.Cluster
 $Location = $Lista.Location
 $Datastore = $Lista.Datastore
 $NumCPU = $Lista.NumCPU
 $MemoryGB = $Lista.MemoryGB
 #$PortGroupMgmt = $Lista.PortGroupMgmt
 $dvs_producao = $Lista.dvs_producao

 ###parametros que precis�o ser editados conforme a sua infraestrutura###
 
 Write-Host "PROVISIONANDO A VM $Vmname USANDO O TEMPLATE $Template" -ForegroundColor Yellow
 New-VM -Name $Vmname -Template $Template -Datastore $Datastore -ResourcePool $Cluster -Location $Location
 Write-Host "CONFIGURANDO HARDWARE -> CPU = $NumCPU Cores e RAM = $MemoryGB GB" -ForegroundColor Yellow
 Set-VM -VM $Vmname -MemoryGB $MemoryGB -NumCPU $NumCPU -Confirm: $false
 #Write-Host "ADICIONANDO INTERFACE DE REDE NO PORTGROUP $PortGroupMgmt" -ForegroundColor Yellow
 #New-NetworkAdapter -VM $Vmname -Networkname $PortGroupMgmt -WakeOnLan -StartConnected -Type Vmxnet3
 #Write-Host "ADICIONANDO INTERFACE DE REDE NO PORTGROUP $dvs_producao" -ForegroundColor Yellow
 #New-NetworkAdapter $Vmname $dvs_producao -WakeOnLan -StartConnected -Type Vmxnet3
 }