---
type: ki-checkpoint
thread: chezmoi
state: active
created_at: 2026-10-08T08:40:00Z
updated_at: 2026-10-08T08:40:00Z
---

# chezmoi

## Objective

Work the open DOTFILES-UE records in the chezmoi source (`~/.local/share/chezmoi`, GitHub `krisb/dotfiles`), keeping the workstation accurate, tidy and observable under the [Rig](../../Streams/Initiatives/rig.md) Initiative. chezmoi does not declare `ki-checkpoint`, so this thread's checkpoint lives in Arcadia.

## Current state

- Rig upkeep, no Project: [DOTFILES-UE-027](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-027-honest-rationales-per-tool.md), [DOTFILES-UE-062](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-062-measure-the-live-apply.md) and [DOTFILES-UE-065](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-065-diagnose-same-boot-mcporter-stall.md) (Hold, Kris-attended or Kris-gated under Decision 19); [DOTFILES-UE-071](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-071-audit-macos-privacy-permissions.md) (triage, Kris-gated) and [DOTFILES-UE-072](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-072-machine-neutral-two-checkout-rule.md) (triage).
- Records owned by other threads: [DOTFILES-UE-073](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-073-cheztoi-host-profile.md) (Next) and [DOTFILES-UE-074](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-074-host-detached-delegation.md) (triage) belong to [agent-host](../../Streams/Projects/agent-host/agent-host.md) and the `techne` thread; [DOTFILES-UE-035](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-035-install-whatsapp-spool-refresh.md) (Hold) belongs to [knowledge-acquisition](knowledge-acquisition.md).
- Helper `retire-bg` (gov-020) is queued to remove the interim `claude-bg` launcher from the chezmoi source (Decision 18); it has not started. Check `ki agent status gov-020`.
- The chezmoi source was clean and level with `origin/main` at this snapshot.

## Decisions made

- The master thread `state-of-play` owns cross-project priorities, releases and decisions; this thread works only the records above.
- Edit the source, never the target; `chezmoi apply` is allowed where needed (Decision 17), after reviewing `chezmoi diff`.

## Files touched

None yet in this thread. Helper prompt in `~/.local/state/ki/agents/gov-020/retire-bg.queued.md`.

## Open questions

None for this thread; the Hold and Kris-gated records wait on Kris through `state-of-play`.

## Next step

Plan DOTFILES-UE-072 through `ki-plan` (the one record not gated on Kris) and verify `retire-bg` once it reports DONE.
