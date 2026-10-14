---
type: ki-checkpoint
thread: rig.mac-studio-bootstrap
label: 'Rig: mac-studio-bootstrap'
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-14T09:55:00Z
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

Mark: 2026-10-11T03:48Z, decisions log at Decision 40

Decisions log: `~/.local/state/ki/agents/mac-studio-bootstrap/decisions.md` (machine-local, on the laptop, not in Git); every "Decision N" in this checkpoint refers to that file.

ki-delegation read at f2b14dca

**Machine.** `sol` (studio, macOS 27.0.1 since 2026-10-14) at `100.90.130.74` on the tailnet, user `krisbrown`, key-based SSH from the laptop with agent forwarding for this host only; use `ssh krisbrown@100.90.130.74`, as plain `ssh sol` fails on `known_hosts`. FileVault is on, so after a restart nothing, Tailscale included, comes up until Kris unlocks it at the screen; any reboot needs Kris's approval. Host names and types are in the Project's [hosts note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/design/hosts.md).

**Ownership.** The Mac Studio is Kris's personal hardware, managed by Kris's Rig and chezmoi (`studio` profile on `core`), not by Techne. Remote agent use is exempt from the Techne Programme Hold under [GDR-KI-PRINCIPAL-004](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/GDR-KI-PRINCIPAL-004-standing-agent-host-exemption-from-the-techne-programme-hold.md) and [KI-ARCADIA-GOV-033](https://github.com/knowledgeislands/ki-principal/blob/75161068b46f9c8529d023c51bbbfb66dbf73b11/Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md) (done, pruned). Each step on the machine still needs Kris's approval.

**Restart test passed (2026-10-14).** `sol` upgraded to macOS 27.0.1, came back after the FileVault unlock, Tailscale reconnected on its own and SSH works. sol's repositories are now cloned into the `~/workspaces/<group>/<repo>` layout (56 repositories, Decision 54); the Observatory runs again and `rig doctor` on sol is clean. The old `~/workspaces/kit/` and `~/workspaces/hnr/` trees are kept and some hold unpushed work (`SOL-OLD-TREES`). The doctor gap is [KI-TOOL-RIG-CORE-052](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-052-doctor-service-launch-prerequisites.md) (triage).

**Firewall (Decisions 47-51, 53).** [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) (macOS pf, never port 22) is Awaiting review with proposed [ADR-KI-TOOL-RIG-009](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/ADR-KI-TOOL-RIG-009-system-domain-resources-under-an-attended-grant.md); Kris approved the review, and closure goes through `ki-accept` after the live test. Kris's declaration (profiles `laptop` and `studio`) is parked outside the chezmoi source at `~/.local/state/ki/agents/mac-studio-bootstrap/56-firewall.toml` (Decision 54). The firewall is already in released Rig 0.6.0-0.6.2 and terra's Homebrew has 0.6.2, so no release request is needed; `sol` still has Homebrew Rig 0.5.0, which rejects `[firewall.*]`, and is fixed by `SOL-BUILD-NOW` or `brew upgrade rig`. The terra test runs a development Rig against a separate copy in `~/.local/state/rig-firewall-test` (steps and rollback in `firewall-live-prep.report.md` in the run folder). On 2026-10-14 at about 10:50 CEST it was applied on terra: tailnet 5900 open and LAN 5900 blocked, checked from `sol`; the restart and rule-comparison steps remain. The Linux provider [KI-TOOL-RIG-CORE-051](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-051-linux-tailnet-only-firewall.md) (Rig-owned nftables table) is Awaiting review with proposed [ADR-KI-TOOL-RIG-010](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/ADR-KI-TOOL-RIG-010-linux-firewall-through-a-rig-owned-nftables-table.md); the agent-host handoff is [KI-TECHNE-OPS-026](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-026-agent-host-tailnet-only-firewall.md) (triage; the AWS stack opens no inbound ports), and applying it on the live agent host waits for the Techne Programme Hold. The `sol` SSH alias is [KB-DOTFILES-UE-088](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-088-ssh-alias-for-sol.md) (triage).

**Handed on.** The SSH token fix (login Keychain locked over SSH, `security` exit 36, so remote 1Password renders fail) is with the [rig.chezmoi](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.chezmoi.md) thread as `KEYCHAIN-SSH`. Screen Sharing on/off, Handoff, Universal Clipboard and Universal Control are in [KI-TOOL-RIG-CORE-046](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-046-remote-access-and-continuity.md) (triage, Rig Initiative). How Kris's Macs are reached is in the "Remote access" section of [the macOS workstation guide](/Users/krisbrown/.local/share/chezmoi/docs/guides/user/macos-workstation.md). **Local mode (Decision 56).** `sol` is to run the KI tools from its checkouts; the agent host keeps pinned releases. The read-only survey (`local-mode-plan.report.md` in the run folder) found terra already does this through unmanaged links, `sol` runs releases with an old `mgit` link, and none of `sol`'s eight MCP server checkouts is built, so none starts. Its plan: chezmoi declares the links on both Macs with Homebrew kept as fallback, `ki dev local on`, and a `ki-local-refresh` script that builds after a pull; one KB-DOTFILES-UE record. [KI-TOOL-RIG-CLI-026](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CLI-026-per-tool-development-mode-switch.md) stays on Hold. [KI-TOOL-RIG-DIST-011](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-DIST-011-stale-terra-rig-link.md) wrongly calls terra the Linux host (vega).

**Display sleep on `sol`.** Display sleep is 30 minutes, but an Amphetamine session (display-awake) and Universal Control both hold the displays on; the screen saver waits 60 minutes.

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

- **Needs Kris:** `FW-LIVE` (terra: confirm a real Screen Sharing session over the tailnet, then restart terra and paste the rule comparison; then `sol`), `SOL-DISPLAY`, `SOL-OLD-TREES`, `LOCAL-PLAN`, `LOCAL-TERRA`, `LOCAL-RECORD`, `SOL-BUILD-NOW` (replaces `SOL-MGIT-LINK` and `SOL-MCP-BUILD`), `RIG-UPDATE-SOURCE`, `DIST-011-HOST`.
- **No action now:** `ZED-MD` (later, at `sol`), `FW-LINUX-LIVE` (needs a Linux host), `KEYCHAIN-SSH` (with rig.chezmoi).

## Next step

Finish `FW-LIVE` on terra (restart check and rule comparison); get a firewall-capable Rig onto `sol` (`SOL-BUILD-NOW`), commit the parked declaration, and run the `sol` test with a NordVPN check.
