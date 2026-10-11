---
type: ki-checkpoint
thread: rig.mac-studio-bootstrap
label: 'Rig: mac-studio-bootstrap'
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-11T02:52:00Z
---

# rig.mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio, unused for over a month, back to full estate capability so any thread can resume there, and make it a reliably reachable remote agent host ([mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md), Initiative [Rig](../../Streams/Initiatives/rig.md)). The thread is driven remotely over the tailnet from the laptop. The bootstrap is done and every follow-up has been handed on; the only thing left is Kris's restart test.

## Current state

Mark: 2026-10-10T15:37Z, decisions log at Decision 28

ki-delegation read at cfa9c458

**Remaining: the restart test.** Kris restarts `sol` in person, Monday evening 2026-10-12 at the earliest, and checks that Tailscale relaunches and reconnects after the FileVault unlock. Kris asked not to be reminded (Decision 35). The Project stays open until the restart is proven.

**Ownership.** The Mac Studio is Kris's personal hardware, built and managed by Kris's own Rig and chezmoi (`studio` profile on `core`), not by Techne, and separate from the Techne agent host. Remote agent use is exempt from the Techne Programme Hold under GDR-KI-ARCADIA-004 and KI-ARCADIA-GOV-033 (done, pruned). Each step on the machine still runs only once Kris approves it.

**Machine.** `sol` on the tailnet (`100.90.130.74`), user `krisbrown`, key-based SSH (plain `ssh sol` fails because `known_hosts` holds the IP). macOS 26.5.2, FileVault on, kept awake by Amphetamine, restarts after power loss. Agent forwarding from the laptop is configured for this host only, so GitHub works from SSH sessions on `sol` (`ssh -A`). chezmoi is applied on `sol` apart from four 1Password-backed targets (`~/.claude.json`, the Claude Desktop config, `~/.mcporter/mcporter.json` and `~/.codex/config.toml`), which render only at its screen.

**Hosts.** The Project's [hosts note](../../Streams/Projects/mac-studio-bootstrap/design/hosts.md) names `vega` (agent-host, Ubuntu), `sol` (studio, macOS) and `terra` (laptop, macOS); the Rig profiles and the Cheztoi host profile take their names from it. Omarchy for `vega` belongs to the agent-host Project.

**sol `rig apply`.** It now fails only on Warp: Homebrew's Warp cask has a checksum mismatch upstream, while the installed app is intact and updates itself. The Rig Initiative's self-updating-apps item, [RIG-CORE-043](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-043-self-updating-applications.md), covers it.

**Handed to [rig.chezmoi](rig.chezmoi.md).** Kris handed that thread the `op_cache` race, the copy-key script that runs on every apply, [DOTFILES-UE-082](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-082-tolerate-missing-template-tools.md), [DOTFILES-UE-084](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-084-render-zshenv-on-vega.md) and the 1Password service account.

**Handed to the [Rig Initiative](../../Streams/Initiatives/rig.md).** [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md) (opt-in removal), [RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md) (profile-filtered Dock items), RIG-CORE-043 and [DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) (undeclared software decisions) now name the Initiative rather than this Project, with the Later items: NordVPN, six untrusted Homebrew taps, a Command Line Tools update and a `tailscaled` swap. [DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md) (always run from latest) stays in chezmoi's roadmap.

## Decisions made

- The master thread `state-of-play` owns cross-project priorities and releases; this thread works only on the Mac Studio.
- The Project sits in Rig because the Mac Studio is Kris's workstation.
- Rig model: one list of Kris's software, `core` profile with `laptop` and `studio` inheriting it; Rig never uninstalls but should warn and offer opt-in removal (Decisions 7, 8, 13, 14).
- Tailscale stays the GUI app as a login item; any `tailscaled` swap is deferred (Decisions 5, 14).
- GitHub on sol uses Kris's own key, and remote SSH sessions use agent forwarding for sol only (Decisions 15, 17, 29, 34).
- DaisyDisk from the App Store on both Macs; OneDrive on sol deleted by Kris; HNR harness kept on sol (Decisions 33, 34).
- XDG base directories in every zsh through `.zshenv` (Decision 34).
- Follow-ups handed on, restart test Monday evening at the earliest with no reminder (Decision 35).
- Host names and machine types recorded in the Project's hosts note; the mark uses the one-line form (Decision 38).

## Files touched

This checkpoint, the [Project note](../../Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) (now a folder note) and its [hosts note](../../Streams/Projects/mac-studio-bootstrap/design/hosts.md), the [Rig Initiative](../../Streams/Initiatives/rig.md) Notes and one Open questions line in [rig.chezmoi](rig.chezmoi.md). Agent prompts, statuses, reports and `decisions.md` are in `~/.local/state/ki/agents/mac-studio-bootstrap/`.

## Open questions

- **Kris to do, Monday evening 2026-10-12 at the earliest:** restart `sol`, unlock FileVault at the screen, and confirm Tailscale relaunches and reconnects (`ssh krisbrown@100.90.130.74` from the laptop works).

## Next step

Wait for Kris's restart result. Once Tailscale is proven to reconnect after the unlock, set the Project's `lifecycle` to done and remove this checkpoint.
