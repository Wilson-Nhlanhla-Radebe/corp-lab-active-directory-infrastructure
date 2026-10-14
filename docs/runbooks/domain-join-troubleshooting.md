# Runbook: Windows client domain-join troubleshooting

> This runbook is for future verification. The attached Phase 1 implementation report does not establish a successful Windows client domain join, so do not describe this task as completed until it is demonstrated.

## 1. Confirm the target

On the Windows Pro client, record the date, network path (LAN/VPN), adapter and DNS servers. Do not include public IPs or credentials in repository evidence.

```powershell
ipconfig /all
Get-NetIPConfiguration
```

The client must use the intended Active Directory DNS server for the join flow; querying a public resolver will not locate private AD records.

## 2. Test DNS before changing anything

```powershell
nslookup corp.lab
nslookup dc01.corp.lab
nslookup -type=SRV _ldap._tcp.dc._msdcs.corp.lab
```

A correct A record alone is not sufficient. The SRV query should return the domain controller locator record for the lab domain.

## 3. Check service reachability

```powershell
Test-NetConnection dc01.corp.lab -Port 53
Test-NetConnection dc01.corp.lab -Port 389
nltest /dsgetdc:corp.lab
```

Use the actual current DC hostname and the necessary ports. AD DS uses additional protocols/ports beyond LDAP; don't assume TCP 389 alone proves domain join readiness.

## 4. Check time, account and domain settings

- Confirm client date/time is close to the domain controller's time.
- Confirm the Windows edition supports joining an AD domain.
- Confirm the join account has the required delegated permission.
- Capture the exact error message before changing configuration.

## 5. Perform and verify the join

Only proceed when DNS and locator lookups work. After the join and reboot, verify:

```powershell
whoami /upn
(Get-CimInstance Win32_ComputerSystem).PartOfDomain
(Get-CimInstance Win32_ComputerSystem).Domain
```

Record `PASS` only if the client reports domain membership and a normal domain-user sign-in is demonstrated. Redact user names/UPNs and network details from public evidence.
