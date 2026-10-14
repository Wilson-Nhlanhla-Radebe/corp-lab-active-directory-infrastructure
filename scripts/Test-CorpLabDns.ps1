[CmdletBinding()]
param(
    [string]$DomainName = 'corp.lab',
    [string]$DomainControllerName = 'dc01.corp.lab'
)

$ErrorActionPreference = 'Continue'
Write-Host "=== Host lookup: $DomainName ==="
Resolve-DnsName -Name $DomainName -ErrorAction Continue

Write-Host "`n=== Domain controller lookup: $DomainControllerName ==="
Resolve-DnsName -Name $DomainControllerName -ErrorAction Continue

Write-Host "`n=== LDAP SRV lookup ==="
Resolve-DnsName -Name "_ldap._tcp.dc._msdcs.$DomainName" -Type SRV -ErrorAction Continue

Write-Host "`n=== Domain controller discovery ==="
nltest /dsgetdc:$DomainName

Write-Host "`nReview which DNS servers are active with: Get-DnsClientServerAddress -AddressFamily IPv4"
Write-Host 'A successful command indicates only that specific lookup/test passed at this time.'
