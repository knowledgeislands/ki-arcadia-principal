---
type: ki-checkpoint
thread: rig.mac-studio-bootstrap
label: 'Rig: mac-studio-bootstrap'
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-14T10:56:00Z
---

# rig.mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio back to full estate capability as a reliably reachable remote agent host, kept up to date remotely, under the Project [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) in the [Rig Initiative](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md). The bootstrap and the restart test are done; the Project stays open until the tailnet-only firewall is live on `sol` and remote `chezmoi apply` works over SSH (Decision 53).

## Thread working rules

Re-read this block after every compaction.

- **Role:** coordinator for the mac-studio-bootstrap Project. Delegate anything longer than a one-step check to detached `ki agent` runs named `mac-studio-bootstrap` under `ki-delegation`; record each approval with `ki agent decide` before launch. Agents may SSH to `sol` and run Homebrew there only when their prompt says so.
- **Reporting:** quiet level, with timestamped CEST one-liners during work. Every Summary is a `ki-delegation` owner report under a `#` banner (thread, Project and Initiative links, window, state): What has been done, What is in progress, Outstanding queries as `### TAG - title` with Summary, Need from you and Recommendation, then one text reply block. Keep tool use visible to Kris to a minimum and report outcomes only. Link every record by full identifier to its absolute path.
- **Standing rules:** commit by explicit path; no force-push or `--no-verify`; accept only through `ki-accept` with Kris's approval; never prune without approval; never print secrets; nothing in the hnr-org organisation; any `sol` reboot needs Kris. From state-of-play (2026-10-14): burn the roadmap down, no new feature records; other threads' committed work beneath ours may be pushed when checks pass, naming it; connection-critical changes need a tested restore path; follow-up releases stop and ask first.

## Current state

Mark: 2026-10-14T10:56Z

Decisions log: `~/.local/state/ki/agents/mac-studio-bootstrap/decisions.md` (machine-local, on the laptop, not in Git); every "Decision N" in this checkpoint refers to that file.

ki-pmo read at 839ad1e1

**Machine.** `sol` (studio, macOS 27.0.1 since 2026-10-14) at `100.90.130.74` on the tailnet, user `krisbrown`, key-based SSH from the laptop with agent forwarding for this host only; use `ssh krisbrown@100.90.130.74`, as plain `ssh sol` fails on `known_hosts`. FileVault is on, so after a restart nothing, Tailscale included, comes up until Kris unlocks it at the screen; any reboot needs Kris's approval. Host names and types are in the Project's [hosts note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/design/hosts.md).

