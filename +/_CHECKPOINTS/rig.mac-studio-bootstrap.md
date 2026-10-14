---
type: ki-checkpoint
thread: rig.mac-studio-bootstrap
label: 'Rig: mac-studio-bootstrap'
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-14T14:51:00Z
---

# rig.mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio back to full estate capability as a reliably reachable remote agent host, kept up to date remotely, under the Project [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) in the [Rig Initiative](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md). The bootstrap and the restart test are done; the Project stays open until the tailnet-only firewall is live on `sol` and remote `chezmoi apply` works over SSH (Kris's closure condition, 2026-10-14).

## Thread working rules

Re-read this block after every compaction.

- **Role:** coordinator for the mac-studio-bootstrap Project. Delegate anything longer than a one-step check to detached `ki agent` runs named `mac-studio-bootstrap` under `ki-delegation`; record each approval with `ki agent decide` before launch. Agents may SSH to `sol` and run Homebrew there only when their prompt says so.
- **Reporting:** quiet level, with timestamped CEST one-liners during work. Every Summary is a `ki-delegation` owner report under a `#` banner (thread, Project and Initiative links, window, state): What has been done, What is in progress, Outstanding queries as `### TAG - title` with Summary, Need from you and Recommendation, then one text reply block. Keep tool use visible to Kris to a minimum and report outcomes only. Link every record by full identifier to its absolute path. Describe decisions by words and date, never by number.
- **Standing rules:** commit by explicit path; no force-push or `--no-verify`; accept only through `ki-accept` with Kris's approval; never prune without approval; never print secrets; nothing in the hnr-org organisation; any `sol` reboot needs Kris. From state-of-play (2026-10-14): burn the roadmap down, no new feature records; other threads' committed work beneath ours may be pushed when checks pass, naming it; connection-critical changes need a tested restore path; follow-up releases stop and ask first.

## Current state

Mark: 2026-10-14T14:51Z

**Re-bootstrapped on sol at this mark** (2026-10-14). No commits, decisions or agent runs since 14:48Z; sol stock unchanged (old trees and dead skill links still present, `ki-pmo` still unlinked). Nothing restarted.

Previous mark: 2026-10-14T14:48Z

**Resumed on sol at this mark** (re-bootstrap, 2026-10-14). Nothing running or queued; no new approvals since 14:35Z, so no work restarted. Stock on sol: ki-principal, ki-agentic-harness, tools-ki and tools-rig level with origin; ki-coordinator output style active, but the `ki-pmo` skill is not linked into `~/.claude/skills` (ki-pmo standard read from the harness checkout at 8f23d27c) and the dead `ki-delegate` and `ki-design-loop` links remain; `~/workspaces/kit`, `hnr` and `knowledge-wayfinder` still present, so OLD-TREES-RUN is not yet done. The re-bootstrap used more reads than a coordinator turn allows; the rest goes to agents.

Previous mark: 2026-10-14T14:35Z (thread moved from terra to sol)

**Thread moves to sol at this mark** (Kris, 2026-10-14: "So I'm thinking I can hand off the rest of this to Sol now. In which case, we need to take a mark, and do it"). terra's coordinating thread stops after the hand-off run; sol's thread resumes from this checkpoint. Nothing is running or queued.

Decisions log: machine-local, not in Git. From this mark the live copy is on `sol` at `~/.local/state/ki/agents/mac-studio-bootstrap/decisions.md`, copied from terra with the run reports; terra's copy is frozen.

ki-pmo read at 8f23d27c

**Machine.** `sol` (studio, macOS 27.0.1 since 2026-10-14) at `100.90.130.74` on the tailnet, user `krisbrown`, key-based SSH from the laptop with agent forwarding for this host only; use `ssh krisbrown@100.90.130.74`, as plain `ssh sol` fails on `known_hosts`. FileVault is on, so after a restart nothing, Tailscale included, comes up until Kris unlocks it at the screen; any reboot needs Kris's approval. Host names and types are in the Project's [hosts note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/design/hosts.md).

