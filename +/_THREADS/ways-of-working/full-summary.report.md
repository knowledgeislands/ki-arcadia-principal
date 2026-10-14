# full-summary: owner report

Run `ways-of-working`, agent `full-summary`, 2026-10-13. Governing decisions: [Decision 14](</Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md#decision-14-2026-10-13>), [Decision 15](</Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md#decision-15-2026-10-13>) and [Decision 18](</Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md#decision-18-2026-10-13>). Model: Claude Fable 5.1 on Claude Code.

## What has been done

### The example, shape only

Read from the transcript with a redacting script; no content retained. It was pasted as rendered text, so its own heading markup was lost. Strengths adopted into the standard:

- a numbered Decisions table covering the whole thread, one line each;
- What has been done grouped by topic with sub-headings;
- dated upcoming deadlines under `Outstanding - no action requested now`;
- queries that read cold, each with Summary, Need from you and Recommendation;
- `<a / b>`-style placeholders in the reply block where only the owner can supply the value;
- one closing "defaults unless you say otherwise" query for low-stakes items.

Shortfalls judged against the standard:

- **No links, decisions unlinked:** rejected; the linking rule stands and the Decided list now requires a link per decision.
- **No banner:** rejected; the H1 banner is required for every form.
- **Flat or unclear heading levels:** rejected; fixed as H1 banner, H2 sections, H3 queries and topic sub-headings.
- **Bundled queries** (one tag carrying two or three distinct asks): rejected; a query the owner cannot answer with one instruction is two queries. The defaults query is kept because it asks for nothing and each item is low-stakes.
- **Em dashes in query headings:** rejected; the standard already fixes the spaced hyphen.
- **Trivial confirm-only queries** outside the defaults query: these belong in `DEFAULTS`; the standard now says so.

### Standard amended

[standards-background-runs.md](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md>) Reporting section:

- new `### Full summary` form: trigger phrases including Kris's wording, window `since the thread began`, H1 banner, `## Decided` (numbered list or table, each decision linked to its decisions-log entry or record), `## What has been done` by topic with `###` sub-headings, `## What is in progress` with dated deadlines, `## Outstanding queries` with every open query in full under `###`, reply block covering every query, `DEFAULTS` query rule, sources, never moves the mark;
- one table of the three forms (Summary since your last message, recap since the mark, full summary since the thread began) with trigger and sections;
- heading-levels rule for every form, and a self-contained rule: no Summary, recap or full summary says "unchanged, see earlier" or points back;
- placeholder rule for the reply block, and a headings rule for every owner report, including agent report files;
- recap Shape and When bullets reconciled; Kris's verbatim quotation untouched.

Also updated: the `ki-delegation` SKILL.md overview and note, RUN-5 in the rubric source with `references/rubric.md` regenerated, and the sources last-review entry.

### Design report

[change-management-report.md](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-report.md>): the PMO unit gains a **Reporting forms (Decision 18)** paragraph adopting the three forms and the full summary by reference; the Decisions list gains owner decision `SUMMARY-ENTRY` with the assessment and recommendation; two bullets added to Changes after review; the amended line and the decision count updated.

### Entry point assessed, not built

Read [ki-recap SKILL.md](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-recap/SKILL.md>). Recommendation (b), a `/ki-pmo` entry point once [KI-PRINCIPAL-ECO-013](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md>) creates `ki-pmo`. See `SUMMARY-ENTRY` below.

### Commits and checks

- ki-agentic-harness `fbd11977` feat(skills): define the full summary form in the ki-delegation owner report. Pushed fast-forward to `origin/main`.
- ki-principal `e6d71ce` docs(ways-of-working): adopt the full summary by reference and add SUMMARY-ENTRY. Pushed fast-forward to `origin/main`.
- `bun run test` 1083 pass, 0 fail; `bunx tsc --noEmit` clean; `ki repo audit --skill ki-delegation` PASS; rubric regenerated with `ki dev skill rubric ki-delegation --write`.
- `ki repo audit --repo .` in ki-principal: FAIL=3 before and after, same three (ki-checkpoint, ki-repo, ki-repo-kb-principal), none new.
- pre-commit hooks passed in both repositories; no `--no-verify`.
- `rg` over both diffs for currency, dates, legal terms: only the generic word "order" in my own prose; no private content.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- Agent work: `skill-graph` is held until this run finishes and can resume.
- Receiver-owned: the pre-existing three FAILs in ki-principal and the `ki-skills` LONG-3 refresh warnings seen by the pre-commit audit are not from this change.
- Retained: the `ki-recap` SKILL.md lives at `skills/change-management/ki-recap/`; the design report's `## Decisions` now numbers ten items while [change-management-decisions.md](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-decisions.md>) numbers its own list differently; tags, not numbers, identify them.

## Outstanding queries

### SUMMARY-ENTRY - slash-command entry point for the full summary

- **Summary:** Kris suggested something like `/ki-recap` for coordinating threads. Options: (a) a full-summary mode of `ki-recap`; (b) a user-invocable `ki-pmo` entry point once the pilot creates `ki-pmo`, taking `summary`, `recap`, `full-summary` and `mark`, so `/ki-pmo full-summary` is the one slash entry for a coordinating thread; (c) a stop-gap user-invocable skill now, moved into `ki-pmo` later. Recorded in the design report's Decisions and Changes after review; nothing built.
- **Need from you:** choose (a), (b) or (c).
- **Recommendation:** (b). `ki-recap` is a one-session summary that ends in an Actions checklist and offers compaction, and the standard keeps the thread-level recap apart from it; a mode would give two different things the one name. A stop-gap skill adds catalogue, `tools-ki` bootstrap and website entries the pilot would then fold away. Nothing is lost by waiting: the trigger phrases already give every coordinating thread the full summary today.

### DEFAULTS - defaults unless you say otherwise

- **Summary:** low-stakes choices made in this run: the defaults query is tagged `DEFAULTS`; the headings rule also applies to agent report files (H1 title, H2 sections, H3 queries); placeholders are written `<a / b>`, `<date>`, `<amount>`; the design report's "Eight decisions are for Kris" became "Ten"; em dashes in query headings stay rejected.
- **Need from you:** nothing, unless you object.
- **Recommendation:** keep the defaults.

```text
SUMMARY-ENTRY - <a / b / c>; recommended (b): /ki-pmo entry point once KI-PRINCIPAL-ECO-013 creates ki-pmo; build nothing now.
DEFAULTS - keep the defaults.
```
