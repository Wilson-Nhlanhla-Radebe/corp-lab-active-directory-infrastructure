[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [Parameter(Mandatory = $true)]
    [ValidatePattern('^(DC=[^,]+)(,DC=[^,]+)*$')]
    [string]$DomainDN
)

# Creates five departmental OUs and domain-root global security groups only.
# It does NOT create users, set passwords, assign group memberships, assign share ACLs,
# change Group Policy, or modify existing users. Run with -WhatIf first.
# This is a starter for the disposable corp.lab lab; inspect before use.

$ErrorActionPreference = 'Stop'
Import-Module ActiveDirectory -ErrorAction Stop

$domain = Get-ADDomain
if ($domain.DistinguishedName -ne $DomainDN) {
    throw "Target DN '$DomainDN' does not match connected domain '$($domain.DistinguishedName)'. Stop and verify the target domain."
}

$departments = @('IT', 'HR', 'Marketing', 'Management', 'Finance')
foreach ($department in $departments) {
    $ouDN = "OU=$department,$DomainDN"
    $existingOU = Get-ADOrganizationalUnit -Identity $ouDN -ErrorAction SilentlyContinue

    if (-not $existingOU) {
        if ($PSCmdlet.ShouldProcess($ouDN, 'Create departmental OU')) {
            New-ADOrganizationalUnit -Name $department -Path $DomainDN -Description "Corp Lab - $department department" -ProtectedFromAccidentalDeletion $true
            Write-Host "Created OU: $ouDN"
        }
    } else {
        Write-Host "OU already exists: $ouDN"
    }

    # The supplied AD evidence shows group names such as GG_Finance in the domain root.
    $groupName = "GG_$department"
    $existingGroup = Get-ADGroup -Filter "Name -eq '$groupName'" -ErrorAction SilentlyContinue
    if (-not $existingGroup) {
        if ($PSCmdlet.ShouldProcess($groupName, 'Create global security group at domain root')) {
            New-ADGroup -Name $groupName -SamAccountName $groupName -GroupScope Global -GroupCategory Security -Path $DomainDN -Description "Corp Lab - $department departmental access group"
            Write-Host "Created group: $groupName"
        }
    } else {
        Write-Host "Group already exists: $groupName"
    }
}

Write-Host 'Finished. Verify OUs and groups in Active Directory. Add user memberships and share permissions only after separate review.'
