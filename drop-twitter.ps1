$adr = (Resolve-DnsName twitter.com -Type A).IPaddress

if (-not(Get-NetFirewallRule | where DisplayName -eq drop-twitter)) {
	New-NetFirewallRule -DisplayName "drop-twitter" -Description "" -Enabled True
}
Enable-NetFirewallRule -DisplayName "drop-twitter"

Set-NetFirewallRule -DisplayName "drop-twitter" -Direction Outbound -Action Block -RemoteAddress $adr -LocalAddress Any