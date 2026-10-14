# pmo-adopt2: rig.chezmoi onto ki-pmo, mark struck

## What has been done

- **Worktree and branch:** [/Users/krisbrown/workspaces/knowledge-islands/ki-principal-chezmoi-pmo-adopt](/Users/krisbrown/workspaces/knowledge-islands/ki-principal-chezmoi-pmo-adopt) on local branch `chezmoi-pmo-adopt`, cut from the local `origin/main` ref (`0f38965`) with no fetch. One commit, `c08ef12` `docs(checkpoint): bring rig.chezmoi onto ki-pmo and strike Kris's mark`, 35 files. Not pushed; worktree and branch left in place for the coordinator. The primary checkout and its other thread's uncommitted files were not touched.
- **Thread folder** [+/_THREADS/chezmoi/](/Users/krisbrown/workspaces/knowledge-islands/ki-principal-chezmoi-pmo-adopt/+/_THREADS/chezmoi/):
  - [decisions.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal-chezmoi-pmo-adopt/+/_THREADS/chezmoi/decisions.md) holds the full log, Decisions 1 to 68, followed by Kris's resume-and-mark instruction of 2026-10-14 10:56Z renumbered as Decision 69.
  - All 33 `*.report.md` files from the state folder are copied.
  - Secret scan: no token, key, password or recovery-phrase values found. The reports name items and carry `op://` references with vault and item IDs, which are references, not secret values.
  - Formatting only, wording unchanged (checked word for word against the originals): Decisions 35 to 45 were one-line headings in the source log and are reshaped into the log's usual heading-and-bullet form; `rumdl fmt` joined wrapped lines in the log and in `ue-079-declare.report.md`; `vault-design-2.report.md` gets a `rumdl-disable-line MD038` comment, because its code span keeps a trailing space on purpose to show a defect in an item title.
- **Checkpoint** [rig.chezmoi.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal-chezmoi-pmo-adopt/+/_CHECKPOINTS/rig.chezmoi.md):
  - `Mark: 2026-10-14T10:56Z`, `Thread folder: +/_THREADS/chezmoi/`, and `ki-pmo read at f5da817b` in place of the old `ki-delegation` line.
  - Every "Decision N" citation is replaced by the decision itself and its date, worded from the log. The Decisions made section now points to the tracked log.
  - The Thread working rules block is rewritten for ki-pmo: the three rules with Kris's 2026-10-13 words, the five-call turn budget, the banner and the three report forms, decisions logged in the turn they arrive, and no decision numbers. The quiet level and standing rules are kept.
  - GATE-PUSH is resolved and recorded under Current state: chezmoi `origin/main` (local ref) holds all three gate-fix commits. The GATE-PUSH query, the Gate baseline open item and the push step in Next step are removed. All other open items are kept: B-START, RIG-DECLARE, PUBLIC-VIEW, RIG-CASKS, PAPERCLIP-DRIFT, the SVG handler, the mac-studio-bootstrap handoff and the catalogue-tool proposal.
  - `updated_at: 2026-10-14T11:00:00Z`.
- **Limitation:** the old checkpoint cited "Decision 25" for the mac-studio-bootstrap service-account handoff, but this thread's Decision 25 is about the vault-plan answers. The number probably came from another thread's log. The citation is removed and not replaced, rather than guessed.

### Check results

- `rumdl check` on the checkpoint and thread folder: no issues in 35 files.
- `ki repo audit --skill ki-checkpoint`: no findings for `rig.chezmoi.md`. Five failures belong to other threads' checkpoints: RECORD-2 in [platform-foundations.estate-factorisation.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal-chezmoi-pmo-adopt/+/_CHECKPOINTS/platform-foundations.estate-factorisation.md), [rig.mac-studio-bootstrap.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal-chezmoi-pmo-adopt/+/_CHECKPOINTS/rig.mac-studio-bootstrap.md) and [techne.agent-host.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal-chezmoi-pmo-adopt/+/_CHECKPOINTS/techne.agent-host.md); LIFECYCLE-1 in [knowledge-islands-model.observatory.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal-chezmoi-pmo-adopt/+/_CHECKPOINTS/knowledge-islands-model.observatory.md); BOUNDARY-1 in [knowledge-islands-model.ways-of-working.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal-chezmoi-pmo-adopt/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md).
- `ki repo audit --skill ki-pmo`: no failures, four warnings. One is ours: PMO-2, the Project `chezmoi` is not in the Capital's `Streams/Projects/` registry (it was like this before this change). The others: two PMO-2 warnings for the observatory checkpoint, and PMO-3, nine active Project threads against a cap of four.
- Commit gate (lint-staged rumdl and the KB audits): passed. The worktree had no `node_modules`, so I cloned the primary checkout's ignored `node_modules` into it rather than run `bun install`, which could reach the network. The gate was not bypassed.

## What is in progress

Nothing running.

Outstanding - no action requested now:

- The coordinator still has to push `chezmoi-pmo-adopt` and then remove the worktree. The worktree has an ignored `node_modules` clone that goes with it.
- The primary checkout's untracked [+/_THREADS/chezmoi/decisions.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/chezmoi/decisions.md), which has the one entry numbered Decision 1, and this report are still uncommitted there. When the branch lands, the untracked log will clash with the tracked one, so the coordinator should remove it before pulling. From then on, `ki agent decide` should continue from Decision 70.
- The state folder's `decisions.md` still has the old one-line form for Decisions 35 to 45. Only the tracked copy was reshaped.

## Outstanding queries

### PROJECT-REG - register chezmoi as a Project or rename the checkpoint

- **Summary:** The ki-pmo audit warns that the checkpoint name `rig.chezmoi` points to a Project `chezmoi` that has no note in the Capital's `Streams/Projects/` registry. This warning was already there before this change. It does not block anything, but threads resolve by Project name, and the audit will keep warning until this is fixed.
- **Need from you:** choose between adding a `chezmoi` Project note under the [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) Initiative and leaving the warning in place.
- **Recommendation:** have state-of-play add the Project note under Rig, because the registry is the master thread's to change, and this would be a registry entry for existing work, not a new feature record.

```text
PROJECT-REG - <register a chezmoi Project under Rig via state-of-play / leave the warning>
```
