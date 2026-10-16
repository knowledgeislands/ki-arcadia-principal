# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › ssh-keyonly

**Run report at 10:54 BST · last mark 10:54 BST**

---

## Done

Under Decision 230 and Decision 169, I drafted the key-only SSH rollout plan and changed nothing on either Mac. I made no change to `sshd`, launchd, the firewall, chezmoi apply or rig apply. On sol I only read files, over the tailnet.

- **The plan:** [Key-only SSH: rollout plan](/Users/krisbrown/.local/share/chezmoi/docs/guides/user/macos-workstation.md#key-only-ssh-rollout-plan) (line 61 of the chezmoi macOS workstation guide), committed as `aff044e` `docs(guides): plan key-only ssh`. All the checks passed: `rumdl check .` was clean, `node --test` passed 241 of 241, and `ki repo audit` had no failures, with only its two earlier warnings. I pushed to origin as a fast-forward, holding only this commit.
- **sol's Rig version:** `rig 0.6.3+dev`, at `~/.local/bin/rig`. sol is on macOS 27.0.1 (26A434).

### Key inventory

| Machine | Trusts (authorized_keys) | Holds | Reaches the other by key |
| --- | --- | --- | --- |
| terra | `SHA256:CrQToHMFBUfiWYY2wHPzvnk3PUN2Z3cR/PWouZUQkdk` (RSA 2048) only | The same key, `~/.ssh/kris@kris.me.uk`, protected by a passphrase and also in OneDrive. It is loaded in the agent. | terra → sol: **yes** (`ssh sol`) |
| sol | The same single fingerprint | The same key. The private key file on sol is byte-identical to terra's copy. | sol → terra: **yes at `100.96.126.29`, but only through the agent forwarded from terra.** `ssh terra` fails host-key verification. |

Both Macs run Apple's stock `sshd`: only `100-macos.conf` is in `sshd_config.d`, with `UsePAM yes`, so passwords are accepted. Remote Login is on for both.

The plan lists four gaps to close before the change:

- sol has no `terra` alias.
- sol's own agent has not been tested with a key login to terra.
- No other device, such as the iPhone, has a key.
- There is only one key, with no spare.

The plan treats the drop-in as a step done by hand, not something chezmoi carries. Writing to `/etc` is administrator-only system work, which belongs to Rig under [ADR-KI-TOOL-RIG-009](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/ADR-KI-TOOL-RIG-009-system-domain-resources-under-an-attended-grant.md), and Rig has no `sshd` resource. The plan covers outbound traffic and LIVE-MAN-SWITCH as you asked.

## In Progress

Nothing. Kris has to carry out the rollout at the Mac.

## Queries

**SSH-TERRA-ALIAS**

**Context:** On sol, `ssh terra` fails because the managed `known_hosts` lists terra only by its address. The terra-side test in the plan uses `100.96.126.29` as a workaround.

**Query:** Should the managed SSH configuration get a `Host terra 100.96.126.29` entry, matching the existing `sol` entry, before the terra rollout?

**Options:** a) (recommended) Yes. The Rig: chezmoi thread adds it to `private_dot_ssh/private_config` without agent forwarding, and you review the `chezmoi diff` before applying it on sol. b) No. Use the address from sol.

**SSH-SPARE-KEY**

**Context:** One passphrase-protected RSA 2048 key is the only key either Mac trusts. Once passwords are off, losing that key or its passphrase means you need the keyboard at both Macs to get back in.

**Query:** Should you add a second key, such as an ed25519 key kept on the iPhone or in 1Password, to both `authorized_keys` files before going key-only?

**Options:** a) (recommended) Yes. Add a second key by hand before the sol rollout, and record its fingerprint in the guide's key table. b) No. Accept a single key, with the keyboard as the way back.

```text
SSH-TERRA-ALIAS: a) Yes. The Rig: chezmoi thread adds a Host terra 100.96.126.29 entry, without agent forwarding, to private_dot_ssh/private_config, and Kris reviews the chezmoi diff before applying it on sol.
SSH-SPARE-KEY: a) Yes. Kris adds a second key by hand to both authorized_keys files before the sol rollout, and its fingerprint is recorded in the guide's key table.
```

```text
╭─ run report · 2026-10-15T09:54:43Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done, pushed        │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · 2 queries for Kris      │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [awaiting Kris] SSH-TERRA-ALIAS, SSH-SPARE-KEY, then the attended sol rollout
- [uncommitted] none

Resume: answer SSH-TERRA-ALIAS and SSH-SPARE-KEY in the master thread.
