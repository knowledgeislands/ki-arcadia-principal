---
type: ki-checkpoint
thread: rig.mac-studio-bootstrap
label: 'Rig: mac-studio-bootstrap'
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-11T01:55:00Z
---

# rig.mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio, unused for over a month, back to full estate capability so any thread can resume there, and make it a reliably reachable remote agent host ([mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md), Initiative [Rig](../../Streams/Initiatives/rig.md)). The thread is driven remotely over the tailnet from the laptop. The bootstrap is done and every follow-up has been handed on; the only thing left is Kris's restart test.

## Current state

**Mark 2, 2026-10-10 17:37 CEST** (Decision 28 in the run's `decisions.md`). The earlier mark (Decision 21) is superseded.

**Remaining: the restart test.** Kris restarts `sol` in person, Monday evening 2026-10-12 at the earliest, and checks that Tailscale relaunches and reconnects after the FileVault unlock. Kris asked not to be reminded before then (Decision 35). The Project stays open until the restart is proven.

**Ownership.** The Mac Studio is Kris's personal hardware, built and managed by Kris's own Rig and chezmoi (`studio` profile on `core`), not by Techne, and separate from the Techne agent host. Remote agent use is exempt from the Techne Programme Hold under GDR-KI-ARCADIA-004 and [KI-ARCADIA-GOV-033](https://github.com/knowledgeislands/ki-arcadia-principal/blob/60e8a65e5eb56b0496cf917763397339734ade1e/Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md) (done, pruned). Each step on the machine still runs only once Kris approves it.

**Machine.** `sol` on the tailnet (`100.90.130.74`), user `krisbrown`, key-based SSH (plain `ssh sol` fails because `known_hosts` holds the IP). macOS 26.5.2, FileVault on, kept awake by Amphetamine, restarts after power loss. Agent forwarding from the laptop is configured for this host only, so GitHub works from SSH sessions on `sol` (`ssh -A`).

**chezmoi on sol (2026-10-11 02:48 BST).** Source fast-forwarded to `origin/main` (`5722843`) over forwarded SSH and applied, leaving out the four 1Password-backed targets (`~/.claude.json`, Claude Desktop config, `~/.mcporter/mcporter.json`, `~/.codex/config.toml`) because `op` has no account in an SSH session. Applied: `.zshenv`, `.ssh/config` and the Finder new-window setting in `40-macos.toml`. `XDG_STATE_HOME` is now set in `zsh -c` and `zsh -lc`.

**sol `rig doctor` (2026-10-11 02:49 BST, plain `zsh -lc`):** 2 findings. `setting.finder-new-window-target` drifted (new declaration from the pull; clears on the next `rig apply`), and a `tool:warp` apply failure recorded 01:44 UTC in Kris's `rig apply`. `skill.archify` and `skill.caveman` no longer flagged; 153 present.

**Pushes.** chezmoi, tools-rig and Arcadia commits from `sol-final-fixes` reached `origin` through other threads' pushes. This run pushed chezmoi `226cc0c` and `5722843`. Reports are `<name>.report.md` in `~/.local/state/ki/agents/mac-studio-bootstrap/`; `handoff-and-push.report.md` holds the latest pass.

**Where the follow-ups went (Decision 35).**

- [Rig Initiative](../../Streams/Initiatives/rig.md) Notes: [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md) (opt-in removal), [RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md) (profile-filtered Dock items), [RIG-CORE-043](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-043-self-updating-applications.md) (self-updating and other-source apps: Warp, OneDrive, DaisyDisk), [DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) (act on add and remove, then revisit "leave"), and the Later items: NordVPN, six untrusted Homebrew taps, Command Line Tools update, `tailscaled` swap.
- [rig.chezmoi](rig.chezmoi.md) Open questions: [DOTFILES-UE-082](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-082-tolerate-missing-template-tools.md) (new line) and the 1Password service account (line already there).
- chezmoi roadmap: [DOTFILES-UE-084](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-084-render-zshenv-on-vega.md) (triage, agent-host Project) for the Cheztoi `vega` manifest not listing `.zshenv`; chezmoi owns the manifest.
- [DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md) (always run from latest) stays in chezmoi's roadmap.

## Decisions made

- The master thread `state-of-play` owns cross-project priorities and releases; this thread works only on the Mac Studio.
- The Project sits in Rig because the Mac Studio is Kris's workstation.
- Rig model: one list of Kris's software, `core` profile with `laptop` and `studio` inheriting it; Rig never uninstalls but should warn and offer opt-in removal (Decisions 7, 8, 13, 14).
- Tailscale stays the GUI app as a login item; any `tailscaled` swap deferred (Decisions 5, 14).
- GitHub on sol uses Kris's own key, and remote SSH sessions use agent forwarding for sol only (Decisions 15, 17, 29, 34).
- DaisyDisk from the App Store on both Macs; OneDrive on sol deleted by Kris; HNR harness kept on sol (Decisions 33, 34).
- XDG base directories in every zsh through `.zshenv` (Decision 34).
- Push, apply on sol after Kris's `rig apply`, hand the follow-ups on, restart test Monday evening at the earliest with no reminder before then (Decision 35).

## Files touched

This checkpoint, the [Project note](../../Streams/Projects/mac-studio-bootstrap.md), the [Rig Initiative](../../Streams/Initiatives/rig.md) Notes and one Open questions line in [rig.chezmoi](rig.chezmoi.md). chezmoi: DOTFILES-UE-084 and the roadmap ledger. On sol: chezmoi source and applied targets above. Agent prompts, statuses, reports and `decisions.md` are in `~/.local/state/ki/agents/mac-studio-bootstrap/`.

## Open questions

**Kris to do:**

1. **Restart test, Monday evening 2026-10-12 at the earliest:** restart `sol`, unlock FileVault at the screen, and confirm Tailscale relaunches and reconnects (`ssh krisbrown@100.90.130.74` from the laptop works).
2. **On sol, at the screen, with 1Password unlocked:** `chezmoi diff` then `chezmoi apply` for the four 1Password-backed targets, and `rig apply` to clear the Finder setting drift and retry Warp.

**Before closing:** RIG-CORE-041, RIG-CORE-042, RIG-CORE-043, DOTFILES-UE-079 and DOTFILES-UE-082 still name this Project in their `project` field; their owners should repoint them to the Rig Initiative or another Project when it closes.

## Next step

Wait for Kris's restart result. Once Tailscale is proven to reconnect after the unlock, set the Project's `lifecycle` to done and remove this checkpoint.
