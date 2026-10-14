# Implementation status

This status snapshot incorporates the attached Phase 1 report and screenshot archive received during repository preparation on 14 October 2026. It does not confirm that the OCI resources are still running.

| Workstream | Evidence-backed state | Remaining work |
|---|---|---|
| OCI compute/network | Windows and Ubuntu VMs described as deployed; OCI rule configuration screenshot supplied | Confirm resource state if continuing the lab; sanitize future cloud screenshots |
| DC01 / `corp.lab` | Reported operational; AD structure screenshot | Re-run AD DS/DNS health queries if live |
| Departmental OUs / accounts | Five departments described; 19 accounts listed in source report | Confirm current memberships if resources still exist |
| Department groups | `GG_Finance` visible in screenshot; report describes group-based permissions | Verify every department group and member list |
| SMB/file services | Folder tree, share listing, share access and ACL screenshots supplied | Complete per-department positive/negative access tests; Finance outcome conflicts in source evidence |
| Ubuntu services | Apache2/PHP/MariaDB/GLPI reported functional | Current service health not independently checked in this publication run |
| GLPI LDAP | Screenshot shows successful TCP/389, Base DN, URI check, bind and search (23 entries found) | Confirm transport security and current-state status if lab remains active |
| GLPI import/auth/tickets | Report and screenshots document imports, representative logins, ticket submission and resolution | Ticket ID check was marked NOT TESTED in source verification table |
| Account lifecycle | Reset, disable/deactivation and offboarding screenshots supplied | Avoid claiming automated end-to-end lifecycle unless independently tested |
| Windows client domain join | Not established in supplied Phase 1 report/screenshots | Capture successful join evidence before claiming done |
| RDP | Known blank/loading session for domain user | Open incident; investigate separately without granting unnecessary admin rights |
| WireGuard | Referenced in earlier project notes, not evidenced in attached Phase 1 report | Verify peer handshake, routes and DNS before claiming operational |

## Overall status

**Core implementation documented; partial operational evidence available; closure testing incomplete.** The source report's overall PASS status is qualified by NOT TESTED rows and conflicting Finance access evidence. See [verification review](phase-1-verification-review.md).
