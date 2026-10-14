# Validation matrix

Use `PASS`, `FAIL`, `NOT TESTED` or `CONFLICTING EVIDENCE`. This matrix reflects the attached report and screenshots rather than assuming that configuration alone proves behavior.

| Test area | Expected outcome | Source evidence / reported result | Portfolio status |
|---|---|---|---|
| Departmental OU structure | Five departments present | Report and AD structure screenshot; source matrix marked PASS | PASS (reported / screenshot available) |
| Departmental account/group structure | Accounts assigned by department and groups available | Source report and group-membership screenshots; representative imports marked PASS | PASS (reported / screenshot available) |
| SMB share definitions | Department shares exist | PowerShell share output screenshot | PASS (evidence supplied) |
| Group-based share ACLs | Access assigned through department groups | Share access / folder ACL screenshots and narrative | CONFIGURED; per-user verification incomplete |
| IT user reaches IT folder | Allow | NOT TESTED in source matrix | NOT TESTED |
| HR user reaches HR folder | Allow | NOT TESTED in source matrix | NOT TESTED |
| Marketing user reaches Marketing folder | Allow | NOT TESTED in source matrix | NOT TESTED |
| Management user reaches Management folder | Allow | NOT TESTED in source matrix | NOT TESTED |
| Finance user reaches Finance folder | Allow | Source matrix says PASS but a screenshot documents Finance access denied | CONFLICTING EVIDENCE — RETEST |
| Unauthorized cross-department folder access | Deny | Source matrix says NOT TESTED | NOT TESTED |
| GLPI LDAP TCP connection | Connect to `dc01.corp.lab:389` | LDAP screenshot green success message | PASS (captured test) |
| GLPI base DN / LDAP URI | Correct directory base and URI | LDAP screenshot shows success | PASS (captured test) |
| LDAP bind authentication | Bind succeeds | LDAP screenshot shows authentication succeeded | PASS (captured test) |
| LDAP directory search | Search returns entries | Screenshot reports 23 entries found | PASS (captured test) |
| GLPI user imports | AD users are visible in GLPI | Import screenshot and source report | PASS (reported / screenshot available) |
| Representative user authentication | Selected directory users can log in | Source report records PASS for IT, Finance and Marketing representatives | PASS (reported; evidence retained) |
| Ticket submission / visibility | Ticket accepted and visible | Source report marks both PASS; screenshots supplied | PASS (reported / screenshot available) |
| Ticket ID verification | Ticket receives a reference | Source matrix says NOT TESTED | NOT TESTED |
| Ubuntu service/port checks | Services and documented ports are available | Source report's baseline table marks PASS | PASS (reported at capture time) |
| Individual domain-user RDP desktop | Usable desktop session | Blank/loading issue described in source report | FAIL / OPEN ISSUE |
| Windows client domain join | Client successfully joined to `corp.lab` | Not established by supplied Phase 1 attachment | NOT ESTABLISHED |

## Definition of done for a stronger final sign-off

- [ ] Repeat all folder allow/deny tests and reconcile the Finance discrepancy.
- [ ] Record evidence showing account group memberships and effective ACLs.
- [ ] Verify a ticket reference/ID and capture it safely.
- [ ] Retest only the current components if the cloud lab remains available.
- [ ] Keep RDP isolated as a separate incident until resolved.
- [ ] Update this matrix with actual dates and results; never mark a test PASS by assumption.
