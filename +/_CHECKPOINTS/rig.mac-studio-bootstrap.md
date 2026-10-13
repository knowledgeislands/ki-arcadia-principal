---
type: ki-checkpoint
thread: rig.mac-studio-bootstrap
label: 'Rig: mac-studio-bootstrap'
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-13T23:55:00Z
---

# rig.mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio back to full estate capability as a reliably reachable remote agent host, kept up to date remotely, under the Project [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) in the [Rig Initiative](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md). The bootstrap and the restart test are done; the Project stays open until the tailnet-only firewall is live on `sol` and remote `chezmoi apply` works over SSH (Decision 53).

## Current state

Mark: 2026-10-11T03:48Z, decisions log at Decision 40

Decisions log: `~/.local/state/ki/agents/mac-studio-bootstrap/decisions.md` (machine-local, on the laptop, not in Git); every "Decision N" in this checkpoint refers to that file.

ki-delegation read at f2b14dca

**Machine.** `sol` (studio, macOS 27.0.1 since 2026-10-14) at `100.90.130.74` on the tailnet, user `krisbrown`, key-based SSH from the laptop with agent forwarding for this host only; use `ssh krisbrown@100.90.130.74`, as plain `ssh sol` fails on `known_hosts`. FileVault is on, so after a restart nothing, Tailscale included, comes up until Kris unlocks it at the screen; any reboot needs Kris's approval. Host names and types are in the Project's [hosts note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/design/hosts.md).

**Ownership.** The Mac Studio is Kris's personal hardware, managed by Kris's Rig and chezmoi (`studio` profile on `core`), not by Techne. Remote agent use is exempt from the Techne Programme Hold under [GDR-KI-PRINCIPAL-004](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/GDR-KI-PRINCIPAL-004-standing-agent-host-exemption-from-the-techne-programme-hold.md) and [KI-ARCADIA-GOV-033](https://github.com/knowledgeislands/ki-principal/blob/75161068b46f9c8529d023c51bbbfb66dbf73b11/Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md) (done, pruned). Each step on the machine still needs Kris's approval.

**Restart test passed (2026-10-14).** `sol` upgraded to macOS 27.0.1, came back after the FileVault unlock, Tailscale reconnected on its own and SSH works. The Observatory service (`uk.me.kris.rig.observatory`) exits 78 since the reboot and a restart did not help; background agent `obs-fix` is investigating (Decision 53).

**Firewall (Decisions 47-51, 53).** [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) (macOS pf, tailnet-only listeners, never port 22) is delivered and Awaiting review with the proposed [ADR-KI-TOOL-RIG-009](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/ADR-KI-TOOL-RIG-009-system-domain-resources-under-an-attended-grant.md); Kris approved the review, and closure goes through `ki-accept` after the live test. It applies to both Macs, terra first (Decision 50). Background agent `firewall-live-prep` is writing the personal declaration in chezmoi, checking whether each Mac's installed Rig accepts the new kind, and writing the terra test steps. Background agent `firewall-linux` is adding and delivering a Linux provider record in tools-rig (Next) and a ki-techne-harness record for the agent host to declare it with no public AWS ports (Decision 51); applying it on the live agent host waits for the Techne Programme Hold.

**Handed on.** The SSH token fix (login Keychain locked over SSH, `security` exit 36, so remote 1Password renders fail) is with the [rig.chezmoi](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.chezmoi.md) thread as `KEYCHAIN-SSH`. Screen Sharing on/off, Handoff, Universal Clipboard and Universal Control are in [KI-TOOL-RIG-CORE-046](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-046-remote-access-and-continuity.md) (triage, Rig Initiative). How Kris's Macs are reached is in the "Remote access" section of [the macOS workstation guide](/Users/krisbrown/.local/share/chezmoi/docs/guides/user/macos-workstation.md). Profile-filtered Dock items are [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md).

## Decisions made

Decision numbers refer to the machine-local decisions log named in Current state.

- This thread works only on Kris's Macs for this Project; the master thread `state-of-play` owns cross-project priorities and releases.
- Rig keeps one list of Kris's software on a `core` profile that `laptop` and `studio` inherit; it never uninstalls, but warns and offers opt-in removal (Decisions 7, 8, 13, 14).
- Tailscale stays the GUI app as a login item; any `tailscaled` swap is deferred (Decisions 5, 14).
- GitHub on `sol` uses Kris's own key, with SSH agent forwarding for `sol` only (Decisions 15, 17, 29, 34).
- Screen Sharing is limited to the tailnet through Rig, not by hand, on both Macs (Decisions 47-50); Rig owns the firewall model for Linux too, and Techne's agent-host recipe consumes it (Decision 51).
- Leave the old apps on `sol` and the Warp checksum failure as they are (Decision 53).

## Files touched

This checkpoint only. The Project note and its hosts note are current.

## Open questions

- **Needs Kris:**
  - `FW-LIVE` - when `firewall-live-prep` reports, run the terra test at the machine (an SSH session open as a safety line, apply with `--sudo`, check tailnet SSH and VNC, LAN refused, survives a restart), then `sol` with a NordVPN on/off check.
  - `TERRA-VNC` - turn on Screen Sharing on terra just before that test (System Settings > General > Sharing, Only these users, VNC password off).
  - `BURNDOWN-NOTE` - paste the firewall note into the tools-burndown thread.
  - `ZED-MD` - at `sol`, select a `.md` file in Finder, Cmd-I, choose Zed under Open with, then Change All.

## Next step

Read the `obs-fix`, `firewall-live-prep` and `firewall-linux` reports, fast-forward the checkouts they pushed, then walk Kris through `FW-LIVE` on terra.
