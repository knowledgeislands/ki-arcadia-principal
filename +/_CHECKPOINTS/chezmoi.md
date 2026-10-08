---
type: ki-checkpoint
thread: chezmoi
state: active
created_at: 2026-10-08T08:40:00Z
updated_at: 2026-10-08T15:20:00Z
---

# chezmoi

## Objective

Work the open DOTFILES-UE records in the chezmoi source (`~/.local/share/chezmoi`, GitHub `krisb/dotfiles`), keeping the workstation accurate, tidy and observable under the [Rig](../../Streams/Initiatives/rig.md) Initiative. chezmoi does not declare `ki-checkpoint`, so this thread's checkpoint lives in Arcadia.

## Current state

- Rig upkeep, no Project: [DOTFILES-UE-027](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-027-honest-rationales-per-tool.md), [DOTFILES-UE-062](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-062-measure-the-live-apply.md) and [DOTFILES-UE-065](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-065-diagnose-same-boot-mcporter-stall.md) (Hold, Kris-attended or Kris-gated under Decision 19); [DOTFILES-UE-071](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-071-audit-macos-privacy-permissions.md) (triage, Kris-gated) and [DOTFILES-UE-072](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-072-machine-neutral-two-checkout-rule.md) (triage).
- Records owned by other threads: [DOTFILES-UE-073](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-073-cheztoi-host-profile.md) (Next) and [DOTFILES-UE-074](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-074-host-detached-delegation.md) (triage) belong to [agent-host](../../Streams/Projects/agent-host/agent-host.md) and the `techne` thread; [DOTFILES-UE-035](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-035-install-whatsapp-spool-refresh.md) (Hold) belongs to [knowledge-acquisition](knowledge-acquisition.md).
- `retire-bg` (gov-020) finished: `claude-bg` is retired and survives only in `.chezmoiremove` and DOTFILES-UE-074 prose. A background agent pushed this thread's earlier commits with its own fixes; the chezmoi audit and tests pass.
- `~/.config/ki/config.toml` now verifies against source, so that drift is closed.
- The source is two commits ahead of `origin/main` (DOTFILES-UE-075, Sol Tailscale daemon exception, from the agent-host side) and carries an uncommitted CodexBar CLI change in `private_10-applications.toml`. Neither belongs to this thread.
- Target drift: `~/.ssh/known_hosts` holds three Sol (`100.90.130.74`) host keys absent from source; a blind `chezmoi apply` would drop them.

## Decisions made

- The master thread `state-of-play` owns cross-project priorities, releases and decisions; this thread works only the records above.
- Edit the source, never the target; `chezmoi apply` is allowed where needed (Decision 17), after reviewing `chezmoi diff`.

## Files touched

None in this thread.

## Open questions

- Who owns the CodexBar CLI change and the two unpushed DOTFILES-UE-075 commits?
- Should the Sol host keys be adopted into the `known_hosts` source?
- The Hold and Kris-gated records still wait on Kris through `state-of-play`.

## Next step

Plan DOTFILES-UE-072 through `ki-plan` (the one record not gated on Kris), once Kris settles the ownership of the unpushed and uncommitted changes and the known_hosts drift.
