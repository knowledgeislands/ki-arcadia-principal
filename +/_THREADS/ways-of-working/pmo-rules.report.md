# pmo-rules · Summary at 19:02 BST

Project [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) · Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) · since the run began · resting

## Done

- [KI-HARNESS-GOV-188 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/0a116e4b99e26f92c9a308c1f0ab4417073d730f/docs/roadmap/KI-HARNESS-GOV-188-report-record-links.md) accepted as done on its review packet under `ki-accept`, quoting Kris's "GOV-188-REVIEW / accept KI-HARNESS-GOV-188 as done on its review packet" and "LINK-LEVEL / keep the link check at warning; raise it to failure once this thread's reports are repaired". PMO-7 stays WARN; the record's Discussion says a later run raises it to FAIL once the ways-of-working reports are repaired. Commit `d49ad6e1`.
- Verify re-run before acceptance: `bun run test` 1151 pass, 0 fail; `bunx tsc --noEmit` clean; `ki repo audit --skill` for `ki-pmo`, `ki-work-roadmap` and `ki-authoring` pass; `ki repo audit --skill ki-pmo` against Knowledge Islands Principal reports `ki-pmo` at WARN with no failure, PMO-7 flagging 318 unlinked or dead record links across the thread reports as intended.
- HEADING-FORM applied, quoting Kris's "HEADING-FORM / adopt: heading "<label> · <form> at <local time>", then a plain line "Project <linked name> · Initiative <linked name> · <window> · <state>"". The rule lives in `ki-delegation`'s Reporting section with an example; the `ki-pmo` standard (practices, heading levels, report forms, full summary, recap, re-bootstrap), the `ki-pmo` skill's three entry points, the `ki-coordinator` output style, the hook line with its test and the banner test, the four authority footers, the run-prompt skeleton, and the PMO-6 and RUN-4 rubric items with both rubrics regenerated all state it. Every surface says a report written before 2026-10-14 keeps its earlier heading. The recap bullet's stale `What is in progress` and `Outstanding queries` names were corrected to `In Progress` and `Queries` in passing. The hook README does not describe the heading, so it is unchanged. Commit `0a116e4b`.
- RECORD-THRESHOLD applied beside the decision classes in the `ki-pmo` standard, quoting Kris's "RECORD-THRESHOLD / agree: a record only for a product or standard change needing acceptance; operational work runs on the decisions log, brief and report; add it to the ki-pmo standard". `ki-work-roadmap`'s graduation test now defers to it for whether a record is due; its sources note the alignment. Same commit `0a116e4b`.
- Gates after the edits: `bun run test` 1151 pass, 0 fail; `bunx tsc --noEmit` clean; hook and banner tests 21 pass; `ki repo audit --skill` for `ki-pmo`, `ki-delegation`, `ki-skills`, `ki-work-roadmap`, `ki-authoring`, `ki-repo-harness` and `ki-diagrams` with no failure. The only warnings are the pre-existing ones: two `ki-skills` sources past refresh cadence and the `ki-diagrams` DIAG-4 freshness warnings on the skill map and skill graph, which I took as the skill-graph check.
- Pruned the one done record with `ki repo roadmap prune`, commit `6d27d6a7`. That commit carries the standardised prune message `ki-accept` fixes, so it has no co-author trailer.
- Pushed: `git log origin/main..HEAD` listed only my three commits; `git pull --rebase` was clean and the push was fast-forward to `origin/main` at `6d27d6a7`.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- Raising PMO-7 to FAIL waits on the ways-of-working thread repairing its reports; that is a later run, as the LINK-LEVEL decision sets.
- Fleet finding: the Capital audit shows five `ki-checkpoint` failures on other threads' checkpoints (`platform-foundations.estate-factorisation`, `rig.mac-studio-bootstrap`, `techne.agent-host`, `knowledge-islands-model.observatory`). They are outside this run's scope and untouched.
- This report is written into the thread folder but not committed; the folder already holds other uncommitted reports from other runs, and committing it is the thread's.

## Queries

No outstanding queries.

```text
No reply needed.
```

```text
╭─ coordination ──── summary 2026-10-14T18:02:43Z ─╮
│                                                  │
│            KI Model - ways-of-working            │
│                                                  │
╰────────────────────── mark 2026-10-14T13:54:34Z ─╯

- [at rest] nothing running or queued
- [uncommitted] thread folder, this report
- [held] PAPERCLIP-REQ until Wave F
```

```text
Resume KI Model - ways-of-working under current ki-pmo and ki-delegation since 2026-10-14T13:54:34Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