**Ownership.** The Mac Studio is Kris's personal hardware, managed by Kris's Rig and chezmoi (`studio` profile on `core`), not by Techne. Remote agent use is exempt from the Techne Programme Hold under [GDR-KI-PRINCIPAL-004](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/GDR-KI-PRINCIPAL-004-standing-agent-host-exemption-from-the-techne-programme-hold.md) and [KI-ARCADIA-GOV-033](https://github.com/knowledgeislands/ki-principal/blob/75161068b46f9c8529d023c51bbbfb66dbf73b11/Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md) (done, pruned). Each step on the machine still needs Kris's approval.

**Restart test passed (2026-10-14).** `sol` upgraded to macOS 27.0.1, came back after the FileVault unlock, Tailscale reconnected on its own and SSH works. sol's repositories are cloned into the `~/workspaces/<group>/<repo>` layout (56 repositories, Kris's layout approval, 2026-10-14); the Observatory runs again and `rig doctor` on sol is clean. The doctor gap is [KI-TOOL-RIG-CORE-052](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-052-doctor-service-launch-prerequisites.md) (triage).

**Headroom on sol (2026-10-14).** Kris deployed Headroom on `sol` by hand with `headroom install apply` (init-user profile, port 8787), and Claude Code on `sol` works through it (Kris, 2026-10-14: "HEADROOM-NOW - this is working, which is great"). The declaration gap goes into the SOL-RECORDS chezmoi record.

