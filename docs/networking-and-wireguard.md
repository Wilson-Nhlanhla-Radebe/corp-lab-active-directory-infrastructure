# Networking and cloud security rules

## Documented network flows

| Flow | Port / protocol | Purpose and status |
|---|---|---|
| Administration host → Ubuntu Server | TCP 22 / SSH | Ubuntu administration; SSH access succeeded after selecting the correct key and restricting its permissions to `0600` |
| Administration host → GLPI host | TCP 80 / HTTP | Browser access used by the lab; some original screenshots show the historical server IP |
| GLPI host → `DC01` | TCP 389 / LDAP | Captured LDAP test shows successful connection, bind and search |
| Corporate subnet → DNS service | TCP/UDP 53 as required | One OCI screenshot shows an ingress rule for TCP 53 from `10.0.0.0/24`; it is not a complete or current rule inventory |
| Windows domain resources | AD DS, DNS and SMB-related traffic | Departmental share and Active Directory administration are documented; the table is not a complete Active Directory port inventory |

## Network security

- Restrict SSH, RDP and directory-management traffic to trusted source ranges or a private VPN.
- Do not broadly expose AD DS, LDAP, SMB or RDP to the public internet.
- Use the minimum source CIDRs and ports required for each flow.
- Review cloud network-security rules alongside the guest operating-system firewall.
- Use HTTPS for GLPI and LDAPS/StartTLS with certificate validation for directory traffic outside an isolated lab.

## SSH access troubleshooting

The SSH connection initially selected the wrong key, and the intended private key had permissions that were too open (`066`). Selecting the correct key and restricting permissions resolved the issue:

```bash
chmod 600 <private-key-file>
ssh -i <private-key-file> ubuntu@<server-address>
```

## WireGuard

The configured tunnel is named `corp_lab_tunnel`, uses UDP port `57058`, and has tunnel addresses `10.10.0.1` and `10.10.0.2`. This repository does not include a current peer-handshake capture, route table or DNS verification for the tunnel, so its present operational state is not established here.
