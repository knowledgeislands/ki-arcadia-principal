---
type: ki-checkpoint
thread: chezmoi
state: active
created_at: 2026-10-08T08:40:00Z
updated_at: 2026-10-08T19:30:00Z
---

# chezmoi

## Objective

Work the open DOTFILES-UE records in the chezmoi source (`~/.local/share/chezmoi`, GitHub `krisb/dotfiles`), keeping the workstation accurate, tidy and observable under the [Rig](../../Streams/Initiatives/rig.md) Initiative. chezmoi does not declare `ki-checkpoint`, so this thread's checkpoint lives in Arcadia.

## Current state

- Rig upkeep, no Project: [DOTFILES-UE-027](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-027-honest-rationales-per-tool.md), [DOTFILES-UE-062](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-062-measure-the-live-apply.md) and [DOTFILES-UE-065](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-065-diagnose-same-boot-mcporter-stall.md) (Hold, Kris-attended or Kris-gated under Decision 19); [DOTFILES-UE-071](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-071-audit-macos-privacy-permissions.md) (triage, Kris-gated) and [DOTFILES-UE-072](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-072-machine-neutral-two-checkout-rule.md) (triage).
- Records owned by other threads: [DOTFILES-UE-073](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-073-cheztoi-host-profile.md) (Next) and [DOTFILES-UE-074](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-074-host-detached-delegation.md) (triage) belong to [agent-host](../../Streams/Projects/agent-host/agent-host.md) and the `techne` thread; [DOTFILES-UE-035](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-035-install-whatsapp-spool-refresh.md) (Hold) belongs to [knowledge-acquisition](knowledge-acquisition.md).
- `retire-bg` (gov-020) finished: `claude-bg` is retired and survives only in `.chezmoiremove` and DOTFILES-UE-074 prose. A background agent pushed this thread's earlier commits with its own fixes; the chezmoi audit and tests pass.
- `~/.config/ki/config.toml` now verifies against source, so that drift is closed.
- The chezmoi source is clean and four commits ahead of `origin/main` (DOTFILES-UE-075 capture, Sol host keys, CodexBar CLI ownership); audit, tests and `rig doctor` pass. Pushing waits on Kris.
- DOTFILES-UE-072 is held until TECHNE-TOOLS-OPS-014 ships, then likely cancelled (Decision 5).
- The three Sol (`100.90.130.74`) host keys are adopted into the `known_hosts` source (Kris, 2026-10-08), committed locally and not pushed.

## Decisions made

- The master thread `state-of-play` owns cross-project priorities, releases and decisions; this thread works only the records above.
- Edit the source, never the target; `chezmoi apply` is allowed where needed (Decision 17), after reviewing `chezmoi diff`.

## Files touched

- `private_dot_ssh/private_known_hosts` in the chezmoi source.

## Open questions

- Push the four local commits?
- The Hold and Kris-gated records still wait on Kris through `state-of-play`.

## Next step

Push once Kris approves; then the thread is idle until Kris picks a gated record (DOTFILES-UE-071, 027, 062 or 065).
