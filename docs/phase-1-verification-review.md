# Phase 1 verification review

**Source verification date:** 21 September 2026  
**Additional screenshot evidence:** through 6 October 2026  
**Review stance:** preserve source results, but don't overstate incomplete test coverage.

## Evidence-supported outcomes

| Area | Interpretation |
|---|---|
| AD domain and departmental structure | Reported functional; OU names and user/group administration are shown in screenshots. |
| GLPI LDAP test | Screenshot directly shows TCP/389, base-DN, LDAP URI, bind and search checks passing, with 23 entries found. |
| GLPI user import/synchronization | Screenshots and report describe imported directory accounts and synchronization. |
| GLPI user authentication | Source report records PASS for representative IT, Finance and Marketing users. |
| Ticket creation | Source report records successful ticket submission and ticket visibility; it marks whether a ticket ID was verified as NOT TESTED. Ticket lifecycle screenshots include ticket resolution evidence. |
| Account lifecycle | Screenshots show account reset, disabling/deactivation, offboarding request and GLPI user-record actions. |
| Ubuntu service stack / connectivity | Source matrix records the relevant services and ports as PASS at time of baseline. |
| SMB/file-access matrix | Partially verified. Several tests are NOT TESTED, and the Finance PASS row conflicts with a screenshot documenting Finance access denied. |
| Cross-department negative test | NOT TESTED in the source matrix. |
| User RDP sessions | Known issue — blank/loading desktop; unresolved. |
| Windows client successful domain join | Not established by the attached Phase 1 evidence and therefore not claimed here. |

## Inconsistency in the original verification report

The source report labels the overall Phase 1 baseline `PASS` and marks several summary rows PASS, while individual tables retain placeholder values (`[PASS/FAIL/NOT TESTED]`), a NOT TESTED ticket-ID check, and multiple NOT TESTED folder-access cases. It also states that final verification is pending in an earlier section, then records a baseline pass later.

This repository does not silently resolve these contradictions by assuming the missing tests passed. The best-supported summary is:

> **Core Phase 1 services and the GLPI/LDAP workflow were reported operational and have supporting screenshots; complete access-control verification is unfinished, and the RDP issue remains open.**

## Recommended closure tests

1. Re-check the domain controller, DNS and service states if the OCI resources still exist.
2. Verify group membership for one demo user in each department.
3. Test each user's own folder access and at least one unauthorized cross-department folder; record both allow and deny results.
4. Confirm actual SMB share ACLs and NTFS ACLs separately.
5. Re-test GLPI LDAP connectivity and login if the lab is live, preferably with secure LDAP and certificate validation.
6. Verify ticket ID generation and final ticket state.
7. Investigate RDP in a separate troubleshooting cycle without granting broad administrator membership as a workaround.
8. Record the test date, actual result and sanitized screenshot for each case.
