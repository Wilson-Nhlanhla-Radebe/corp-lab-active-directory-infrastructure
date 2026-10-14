# Evidence index

Ten selected screenshots are included to show the main infrastructure components and service-desk workflows. The images document system state at the time they were captured.

| Evidence file | What it shows | Interpretation |
|---|---|---|
| [`ad-organizational-structure.jpg`](../screenshots/ad-organizational-structure.jpg) | Active Directory domain and departmental OU structure | Shows directory organisation at capture time |
| [`department-folder-acl.jpg`](../screenshots/department-folder-acl.jpg) | Windows folder permission configuration | Shows configured ACLs, not effective access for every user |
| [`powershell-smb-share-access.jpg`](../screenshots/powershell-smb-share-access.jpg) | PowerShell output for SMB shares and access | Supports the share-configuration record; full allow/deny testing is incomplete |
| [`glpi-ldap-connection-test.jpg`](../screenshots/glpi-ldap-connection-test.jpg) | TCP/389, Base DN, LDAP URI, bind and search checks | All shown as successful; 23 entries returned |
| [`glpi-directory-users-imported.jpg`](../screenshots/glpi-directory-users-imported.jpg) | Directory users imported into GLPI | Demonstrates import state at capture time |
| [`glpi-directory-sync.jpg`](../screenshots/glpi-directory-sync.jpg) | GLPI directory-user synchronization | Shows the synchronization workflow |
| [`glpi-ticket-resolution.jpg`](../screenshots/glpi-ticket-resolution.jpg) | GLPI ticket-resolution workflow | Demonstrates a ticket workflow, not every possible service-desk case |
| [`ad-user-disabled.jpg`](../screenshots/ad-user-disabled.jpg) | Active Directory account disabled during offboarding | Shows the account state at capture time |
| [`oci-security-rule-configuration.jpg`](../screenshots/oci-security-rule-configuration.jpg) | Oracle Cloud security-rule configuration | Shows a network-rule configuration view |
| [`glpi-offboarding-user-record.jpg`](../screenshots/glpi-offboarding-user-record.jpg) | GLPI user record associated with offboarding | Shows GLPI-side account lifecycle handling |

Browser address details and the cloud resource URL were redacted from the relevant screenshots. The evidence does not establish current cloud resource availability. See the [validation matrix](validation-matrix.md) for test status and remaining gaps.
