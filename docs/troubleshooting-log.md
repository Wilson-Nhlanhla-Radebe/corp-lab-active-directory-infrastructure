# Troubleshooting log

This log records the main issues encountered in the lab and the outcomes of the troubleshooting work.

## 1. SSH to Ubuntu Server rejected

**Symptom:** SSH could not establish a session from the administration host.

**Checks:** Network reachability to TCP 22 was tested. The SSH client was selecting keys other than the one associated with the instance.

**Finding:** The intended private-key file had permissions set to `066`, making it accessible to group/other users.

**Resolution:** The intended key was specified explicitly and its permissions were restricted with `chmod 600 <private-key-file>`. SSH access then succeeded.

## 2. GLPI web interface unreachable in browser

**Symptom:** The browser could not load GLPI although TCP/80 was reachable.

**Finding and resolution:** Browser HTTPS-upgrade behavior conflicted with the lab endpoint's HTTP configuration. Adjusting the access path restored the lab interface. This was a lab-specific workaround; HTTPS is recommended for a persistent deployment.

## 3. GLPI unable to communicate with Active Directory

**Symptom:** The initial LDAP integration test failed.

**Investigation:** Oracle Cloud security rules and hostname resolution were reviewed. PHP was resolving the Domain Controller hostname differently than expected.

**Resolution:** Network/security and hostname-resolution settings were adjusted. A later test confirmed TCP connectivity to `dc01.corp.lab:389`, Base DN and LDAP URI checks, bind authentication and directory search, with 23 entries returned.

## 4. Imported users missing expected group association

**Symptom:** Imported users did not initially show the expected department associations in GLPI.

**Investigation:** AD group membership was checked and found to exist. Forced synchronization did not immediately correct the association.

**Resolution:** Affected users were manually associated with the intended groups where required, then synchronization was retried.

## 5. Domain-user RDP desktop — resolved

**Symptom:** A domain user's RDP authentication succeeded, but the session remained on a blank/loading screen rather than displaying a usable desktop.

**Resolution status:** **Resolved.** Domain-user sessions were confirmed working on 14 October 2026.

## 6. Finance share access

A Finance-user access-denied screenshot conflicts with a PASS result in the verification worksheet. The actual effective access remains inconclusive until the Finance scenario and the remaining departmental allow/deny tests are repeated and recorded.
