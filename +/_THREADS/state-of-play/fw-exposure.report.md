# Master: state-of-play › fw-exposure

**Run report at 02:14 BST · last mark 02:14 BST**

---

## Done

Read only, on `terra`, under Decision 226. I changed no settings, used no sudo, created no records and made no commits.

### The short answer

Yes. On a cafe network today, anyone on the same Wi-Fi can reach both Screen Sharing and Remote Login on `terra` and try your account password. Nothing filters either of them. The macOS application firewall is off, stealth mode is off, and SSH still accepts passwords. Tailscale does not change this, because macOS opens both services on every network, not only on the tailnet.

### What terra exposes, port by port

| Port | Service | Who can reach it | Risk on cafe Wi-Fi |
| --- | --- | --- | --- |
| TCP 22 | Remote Login (`sshd`) | Every network, IPv4 and IPv6 | **High.** Password login is accepted. |
| TCP 5900 | Screen Sharing | Every network, IPv4 and IPv6 | **High.** Your account password is the only protection. |
| TCP 88 | Built-in Kerberos (`kdc`), which Screen Sharing and file-sharing sign-in use | Every network | Low. It is an Apple sign-in service. |
| TCP 5000, 7000 | AirPlay Receiver (Control Center) | Every network | Low to medium. Others nearby can see it and try to cast to it. |
| TCP 49168, 50748–50749; UDP 3722 and others | Continuity and Handoff (`rapportd`, `sharingd`) | Every network | Low. Apple authenticates these to your own devices. |
| UDP 5353 | Bonjour | Local network | Low, but it announces the Mac's name and services. |
| TCP 43307, 43667 | Tailscale's own peer service | Tailscale traffic | None. Tailscale drops anything that isn't from the tailnet. |
| Every web or app server (3333, 8787, 7801, 1675, 9277, and others) | Local tools and dev servers | Only this Mac (`127.0.0.1`) | None. |

Matching your settings to what I measured:

- **Remote Login really is on.** An earlier read found nothing on port 22 because it asked the wrong question. macOS holds port 22 open itself and only starts `sshd` when a connection arrives. The ordinary listing is run as you, not as the system, so it misses that. The system's network table shows `*.22` held by launchd on IPv4 and IPv6. Port 5900 works the same way.
- **SSH between your machines uses the Mac's own `sshd`, not Tailscale SSH.** Tailscale SSH is off on `terra`. `ssh sol` goes to `sol`'s tailnet address through the normal SSH server.
- **SSH accepts passwords.** `sshd` is running Apple's stock configuration, which sets nothing about passwords. That leaves both password login and keyboard-interactive login on. I couldn't read the full effective settings without sudo, but the config files leave no doubt. `terra` trusts one SSH key.
- **Tailscale:** Shields Up is off, so the tailnet can reach this Mac. Tailscale SSH is off. Serve and Funnel are not configured, and no exit node is in use.
- **Application firewall:** off. It also automatically allows signed software, and it lists `sshd` and `sharingd` as allowed. Turning it on would not limit these services to the tailnet, because it decides by app, not by network.

### Why the planned firewall covers only Screen Sharing

[KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) restricts Screen Sharing to the tailnet. It is built and tested against test fixtures. It is waiting for review and has never been run on a real Mac. It rejects port 22 on purpose. The Rig specification's firewall rule (RIG-CONF-030) and its validation code (`src/rig/29-firewall.bash:70`) both say: "SSH is the recovery path."

- **The lockout reason.** The firewall is a packet-filter rule that Rig loads as the system, and it reloads at every startup. If a rule is wrong, or the tailnet check misbehaves on a real Mac, it blocks what it covers. If that included SSH, you could lose remote access to `sol` with no remote way to undo it. The tested way back is to unload the rule over SSH (see the rollback in [the Rig user guide](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/guides/user/operational-resources.md)). So SSH stays outside the rule.
- [ADR-KI-TOOL-RIG-009](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/ADR-KI-TOOL-RIG-009-system-domain-resources-under-an-attended-grant.md) adds that changes like this only run under an attended administrator session, "because a mistake in this domain can lock a person out of their machine".
- **The cost.** Remote Login stays open on every network. KI-TOOL-RIG-CORE-047 also leaves SSH server settings out of scope, so it does nothing about password login either.

### Is a tailnet-only SSH rule possible later?

Technically, yes. The same rule shape would let tailnet SSH through and block everything else. Today Rig refuses it outright. Allowing it would need all of these first:

1. KI-TOOL-RIG-CORE-047 passes its live check on `terra` and then `sol`: tailnet SSH and Screen Sharing still connect, LAN access is refused, the rule survives a restart, and NordVPN on `sol` doesn't break it.
2. A second way back that doesn't need SSH. Examples: someone at the keyboard, or Screen Sharing over the tailnet tested as a way to undo the rule.
3. A specification change that lifts the port 22 refusal under that condition, plus a tested restore that reconnects first (Decision 169).

