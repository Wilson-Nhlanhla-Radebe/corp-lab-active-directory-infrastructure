# Troubleshooting log

This log captures the issues and resolutions described in the supplied Phase 1 report. Revalidate against the live systems before applying the same changes elsewhere.

## 1. SSH to Ubuntu Server rejected

**Symptom:** SSH could not establish a session from the bare-metal host.  
**Checks:** OCI TCP/22 connectivity was tested; the SSH client was attempting keys other than the downloaded key. The intended key was explicitly selected, but authentication remained rejected.  
**Finding:** The private-key file permissions were observed as `066`, allowing group/other access.  
**Resolution:** Restrict key permissions with `chmod 600 <private-key-file>` and use the correct key path. The report records successful SSH access afterward.

## 2. GLPI web interface unreachable in browser

**Symptom:** The browser could not reach GLPI although TCP/80 was reachable.  
**Finding:** Browser behavior was forcing HTTPS on a lab endpoint configured for HTTP.  
**Resolution recorded by the source:** Browser behavior was adjusted for the lab HTTP endpoint.  
**Security note:** This is not a recommended production fix. Prefer HTTPS/TLS and avoid reducing browser protections for a public endpoint.

## 3. GLPI unable to communicate with Active Directory

**Symptom:** Initial GLPI LDAP integration test failed.  
**Investigation:** OCI security rules and name resolution were reviewed; the report says PHP was resolving the Domain Controller hostname differently than expected.  
**Resolution:** Relevant network/security and hostname-resolution configuration was adjusted.  
**Evidence:** The later LDAP-test screenshot reports TCP connection to `dc01.corp.lab:389`, base DN setup, LDAP URI check, bind authentication and directory search succeeded; 23 entries were found.

## 4. Imported users missing expected group association

**Symptom:** Users were imported, but department group membership was not initially reflected as expected in GLPI.  
**Investigation:** Group membership was checked in AD and found to exist. Forced synchronization did not immediately fix the association.  
**Resolution:** Affected users were manually associated with the intended groups where required, followed by another synchronization.  
**Portfolio note:** This demonstrates troubleshooting experience but should not be presented as fully automated group provisioning.

## 5. Standard-user RDP desktop blank/loading

**Symptom:** A domain user's RDP authentication succeeded under a temporary administrative test, but the session remained blank/loading rather than displaying a usable desktop.  
**Security action:** The test user was removed from the Administrators group; broad administrative privilege was not retained as a workaround.  
**Status:** **Unresolved — pending investigation.** The issue was intentionally not changed during the documented baseline verification.

## 6. Finance share access denied

A screenshot documents a Finance user unable to access the Finance folder. The source report also marks one Finance access test PASS in its verification matrix, creating a conflict. Per-department positive and negative tests should be repeated and the actual ACL/effective access recorded before claiming file permissions are fully validated.
