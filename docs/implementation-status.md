# Implementation status

**Status updated:** 14 October 2026

| Workstream | Status | Notes |
|---|---|---|
| OCI compute and networking | Deployed | Windows and Ubuntu instances were used for the lab. Captured cloud settings are historical evidence, not a live resource check. |
| `DC01` / `corp.lab` | Configured | Windows Server 2022 Standard provides AD DS and DNS. |
| Departmental OUs and accounts | Configured | Five departments and 19 demonstration accounts are documented. |
| Departmental security groups | Configured | Departmental groups support the shared-folder access model. |
| SMB file services | Configured; access matrix incomplete | The selected evidence shows share inventory and one Finance folder ACL. A displayed `CORP\Users` entry has read-type rights; separate historical evidence conflicts on Finance access, and the complete allow/deny matrix is not recorded. |
| Ubuntu application stack | Deployed | Apache2, PHP, MariaDB and GLPI were used for the service desk. Current service state has not been queried from OCI during this documentation update. |
| GLPI LDAP integration | Successful at capture time | Screenshot shows TCP/389, LDAP URI, bind and search checks succeeding; 23 entries were returned. |
| GLPI user records and workflows | Demonstrated (examples) | Screenshots show a user list, one group association, a ticket conversation and an offboarding ticket. Separate lab records document representative authentication; the images do not prove complete workflow automation. |
| RDP for domain users | Resolved | Domain-user desktop sessions are working as of 14 October 2026. |
| Windows client domain join | Not verified in this project evidence | No successful join result is documented in the current evidence set. |
| WireGuard tunnel | Not verified in this repository | Earlier notes reference a tunnel, but no current handshake or route verification is included. |

## Remaining validation

The highest-priority evidence gap is the per-department file-access matrix: test each department's authorised access and at least one unauthorised cross-department access, then record the actual results. A successful Windows client domain join can be added if it is completed and captured. Current cloud resource and service health should be checked directly before describing the environment as live.
