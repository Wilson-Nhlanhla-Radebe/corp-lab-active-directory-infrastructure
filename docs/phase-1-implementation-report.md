# Phase 1 implementation report

**Scope:** Infrastructure, Active Directory, file services and GLPI integration  
**Cloud:** Oracle Cloud Infrastructure  
**Captured evidence:** September–October 2026

## Executive summary

The supplied project report describes a simulated corporate IT environment using Windows Server 2022 Standard and Ubuntu Server. The Windows server (`DC01`) provides Active Directory Domain Services for `corp.lab`. The Ubuntu server hosts Apache2, PHP, MariaDB and GLPI. Departmental organisational units, users, security groups and shared folders were configured, and GLPI was integrated with Active Directory using LDAP.

The supplied evidence includes an LDAP test where the connection to `dc01.corp.lab` on TCP 389, base-DN configuration, bind authentication and directory search succeeded, with 23 entries returned. Additional screenshots show imported users, user synchronization, ticket submission/resolution and account lifecycle operations.

The lab is a useful implementation exercise, but the supplied verification report has inconsistent statuses: its overall baseline is marked PASS while several specific tests remain NOT TESTED or have placeholder results. This repository makes those gaps visible rather than treating every subsystem as fully signed off.

## Implemented areas described in the report

### 1. Windows Server / Active Directory

- Windows Server 2022 Standard deployed in OCI and promoted to a domain controller.
- Domain name: `corp.lab`; domain-controller hostname: `DC01`.
- Five departmental OUs: IT, HR, Marketing, Management and Finance.
- Departmental users and security groups created.
- Group-based permission assignment used for departmental shared resources.

The source report lists 19 departmental accounts across those five OUs (IT: 4, HR: 4, Marketing: 4, Management: 4, Finance: 3). Individual names are deliberately not repeated in this report; screenshots remain illustrative evidence of the management interface.

### 2. File services

A `Company Folder` / Company Data directory was created on the Windows Server's `C:` drive with separate departmental directories. SMB shares, mapped-drive configuration and group-oriented folder ACLs are documented in the evidence archive. Inheritance was removed where needed and permission assignment was intended to be managed through departmental groups rather than individual accounts.

### 3. Ubuntu and GLPI application stack

Ubuntu Server hosts:

- Apache2 as the web server.
- PHP as the application runtime.
- MariaDB as the database.
- GLPI as the IT service-management application.

The web interface was accessed from the bare-metal host using HTTP on TCP 80 in the documented lab configuration. SSH administration used TCP 22.

### 4. Active Directory / GLPI LDAP integration

The supplied LDAP-test screenshot reports:

- TCP connection to `dc01.corp.lab:389` succeeded.
- Base DN `DC=corp,DC=lab` configured.
- LDAP URI check succeeded.
- Bind authentication succeeded.
- Directory search succeeded and returned 23 entries.

The report also describes user/group import and authentication testing. GLPI screenshots document imported users, user synchronization, ticket submission and ticket resolution.

## Troubleshooting completed

1. **SSH access:** The initial client connection selected the wrong key and the private key permissions were too open (`066`). Restricting the key to `chmod 600` and specifying the key explicitly resolved access.
2. **GLPI web access:** TCP 80 was reachable, but the browser was forcing HTTPS for an HTTP endpoint. Browser behavior was adjusted for the lab's HTTP configuration. For any environment beyond a private lab, prefer HTTPS instead of weakening browser protections.
3. **LDAP connectivity:** OCI security rules and hostname resolution were adjusted until GLPI's LDAP test succeeded.
4. **Group synchronization:** Imported users did not initially appear with expected department group associations. AD membership was checked; affected users were manually associated in GLPI where necessary, and synchronization was retried.
5. **RDP sessions:** Domain-user authentication was reported to succeed, but the desktop session stayed blank/loading. This remains unresolved and is retained as a known issue.

## Current interpretation

The core infrastructure and GLPI/LDAP workflow have meaningful evidence and were reported operational at the time of capture. Not every verification case is complete. In particular, the per-department positive/negative file-access matrix requires retesting and RDP remains unresolved. See [the Phase 1 verification review](phase-1-verification-review.md).
