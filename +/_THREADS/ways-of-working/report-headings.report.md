# report-headings: owner report

Run `ways-of-working`, agent `report-headings`, 2026-10-14. Project [ways-of-working](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md>), Initiative [knowledge-islands-model](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md>). Repository `ki-agentic-harness`. Governing decision, Kris, 2026-10-14 17:56 BST: "What has been done -> Done", "What is in progress -> In Progress", "Outstanding queries -> Queries". The thread's [decisions log](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md>) has no HEADING-FORM entry, so only the section names changed; the `#` heading and context line are untouched.

## Done

- Harness `main` pulled first; `link-form` ([KI-HARNESS-GOV-188](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-188-report-record-links.md>)) was already on it at `8a8b2618`.
- Commit `2208da99` on harness `main`, pushed fast-forward to `origin/main`; `git log origin/main..HEAD` held only that commit, authored by this run.
- `ki-delegation` Reporting section: the three sections are now `## Done`, `## In Progress` and `## Queries`, with Kris's words quoted verbatim beneath the original 2026-10-13 quotation, which stands as given; the Applied bullets, the headings rule and the sub-heading note use the new names; past reports keep the old names and readers accept both.
- `ki-pmo` standard: heading-level rule, report-forms table, recap shape and the full-summary form renamed; `## Decided` still leads the full summary. The re-bootstrap form names no sections, so it needed no change.
- `ki-coordinator` output style in `output-styles/` renamed, with the decision date inline.
- Authority footers `rules-none`, `rules-push`, `rules-prune`, `rules-release` and the `run-prompt` skeleton name the new headings.
- RUN-4 in `background-runs.ts` names the new headings; `ki-delegation` rubric regenerated and in sync. PMO-6 refers to section levels, not names, so it is unchanged.
- [KI-HARNESS-GOV-175](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md>) example renamed; its 2026-10-13 quotation of the original format left verbatim.
- Both sources files carry a 2026-10-14 review entry quoting the decision; earlier review history and quoted owner words left as written.
- Hook `coordinator-reminder.sh`, its tests and the hook README never named the sections, so nothing changed there. `scripts/banner.test.ts` does not exist; the ki-pmo `banner.test.ts` asserts no section names.
- Gates: `bun run test` 1149 pass, 0 fail (hook tests included); `bunx tsc --noEmit` clean; skill-graph check in sync; `ki repo audit` PASS for `ki-delegation`, `ki-pmo` and `ki-work-roadmap`; `ki-skills` WARN only on two pre-existing LONG-3 refresh-cadence findings in its own sources file, a fleet finding not touched by this change.
- No past report or other thread's file rewritten. Untracked `+/diagrams/` from another session left alone.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- The installed `~/.claude/output-styles/ki-coordinator.md` is a symlink to the harness source, so running coordinating threads pick up the new section names on their next read with no Rig step.
- No owner-side parser reads report sections today; `tools-ki` has no match for the old or new names. KI-HARNESS-GOV-175 records that any future `needs-owner` or `failed` derivation must accept both forms.
- The `ki-skills` LONG-3 refresh warnings predate this run and belong to that skill's own sources review.

## Queries

No outstanding queries.

```text
No reply needed.
```
