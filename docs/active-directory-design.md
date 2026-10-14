# Active Directory design

## Domain and roles

- Domain: `corp.lab`
- Domain controller: `DC01`
- Platform: Windows Server 2022 Standard
- Services: Active Directory Domain Services (AD DS) and DNS

The attached implementation report states that the domain controller was deployed and promoted successfully. The screenshot evidence shows the `corp.lab` namespace and departmental structure in Active Directory Users and Computers.

## Departmental organisational units

| Department | Accounts listed in source report |
|---|---:|
| IT | 4 |
| HR | 4 |
| Marketing | 4 |
| Management | 4 |
| Finance | 3 |
| **Total** | **19** |

The departmental OUs organise accounts by business function. The full list of display names from the source report is not duplicated here to keep the public portfolio focused on the design rather than account-level personal data.

## Security groups and access model

Screenshots show a departmental security group named `GG_Finance` and the report describes departmental groups for access management. The intended pattern is:

```text
Department OU
   └── User accounts
          └── Departmental security group (for example, GG_Finance)
                 └── Department share permissions
```

The attached screenshot shows `GG_Finance` as a group in the domain and a demonstration user as a member. Group naming and actual object placement should be checked against the live domain before re-running any script.

## Safe starter script

[`../scripts/New-CorpLabStructure.ps1`](../scripts/New-CorpLabStructure.ps1) is an idempotent starter that creates five departmental OUs and global security groups named `GG_<Department>` at the domain root if absent. It does not create users, set passwords, assign memberships, modify share ACLs, or change Group Policy. Review the target domain before using it.

```powershell
Import-Module ActiveDirectory
Get-ADDomain | Select-Object DNSRoot, DistinguishedName, PDCEmulator
./scripts/New-CorpLabStructure.ps1 -DomainDN 'DC=corp,DC=lab' -WhatIf
```

Run from a domain-joined administrative PowerShell session. Confirm the returned domain DN matches the intended lab first. Use `-WhatIf` to preview changes, then remove `-WhatIf` only after review and backup.

## Validation commands

```powershell
Get-ADDomain
Get-ADDomainController -Filter * | Select-Object HostName, IPv4Address, Site
Get-ADOrganizationalUnit -Filter * | Select-Object Name, DistinguishedName
Get-ADGroup -Filter 'Name -like "GG_*"' | Select-Object Name, GroupScope, GroupCategory
Get-Service NTDS,DNS
```

## Identity hygiene

- Keep separate standard and privileged accounts.
- Use security groups as the permission-management unit where practical.
- Disable lab accounts when no longer needed.
- Never store passwords in scripts or Git.
- Use lab-only demonstration accounts and avoid publishing production user lists.
