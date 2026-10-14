# query-form · Summary at 19:08 BST

Project [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) · Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) · since the run began · resting

## Done

- Built on `pmo-rules` at harness `main` 6d27d6a7; the decisions log's later entries won, so the applied shape uses bold labels, "bold not italics for the "Context", "Query", "Options" please", and lettered options with no bullet, "if the options have a), b), then no bullet also".
- `ki-delegation` Reporting section now owns the query shape: **Context**, **Query**, **Options** with `a) (recommended)` first, further letters only for real alternatives, Kris's words of 2026-10-14 quoted; the reply block keeps the stacked form with option a)'s instruction in full, a bare letter is accepted as an answer, the "never a menu" rule governs only the reply block, and a query written before 2026-10-14 keeps Summary, Need from you and Recommendation.
- Applied in the `ki-pmo` standard (full-summary form and the `DEFAULTS` query), the `ki-coordinator` output style, the coordinator-reminder hook line, its test, the banner test and the hooks README, the four authority footers and the run-prompt skeleton, and both sources notes.
- RUN-4 and PMO-6 updated to check the new shape and accept the old one in past reports; both rubrics regenerated with `ki dev skill rubric --write`.
- Committed as harness 03de5823, `feat(ki-delegation): adopt the Context, Query and Options query shape`, by explicit path with the trailer; `git log origin/main..HEAD` held only that commit; pushed fast-forward, `main` level with `origin/main`.
- Gates: `bun run test` 1151 pass, 0 fail; `bunx tsc --noEmit` clean; skill-graph check in sync; hook and banner tests pass; `ki repo audit` PASS for `ki-pmo`, `ki-delegation` and `ki-work-roadmap`; `ki-skills` PASS with two pre-existing LONG-3 refresh-cadence warnings on its own sources note, a fleet finding, not from this change.
- The installed `~/.claude/output-styles/ki-coordinator.md` is a symlink into the harness checkout, so the output style took effect on push with no Rig hand-off.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- Thread folder: `+/_THREADS/ways-of-working/decisions.md` is dirty from the thread's own session and eight earlier reports are untracked; left for the thread to commit at its next report under `ki-pmo`.
- Untracked `+/diagrams/` in the harness checkout, not mine, left alone.

## Queries

### LETTER-REPLY - teaching `ki agent decide` to resolve a bare letter

**Context:** The new rule says whoever reads a reply accepts a bare letter, such as `b`, beneath a tag and resolves it against that query's lettered options. Coordinating threads can do that by hand from the report, but `ki agent decide` in `tools-ki`, which logs owner replies into the decisions log, currently records the text as given and knows nothing of the options; a logged entry reading only "b" is not durable in the owner's words unless the tool, or the thread, expands it. **Query:** Should a `tools-ki` follow-on make `ki agent decide` expand a bare letter into the chosen option's text when logging it? **Options:** a) (recommended) raise a `tools-ki` follow-on so `ki agent decide` expands a bare letter against the latest report's options before logging, and until then the thread writes the option's text into the log itself b) leave it as it is: threads expand the letter by hand when they log the decision, and no tool change is needed

```text
LETTER-REPLY

raise a tools-ki follow-on so ki agent decide expands a bare letter against the latest report's options before logging, and until then the thread writes the option's text into the log itself
```

```text
╭─ coordination ──── summary 2026-10-14T18:08:42Z ─╮
│                                                  │
│            KI Model - ways-of-working            │
│                                                  │
╰────────────────────── mark 2026-10-14T13:54:34Z ─╯

- [at rest] nothing running or queued
- [waiting] LETTER-REPLY
- [uncommitted] thread folder, for the thread to commit at its next report
```

```text
Resume KI Model - ways-of-working under current ki-pmo and ki-delegation since 2026-10-14T13:54:34Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
