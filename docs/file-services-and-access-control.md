# File services and access control

## Configuration

The Windows Server hosts a top-level Company Folder / Company Data directory with departmental subfolders for:

- IT
- HR
- Marketing
- Management
- Finance

Screenshots document SMB share creation, share-ACL inspection, mapped-drive configuration and folder permissions. Departmental security groups are used as the intended permission-management unit.

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

The available evidence demonstrates share and ACL configuration, but does not establish effective access for every department. A Finance-user screenshot shows access denied, while the verification worksheet records one Finance access test as PASS. Those results conflict, so Finance access requires a repeat test. The current evidence also does not record the IT, HR, Marketing and Management positive tests or the negative cross-department test.

| Test | Expected result | Recorded status |
|---|---|---|
| IT user → IT share | Allow | Not tested in available matrix |
| HR user → HR share | Allow | Not tested in available matrix |
| Marketing user → Marketing share | Allow | Not tested in available matrix |
| Management user → Management share | Allow | Not tested in available matrix |
| Finance user → Finance share | Allow | Conflicting evidence; repeat test needed |
| User → restricted share outside their department | Deny, unless explicitly authorised | Not tested in available matrix |

For a complete validation, compare SMB share permissions and NTFS permissions, then test with ordinary department accounts. Record the effective result for each allow and deny case.
