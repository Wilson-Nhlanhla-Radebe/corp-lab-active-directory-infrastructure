# Phase 1 implementation report

**Scope:** Cloud infrastructure, Active Directory, file services and GLPI integration

**Platform:** Oracle Cloud Infrastructure

**Evidence period:** September–October 2026

## Summary

Phase 1 established a simulated corporate IT environment using Windows Server 2022 Standard and Ubuntu Server. `DC01` provides Active Directory Domain Services and DNS for `corp.lab`. The Ubuntu server hosts Apache2, PHP, MariaDB and GLPI. Five departmental organisational units, demonstration users, security groups and shared folders were configured.

GLPI was integrated with Active Directory through LDAP. A captured connection test shows successful TCP connectivity to `dc01.corp.lab:389`, Base DN and LDAP URI checks, bind authentication and directory search, with 23 entries returned. Other screenshots show a GLPI user list, a user group association, a ticket conversation, one account disablement and an offboarding ticket. They document examples rather than complete automation or current service state.

## Active Directory and file services

The domain uses five departments: IT, HR, Marketing, Management and Finance. The documented structure contains 19 demonstration accounts: four each in IT, HR, Marketing and Management, and three in Finance. Departmental groups are the intended basis of shared-folder permissions. The selected screenshots show the directory structure, SMB share inventory and one folder ACL view; they do not demonstrate effective access for each department.

The folder configuration is documented, but the complete effective-access test matrix is not. The available records disagree on the Finance access result, which remains inconclusive; the positive and negative department-level tests are not fully recorded.

## Ubuntu and GLPI

The Ubuntu server hosts the following application components:

- **Apache2:** web server.
- **PHP:** GLPI runtime.
- **MariaDB:** application database.
- **GLPI:** IT service-management interface.

The captured environment used HTTP/TCP 80 for browser access and TCP 22 for SSH administration. GLPI's directory integration used LDAP/TCP 389. These are the ports recorded in the lab configuration; a persistent or exposed environment should use encrypted transports and restricted network access.

## Troubleshooting completed

1. **SSH access:** The client initially selected the wrong key, and the intended private key's permissions were too open (`066`). Selecting the correct key and applying `chmod 600` restored access.
2. **GLPI web access:** Browser HTTPS-upgrade behavior conflicted with the lab's HTTP endpoint. The access path was adjusted for the lab; HTTPS is recommended for any persistent deployment.
3. **LDAP connectivity:** Network rules and hostname resolution were adjusted until the GLPI LDAP test passed.
4. **Group synchronization:** Some imported accounts did not initially show the expected department associations in GLPI. AD membership was checked, affected users were manually associated where necessary, and synchronization was retried.
5. **Remote Desktop:** Domain-user sessions are working as of 14 October 2026. The earlier blank/loading-session problem is resolved.

## Phase 1 status

The core infrastructure and GLPI/LDAP workflow are demonstrated by the project evidence. RDP access is resolved. The main outstanding verification item is the complete departmental file-access matrix. A successful Windows client domain join and current OCI service health are not established by the screenshots in this repository.
