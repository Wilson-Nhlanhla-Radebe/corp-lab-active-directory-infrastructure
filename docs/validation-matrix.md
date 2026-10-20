# Validation matrix

This matrix distinguishes implemented configuration from behavior supported by test records. Screenshot-based results reflect the time of capture; they are not a live health check.

| Test area | Expected outcome | Result | Evidence / note |
|---|---|---|---|
| Departmental OU structure | Five departments present | PASS | AD structure screenshot and implementation record |
| Departmental users and groups | Accounts organised by department and assigned to relevant groups | PASS (recorded) | Directory structure and representative group evidence |
| SMB share definitions | Department shares exist | PASS | PowerShell `Get-SmbShare` inventory screenshot |
| Group-based share ACL configuration | Access assigned through department groups | CONFIGURED; REVIEW REQUIRED | Finance folder ACL view includes `GG_Finance` and `CORP\Users` read-type rights; an inspected alternate share-access view showed `Everyone: Allow / Full` on Finance. These are configuration observations, not effective-access results. |
| IT user reaches IT folder | Access allowed | NOT TESTED | No result recorded in the verification worksheet |
| HR user reaches HR folder | Access allowed | NOT TESTED | No result recorded in the verification worksheet |
| Marketing user reaches Marketing folder | Access allowed | NOT TESTED | No result recorded in the verification worksheet |
| Management user reaches Management folder | Access allowed | NOT TESTED | No result recorded in the verification worksheet |
| Finance user reaches Finance folder | Access allowed | CONFLICTING EVIDENCE | The worksheet reports PASS; a separate screenshot shows access denied |
| Unauthorised cross-department folder access | Access denied | NOT TESTED | Negative-test result not recorded |
| GLPI LDAP connection | Connect to `dc01.corp.lab:389` | PASS (captured test) | TCP connectivity succeeded |
| LDAP base DN and URI | Correct directory base and URI | PASS (captured test) | Configuration checks succeeded |
| LDAP bind authentication | Bind succeeds | PASS (captured test) | Test screen reports bind success |
| LDAP directory search | Directory search returns entries | PASS (captured test) | 23 entries found |
| GLPI directory import | AD users appear in GLPI | PASS (recorded) | Imported-user screenshot and verification record |
| Representative GLPI authentication | Selected directory users can sign in | PASS (recorded) | IT, Finance and Marketing users listed in verification record |
| Ticket submission and visibility | Ticket is accepted and visible | PASS (recorded) | Ticket workflow screenshots |
| Ticket reference/ID check | Ticket reference is confirmed | NOT TESTED in baseline worksheet | Ticket resolution is shown, but the initial ID-verification line was not completed |
| Ubuntu services and documented ports | Services available | PASS (recorded at baseline) | Historical service/connectivity checks |
| Domain-user RDP desktop | A usable desktop session opens | RESOLVED | Working as of 14 October 2026 |
| Windows client domain join | Client is joined to `corp.lab` | NOT VERIFIED | No successful join result in this evidence set |
| Current OCI resource state | Instances and services running now | NOT CHECKED | No live-state evidence is recorded |

## Outstanding validation

The departmental share-access allow/deny tests remain incomplete, and the conflicting Finance result is unresolved. Current service availability has not been verified. New test results are not present in this evidence set.
