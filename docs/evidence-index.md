# Evidence index

Ten curated screenshots are committed with the public repository. The project owner also supplied a larger 33-image archive; all 33 copies have been sanitized by redacting the lab public IP from GLPI browser bars and the OCI resource URL from the cloud-rule screenshot. The larger archive is delivered separately with the project bundle so the repository can focus on the most useful proof points.

| Evidence file | What it illustrates | Limitation / note |
|---|---|---|
| [`ad-organizational-structure.jpg`](../screenshots/ad-organizational-structure.jpg) | AD domain and departmental OU structure | Screenshot state only; live domain not queried during publication |
| [`department-folder-acl.jpg`](../screenshots/department-folder-acl.jpg) | Windows folder permission configuration | Configuration view does not prove effective access for every user |
| [`powershell-smb-share-access.jpg`](../screenshots/powershell-smb-share-access.jpg) | PowerShell output for SMB share permissions | Requires complete positive/negative per-department access testing |
| [`glpi-ldap-connection-test.jpg`](../screenshots/glpi-ldap-connection-test.jpg) | TCP/389, Base DN, LDAP URI, bind and search succeeded | Captured test; 23 entries reported; URL/public IP redacted |
| [`glpi-directory-users-imported.jpg`](../screenshots/glpi-directory-users-imported.jpg) | Directory users imported into GLPI | Does not prove current state after the capture date |
| [`glpi-directory-sync.jpg`](../screenshots/glpi-directory-sync.jpg) | GLPI directory-user synchronization | Initial group association required troubleshooting per source report |
| [`glpi-ticket-resolution.jpg`](../screenshots/glpi-ticket-resolution.jpg) | GLPI ticket-resolution workflow | One workflow example; does not establish all service desk use cases |
| [`ad-user-disabled.jpg`](../screenshots/ad-user-disabled.jpg) | AD account disabled during offboarding | Does not prove every offboarding control is automated |
| [`oci-security-rule-configuration.jpg`](../screenshots/oci-security-rule-configuration.jpg) | OCI security-rule setup | Browser URL containing resource identifier has been redacted |
| [`glpi-offboarding-user-record.jpg`](../screenshots/glpi-offboarding-user-record.jpg) | GLPI user-record/offboarding evidence | Pair with AD account state when retesting current configuration |

## Reading evidence responsibly

A successful LDAP test only establishes what that test showed at capture time. A share ACL screenshot establishes configuration, not the actual allow/deny behavior for every user. A ticket screenshot establishes that a workflow was shown, not that every integration is still live. Use the [validation matrix](validation-matrix.md) alongside images.
