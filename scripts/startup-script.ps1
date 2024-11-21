Start-Transcript -path C:\output.txt -append

$Interface = Get-NetAdapter | Where-Object { $_.InterfaceDescription -like '*Ethernet*' } 

$Address = Get-NetIPAddress -InterfaceAlias $Interface.Name | Where-Object { $_.AddressFamily -eq "IPv4" }

If ($Address.SuffixOrigin = "Dhcp"){
    
    $IP = $Address.IPAddress
    $PrefixLength = $Address.PrefixLength
    $SubnetMask = "255.255.255.0"
    $GateWay = Get-NetRoute -InterfaceAlias $Interface.ifAlias -DestinationPrefix "0.0.0.0/0" | Select-Object -ExpandProperty NextHop
    netsh interface ip set address $Interface.ifAlias static $IP $SubnetMask $GateWay
    Set-DnsClientServerAddress -InterfaceAlias $Interface.ifAlias -ServerAddresses (@($IP))

} 

Stop-Transcript
