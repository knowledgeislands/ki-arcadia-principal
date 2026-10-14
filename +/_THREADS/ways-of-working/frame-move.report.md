# frame-move · Summary at 19:21 BST

```text
╭─ coordination ──── summary 2026-10-14T18:21:12Z ─╮
│                                                  │
│            KI Model - ways-of-working            │
│                                                  │
╰────────────────────── mark 2026-10-14T13:54:34Z ─╯
```

Project [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) · Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) · since the run began · resting

## Done

- Harness `main` commit `72c21522`, pushed fast-forward to `origin/main` from `03de5823`; the only commit ahead of origin was mine. It delivers Kris's placing of 19:05 BST, recorded in the [decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md) as "This is for the heading, not the footer banner. The footer banner needs to be like it was before, with the large ascii text."; no later FRAME-PLACE or HEADING-SHAPE entry existed.
- The `ki-pmo` standard's Banner section now splits into the heading frame, which opens every Summary, recap, full summary and re-bootstrap report in a `text` block in place of the `# <label> · <form> at <local time>` line, with the plain Project, Initiative, window and state line beneath it, and the footer banner, the block-letter REST and BUSY frames restored byte-for-byte from harness revision `e60b4e45` with Kris's `- [<state>] <what>` list beneath and no label-and-mark line. A saved report file keeps a single H1 above the frame only where the Markdown lint needs it. The DONE frame and `ki-recap`'s frame are unchanged. The thread-type table, practices, heading levels, report forms, full summary, re-bootstrap and recap rules follow, and the `ki-pmo` SKILL.md and sources review record the eleventh review.
- `ki-delegation`'s Reporting section carries the heading rule for every owner report, with a saved-file example; the authority footers `rules-none.md` and `rules-push.md` and the run-prompt skeleton tell a background agent to open with the heading frame of the thread it reports to and close with that thread's block-letter footer, list and resume line; its sources review records the sixth review.
- The `ki-coordinator` output style, the hook line with its test and the hook README, and HARN-012 and HARN-013 in `docs/specs/harness.md` describe the heading frame above and the block-letter footer below.
- `scripts/banner.test.ts` asserts the heading frame with nothing beneath it, the footer's issued border, its three rows byte-identical to `e60b4e45` and its fixed bottom border, the output style's three frames equal to the standard's, and the hook line's wording. PMO-6 and RUN-4 are rewritten and both rubrics regenerated and in sync.
- [KI-HARNESS-GOV-191](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-191-banner-frame.md) quotes the decision under a new Context subsection, carries the split in its Requirements, Steps, Files touched, Review and Discussion, and stays at `awaiting-review`.
- Checks: `bun run test` 1152 pass, 0 fail; `bunx tsc --noEmit` clean; the skill-graph check in sync; the banner and hook tests 22 pass; `ki repo audit` passes for `ki-pmo`, `ki-delegation` and `ki-work-roadmap`, and for `ki-skills` with its two standing refresh-cadence warnings on sources reviewed on 2026-06-21 and 2026-08-29, which predate this run.

## In Progress

Nothing is running.

Outstanding - no action requested now

- The thread folder `+/_THREADS/ways-of-working/` in `ki-principal` holds an uncommitted `decisions.md` and untracked earlier reports from other runs; this run touched none of them and leaves them for the thread to commit at its next report. The `ki-principal` checkout is three commits behind `origin/main`.
- The `+/diagrams/` folder in the harness is untracked from another session and was not touched.
- `tools-ki` has no `ki` command that prints either frame, so no handoff was needed.

## Queries

### FRAME-AGENT - whose frame a background agent's report renders

**Context:** The brief says the heading frame opens every report and carries the thread type, the form, the label and the mark, and asks this run's report to use it, but it does not say what a background agent writes in the frame, since an agent is not a thread and has no mark of its own. This delivery has the agent render the frame of the thread it reports to, with `summary` as its form, the thread's label and mark, and the run name kept in the file's H1 line, which is what the footer already did in earlier agent reports; `ki-delegation`'s Reporting section, the authority footers and the run-prompt skeleton say so, and this report is drawn that way. **Query:** Should a background agent's report carry the thread's heading frame, as delivered, or a frame of its own? **Options:** a) (recommended) keep the thread's frame: the agent's report opens and closes with the frames of the thread it reports to, and the run name stays in the file's H1 b) give the agent its own frame, with the run name centred as the label and the run's start time in place of the mark, and say so in `ki-delegation`'s Reporting section

```text
FRAME-AGENT

keep the thread's frame: a background agent's report opens and closes with the frames of the thread it reports to, the run name staying in the file's H1, as ki-delegation's Reporting section now says
```

```text
╭─ issued 2026-10-14T18:21:12Z ────────────────────╮
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
╰──────────────────────────────────────────────────╯

- [at rest] nothing running or queued
- [waiting] FRAME-AGENT
- [uncommitted] thread folder, for the thread to commit at its next report
```

```text
Resume KI Model - ways-of-working under current ki-pmo and ki-delegation since 2026-10-14T13:54:34Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
