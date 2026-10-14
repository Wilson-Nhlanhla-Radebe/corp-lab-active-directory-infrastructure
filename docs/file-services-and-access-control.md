# File services and access control

## Reported configuration

The Windows Server's `C:` drive contains a top-level Company Folder / Company Data directory and departmental subfolders for:

- IT
- HR
- Marketing
- Management
- Finance

SMB share creation, share ACL inspection, mapped-drive configuration and file/folder permissions are represented in the supplied screenshots. The attached report says inherited ACL entries were removed where necessary and permissions were assigned to departmental security groups rather than directly to each individual user.

## Intended access model

```text
Departmental users
        ↓ membership
Department security group (for example, GG_Finance)
        ↓ permission assignment
Department folder / SMB share
```

This model is easier to maintain because onboarding/offboarding primarily changes group membership, not every folder ACL.

## Important validation caveat

The evidence includes a screenshot titled as a Finance user being unable to access the Finance folder. The verification matrix later marks the Finance access test PASS, while the IT/HR/Marketing/Management tests and the negative cross-department test are marked NOT TESTED. These statements do not support an unconditional claim that all folder permissions work correctly.

Treat the present result as **configured, partially evidenced, and requiring a complete access matrix**. Re-test with one normal user from every department:

| Test | Expected result | Current documented state |
|---|---|---|
| IT user → IT share | Allow | Not tested in the source matrix |
| HR user → HR share | Allow | Not tested in the source matrix |
| Marketing user → Marketing share | Allow | Not tested in the source matrix |
| Management user → Management share | Allow | Not tested in the source matrix |
| Finance user → Finance share | Allow | Source report marks PASS, but separate screenshot records an access-denied scenario; retest required |
| Each user → another department's restricted folder | Deny, unless explicitly authorized | Not tested in the source matrix |

## Suggested evidence capture

Capture, with demo accounts only:

1. `Get-SmbShare` output.
2. `Get-SmbShareAccess -Name <share>` output.
3. NTFS Security tab for each departmental folder.
4. A successful access test for the correct department.
5. A failed access test for an unauthorized department.
6. The test date, account department and share tested.

Redact hostnames, public IPs, production identifiers and any non-lab names before publishing screenshots.