Key-only SSH gives most of the protection with much less lockout risk. That is why I recommend it below instead.

### Safe options for SSH, in order of my preference

1. **Turn Remote Login off on `terra`.** `terra` is the laptop: you SSH _from_ it to `sol`. I found nothing that needs to SSH _into_ it. You do this in System Settings › General › Sharing while sitting at the Mac, and turning it back on is the restore. Nothing remote depends on it. The same applies to Screen Sharing on `terra`: the chezmoi macOS workstation guide already says to keep it off on `terra` and off on any laptop you take onto shared networks.
2. **Make `sshd` key-only on `sol`, and on `terra` if you keep Remote Login there.** That means turning off password and keyboard-interactive login. This is connection-critical (Decision 169), so it needs a rollout plan:
   - first confirm that the keys of every machine that connects are in the trusted-keys list;
   - keep one SSH session open;
   - make the change and test a fresh key login from a second machine;
   - only then close the held session.

   The restore is to remove the change from the held session, or at the keyboard. `sol` sits at home and is not exposed in cafes, so this matters most for any Mac that travels.
3. **Later, a tailnet-only rule for SSH**, under the conditions above.
4. **Tailscale SSH** would replace the Mac's SSH server with tailnet sign-in. It runs only under the separately installed Tailscale service, which `terra` uses but `sol` does not (it runs the Tailscale app). So it doesn't help `sol` without reinstalling Tailscale, which is itself a connection-critical change. Not recommended now.

Until KI-TOOL-RIG-CORE-047 is live, the safest thing in a cafe is option 1, with Screen Sharing also off on `terra`.

### Web pages on other hosts

Yes, they can be reachable over the tailnet. Every web server on `terra` today listens only on the Mac itself, so none of them can be reached from anywhere else. Reaching one from another machine later works one of three ways:

- **Listen on all addresses or on the tailnet address**, then open `http://<host>:<port>`. MagicDNS is on, so host names work. Listening on all addresses also opens the port on cafe Wi-Fi. A Rig firewall rule is the fix: the Rig user guide's example limits a development server on port 3000 to the tailnet, and the Mac firewall accepts any port except 22.
- **Tailscale Serve** publishes a loopback-only service to the tailnet over HTTPS, with no extra open port. None of the existing Rig or chezmoi records or guides covers Serve, so it would be a hand setting today.
- **Avoid Tailscale Funnel**, which publishes to the whole internet.

## In Progress

Nothing. KI-TOOL-RIG-CORE-047's live check on `terra` and `sol` still waits for your separate approval, as the record says.

## Queries

**FW-TERRA-OFF**

**Context:** `terra` travels, and both Screen Sharing and Remote Login on it accept password attempts from any network. Nothing I found connects into `terra`. You can turn both back on in System Settings at the Mac.

**Query:** Should Screen Sharing and Remote Login be turned off on `terra` until KI-TOOL-RIG-CORE-047 is live there?

**Options:** a) (recommended) Turn off Screen Sharing and Remote Login on `terra` yourself, at the Mac, in System Settings › General › Sharing. Leave `sol` unchanged. b) Keep both on and turn them off only when you're on a shared network. c) Keep both on.

**FW-SSH-KEYONLY**

**Context:** SSH on both Macs runs Apple's stock configuration, which accepts passwords. Making it key-only is connection-critical under Decision 169 and needs a tested rollout. KI-TOOL-RIG-CORE-047 excludes SSH server settings, and Decision 158 rules out a new Rig record for it.

**Query:** Should a background run draft a key-only SSH rollout plan for `sol` (and `terra` if Remote Login stays on), for you to carry out attended?

**Options:** a) (recommended) Yes. A run drafts the plan as a section in the chezmoi macOS workstation guide's Remote access section. The plan covers the key inventory, a held session, a second-machine test and restore steps. You carry it out at the Mac, and the run changes nothing on any machine. b) Defer until KI-TOOL-RIG-CORE-047 is live. c) No change: passwords stay accepted.

```text
FW-TERRA-OFF: a) Turn off Screen Sharing and Remote Login on terra yourself, at the Mac, in System Settings › General › Sharing. Leave sol unchanged.
FW-SSH-KEYONLY: a) Yes. A run drafts the plan as a section in the chezmoi macOS workstation guide's Remote access section. The plan covers the key inventory, a held session, a second-machine test and restore steps. You carry it out at the Mac, and the run changes nothing on any machine.
```

```text
┌─ run report · 02:14 BST ─────────────────────────────────────┐
│                                                              │
│   FW-EXPOSURE   [done] [read-only] [2 queries open]          │
│                                                              │
└──────────────────────────────────────────────────────────────┘
At rest. Resume: answer FW-TERRA-OFF and FW-SSH-KEYONLY in the master thread.
```
