# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › fw-rollout

**Run report at 00:28 BST · last mark 00:28 BST**

---

## Done

I prepared the rollout plan for the live check of [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md). It is below. This was a read-only run with no commits, and I made no live `sudo`, `pfctl`, `launchctl`, `rig apply` or `chezmoi apply` call.

Findings that shape the plan:

- **No declaration exists yet.** The chezmoi Rig catalogue (`dot_config/rig/conf.d/`) has no `[firewall.*]` table, so step 1 is still to do.
- **Which ADR belongs to which record.** [ADR-KI-TOOL-RIG-009](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/ADR-KI-TOOL-RIG-009-system-domain-resources-under-an-attended-grant.md) (system-domain resources under an attended grant) belongs to KI-TOOL-RIG-CORE-047. [ADR-KI-TOOL-RIG-010](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/ADR-KI-TOOL-RIG-010-linux-firewall-through-a-rig-owned-nftables-table.md) is the Linux nftables decision for KI-TOOL-RIG-CORE-051 and depends on ADR-KI-TOOL-RIG-009. KI-TOOL-RIG-CORE-051 has already been accepted and pruned. Both ADRs are still `proposed`.
- **terra is ready on the Rig side.** It runs `rig 0.6.3+dev` from its checkout, and the firewall has shipped since v0.6.0. Its Screen Sharing port 5900 is **listening on every address right now**, so it is exposed on the LAN today. terra has no SSH daemon on port 22; SSH reaches it only through Tailscale SSH.
- **sol may be behind.** [KB-DOTFILES-UE-089](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-089-ki-tool-release-channels.md) records sol's Homebrew `rig` as 0.5.0, which "rejects the firewall declaration". Once the declaration is in the catalogue, chezmoi will carry it to sol. If sol still runs 0.5.0 then, every `rig` command there will refuse the whole configuration.

### The rollout plan

Do terra first. Go on to sol only after terra passes every check. The firewall only ever filters the ports it declares (TCP and UDP 5900). Rig refuses port 22, so SSH stays open as the way back in.

**1. Prerequisites**

1. Add this declaration to chezmoi source as a new file, `dot_config/rig/conf.d/private_45-firewall.toml`. It follows the record's proposed contract and the `uk.me.kris.rig.*` locator style the existing services use:

   ```toml
   [firewall.screen-sharing-tailnet]
   name = "Screen Sharing on the tailnet only"
   purpose = "Keep remote screen sessions off shared networks"
   rationale = "Screen Sharing listens on every address and macOS cannot bind it to one interface"
   provider = "macos-pf"
   locator = "uk.me.kris.rig.firewall.screen-sharing"
   platforms = ["macos"]
   ports = ["tcp:5900", "udp:5900"]
   allow = ["tailnet"]
   profiles = ["laptop"]
   ```

   Start with `profiles = ["laptop"]` so that only terra selects it. Change it to `["laptop", "studio"]` once terra passes. The Rig: chezmoi thread commits it (query FW-DECLARE).
2. Before chezmoi carries this file to sol, make sure sol's `rig --version` is 0.6.0 or later.
3. On terra, apply chezmoi so the file reaches `~/.config/rig/conf.d/`. Then check that `rig show firewall:screen-sharing-tailnet` lists the ports, the allowed tailnet ranges and the locator. This step changes nothing on the network.

**2. Restore path: rehearse it before the change**

- **terra.** You are at the machine, and the local console is the way back. Rehearse it: open Terminal on terra and run `sudo pfctl -a com.apple/uk.me.kris.rig.firewall.screen-sharing -s rules`. This only reads. It should take your password and print nothing, because the anchor is empty. That proves the admin route you would use to roll back works.
- **sol.** The way back is SSH over the tailnet from terra, which the firewall never touches. Have physical access, or someone at sol with a local admin account, as the fallback. Do not count on Screen Sharing from the LAN: once the firewall is on, that is exactly what it blocks. Rehearse it: from terra, SSH to sol on its tailnet address, run the same read-only `pfctl` query under `sudo` there, and confirm it prints nothing. Baseline NordVPN at the same time. Turn NordVPN on and then off on sol, before any firewall exists, and confirm the SSH session survives. If it drops, NordVPN is breaking the tailnet by itself; stop and report that before going any further.
- **The rollback itself, which needs no Rig.** If something goes wrong, run the two commands from [Restrict a listener to the tailnet](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/guides/user/operational-resources.md): `launchctl bootout system/uk.me.kris.rig.firewall.screen-sharing`, then `pfctl -a com.apple/uk.me.kris.rig.firewall.screen-sharing -F all`, both under `sudo`. The first stops the daemon reloading the rules; the second removes the loaded rules at once.
- **The durable Rig retirement.** Delete the `[firewall.screen-sharing-tailnet]` table from chezmoi source, apply chezmoi, then run Rig's attended apply with the administrator grant. Rig unloads the daemon, flushes only its own anchor and removes its two files. Taking the item out of a profile is not enough; it retires nothing.

**3. Apply on terra**

1. Preview: run Rig's targeted dry run for `firewall:screen-sharing-tailnet`. You should see the rendered pf rules: four per port (pass on `lo0`, pass IPv4 tailnet to tailnet, pass IPv6 tailnet to tailnet, then block). You should also see two files, `/etc/pf.anchors/uk.me.kris.rig.firewall.screen-sharing` and `/Library/LaunchDaemons/uk.me.kris.rig.firewall.screen-sharing.plist`, and the commands Rig would run. No rule should name port 22.
2. Apply: run the same targeted apply without `--dry-run` and with `--sudo`. It asks for your password once. You should see the firewall reported as applied, with no reread mismatch. That reread is the first real proof that Rig reads live `pfctl` output correctly, which was proven only against a fixture until now. If it fails with a reread mismatch, nothing is left half-loaded; report it as a failure.
3. `rig doctor` should then report the firewall `present` with `kernel-rules-unverified`, and no `exposed-beyond-tailnet`.

