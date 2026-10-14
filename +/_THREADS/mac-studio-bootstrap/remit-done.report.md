# remit-done - owner report

## What has been done

- **HANDED-OVER-DONE** - [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) now has rule 6 and a "DONE on handover, decided 2026-10-14" section. Once the handover has pushed, the thread instance left on the old host closes with a DONE frame. That frame has no resume line and points to the host that took over. The section quotes Kris ("we do sometimes need done, not just rest and busy") and notes that `ki-pmo`'s DONE frame today appears only at Project close (checked in `standards-pmo.md`), so this extends it. The commit is `09a56961` in ki-agentic-harness, which is now 3 ahead and not pushed. The pre-commit hook passed.
- **Remit** - the [mac-studio-bootstrap Project note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) has a new `## Remit` section. It quotes Kris ("I want to add to this projects remit that it needs to look at the rig differences") and gives one line each for RIG-DIFF, SOL-SCOPE and LOCAL-MODE-CHECK, worded from the SOL-FOLD decision. Only that file was committed, as `e060554` in ki-principal, which is now 1 ahead and not pushed.

## What is in progress

Nothing.

## Outstanding queries

- **Needs PULL-SKIPPED:** the brief asked for `pull --rebase` before committing in ki-principal, but the run rules forbid any remote call. I did not pull. The local checkout was level with its upstream ref and had no other staged changes, so the commit is on top of local `main`. The next push from `sol` should pull and rebase first. Recommended: accept.
- **Needs DECISIONS-LOG-LINE:** the Project note's Notes still say the decisions log lives on the laptop. The live copy is now on `sol`. This was out of scope, so I left it. Recommended: correct it in the next note edit.
- **Needs UNTRACKED-REPORTS:** `+/_THREADS/mac-studio-bootstrap/chezmoi-fix.report.md` and `tool-records.report.md` are untracked in ki-principal and belong to other runs. I left them untouched. This report is also copied there as `remit-done.report.md`, also untracked. Recommended: the coordinator commits the thread folder.

```text
PULL-SKIPPED: accept
DECISIONS-LOG-LINE: fix in next note edit
UNTRACKED-REPORTS: coordinator commits thread folder
```
