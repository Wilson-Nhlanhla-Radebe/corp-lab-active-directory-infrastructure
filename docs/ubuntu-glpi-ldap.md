# Ubuntu Server, GLPI and LDAP integration

## Application stack

The attached Phase 1 report describes Ubuntu Server hosting the complete GLPI application stack:

- **Apache2** — web serving.
- **PHP** — GLPI application runtime.
- **MariaDB** — database backend.
- **GLPI** — IT service-management application.

The report records browser access from the bare-metal host over HTTP/TCP 80 and SSH administration over TCP 22. The documented LDAP path between GLPI and the Domain Controller uses TCP 389.

## LDAP configuration evidence

The supplied `LDAP Test.png` screenshot (published as [`glpi-ldap-connection-test.jpg`](../screenshots/glpi-ldap-connection-test.jpg)) displays the following successful checks:

1. TCP stream to `dc01.corp.lab` on port 389.
2. Base DN `DC=corp,DC=lab` configured.
3. LDAP URI check succeeded.
4. Bind authentication succeeded.
5. Search succeeded with 23 entries found.

Other evidence shows directory users imported, user information synchronized, user authentication, and ticket creation/resolution workflows. This represents the captured test result at the time the screenshots were taken; it does not prove that the VM or services are currently live.

## Security considerations

The captured environment uses LDAP on TCP 389 and HTTP on TCP 80. These may be convenient in an isolated lab, but they are not a safe default for a service reachable over untrusted networks.

For a production-like environment:

- Use HTTPS with a valid certificate for the GLPI web UI.
- Prefer LDAPS or StartTLS with certificate validation for directory traffic.
- Use a dedicated least-privilege LDAP bind identity, not a domain administrator.
- Restrict security-rule source ranges to the required systems or private networks.
- Never publish the actual public IP, bind password, database credential, session cookie or browser export.
- Keep GLPI accounts and offboarding tests limited to demo identities.

## Troubleshooting notes from the report

- LDAP initially failed while OCI security rules and host resolution were reviewed.
- After network and hostname-resolution adjustments, the GLPI test succeeded.
- Initial group mapping/synchronization did not show all expected memberships. AD membership was checked, affected users were manually associated in GLPI where needed, then synchronization was retried.
- The report includes screenshots of tickets submitted and resolved through GLPI, including access and offboarding scenarios.

## Example validation commands

Run from the Ubuntu host only when it is still available and the command matches the current DNS/network design:

```bash
getent hosts dc01.corp.lab
nc -vz dc01.corp.lab 389
systemctl is-active apache2 mariadb
```

Do not place real LDAP bind secrets on the command line, in shell history, or in this repository.
