# brief - report

## Done

- Brief written and pushed: `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-brief.md` (commit bd2e75d on `main`, fast-forward to origin).
- Project note converted to folder form: `Streams/Projects/ways-of-working/ways-of-working.md`, with a Notes line linking the new `design/design.md` index. `Projects.md` and the other `[[ways-of-working]]` wikilinks resolve unchanged, so no other file was edited.
- Checks: `ki repo audit --repo .` shows no new FAIL. The only FAIL, PRINCIPAL-2 "Enactment gate is anchored", was already there at baseline (HEAD audited in a temporary worktree). Pre-commit hooks (rumdl, staged audit) passed.

Numbered reflection points:

1. Work (records): `ki-work`, its adapters and the lifecycle skills own one record's life, and change least.
2. Portfolio: the Project/Initiative registry standard moves from `ki-work` to `ki-pmo`; `ki-work` keeps slug resolution.
3. PMO: `ki-pmo` owns the coordinating-thread unit (master, Project threads, cap/queue, openers, directions, Summary, Needs/handoffs, parking, linking, roll-up, coordinator role).
4. Delegation: `ki-delegation` keeps only background runs and packets; about half of its standard moves to `ki-pmo`.
5. Continuity: `ki-checkpoint` stays the generic snapshot skill (not renamed into the threads skill) and gains optional `opener` and `mark` fields.
6. Shape: the design loop stays a separate skill beside `ki-pmo`, renamed.
7. Session: `ki-recap` stays one-session; the thread-level form is renamed "roll-up since the mark".
8. Model economy: `ki-tokenomics` owns purposes and their mapping; `ki-pmo` and `ki-delegation` only name purposes.
9. `ki-pulse` moves out of change-management, to governance (beside the radars) or acquire.
10. Rename `ki-work-housekeeping` (for example `ki-work-recurring`) to avoid a clash with the runtime housekeeping skills.
11. "Every repository adopts the roadmap skill" means `ki-work` plus an adapter; the alternative is merging the kb-streams record rules into `ki-work-roadmap`.
12. `ki-batch`, `ki repo batch` and the `ki-work` batch scaffold are one concept in three homes; consolidate them.
13. Rename `ki-design-loop`. Candidates `ki-shape`, `ki-deliberate`, `ki-review-loop`; recommended `ki-shape`.
14. Define session, thread, run and agent once, in `ki-pmo`.
15. The mark is data in checkpoint frontmatter (`mark: {at, decision}`); its behaviour stays in `ki-pmo`.
16. Each checkpoint carries a frontmatter `opener` that names the Project, not the label.
17. Keep direction, outcome and goal as three words for three levels of finiteness, defined in one table.
18. Initiatives carry a bounded list of three to five current aims; Project outcomes and record goals stay short.
19. A Project thread coordinates exactly one Project; drop the "named estate area" escape.
20. One rule per noun: `ki repo` acts, `ki territory` describes, `ki registry` registers; fold `ki territory open` and `show` listing into `ki repo`.
21. Keep "territory" as the concept and give the command a short alias; weigh `ki land` and `ki terr`.
22. Read-only views: `ki territory projects`, `ki territory threads` (with `--opener`), and `ki territory roadmap` as an alias of `ki repo roadmap -t --by project`.
23. `ki agent` gains `--model`/`--effort` (in progress) plus `--purpose` resolved through `ki-tokenomics` bindings.
24. Coordinator default is `standard` at low effort, not `fast`; `fast` only once the PMO bookkeeping is mechanical in `ki`.
25. Higher effort is a per-decision escalation to `reasoning` background agents; reviews and merges run at `reasoning`/`frontier`.
26. This design settles the KI column of command-centre's glossary; command centre keeps the crosswalk and builds its view on the point-22 projections.
27. Needs as decision Items, and possible Item kinds, belong to command centre's attention taxonomy.
28. Rollout pilot: move the thread material into `ki-pmo` with the checkpoint `opener`/`mark` fields; renames, commands and views follow in later waves.

## Needs the owner

- **WOW-CKPT-LINK:** the ways-of-working checkpoint (`+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md`, Objective) still links the old path `Streams/Projects/ways-of-working.md`. I did not edit the checkpoint, as instructed; the thread should update the link at its next checkpoint update.
- **BRIEF-DRIFT:** the brief records drift the reviews will see: the master's opener uses the label (`Re-bootstrap as the <label> thread`), the planned `KI Model:` label departs from the `<Initiative title>: <project>` rule, and the cap is "three or four" in the standard against "three plus the master" in master Decision 19.
