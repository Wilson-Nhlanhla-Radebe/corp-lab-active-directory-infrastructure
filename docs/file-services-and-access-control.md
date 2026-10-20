# File services and access control

## Configuration

The Windows Server hosts a top-level Company Folder / Company Data directory with departmental subfolders for:

- IT
- HR
- Marketing
- Management
- Finance

The selected screenshots show an SMB share inventory and the Finance folder's NTFS permission dialog. The inventory lists share names and paths; it does not show share permissions or effective user access. The folder dialog shows `GG_Finance` and a `CORP\Users` entry with read-type rights. The intended scope of that broader entry is not established by the available evidence. Departmental security groups are the intended permission-management unit, but the screenshots do not prove that access is restricted to those groups.

An inspected alternate `Get-SmbShareAccess` screenshot showed `Everyone` with `Allow / Full` on the Finance share. It is excluded from the portfolio because it cannot support a restricted-access claim. Share-level and NTFS permissions combine to determine effective access; the historical screenshot does not establish current exposure or the present configuration.

## Access model

```text
Departmental users
        ↓ membership
Department security group (for example, GG_Finance)
        ↓ permission assignment
Department folder / SMB share
```

Group-based access makes onboarding and offboarding easier to maintain because resource permissions can follow changes in group membership.

## Validation status

The available evidence shows share inventory and one folder ACL view, but does not establish effective access for any department. A Finance-user screenshot shows access denied, while the verification worksheet records one Finance access test as PASS. Those results conflict, so Finance effective access remains unresolved. The current evidence also lacks recorded IT, HR, Marketing and Management positive tests and a negative cross-department test.

| Test | Expected result | Recorded status |
|---|---|---|
| IT user → IT share | Allow | Not tested in available matrix |
| HR user → HR share | Allow | Not tested in available matrix |
| Marketing user → Marketing share | Allow | Not tested in available matrix |
| Management user → Management share | Allow | Not tested in available matrix |
| Finance user → Finance share | Allow | Conflicting evidence; repeat test needed |
| User → restricted share outside their department | Deny, unless explicitly authorised | Not tested in available matrix |

A complete validation compares SMB share permissions and NTFS permissions, tests ordinary department accounts against each allow and deny case, and records the effective result.
