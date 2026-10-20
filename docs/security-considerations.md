# Security considerations

The lab demonstrates directory services, shared-folder access, remote administration and a web-based service desk. The security controls below are relevant when building or maintaining this type of environment.

## Network boundaries

- Restrict management ports such as SSH and RDP to trusted source addresses or a private VPN.
- Do not expose Active Directory, SMB or LDAP services broadly to the public internet.
- Allow only the ports and source networks required for each documented communication flow.
- Check cloud network-security rules and guest operating-system firewall rules together.

## Identity and access control

- Use departmental security groups to manage share access rather than assigning permissions to individual users wherever practical.
- Separate everyday user accounts from privileged administration accounts.
- Use a dedicated least-privilege LDAP bind identity for GLPI integration.
- Disable accounts during offboarding and verify the resulting access state.

## Transport security

The documented lab configuration used HTTP/TCP 80 for GLPI and LDAP/TCP 389 for directory integration. For a persistent environment, use HTTPS for the web interface and LDAPS or StartTLS with certificate validation for directory traffic. Keep directory and file services on trusted networks.

## Evidence handling

The selected original screenshots retain historical browser address details, a cloud resource identifier and visible account names; these details were not redacted. No credential was visible in the selected images during visual review. Confirm that demonstration identities are synthetic before using them in public examples, and do not reuse real staff, student or customer accounts. The screenshots do not establish whether the historical server address is still active.

## Before publishing

- Never commit passwords, tokens, private keys, WireGuard private-key material, OCI authentication files, LDAP bind secrets, database credentials or session cookies.
- Do not publish database dumps, credential-bearing logs, or real employee, student or customer information.
- Visually inspect every screenshot for account names, browser addresses, cloud resource identifiers and other sensitive details. Ensure all demonstration identities are synthetic.
- Keep secrets outside Git and use least-privilege service identities for administration and application integrations.
- If a real secret is committed or pushed, revoke or rotate it immediately. Deleting it in a later commit does not make the exposed credential safe.
- Run secret scans and review the complete staged diff before publishing changes.
