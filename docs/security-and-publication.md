# Security and publication checklist

This public portfolio contains historical infrastructure screenshots and configuration documentation. Treat published commits as persistent; deleting a file later does not guarantee copies disappear.

## Redactions applied to this publication

- Browser address bars containing the lab's public IP in GLPI screenshots were obscured and labelled `ADDRESS REDACTED`.
- The Oracle Cloud browser URL containing a VCN/resource identifier was obscured and labelled `OCI RESOURCE URL REDACTED`.
- Screenshot filenames were normalized to remove individual display names.
- The original screenshot archive itself is not copied to the repository; the redacted images are used instead.

A visual review and text-pattern scan cannot guarantee the absence of every sensitive item. Review screenshots again if adding replacements. Some demo account names are visible inside the screenshots; ensure they are laboratory-only accounts before retaining the repository as public.

## Never commit

- Passwords, recovery codes, private keys, personal access tokens, cookies, private SSH material or credentials.
- Real WireGuard private keys or complete live peer configurations.
- OCI API signing keys, auth files, tenancy/user OCIDs or resource exports containing sensitive identifiers.
- GLPI database credentials or LDAP bind secrets.
- Unredacted database dumps, backups, environment files, browser exports, logs with auth/session data or private ticket data.
- Real employee/student personal data or real organization's help-desk records.

## Before each push

- [ ] Review `git status` and the complete diff.
- [ ] Search filenames and content for `password`, `secret`, `token`, `private_key`, `ocid`, `BEGIN PRIVATE KEY`, and accidental public IPs.
- [ ] Confirm `.gitignore` excludes credentials, backups, dumps and local configs.
- [ ] Visually inspect all added screenshots.
- [ ] Confirm README claims match evidence and open issues remain visible.

## Lab safety

- Keep AD/RPC/SMB/RDP endpoints off the public internet. Use a VPN/private network and least-privilege source ranges.
- Do not leave lab LDAP on port 389 exposed to untrusted networks; prefer LDAPS/StartTLS with certificate validation.
- Use HTTPS for GLPI and a dedicated least-privilege LDAP bind account if the lab is kept running.
- If a credential is accidentally committed, revoke/rotate it; deleting it in a later commit is not sufficient.
