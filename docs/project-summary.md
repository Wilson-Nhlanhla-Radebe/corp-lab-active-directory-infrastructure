# Project summary — CV / portfolio use

## Project title
**Enterprise IT Infrastructure Lab — Active Directory, File Services and GLPI Integration**

## Portfolio summary
Built a simulated corporate IT environment in Oracle Cloud Infrastructure using Windows Server 2022 Standard and Ubuntu Server. Configured an Active Directory `corp.lab` domain with five departmental organisational units, departmental user/group structure and SMB shared-folder permissions. Deployed Apache2, PHP, MariaDB and GLPI on Ubuntu Server, then configured GLPI's LDAP integration with Active Directory.

The supplied LDAP verification screenshot records successful TCP connectivity to `dc01.corp.lab:389`, base DN and LDAP URI checks, bind authentication and directory search (23 entries returned). Additional evidence documents directory imports/synchronization, ticket submission and resolution, account reset/deactivation and offboarding workflows. Troubleshot SSH key permissions, OCI security rules, web access behavior, LDAP name resolution and group synchronization.

## Recommended resume bullets

- Deployed and documented a cloud-hosted Windows Server 2022 / Active Directory lab with departmental OUs, user/group structure and SMB file services.
- Configured GLPI on Ubuntu Server with Apache2, PHP and MariaDB, and validated an LDAP connection to Active Directory including bind authentication and directory search.
- Documented end-to-end ITSM examples covering ticket submission/resolution, directory user synchronization, account reset and offboarding.
- Investigated infrastructure issues across SSH authentication, network security rules, name resolution, LDAP group mapping and RDP sessions.

## Be accurate in interviews

Mention that RDP domain-user sessions remained unresolved and the department-wide folder allow/deny matrix was incomplete in the source verification record. Do not claim a successful Windows client domain join unless you capture current evidence for it.
