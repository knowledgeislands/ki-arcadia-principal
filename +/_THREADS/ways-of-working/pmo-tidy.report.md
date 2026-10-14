# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › pmo-tidy

**Run report at 20:42 BST · last mark 19:56 BST**

---

## Done

- The THREAD-TIDY rule is in the ki-pmo standard as a new thread working rule, [Tidying the thread folder](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md#tidying-the-thread-folder), quoting Kris as received on 2026-10-14: "THREAD-TIDY / add a rule to ki-pmo: at each mark the thread deletes every report whose queries are all answered and whose outcome has a durable home, keeping only reports with open queries and decisions.md, with Git history holding the rest; each thread applies it to its own folder at its next mark, starting with this one once the commit gate passes". A durable home is a work record, the decisions log, the checkpoint or a commit; the deletion is one commit by explicit path so Git holds every report; each thread tidies only its own folder and a background agent never deletes a report.
- Recap since the mark (the striking step and its sources), the full summary's sources, Committing the thread folder and Project close now point at the rule, so a deleted report is read from Git history rather than treated as missing.
- The same rule is restated where thread-folder retention was already stated: the ki-delegation standard's run packet and decisions-log section, ki-delegation's SKILL.md notes, the `ki-coordinator` output style, the hook line in `hooks/coordinator-reminder.sh` with its test, and both rubrics, PMO-6 and RUN-3, with `references/rubric.md` regenerated for ki-pmo and ki-delegation. Both skills' sources files carry a dated review entry.
- No work record was opened, under the record threshold Kris set on 2026-10-14: "RECORD-THRESHOLD / agree: a record only for a product or standard change needing acceptance; operational work runs on the decisions log, brief and report; add it to the ki-pmo standard". The change carries out a decision already made in full, as the pmo-cadence delivery did.
- Nothing in ki-principal was deleted or touched: each thread applies the rule to its own folder at its next mark.
- Commit `daa63224` on `ki-agentic-harness` `main`, `feat(ki-pmo): tidy the thread folder at each mark as Kris set`, by explicit path with the co-author trailer. It was rebased onto one new origin commit by Kris, a roadmap edit, and pushed fast-forward; `git log origin/main..HEAD` held only this commit before the push, and `main` is level with `origin/main` now. Untracked `+/diagrams/` was left alone.
- Gates: `bun run test` 1152 pass, 0 fail, re-run after the rebase; `bunx tsc --noEmit` clean; the hook tests pass with the updated line; `ki repo audit` PASS for ki-pmo, ki-delegation and ki-work-roadmap. The ki-skills audit returns WARN on two pre-existing fleet findings outside this change: two sources in ki-skills' own `references/sources.md` are past their monthly refresh cadence (last reviewed 2026-08-29 and 2026-06-21). They are reported here and not fixed.
- Skill-graph check: the `ki:skills:graph:check` package script named in the harness spec no longer exists; it was retired in the refactor that made audits per skill. The graph is checked by the ki-skills audit's KI-SHAPE-20 item, "dependency declarations resolve and are acyclic", which passed. No dependency declaration changed in this delivery.
- Commitlint printed one warning on the commit message, "footer must have leading blank line", because the quoted threshold paragraph before the trailer reads as a footer to it; the trailer is present and correctly separated.

## In Progress

Nothing is running.

Outstanding - no action requested now

- The harness spec still names `bun run ki:skills:graph:check` as the verification for GOV-005 in `docs/specs/governance.md`; the script is gone and the ki-skills audit covers it. A one-line spec correction is for a later delivery.
- Two stale sources in ki-skills' `references/sources.md` await a REFRESH of that skill.
- This report is written but not committed in ki-principal: that checkout's index already holds two files another session staged under `+/_THREADS/knowledge-acquisition/`, and modified checkpoints, so a commit here would sweep in work that is not mine. The ways-of-working thread commits its folder at its next owner report.

## Queries

No outstanding queries.

```text
No reply needed.
```

```text
╭─ run report · 2026-10-14T19:42:09Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯

- [at rest] nothing running or queued
- [committed] ki-agentic-harness commit daa63224, pushed
- [uncommitted] this report in ki-principal, another session's staged files block it
```

```text
Resume KI Model: ways-of-working under current ki-pmo and ki-delegation since 19:56 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