**Firewall (Kris's tailnet-only Screen Sharing decisions, 2026-10-13 and 2026-10-14).** [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) (macOS pf, never port 22) is Awaiting review with proposed [ADR-KI-TOOL-RIG-009](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/ADR-KI-TOOL-RIG-009-system-domain-resources-under-an-attended-grant.md); Kris approved the review, and closure goes through `ki-accept` after the live test. Kris's declaration (profiles `laptop` and `studio`) is parked outside the chezmoi source at `~/.local/state/ki/agents/mac-studio-bootstrap/56-firewall.toml` on terra (not copied to `sol`). The firewall is in released Rig 0.6.x, so no release request is needed; `sol` runs Rig 0.6.3 from its checkout, which accepts the declaration. The terra test runs a development Rig against a separate copy in `~/.local/state/rig-firewall-test` (steps and rollback in `firewall-live-prep.report.md` in the run folder). On 2026-10-14 at about 10:50 CEST it was applied on terra: tailnet 5900 open and LAN 5900 blocked, checked from `sol`, and a real Screen Sharing session from `sol` to terra works. The rule comparison is pending and the reboot check is proposed for terra's next natural restart. The Linux provider [KI-TOOL-RIG-CORE-051](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-051-linux-tailnet-only-firewall.md) is Awaiting review with proposed [ADR-KI-TOOL-RIG-010](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/ADR-KI-TOOL-RIG-010-linux-firewall-through-a-rig-owned-nftables-table.md); the agent-host handoff is [KI-TECHNE-OPS-026](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-026-agent-host-tailnet-only-firewall.md) (triage), and applying it on the live agent host waits for the Techne Programme Hold. The `sol` SSH alias is [KB-DOTFILES-UE-088](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-088-ssh-alias-for-sol.md) (triage).

**Handed on.** The SSH token fix (login Keychain locked over SSH, so remote 1Password renders fail) is with the [rig.chezmoi](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.chezmoi.md) thread as `KEYCHAIN-SSH`. Screen Sharing on/off, Handoff, Universal Clipboard and Universal Control are in [KI-TOOL-RIG-CORE-046](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-046-remote-access-and-continuity.md) (triage). How Kris's Macs are reached is in the "Remote access" section of [the macOS workstation guide](/Users/krisbrown/.local/share/chezmoi/docs/guides/user/macos-workstation.md). Thread-state transfer between hosts, including the decisions-log copy, is [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md).

**Local mode and channels (Kris's release-channel decisions, 2026-10-14).** The agent host (vega) is stable, tagged releases only; `sol` and terra are dev, running KI tools from checkouts and pulling `main` regularly, never pushing. The model is [KB-DOTFILES-UE-089](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-089-ki-tool-release-channels.md) (triage, open shape questions `UE-089-SHAPE`). On `sol` the five tools link to checkouts (Homebrew kept as fallback, undo in `sol-build.report.md`), the Knowledge Islands Harness is in local mode, and 7 of 8 MCP servers start (WhatsApp has no linked device on `sol`). [KI-TOOL-RIG-DIST-011](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-DIST-011-stale-terra-rig-link.md) host naming fixed and pushed.

**Old trees on `sol`.** `OLD-TREES` is off hold (Kris, 2026-10-14: "OLD-TREES - Can you give me a command to run that will do it?"): Kris runs it at `sol` as `OLD-TREES-RUN`, a two-step command that first lists, then moves `~/workspaces/kit` and `~/workspaces/hnr` into `~/workspaces/_retired-old-trees-2026-10-14`, removes the empty `knowledge-wayfinder` and removes the `ki-delegate` skill links. Nothing is deleted; undo is `mv ~/workspaces/_retired-old-trees-2026-10-14/{kit,hnr} ~/workspaces/`. Four repositories GitHub no longer serves stay as `OLD-ORPHANS`, and one unfinished `tools-mgit` change is saved as a patch in terra's run folder (`MGIT-PRESEED`).

Profile-filtered Dock items are [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md).

## Resuming on sol

1. On `sol`: `git -C ~/workspaces/knowledge-islands/ki-principal pull --ff-only`.
2. Open `ki-principal` in Zed or a terminal and start Claude Code with the ki-coordinator output style. That needs SOL-SCREEN step 5 (harness pull) and step 6 (chezmoi apply) first; until then, paste the resume line into a plain Claude session.
3. Paste the resume line: `Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T14:35Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.`
4. Use the run's state folder on `sol` with `--log ~/.local/state/ki/agents/mac-studio-bootstrap/decisions.md` and `--repo ~/workspaces/knowledge-islands/ki-principal`.

## Decisions made

Decisions are described by words and date; the full wording is in the decisions log.

- This thread works only on Kris's Macs for this Project; the master thread `state-of-play` owns cross-project priorities and releases.
- Rig keeps one list of Kris's software on a `core` profile that `laptop` and `studio` inherit; it never uninstalls, but warns and offers opt-in removal (2026-10-09).
- Tailscale stays the GUI app as a login item; any `tailscaled` swap is deferred (2026-10-09).
- GitHub on `sol` uses Kris's own key, with SSH agent forwarding for `sol` only (2026-10-09 to 2026-10-11).
- Screen Sharing is limited to the tailnet through Rig, not by hand, on both Macs; Rig owns the firewall model for Linux too, and Techne's agent-host recipe consumes it (2026-10-13 and 2026-10-14).
- Leave the old apps on `sol` and the Warp checksum failure as they are (2026-10-14).
- Move the coordinating thread to `sol` at this mark (2026-10-14).

## Files touched

This checkpoint and `+/_THREADS/mac-studio-bootstrap/`. The Project note and its hosts note are current.

## Open questions

Waiting on Kris:

- **`SOL-SCREEN` - at-screen steps on `sol`** (`sol-ready.report.md`). `sol` can't host the thread fully until it signs in to GitHub, 1Password and chezmoi on its own with the Keychain unlocked. Steps (a)2 to (a)9: log in at the screen, check GitHub SSH and `gh`, turn on the 1Password CLI integration, pull the harness, pull and apply chezmoi for `~/.claude`, `~/.config/zed` and `~/.codex` only, then check Claude Code, Codex and Zed's agents. The Command Line Tools step (a)1 is skipped while `SOL-CLT` is parked. Recommended: `SOL-SCREEN - done the at-screen steps (a)2-(a)9 on sol, skipped (a)1 while SOL-CLT is parked, left .config/ki/config.toml unapplied`.
- **`SOL-AGENT-FIX` - let an agent finish `sol` over SSH** (`sol-ready.report.md`, absorbing `SOL-PULL`). After SOL-SCREEN: fast-forward clean `main` checkouts on `sol` and rebuild changed tools; remove the dead `ki-design-loop` skill link and the old `mise` claude shim; once OLD-TREES-RUN step 2 is done, clear the old `kit`, `hnr` and `kis` paths from sol's Claude settings; then re-run `rig doctor`, `chezmoi status`, `mcporter list` and `ki doctor`. No commits or pushes. Recommended: `SOL-AGENT-FIX - approved: after SOL-SCREEN, fast-forward clean main checkouts on sol, rebuild changed tools, tidy the dead ki-design-loop link and mise claude shim, clear old kit/hnr/kis paths from Claude settings after OLD-TREES-RUN step 2, re-run the checks; fetch allowed, no commits or pushes`.
- **`SOL-RECORDS` - record the gaps** (`sol-ready.report.md`, absorbing `HEADROOM-DECLARE`). One chezmoi triage record covering the Headroom deployment gap, the sign-ins bootstrap step, output-style link ordering and skill-link drift; the decisions-log transfer is added to [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) instead of a new record. Recommended: `SOL-RECORDS - capture one chezmoi triage record for Headroom deployment, sign-ins bootstrap, output-style link ordering and skill-link drift; add the decisions-log transfer to KI-HARNESS-GOV-189`.
- **`OLD-TREES-RUN` - retire the old trees on `sol`** (`old-trees.report.md`). Kris runs the two-step command described under Current state at sol's screen; nothing is deleted and the move is undoable. Recommended: `OLD-TREES-RUN - done: listed, then moved kit and hnr into ~/workspaces/_retired-old-trees-2026-10-14, removed knowledge-wayfinder and the ki-delegate skill links`.
- **`SOL-DOCK-ZED` - get Zed onto sol's Dock** (`sol-dock-zed.report.md`, not yet reported to Kris). Rig doesn't manage sol's Dock until [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md) is built, so `rig apply` won't add Zed. Recommended: `SOL-DOCK-ZED - drag Zed onto sol's Dock now and prioritise KI-TOOL-RIG-CORE-042`.
- **`SOL-DOCK-EXTRAS` - which laptop Dock extras belong on sol** (`sol-dock-zed.report.md`, not yet reported to Kris). A shared Dock would also bring NordVPN, ChatGPT Classic, LaunchControl, draw.io, Telegram, RendApp and The Tower where `studio` selects them, and Lightroom Classic would need adding. Recommended: `SOL-DOCK-EXTRAS - same order as the laptop, filtered by what each profile selects`.
- **`RIG-SITE-REFRESH` - refresh the Rig catalogue on midnight.ninja** (`rig-site.report.md`, not yet reported to Kris; Kris wants the site to show how Rig is available on each host). The catalogue is three weeks old, missing four tools, Spark is wrong, and Telegram's rationale needs internal references removed. Recommended: `RIG-SITE-REFRESH - run it: edit the Telegram rationale, run MIDNIGHT-HK-001 on terra, commit locally; push stays my call`.
- **`RIG-SITE-HOSTS` - record for the per-host view** (`rig-site.report.md`). Showing which hosts carry each public tool needs no Rig change and publishes nothing private; live versions and results would cross the privacy boundary. Recommended: `RIG-SITE-HOSTS - capture KB-MIDNIGHT-RIG-SITE-001 for the declared view only`.
- **`RIG-SITE-HOSTNAMES` - host names on the site** (`rig-site.report.md`). Roles (laptop, studio, agent host) or names (terra, sol, vega); the page is unindexed but public by URL. Recommended: `RIG-SITE-HOSTNAMES - roles only`.

On hold, parked (Kris, 2026-10-14): `SOL-CLT` (Kris installs the Command Line Tools for Xcode 27.0 on sol, then an agent runs `brew reinstall pkgconf` and `rig upgrade`; old tools cause 82-83 of 84 upgrade failures), `SOL-TELEGRAM` (clear the Homebrew cask record, then `rig apply --target telegram` from the App Store), both to pick up after the move to sol; `FW-LIVE` (terra rule comparison; reboot check at the next natural restart), `SOL-FW-TEST`, `UE-089-SHAPE`, `OLD-ORPHANS`, `MGIT-PRESEED`, `SOL-REGISTRY`, `SOL-SOURCES`, `SOL-HNR-HARNESS`, `SOL-WHATSAPP`, `SOL-KI-CONFIG-DRIFT`. Each is described in the run folder reports `old-trees`, `sol-build` and `records`.

No action now: `ZED-MD` (later, at `sol`), `FW-LINUX-LIVE` (needs a Linux host), `KEYCHAIN-SSH` (with rig.chezmoi).

## Next step

On `sol`: resume as above, put the open queries to Kris, then run SOL-AGENT-FIX after SOL-SCREEN. The firewall test on `sol` follows the terra rule comparison; the parked declaration file is on terra and must be copied or committed before it.
