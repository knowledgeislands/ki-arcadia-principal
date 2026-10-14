# banner-refine report - [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md), [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) - since the run began - resting

## Done

- Reopened [KI-HARNESS-GOV-191](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-191-banner-frame.md), which was closed, from the first delivery as its new baseline, quoted Kris's 18:08 BST redrawing and his words "`KI Model - ways-of-working` could be centralised too" in its Context, and delivered the refinement on top of `banner-frame`'s work. One commit on harness `main`, mine, pushed fast-forward after `git log origin/main..HEAD` showed only it: `b6f09c71`.
- The `ki-pmo` standard's Banner section now sets the refined frame: the report form (`summary`, `recap`, `full summary` or `re-bootstrap`) in the top border before the issued time; the label centred with any odd space on the right; a blank line after the frame; one Markdown list beneath of `- [<state>] <what>` items, `[at rest]` first when nothing runs or queues, then `[running]`, `[queued]` and `[waiting] <TAG>`; the housekeeping line become items of the same kind; and the width rule, 52 while the top border fits with four `─` of fill, every line widened equally when the thread type and form need more, nothing abbreviated. REST and BUSY examples are redrawn from Kris's drawing, and a widened `state-of-play` full-summary example at 58 is added.
- The `ki-coordinator` output style, the hook line with its tests and README, the PMO-6 rubric item with the regenerated rubric, `SKILL.md`, the sources review and the harness specification's HARN-012 and HARN-013 all say the same.
- `scripts/banner.test.ts` now asserts the top border with its form and at least four fill, the width for every thread-type and form pair and equal widening, the centred label with odd space right, the blank line, every item's bracketed state and order, the agent and tag item shapes, byte-identical examples in the output style, the DONE glyphs shared with `ki-recap`, the resume line and the hook wording.
- Gates: `bun run test` 1151 pass; `bunx tsc --noEmit` clean; skill-graph check in sync; banner and hook tests 21 pass; `ki dev skill rubric ki-pmo` in sync; `ki repo audit` for `ki-pmo`, `ki-delegation` and `ki-work-roadmap` pass; `ki-skills` passes with its two pre-existing refresh-cadence warnings. The pre-commit hook ran lint-staged and the staged `ki-skills` audit.
- Limitations: the brief names "the builder", but no banner builder exists in the harness or in `tools-ki`, as `banner-frame` found, so there was nothing to change there. The housekeeping item states beyond Kris's `[blocked]` and `[held]` are my choice, each a state word: `[committed] checkpoint and thread folder, pushed`, `[uncommitted]`, `[unpushed]`, `[parked] <count>`, `[recovered] <UTC>` and `[unlogged] decisions: <count>`. `- [waiting] <TAG>` carries the tag alone, as drawn, so the query title now lives only in the Queries section. The DONE frame and `ki-recap`'s frame keep their block-letter glyphs. No checkpoint was edited.
- The record sits at `awaiting-review` with a full review packet; the first acceptance is kept under its Discussion. I did not close it, because this brief authorised reopening but not acceptance.

## In Progress

Nothing is running.

Outstanding - no action requested now

- Live threads pick up the refined frame at their next report under the refresh rule.
- The `ki-skills` sources past cadence predate this run and were not touched.
- `+/diagrams/` is untracked in the harness checkout from another session and was left alone.

## Queries

### CLOSE-191 - accept the refined banner record

**Summary.** [KI-HARNESS-GOV-191](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-191-banner-frame.md) was reopened for the refinement and now awaits review with every gate green; the first delivery had been closed under `banner-frame`'s brief, "deliver it, and close it if it verifies", which this brief did not repeat.

**Need from you.** Accept the refined record, or name what to change first, including any renaming of the housekeeping states `[committed]`, `[uncommitted]`, `[unpushed]`, `[parked]`, `[recovered]` and `[unlogged]`.

**Recommendation.** Accept it as delivered, keeping the housekeeping states as named.

### DONE-FRAME - redraw the DONE frame to match

**Summary.** The live banner is now a framed label with a list beneath; the DONE frame shown once at Project close and `ki-recap`'s single-session frame still use block-letter glyphs, so a closing Project renders a different shape from every report before it. `banner-frame` raised this and it is still open.

**Need from you.** Say whether both should take the new shape, with `closed <UTC>` on the bottom border in place of `mark`, or stay as they are.

**Recommendation.** Redraw both in the new shape, with `closed` on the bottom border, in one small follow-on under [KI-HARNESS-GOV-191](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-191-banner-frame.md)'s Discussion.

```text
CLOSE-191

Accept KI-HARNESS-GOV-191 as delivered, keeping the housekeeping states [committed], [uncommitted], [unpushed], [parked], [recovered] and [unlogged].

---

DONE-FRAME

Redraw the DONE frame and ki-recap's frame in the new shape, closed <UTC> on the bottom border, as a follow-on to KI-HARNESS-GOV-191.
```

```text
╭─ coordination ──── summary 2026-10-14T17:53:54Z ─╮
│                                                  │
│            KI Model - ways-of-working            │
│                                                  │
╰────────────────────── mark 2026-10-14T13:54:34Z ─╯

- [at rest] nothing running or queued
- [waiting] CLOSE-191
- [waiting] DONE-FRAME
- [uncommitted] thread folder, this report
- [held] PAPERCLIP-REQ until Wave F
```

```text
Resume KI Model - ways-of-working under current ki-pmo and ki-delegation since 2026-10-14T13:54:34Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
