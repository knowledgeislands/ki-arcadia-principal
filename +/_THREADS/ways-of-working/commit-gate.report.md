# commit-gate - ways-of-working - owner report

Thread [Knowledge Islands Model: ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md), Project [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md). Window: this run, 17:50 to 17:57 BST on 2026-10-14. State: blocked on another thread's committed file; nothing left to run.

## What has been done

**What broke the gate.** Not a harness regression. The pre-commit hook in `.githooks/pre-commit` runs lint-staged, syncpack and then only `ki repo audit --repo . --skill ki-repo-kb`, which audits the whole working tree for the knowledge-base skill and its three overlays, not just the staged files. That focused audit has exactly one failure: criterion STREAM-9 of `ki-repo-kb-streams` on the Project note [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md), which now lists three work-record identifiers in its two new "Rig note" bullets. Registry notes may not list records; records name their Project instead. That note was changed by commit `9b852d8` (17:38 BST, "docs(projects): note Rig shared-failure reporting and PATH shadowing for mac-studio-bootstrap"), made on `sol` by the mac-studio-bootstrap thread, pushed, and pulled into this checkout as a fast-forward at 17:50 BST, the minute your commit failed. The STREAM-9 criterion has been unchanged in the harness since 8 October. Because the failing content is already committed, every commit in this checkout is blocked until that note is conformed, whatever is staged.

- The `ki-checkpoint` and `ki-authoring` failures you saw come from the full `ki repo audit`, which the hook does not run. They do not block commits. Harness commit `8f23d27c` (15:07 BST, "feat(ki-pmo): make the thread model and the issued banner normative", under [KI-HARNESS-GOV-187](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-187-thread-model-and-banner.md)) reworded the canonical checkpoint README from "Project's thread" and "master thread" to "coordination thread" and "state-of-play thread"; that is the whole STRUCTURE-1 drift. It did not change the RECORD-2 heading schema. [KI-HARNESS-GOV-190](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-190-stacked-reply-block.md) touched only `ki-delegation` prose.
- Fixed, in the working tree only: `+/_CHECKPOINTS/README.md` now matches the harness HEAD orientation (one line), and STRUCTURE-1 passes. The `ki repo conform --skill ki-checkpoint` real run is withheld by the tool while other threads' RECORD-2 failures stand, so the one proposed write was applied by copying the canonical file. A double space in this thread's `decisions.md` (line 357) that `rumdl` flagged is fixed; the thread folder is now lint-clean.
- Not committed: the hook cannot pass in this checkout, so the README fix, `decisions.md`, `cli127-widen.report.md` and this report sit uncommitted and unstaged under this thread's paths. No `--no-verify`, no push, no edits outside this thread's files. Other threads' staged files were left as they were.
- The checkpoint [knowledge-islands-model.ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md) passes the audit, so under the task rule "Do not edit any checkpoint" it was not opened. The two [KI-HARNESS-GOV-181](https://github.com/knowledgeislands/ki-agentic-harness/blob/34e2ed2e6b08f4b7690234b66343529473b5340d/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md) links at its lines 35, 67 and 77 still point at the pruned file; the revision link in this sentence is the one to paste in, as the thread's own reports already do.

**Failing files by owning thread** (full audit, none hook-blocking except the first):

- Rig: mac-studio-bootstrap. Project note [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) lists three record identifiers (STREAM-9, blocks the gate). Checkpoint [rig.mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.mac-studio-bootstrap.md) carries extra H2 sections "Thread working rules" and "Resuming on sol" (RECORD-2) and a "Handed on" passage the audit reads as session continuity (BOUNDARY-1).
- Platform Foundations: estate-factorisation. Checkpoint [platform-foundations.estate-factorisation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/platform-foundations.estate-factorisation.md) has H3 subsections "Thread working rules" and "From the master thread" under Current state (RECORD-2).
- Techne: agent-host. Checkpoint [techne.agent-host](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/techne.agent-host.md) has an extra H2 "Thread working rules" (RECORD-2).
- Observatory: product. Checkpoint [knowledge-islands-model.observatory](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.observatory.md) has `state: resting`; a record at the checkpoint location must be active (LIFECYCLE-1).
- Knowledge Islands Model: knowledge-acquisition. Its staged report `+/_THREADS/knowledge-acquisition/route-local-review.report.md` has no H1 on line 1 (MD041), the only `ki-authoring` MD-mech failure. lint-staged will auto-fix it when that thread commits.
- Master (`_state-of-play.md`): no failures.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- This thread's four working-tree files wait for the gate to pass, then commit by explicit path through a private index and push fast-forward, under Kris's rule of 2026-10-14: 'threads need to know that they need to commit their work under +/_THREAD/'.
- The `ki-pmo` audit raises 309 PMO-7 warnings across old thread reports in `+/_THREADS/ways-of-working/` (unlinked or pruned-record links). Warnings only; a separate tidy if wanted.

## Outstanding queries

### GATE-FIX - ask the mac-studio-bootstrap thread to conform its Project note

**Summary.** The gate is blocked for every thread in this checkout by the committed Project note [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md). The smallest fix is to reword its two "Rig note" bullets so they name no record identifiers, leaving the records to name the Project, then commit and push from `sol`. The same thread owns the RECORD-2 and BOUNDARY-1 findings on its checkpoint, which do not block but will stop `ki repo conform --skill ki-checkpoint` for everyone.

**Need from you.** Pass the fix to the mac-studio-bootstrap thread, or authorise this thread to make the one-note change itself.

**Recommendation.** Pass it to the owning thread; it is on `sol` and the note is its registry entry.

### GOV181-RELINK - relink KI-HARNESS-GOV-181 in this thread's checkpoint

**Summary.** The checkpoint does not fail, so it was left untouched under the task's no-checkpoint-edits rule. Three links still point at the pruned record file.

**Need from you.** Confirm the coordinating thread applies the revision link at its next mark.

**Recommendation.** Apply at the next mark, then commit the thread folder with the gate-blocked files once the gate passes.

```text
GATE-FIX

Pass to Rig: mac-studio-bootstrap: reword the two "Rig note" bullets in Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md so they name no record identifiers, conform rig.mac-studio-bootstrap.md to the six-section schema with no continuity wording, commit and push from sol; then this thread commits its four waiting files.

---

GOV181-RELINK

Apply the 34e2ed2e revision link for KI-HARNESS-GOV-181 in knowledge-islands-model.ways-of-working.md at the next mark.
```
