# Ubuntu Server, GLPI and LDAP integration

## Application stack

Ubuntu Server hosts the following GLPI stack:

- **Apache2:** web server.
- **PHP:** application runtime.
- **MariaDB:** database backend.
- **GLPI:** IT service-management application.

The lab used HTTP/TCP 80 for browser access, SSH/TCP 22 for Ubuntu administration and LDAP/TCP 389 for directory communication.

## LDAP connection test

The captured [GLPI LDAP test](../screenshots/glpi-ldap-connection-test.jpg) shows:

1. TCP connection to `dc01.corp.lab` on port 389 succeeded.
2. Base DN `DC=corp,DC=lab` was configured.
3. LDAP URI validation succeeded.
4. Bind authentication succeeded.
5. Directory search succeeded and returned 23 entries.

Other screenshots show directory users imported into GLPI, user synchronization, ticket handling and offboarding-related user records. These images represent the system at capture time rather than current cloud health.

## Security considerations

The captured configuration uses LDAP on TCP 389 and HTTP on TCP 80. For any persistent or externally accessible deployment:

- Use HTTPS with a valid certificate for the GLPI web interface.
- Use LDAPS or StartTLS with certificate validation for directory traffic.
- Use a dedicated least-privilege LDAP bind identity.
- Restrict cloud security rules to the systems and source networks that require access.
- Keep account lifecycle tests limited to demonstration identities.

## Troubleshooting notes

- LDAP connectivity initially failed while network rules and hostname resolution were investigated.
- Adjusting the relevant network and name-resolution settings allowed the LDAP test to pass.
- Some user group associations required manual correction in GLPI before synchronization was repeated.

## Validation commands

Run from Ubuntu when the host is available and the current DNS/network configuration matches the lab:

```bash
getent hosts dc01.corp.lab
nc -vz dc01.corp.lab 389
systemctl is-active apache2 mariadb
```
