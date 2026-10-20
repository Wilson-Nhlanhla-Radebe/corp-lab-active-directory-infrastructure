# Phase 1 verification review

**Baseline verification date:** 21 September 2026

**Additional evidence captured:** through 6 October 2026

**Status update:** RDP working as of 14 October 2026

## Results supported by the project evidence

| Area | Status | Evidence or limitation |
|---|---|---|
| AD domain and departmental structure | Demonstrated | `corp.lab`, five departmental OUs and directory administration are shown. |
| GLPI LDAP integration | Pass at capture time | Test screen shows TCP/389, Base DN, LDAP URI, bind and search succeeded; 23 entries found. |
| GLPI directory import and user association | Demonstrated | Screenshots show a GLPI user list and one user group association; they do not prove continuous or fully automated synchronization. |
| Representative GLPI user authentication | Pass recorded | The lab verification records successful authentication for representative IT, Finance and Marketing users. |
| Ticket workflow | Demonstrated | Screenshots show ticket submission/visibility and ticket resolution. The initial verification worksheet did not record the ticket-ID check as tested. |
| Account lifecycle | Demonstrated | Evidence shows account reset/disablement and GLPI offboarding activity. |
| Ubuntu application stack and connectivity | Pass recorded at baseline | Apache2, PHP, MariaDB, GLPI and the documented ports were recorded as functional at the time. |
| Departmental shared-folder access | Partially verified | Configuration is shown, but some department-level access tests are not recorded. The Finance allow/deny result is inconsistent across the available records. |
| Domain-user RDP sessions | Resolved | Domain-user desktop sessions were working as of 14 October 2026. |
| Windows client domain join | Not verified | No successful domain-join result is included in this evidence set. |
| Current OCI resource state | Not checked during this update | The screenshots are historical captures and do not confirm the instances are running now. |

## File-access validation gap

The verification worksheet has incomplete entries for the IT, HR, Marketing and Management share-access tests and the negative cross-department test. It marks the Finance test as passed, while a separate screenshot records a Finance access-denied result. For this reason, the departmental access-control implementation is documented as configured, but the effective-access result is not considered fully verified.

## Outstanding validation items

1. Test one normal account from each department against its own share.
2. Test at least one user against a restricted share outside their department.
3. Record the result alongside both share ACL and NTFS ACL evidence.
4. Confirm ticket-reference generation if that requirement is needed for the portfolio.
5. Capture a successful Windows client domain join if that work is completed.
6. Query OCI and service status directly before making claims about current availability.
