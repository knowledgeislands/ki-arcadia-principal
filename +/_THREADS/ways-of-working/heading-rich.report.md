# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › heading-rich

**Run report at 19:32 BST · last mark 14:54 BST**

---

## Done

- The rich-text heading replaces the box frame at the top of every Summary, recap, full summary and re-bootstrap report, on every surface `frame-move` touched: the `ki-pmo` standard, its SKILL.md and sources, the `ki-coordinator` output style, the hook line with its test and README, `scripts/banner.test.ts`, PMO-6 and RUN-4 with both rubrics regenerated, `ki-delegation`'s Reporting section, all four authority footers and the run-prompt skeleton, and HARN-012 and HARN-013. The `rules-prune.md` and `rules-release.md` footers, which still carried the one-line heading, now carry this one too.
- Kris's words are quoted inline wherever the decision is cited: the 19:13 BST request "maybe you can just come up with something which is just a better heading that is the actual just normal text, so it can be rich text rather than fixed width text ...", the agreement "Actually, that is really good.", and the two amendments "Maybe we use a tripple HR element Before the main heading." and "And maybe then even a single HR alignment after the summary and last mark part." The amendments are applied as three `---` rules before the heading and one after the form line; a saved report file omits the three so it is not read as front matter.
- The plain `Project · Initiative · <window> · <state>` line is removed with the frame; the form fixes the window and the footer banner's list carries the state. The footer stays exactly as `frame-move` left it. Checks accept the framed label and the one-line heading in past reports.
- [KI-HARNESS-GOV-191](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-191-banner-frame.md) quotes the decision, records that the box frame has been retired, and stays at `awaiting-review`.
- Commit `cf601d66` on harness `main`, by explicit path, pushed fast-forward; no commit by anyone else was in the push.
- Gates: `bun run test` 1152 pass, 0 fail; `bunx tsc --noEmit` clean; the skill-graph check in sync; the banner and hook tests 22 pass; both rubrics in sync; the `ki-pmo`, `ki-delegation` and `ki-work-roadmap` audits pass and `ki-skills` passes with its two standing refresh-cadence warnings.

## In Progress

Nothing is running.

Outstanding - no action requested now

- The ways-of-working checkpoint and any `ki` command in `tools-ki` that prints the banner still describe the framed heading; they pick up the new shape under the refresh rule and were not edited.
- The untracked `+/diagrams/` folder in the harness checkout belongs to another session and was left alone.

## Queries

### HR-SHAPE - how the two horizontal-rule amendments are rendered

**Context:** Your amendments were "Maybe we use a tripple HR element Before the main heading." and "And maybe then even a single HR alignment after the summary and last mark part." This delivery renders them as three `---` rules, each on its own line with blank lines between, before the `#` heading, and one `---` after the bold form line; a saved report file omits the three before the heading because a file beginning with `---` is read as front matter. The mock you agreed carried neither rule, so the reading is the delivery's. **Query:** Is three separate rules before the heading and one after the form line the shape you meant? **Options:** a) (recommended) keep it: three `---` rules before the heading in a message, none in a saved file, one `---` after the form line b) drop the rules and keep the agreed mock exactly: heading, form line, sections c) one rule before the heading and one after the form line

```text
HR-SHAPE

keep it: three --- rules before the heading in a message, none in a saved file, one --- after the form line, as KI-HARNESS-GOV-191 at /Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-191-banner-frame.md records
```

```text
╭─ issued 2026-10-14T18:32:56Z ────────────────────╮
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
╰──────────────────────────────────────────────────╯

- [at rest] nothing running or queued
- [waiting] HR-SHAPE
- [committed] harness delivery, pushed
```

```text
Resume KI Model - ways-of-working under current ki-pmo and ki-delegation since 2026-10-14T13:54Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
