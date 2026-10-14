# Owner report: roadmap sizing and burn-down design record

**Run:** ways-of-working / sizing-design - **Date:** 2026-10-14 - **Repository:** ki-principal (main, pushed, level with origin)

## Done

- Captured the one design record Kris asked for, at `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/roadmap-sizing-and-burn-down.md`. It quotes the ROADMAP-SIZING direction verbatim: "capture ONE design record in your change-management design for roadmap sizing and burn-down history ... (a) first, a daily ki snapshot appending one JSONL line per repository (date, count by state, later points by state) to a tracked file, repairable from Git history at any commit, charted in Observatory; (b) then a size field in Fibonacci points 1-13 set at plan time, measuring Kris's attention (review, decisions, risk) rather than agent effort, split above 8, triage unsized; (c) then ID allocation moved out of the roadmap notes file's front matter and body into one ki-owned per-area allocation file checked against Git history so pruned IDs never recur. Ownership: ki-work-roadmap defines fields, tools-ki does allocation and snapshots, Observatory charts. Burn-down focus (Decision 158) still applies: design now, build after the current Next records close."
- The record covers (a), (b) and (c) in that order, with facts checked against `tools-ki` (`readWorkItemsAtCommit` already reads a roadmap at any commit; `ki repo roadmap list --format json` is the Observatory's read contract), the `ki-work-roadmap` standards (no size field today; `_ISSUES.md` holds the marks twice and CONFORM scaffolds from retained records only, which forgets pruned numbers) and the Observatory's PDR-KI-OBSERVA-004. It gives a points rubric, the plan-time gate (triage unsized, `ready` requires size, 13 only on a draft as the split marker), the ki-owned `_ALLOCATION.toml` reservation with a Git-history scan, an ownership table (harness defines, tools-ki allocates and snapshots, Observatory charts, this island schedules), the build-after-Next sequence and nine tagged open questions with recommendations.
- Linked it from the design index `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/design.md` under a new "Roadmap sizing and burn-down" section.
- No roadmap record was created, per the burn-down focus.
- Commits on `main`, pushed fast-forward; checks (lint-staged, rumdl, `ki repo audit`) passed with two pre-existing unrelated warnings (Project close-out assessments for `paperclip-bootstrap-and-recovery` and `website`):
  - `fdf583b` docs(design): add roadmap sizing and burn-down history design record (mine).
  - `024625d` docs(design): add thread banner and re-anchoring design for sanity check (another ways-of-working session's commit, pushed beneath mine under the standing rule "an agent may push other threads' committed work beneath its own when checks pass, naming the commits"). Note: that session committed `design.md` while my index section was in the working tree, so my link to the record travelled in `024625d` rather than in `fdf583b`. The content is correct and both are on origin; naming it for the record.

## In progress

Nothing. The run is complete.

## Outstanding queries

The record's nine open questions each carry a recommendation; answering them in `change-management-decisions.md` in Kris's words is the next step when convenient. None blocks anything until the build records are captured after the current Next records close.

- **Needs: SNAPSHOT-HOME** - per-repository `_HISTORY.jsonl` beside the ledger (recommended) or one estate file in this island.
- **Needs: SNAPSHOT-DATE** - UTC date with end-of-day cutoff (recommended) or local date.
- **Needs: SNAPSHOT-DIMENSIONS** - counts by status only, or status and horizon (recommended).
- **Needs: SNAPSHOT-SCHEDULE** - a Rig-managed workstation job over the estate, declared as an Activity note here (recommended).
- **Needs: SIZE-GATE** - forbidden on triage, optional on draft, required for ready, 13 only on draft (recommended).
- **Needs: SIZE-RESIZE** - re-size only on re-plan, noted in Discussion (recommended).
- **Needs: ALLOCATION-FORMAT** - `_ALLOCATION.toml` (recommended) or JSON.
- **Needs: LEDGER-RETIREMENT** - remove `_ISSUES.md` once migrated (recommended) or keep as prose.
- **Needs: HISTORY-SCOPE** - scan the designated branch and its remote ref (recommended) or every local ref.

```text
SNAPSHOT-HOME - (a) per-repo / (b) estate file
SNAPSHOT-DATE - (a) UTC / (b) local
SNAPSHOT-DIMENSIONS - (a) status only / (b) status and horizon
SNAPSHOT-SCHEDULE - (a) Rig job + Activity note / (b) other: ...
SIZE-GATE - (a) as recommended / (b) other: ...
SIZE-RESIZE - (a) re-plan only / (b) any time
ALLOCATION-FORMAT - (a) _ALLOCATION.toml / (b) JSON
LEDGER-RETIREMENT - (a) remove / (b) keep
HISTORY-SCOPE - (a) designated branch + remote / (b) all refs
```
