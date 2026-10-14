# Runbook: Windows client domain-join troubleshooting

Use this sequence to diagnose a Windows client that cannot join `corp.lab`. The project evidence does not currently include a verified successful join, so validate the result separately from the Domain Controller and GLPI tests.

## 1. Confirm the client configuration

Record the adapter and DNS configuration and confirm the client is using the intended Active Directory DNS server.

```powershell
ipconfig /all
Get-NetIPConfiguration
```

A public resolver will not return the private AD records needed for domain discovery.

## 2. Test DNS before changing anything

```powershell
nslookup corp.lab
nslookup dc01.corp.lab
nslookup -type=SRV _ldap._tcp.dc._msdcs.corp.lab
```

The SRV lookup should return the domain-controller locator record for the lab domain.

## 3. Check service reachability

```powershell
Test-NetConnection dc01.corp.lab -Port 53
Test-NetConnection dc01.corp.lab -Port 389
nltest /dsgetdc:corp.lab
```

Active Directory uses additional protocols and ports beyond LDAP; TCP 389 alone does not prove that a domain join can succeed.

## 4. Check time, account and domain settings

- Confirm the client clock is close to the Domain Controller's time.
- Confirm the Windows edition supports joining an AD domain.
- Confirm the join account has the required permission.
- Capture the exact error before changing configuration.

## 5. Perform and verify the join

After DNS and domain-controller discovery succeed, attempt the join and reboot. Then verify:

```powershell
whoami /upn
(Get-CimInstance Win32_ComputerSystem).PartOfDomain
(Get-CimInstance Win32_ComputerSystem).Domain
```

A successful result should show domain membership and a normal domain-user sign-in.
