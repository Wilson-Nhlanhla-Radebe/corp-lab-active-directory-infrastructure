# Evidence index

Ten selected original PNG screenshots document system state and workflow examples at the time they were captured. They are ordered from directory structure through offboarding.

| Evidence file | What it shows | Interpretation |
|---|---|---|
| [`ad-organizational-structure.png`](../screenshots/ad-organizational-structure.png) | `corp.lab` domain, departmental OUs and security groups | Shows directory organisation at capture time; not current domain health |
| [`powershell-smb-share-inventory.png`](../screenshots/powershell-smb-share-inventory.png) | PowerShell `Get-SmbShare` output with share names and paths | Inventory only; it does not show effective permissions |
| [`department-folder-acl.png`](../screenshots/department-folder-acl.png) | Finance folder ACL dialog | Shows configured entries including `GG_Finance` and a `CORP\Users` read-type entry; not effective access for every user |
| [`oci-security-rule-configuration.png`](../screenshots/oci-security-rule-configuration.png) | One OCI ingress rule for TCP 53 from `10.0.0.0/24` | One configuration view, not a complete or current security-rule inventory |
| [`glpi-ldap-connection-test.png`](../screenshots/glpi-ldap-connection-test.png) | TCP/389, Base DN, LDAP URI, bind and search checks | This captured test succeeded and returned 23 entries; it does not establish current service availability |
| [`glpi-directory-users-imported.png`](../screenshots/glpi-directory-users-imported.png) | User list shown in GLPI | Shows user records at capture time; not proof each row came from the captured LDAP search |
| [`glpi-directory-sync.png`](../screenshots/glpi-directory-sync.png) | GLPI user view with a `GG_Marketing` group association | One example of directory-related user state; not proof of continuous or fully automated synchronization |
| [`glpi-ticket-resolution.png`](../screenshots/glpi-ticket-resolution.png) | Ticket conversation about shared-folder access | One ticket example; the image does not show an independent retest or complete workflow automation |
| [`ad-user-disabled.png`](../screenshots/ad-user-disabled.png) | Active Directory confirmation that one account was disabled | Shows one account state; does not prove all sessions or downstream access were revoked |
| [`glpi-offboarding-user-record.png`](../screenshots/glpi-offboarding-user-record.png) | GLPI offboarding ticket marked solved | One workflow example; does not prove every offboarding action is automated or independently verified |

The original PNGs retain the historical browser address and account details visible in their source captures; they were not redacted or altered. No credential was visible in the selected images during visual review. Confirm that displayed identities are synthetic before reusing them. The evidence does not establish current cloud resource availability. See the [validation matrix](validation-matrix.md) for test status and remaining gaps.
