---
type: ki-checkpoint
thread: rig.mac-studio-bootstrap
label: 'Rig: mac-studio-bootstrap'
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-11T03:20:00Z
---

# rig.mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio back to full estate capability as a reliably reachable remote agent host, under the Project [mac-studio-bootstrap](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) in the [Rig Initiative](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Initiatives/rig.md). The bootstrap is done and every follow-up has been handed on; only the restart test remains.

## Current state

Mark: 2026-10-10T15:37Z, decisions log at Decision 28

Decisions log: `~/.local/state/ki/agents/mac-studio-bootstrap/decisions.md` (machine-local, on the laptop, not in Git); every "Decision N" in this checkpoint refers to that file.

ki-delegation read at c15053c4

**Remaining: the restart test** (Needs Kris item `RESTART`). The Project stays open until it passes.

**Machine.** `sol` (studio, macOS) at `100.90.130.74` on the tailnet, user `krisbrown`, key-based SSH from the laptop with agent forwarding for this host only; use `ssh krisbrown@100.90.130.74`, as plain `ssh sol` fails on `known_hosts`. FileVault is on, so after a restart nothing, Tailscale included, comes up until Kris unlocks it at the screen. Four 1Password-backed chezmoi targets render only at that screen. Host names and types are in the Project's [hosts note](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/mac-studio-bootstrap/design/hosts.md).

**Ownership.** The Mac Studio is Kris's personal hardware, managed by Kris's Rig and chezmoi (`studio` profile on `core`), not by Techne. Remote agent use is exempt from the Techne Programme Hold under [GDR-KI-ARCADIA-004](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Admin/Governance/Decisions/GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold.md) and [KI-ARCADIA-GOV-033](https://github.com/knowledgeislands/ki-arcadia-principal/blob/75161068b46f9c8529d023c51bbbfb66dbf73b11/Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md) (done, pruned). Each step on the machine still needs Kris's approval.

**Follow-ups handed on.**

- [Rig Initiative](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Initiatives/rig.md): opt-in software removal ([RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md)), profile-filtered Dock items ([RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md)), self-updating apps including Warp ([RIG-CORE-043](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-043-self-updating-applications.md)), undeclared software decisions ([DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md)), and the Later items: NordVPN, six untrusted Homebrew taps, a Command Line Tools update and a `tailscaled` swap.
- [rig.chezmoi](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/rig.chezmoi.md) thread: the `op_cache` race, the copy-key script that runs on every apply, [DOTFILES-UE-082](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-082-tolerate-missing-template-tools.md), [DOTFILES-UE-084](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-084-render-zshenv-on-vega.md) and the 1Password service account.

## Decisions made

Decision numbers refer to the machine-local decisions log named in Current state.

- This thread works only on the Mac Studio; the master thread `state-of-play` owns cross-project priorities and releases.
- Rig keeps one list of Kris's software on a `core` profile that `laptop` and `studio` inherit; it never uninstalls, but warns and offers opt-in removal (Decisions 7, 8, 13, 14).
- Tailscale stays the GUI app as a login item; any `tailscaled` swap is deferred (Decisions 5, 14).
- GitHub on `sol` uses Kris's own key, with SSH agent forwarding for `sol` only (Decisions 15, 17, 29, 34).
- XDG base directories reach every zsh through `.zshenv` (Decision 34).
- Kris restarts `sol` in person, Monday evening 2026-10-12 at the earliest, and is not to be reminded (Decision 35).
- Host names and machine types live in the Project's hosts note (Decision 38).

## Files touched

This checkpoint only. The Project note and its hosts note are current.

## Open questions

- **Needs Kris** (all optional, at your convenience):
  - `RESTART` - Monday evening 2026-10-12 at the earliest: restart `sol`, unlock FileVault at the screen, and confirm Tailscale relaunches and reconnects (`ssh krisbrown@100.90.130.74` from the laptop works). This closes the Project.
  - `DROPBOX` - Dropbox, PTGui Pro, PhotoSweeper, ScanSnap Home and Synology Drive Client are no longer needed on `sol`; remove them by hand if you wish, or leave them for opt-in removal under RIG-CORE-041.
  - `WARP` - `rig apply` on `sol` fails only on Warp, because Homebrew's Warp cask has an upstream checksum mismatch; the installed app is intact and updates itself. Nothing to do unless you want the failure cleared before RIG-CORE-043 lands.

## Next step

Wait for Kris's `RESTART` result. Once Tailscale is proven to reconnect after the FileVault unlock, set the Project's `lifecycle` to done and remove this checkpoint.