**4. Checks on terra, each with its expected result**

| Check | How | Expected |
| --- | --- | --- |
| Tailnet SSH | From sol, SSH to terra's tailnet address `100.96.126.29` | Connects as before |
| Tailnet Screen Sharing | From sol, or an iPhone with Tailscale on, open `vnc://100.96.126.29` | Connects |
| LAN refused | From an iPhone on the same Wi-Fi with Tailscale off, open `vnc://` to terra's LAN address | Times out or is refused |
| Survives restart | Restart terra, unlock FileVault, and wait for Tailscale. Run the read-only `pfctl … -s rules` query, then repeat the tailnet and LAN Screen Sharing checks | Four rules per port are still listed; tailnet connects; LAN is refused |

**5. sol, only after terra passes**

1. Change the declaration's profiles to `["laptop", "studio"]` (through the Rig: chezmoi thread), then apply chezmoi on sol. Confirm `rig --version` is 0.6.0 or later first.
2. Keep an SSH session from terra to sol open over the tailnet throughout, as the restore path. Run the same preview and attended apply on sol, then `rig doctor`.
3. Run the same checks against sol at `100.90.130.74`: SSH, `vnc://`, and LAN refusal from the iPhone with Tailscale off.
4. **NordVPN:** turn NordVPN on and run the `pfctl … -s rules` query. Then turn it off and run the query again. The rules should still be listed both times, and tailnet `vnc://` should still connect. If NordVPN removes the rules, that is a fail; the record's planned fallback is a periodic reload (FW-PERSIST), raised as a follow-up rather than a widening of this record.
5. **Restart:** only when you are at sol, because FileVault holds it at the unlock screen before Tailscale starts. Restart it, unlock it, and repeat the rules query and the tailnet and LAN checks.

**6. Pass or fail**

Report back one line per check: terra SSH, terra `vnc://`, terra LAN refused, terra restart, sol SSH, sol `vnc://`, sol LAN refused, sol NordVPN, sol restart. Give each pass or fail, with any error text.

- **On a full pass**, one run accepts KI-TOOL-RIG-CORE-047 under `ki-accept`, recording this live evidence in its Review. It marks ADR-KI-TOOL-RIG-009 accepted, because that is the record's own ADR. Under your earlier RCA-RIG-ADR010 answer, it also marks ADR-KI-TOOL-RIG-010 accepted (query FW-ADR). The chezmoi macOS workstation guide's "Remote access" paragraph should then point to the firewall; that is a handoff to the Rig: chezmoi thread.
- **On a fail**, roll back with the two commands above, then evaluate. A narrow defect, such as a reread mismatch or NordVPN flushing the rules, is captured as a follow-up record, as the record's Verify section requires. KI-TOOL-RIG-CORE-047 stays awaiting review.

## In Progress

Nothing is running.

Not started:

- sol's `rig` version is unverified. The 0.5.0 figure comes from the read-only survey recorded in KB-DOTFILES-UE-089. I did not contact sol.

## Queries

**FW-DECLARE**

**Context:** The declaration does not exist yet. Adding it changes the shared Rig catalogue on every Mac. sol's `rig` 0.5.0, if it is still installed, would reject the whole configuration.

**Query:** Who adds the declaration, and in what order?

**Options:** a) (recommended) The Rig: chezmoi thread commits the declaration above as `conf.d/private_45-firewall.toml`, with `profiles = ["laptop"]`, and does not apply chezmoi on sol until sol's `rig` is 0.6.0 or later. Kris then runs the terra steps. b) Kris adds the file by hand on terra only for the check, and the chezmoi thread commits it afterwards. c) Hold until sol's release channel under KB-DOTFILES-UE-089 is settled.

**FW-ADR**

**Context:** ADR-KI-TOOL-RIG-009 is KI-TOOL-RIG-CORE-047's own ADR. ADR-KI-TOOL-RIG-010 is the Linux ADR of the already-accepted KI-TOOL-RIG-CORE-051, and it depends on ADR-KI-TOOL-RIG-009. Your RCA-RIG-ADR010 answer named only ADR-KI-TOOL-RIG-010.

**Query:** Which ADRs does the acceptance run mark accepted on a pass?

**Options:** a) (recommended) Both ADR-KI-TOOL-RIG-009 and ADR-KI-TOOL-RIG-010. b) ADR-KI-TOOL-RIG-009 only, leaving ADR-KI-TOOL-RIG-010 for a Linux live check on vega.

```text
FW-DECLARE: a) The Rig: chezmoi thread commits the firewall declaration as conf.d/private_45-firewall.toml with profiles = ["laptop"], and does not apply chezmoi on sol until sol's rig is 0.6.0 or later; Kris then runs the terra steps.
FW-ADR: a) On a pass, the acceptance run accepts KI-TOOL-RIG-CORE-047 and marks both ADR-KI-TOOL-RIG-009 and ADR-KI-TOOL-RIG-010 accepted.
```

```text
╭─ run report · 2026-10-14T23:28:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [awaiting Kris] FW-DECLARE, FW-ADR, then the live check
- [uncommitted] none; read-only run
