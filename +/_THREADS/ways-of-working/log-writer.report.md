# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › log-writer

**Run report at 22:33 BST · last mark 21:19 BST**

---

## Done

- Before starting I checked for leftovers from the run that hit the usage limit. There were none: `tools-ki` and the harness had no partial commits, reservations or changes from it. `gate-release` and `pmo-simplify` had both finished.
- LOG-WRITER, your words: "make the launcher the only writer of the thread folder's log and report files, and delete the "until then" sentence from the standard".
  - `tools-ki`: since 0.10.3, `ki agent decide` has written to the tracked log and agents have written their reports into the thread folder. One gap was left: runs from before 0.10.3 that still kept a log or reports in their state folder. Now `ki agent decide` and `ki agent close` move those files into `+/_THREADS/<run>/` themselves, unless the thread folder already has a copy. That way the old log keeps its numbering, and `close --delete` can no longer lose a report that only existed in the state folder. `close` now reads only the tracked log. The manual, command inventory, background-agents guide and changelog are updated. Commits `acd0c23` (reserving the record number) and `0fcc593`, pushed. It is not released.
  - Harness: I deleted the "until then" sentence from the `ki-delegation` background-run standard. I also removed the outdated phrase "as they report into one state folder today" and replaced both with a sentence that quotes your decision. No other copy of that text was left after `pmo-simplify`. Commit `10fcb348`, pushed.
- RECORD-THRESHOLD, your words: "a record only for a product or standard change needing acceptance; operational work runs on the decisions log, brief and report". The `tools-ki` change is a product change, so it has the record [KI-TOOL-KI-CLI-132](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-132-launcher-only-thread-writer.md), now awaiting review. The harness edit is the exact deletion you decided, so it has no record.
- Checks:
  - `tools-ki`: `bun run test:coverage` passed (1185 tests, 100%). `tsc`, Biome (warnings that were already there), knip, `mandoc -T lint` and the `ki-work-roadmap` audit pass.
  - Harness: `bun run test` passed (1176 tests) and `bunx tsc --noEmit` is clean. `ki repo audit --skill ki-delegation --skill ki-pmo` passes.

## In Progress

Nothing of mine is running. `diagrams-tidy` is waiting for this run to finish.

- **The change is already live on this machine.** `~/.local/bin/ki` runs `tools-ki/src/main.ts` straight from the checkout. So at 22:21 BST the thread's `ki agent decide ways-of-working` (Decision 133, COMMIT-WORK) used my change before it was committed. That call moved 55 reports from before 0.10.3 out of the state folder into `ki-principal/+/_THREADS/ways-of-working/`, where they are now untracked. Nothing was lost. The old state-folder `decisions.md` was correctly left in place, because the tracked log already existed. **Those 55 reports now exist only as untracked files**, so they need committing (see COMMIT-MOVED).
- I left these untouched, because other sessions own them:
  - In `ki-principal`, the thread's `decisions.md` change and the 55 moved reports.
  - `+/diagrams/`, untracked in the harness.
- The brief asked for a `Claude Fable 5.1` trailer. This run is Claude Opus 5.5, so my commits name that model, following the rule that the trailer names the model making the commit.
- The harness push went on top of another thread's commit `17747064`, which was already on the remote. Only my own commits were pushed.

## Queries

### COMMIT-MOVED - Commit the 55 reports the launcher moved into the thread folder?

**Context:** Your 22:21 BST decide call moved 55 old agent reports out of the state folder and into `ki-principal/+/_THREADS/ways-of-working/`. They are now untracked, and their state-folder copies are gone. If anything cleans untracked files before they are committed, they are lost. Your COMMIT-WORK decision says "it's absolutely imperative that you commit your work". Under `ki-pmo`'s tidying rule, the thread deletes reports once their queries are answered and their outcome is homed.

**Query:** How should the thread secure them?

**Options:** a) (recommended) The thread commits the 55 reports by explicit path now, with its Decision 133 change, then deletes the answered and homed ones at the next mark under the tidying rule. b) The thread reads them first, commits only those still open, and moves the rest back to the state folder to be archived when the run closes.

### KI-RELEASE - Release tools-ki with KI-TOOL-KI-CLI-132?

**Context:** The change is pushed but not released. It is live on this machine only because the local `ki` runs from the checkout. Other hosts and CI use the released 0.10.4. [KI-TOOL-KI-CLI-132](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-132-launcher-only-thread-writer.md) is awaiting your review. The harness sentence I deleted now describes the launcher as the only writer.

**Query:** Should the follow-up release go ahead?

**Options:** a) (recommended) Review and accept KI-TOOL-KI-CLI-132 through `ki-accept`, then launch a release run that cuts the next `tools-ki` patch release and bumps the Harness pin and `.github/ki-version` where they apply. b) Hold the release until it can go out with [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md), which is ready and is also needed by `ki-principal` CI.

```text
COMMIT-MOVED

Commit the 55 moved reports in ki-principal +/_THREADS/ways-of-working by explicit path now, with the Decision 133 change, then delete answered and homed ones at the next mark under the tidying rule.

KI-RELEASE

Review and accept KI-TOOL-KI-CLI-132 through ki-accept, then launch a release run that cuts the next tools-ki patch release and bumps the Harness pin and .github/ki-version where they apply.
```

```text
╭─ run report · 2026-10-14T21:33:22Z ──────────────╮
│                                                  │
│  █▀▀▄ █  █ █▀▀▀ █  █   · thread busy             │
│  █▀▀▄ █  █ ▀▀▀█  ▀█▀   · running or queued work  │
│  █▄▄▀ █▄▄█ ▄▄▄█   █    · lines below say which   │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [waiting] diagrams-tidy - held until log-writer finishes
- [waiting] COMMIT-MOVED, KI-RELEASE
- [committed] tools-ki and ki-agentic-harness, pushed
- [uncommitted] thread folder: 55 moved reports and the Decision 133 entry
