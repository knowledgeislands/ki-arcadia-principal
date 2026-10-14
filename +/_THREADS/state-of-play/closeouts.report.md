# closeouts - report

## Done

- **ESTATE-030:** dropped the KI-ARCADIA-GOV-030 disposition step from the estate-factorisation checkpoint's `Next step`. Its Current state also now matches reality: KI-HARNESS-GOV-141 is done and pruned, and helper `estate` has finished.
- **CLOSEOUT:** added a `### Close-out assessment` to `Streams/Projects/estate-factorisation.md`. It covers what was delivered (the MCP safety contract, automatic `ki` pin bumps, and the release App and release cascade notes) and says no phase gate is met. FND-3 to EVAL-2, including FND-5 and OAI-1 (retiring `mcp-housekeeping-codex`), remain untracked ideas. `lifecycle` stays `active` until Kris decides whether to close it.
- **CLOSEOUT:** added a one-line close-out assessment to `Streams/Projects/specifications.md`: paused, no open records, nothing delivered, Outcome stands.
- **CLOSEOUT:** the estate-factorisation checkpoint now reflects the close-out. It says the checkpoint is ready to remove if Kris closes the Project.
- **GOV-168-NOTE:** added the dated parked item under `## Open questions` in the baseline-rollout checkpoint, linking KI-HARNESS-GOV-168 by absolute local path.
- Commits `684e9f0` (Project notes) and `ddf217b` (checkpoints) were pushed fast-forward to `origin/main`. The primary checkout was clean and not ahead, so it was fast-forwarded. The worktree is removed.
- Audits:
  - ki-repo-kb-streams: before, FAIL=0 WARN=3; after, FAIL=0 WARN=1. The STREAM-10 warnings for estate-factorisation and specifications are cleared. The remaining warning is secrets-hygiene, which was out of scope.
  - ki-checkpoint: FAIL=3 both before and after, all in `rig.chezmoi.md` (RECORD-2 headings and empty sections). These were already there and are out of scope.

## Failed

- None.

## Needs Kris

- The estate-factorisation close decision: either capture FND-5 in its owning repository and keep the Project active, or complete or cancel the Project and leave the phases as ideas. If the Project closes, the checkpoint is ready to remove.
- `rig.chezmoi.md` fails the checkpoint audit (RECORD-2). It is owned by the rig.chezmoi thread.
- secrets-hygiene also has no open records and needs its own STREAM-10 close-out assessment.
