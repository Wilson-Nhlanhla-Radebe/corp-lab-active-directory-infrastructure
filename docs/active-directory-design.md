# Active Directory design

## Domain and server roles

- **Domain:** `corp.lab`
- **Domain controller:** `DC01`
- **Platform:** Windows Server 2022 Standard
- **Services:** Active Directory Domain Services (AD DS) and DNS

## Departmental organisational units

| Department | Demonstration accounts |
|---|---:|
| IT | 4 |
| HR | 4 |
| Marketing | 4 |
| Management | 4 |
| Finance | 3 |
| **Total** | **19** |

The five OUs organise demonstration accounts by business function. Account display names are not repeated here; the screenshots focus on the directory structure and management tasks.

## Security groups and access model

The departmental access pattern uses global security groups such as `GG_Finance` to grant access to departmental shared resources.

```text
Department OU
   └── User accounts
          └── Departmental security group (for example, GG_Finance)
                 └── Department share permissions
```

This approach centralises permission management around group membership rather than individual user ACLs.

## Lab automation script

[`../scripts/New-CorpLabStructure.ps1`](../scripts/New-CorpLabStructure.ps1) creates the five departmental OUs and corresponding `GG_<Department>` global security groups when they are absent. It does not create users, set passwords, assign group memberships, modify share ACLs or change Group Policy.

```powershell
Import-Module ActiveDirectory
Get-ADDomain | Select-Object DNSRoot, DistinguishedName, PDCEmulator
./scripts/New-CorpLabStructure.ps1 -DomainDN 'DC=corp,DC=lab' -WhatIf
```

Run the script from a domain-joined administrative PowerShell session. The `-WhatIf` option previews actions. Confirm the target domain and review the proposed changes before running it without `-WhatIf`.

## Validation commands

```powershell
Get-ADDomain
Get-ADDomainController -Filter * | Select-Object HostName, IPv4Address, Site
Get-ADOrganizationalUnit -Filter * | Select-Object Name, DistinguishedName
Get-ADGroup -Filter 'Name -like "GG_*"' | Select-Object Name, GroupScope, GroupCategory
Get-Service NTDS,DNS
```