**Ownership.** The Mac Studio is Kris's personal hardware, managed by Kris's Rig and chezmoi (`studio` profile on `core`), not by Techne. Remote agent use is exempt from the Techne Programme Hold under [GDR-KI-PRINCIPAL-004](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/GDR-KI-PRINCIPAL-004-standing-agent-host-exemption-from-the-techne-programme-hold.md) and [KI-ARCADIA-GOV-033](https://github.com/knowledgeislands/ki-principal/blob/75161068b46f9c8529d023c51bbbfb66dbf73b11/Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md) (done, pruned). Each step on the machine still needs Kris's approval.

**Restart test passed (2026-10-14).** `sol` upgraded to macOS 27.0.1, came back after the FileVault unlock, Tailscale reconnected on its own and SSH works. sol's repositories are now cloned into the `~/workspaces/<group>/<repo>` layout (56 repositories, Decision 54); the Observatory runs again and `rig doctor` on sol is clean. The old `~/workspaces/kit/` and `~/workspaces/hnr/` trees are kept and some hold unpushed work (`SOL-OLD-TREES`). The doctor gap is [KI-TOOL-RIG-CORE-052](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-052-doctor-service-launch-prerequisites.md) (triage).

**Firewall (Decisions 47-51, 53).** [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) (macOS pf, never port 22) is Awaiting review with proposed [ADR-KI-TOOL-RIG-009](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/ADR-KI-TOOL-RIG-009-system-domain-resources-under-an-attended-grant.md); Kris approved the review, and closure goes through `ki-accept` after the live test. Kris's declaration (profiles `laptop` and `studio`) is parked outside the chezmoi source at `~/.local/state/ki/agents/mac-studio-bootstrap/56-firewall.toml` (Decision 54). The firewall is in released Rig 0.6.x, so no release request is needed; `sol` now runs Rig 0.6.3 from its checkout, which accepts the declaration (checked against a throwaway config copy). The terra test runs a development Rig against a separate copy in `~/.local/state/rig-firewall-test` (steps and rollback in `firewall-live-prep.report.md` in the run folder). On 2026-10-14 at about 10:50 CEST it was applied on terra: tailnet 5900 open and LAN 5900 blocked, checked from `sol`, and a real Screen Sharing session from `sol` to terra works. Kris does not want to restart terra now; the rule comparison is pending and the reboot check is proposed for terra's next natural restart. The Linux provider [KI-TOOL-RIG-CORE-051](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-051-linux-tailnet-only-firewall.md) (Rig-owned nftables table) is Awaiting review with proposed [ADR-KI-TOOL-RIG-010](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/ADR-KI-TOOL-RIG-010-linux-firewall-through-a-rig-owned-nftables-table.md); the agent-host handoff is [KI-TECHNE-OPS-026](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-026-agent-host-tailnet-only-firewall.md) (triage; the AWS stack opens no inbound ports), and applying it on the live agent host waits for the Techne Programme Hold. The `sol` SSH alias is [KB-DOTFILES-UE-088](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-088-ssh-alias-for-sol.md) (triage).

**Handed on.** The SSH token fix (login Keychain locked over SSH, `security` exit 36, so remote 1Password renders fail) is with the [rig.chezmoi](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.chezmoi.md) thread as `KEYCHAIN-SSH`. Screen Sharing on/off, Handoff, Universal Clipboard and Universal Control are in [KI-TOOL-RIG-CORE-046](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-046-remote-access-and-continuity.md) (triage, Rig Initiative). How Kris's Macs are reached is in the "Remote access" section of [the macOS workstation guide](/Users/krisbrown/.local/share/chezmoi/docs/guides/user/macos-workstation.md). **Local mode and channels (Decisions 56, 57).** Hosts are on a release channel: the agent host (vega) stable, tagged releases only; `sol` and terra dev, running KI tools from checkouts and pulling `main` regularly, never pushing. The model is [KB-DOTFILES-UE-089](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-089-ki-tool-release-channels.md) (triage, pushed, open shape questions `UE-089-SHAPE`). On `sol` the five tools now link to checkouts (Homebrew kept as fallback, undo in `sol-build.report.md`), the old `mgit` link is gone, the Knowledge Islands Harness is in local mode, `rig doctor` is clean, and 7 of 8 MCP servers start (WhatsApp has no linked device on `sol`). `ki dev local on` rewrote sol's chezmoi-managed `~/.config/ki/config.toml` (`SOL-KI-CONFIG-DRIFT`); the HNR Harness was never installed on `sol` (`SOL-HNR-HARNESS`). [KI-TOOL-RIG-DIST-011](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-DIST-011-stale-terra-rig-link.md) host naming fixed and pushed.

**Old trees on `sol` (`old-trees.report.md`).** 37 old checkouts under `kit/` and `hnr/` fetched: no work is lost except four repositories GitHub no longer serves (`5g-emerge-resources`, `ki-techne-principal`, `ki-plugins`, `kit-openclaw-kitteth`; `OLD-ORPHANS`) and one unfinished `tools-mgit` change saved as a patch in the run folder (`MGIT-PRESEED`). The rest can be retired (`OLD-TREES`). sol's territories already match the laptop in repositories; sol's `ki` registry is empty (`SOL-REGISTRY`) and its OneDrive `sources-*` stores are not synced (`SOL-SOURCES`).

Profile-filtered Dock items are [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md).

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

- **Needs Kris:** `FW-LIVE` (paste the rule comparison; reboot check at the next natural restart), `UE-089-SHAPE`, `OLD-TREES`, `OLD-ORPHANS`, `MGIT-PRESEED`, `SOL-REGISTRY`, `SOL-SOURCES` (Kris in OneDrive on `sol`), `SOL-HNR-HARNESS`, `SOL-WHATSAPP`, `SOL-KI-CONFIG-DRIFT`.
- **No action now:** `ZED-MD` (later, at `sol`), `FW-LINUX-LIVE` (needs a Linux host), `KEYCHAIN-SSH` (with rig.chezmoi).

## Next step

Get the terra rule comparison; then commit the parked firewall declaration and run the `sol` test with a NordVPN check (sol's Rig is now firewall-capable). Act on Kris's answers to the old-tree and local-mode queries.
