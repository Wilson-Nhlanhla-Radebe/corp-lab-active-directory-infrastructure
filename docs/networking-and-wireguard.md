# Networking and cloud security rules

## Phase 1 paths described by the report

| Flow | Port / protocol | Evidence / purpose |
|---|---|---|
| Admin host → Ubuntu Server | TCP 22 / SSH | Ubuntu administration; SSH access issue resolved by selecting the correct key and restricting file permissions to `0600` |
| Admin host → Ubuntu Server / GLPI | TCP 80 / HTTP | Browser access documented in the lab; public IP and URL were redacted from screenshots |
| GLPI host → `DC01` | TCP 389 / LDAP | GLPI test screenshot shows successful connection, bind and search |
| Windows domain resources | SMB, AD/DNS ports as configured | Departmental share and AD administration screenshots supplied; don't infer a complete port inventory from the screenshots alone |

## Oracle Cloud network-security notes

The source report says the required security rules were reviewed and ports 22, 80 and 389 were opened for the lab's intended flows. One screenshot shows an ingress rule sourced from `10.0.0.0/24` for TCP 53 with a description indicating AD DNS from the corporate subnet. The full current NSG/security-list configuration has not been independently re-queried.

Best practice for a public portfolio lab:

- Restrict management and directory ports to the required private subnet or VPN; do not broadly expose AD DS, LDAP, SMB or RDP to the internet.
- Use the minimum source CIDRs and ports needed for each flow.
- Verify both cloud security rules and the guest OS firewall.
- Do not publish public IPs, full OCI OCIDs, tenancy identifiers or credential-bearing OCI config files.
- If the project is kept running, review ongoing cost and shut down/delete resources when no longer needed.

## SSH key handling

The report states the initial SSH connection failed because the intended key was not explicitly selected and the private key permissions were too open (`066`). The working resolution was to reference the intended key and change its permissions:

```bash
chmod 600 <private-key-file>
ssh -i <private-key-file> ubuntu@<server-address>
```

The placeholders above are intentionally not real file or address values. Never commit private keys.

## Related WireGuard notes

Earlier project notes referenced a tunnel called `corp_lab_tunnel`, UDP port `57058`, and tunnel-side addresses `10.10.0.1` / `10.10.0.2`. The attached Phase 1 report and screenshots do not prove a working tunnel or handshake. Treat this as a historical side note until the current interface, peers, routes, DNS and last-handshake status are verified.
