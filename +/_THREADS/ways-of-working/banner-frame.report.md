# banner-frame report - [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md), [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) - since the run began - resting

## Done

- Opened, delivered and closed [KI-HARNESS-GOV-191](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-191-banner-frame.md), which quotes Kris's second drawing. Three commits on harness `main`, all mine, pushed fast-forward: the ledger reserve `a3eeb5f0`, the record `8061c13e`, the delivery `0b3c05b5`.
- The `ki-pmo` standard's Banner section now sets the one live frame: thread type and issued time on the top border, the label with ` - ` in the body, the mark on the bottom border, and `at rest: nothing running or queued` as the first line beneath when nothing runs or queues. The REST and BUSY examples are redrawn from the drawing; the thread-type table and the heading-state sentence follow.
- The `ki-coordinator` output style, the hook line with its tests and README, the PMO-6 rubric item with the regenerated rubric, `SKILL.md`, the sources review and the harness specification's HARN-012 and HARN-013 all say the same.
- `scripts/banner.test.ts` asserts 52 code points on every framed line, the top border with its thread type and time, the blank and label body lines, the bottom border with the mark, the rest line first under REST and absent under BUSY, one item per line, byte-identical examples in the output style, the DONE glyphs shared with `ki-recap`, the resume line and the hook wording.
- Gates: `bun run test` 1150 pass; `bunx tsc --noEmit` clean; skill-graph check in sync; hook and banner tests 20 pass; `ki repo audit` for `ki-pmo`, `ki-delegation` and `ki-work-roadmap` pass; `ki-skills` passes with its two pre-existing refresh-cadence warnings. The pre-commit hook ran the staged `ki-skills` audit on each commit.
- `tools-ki` prints no banner, so no handoff was needed in the record's Discussion.
- Limitations: the DONE frame at Project close keeps its block-letter glyphs, as does `ki-recap`'s frame, because the drawing did not cover them. A label over 48 code points would not fit the body line. Checkpoints still carry labels with a colon; the banner renders ` - ` and no checkpoint was edited. The pre-commit formatter strips leading spaces inside inline code, so the standard says "a space, then `mark <mark UTC> ─╯`" rather than putting the space in the code span.

## In Progress

Nothing is running.

Outstanding - no action requested now

- Live threads pick up the new frame at their next report under the refresh rule; the ways-of-working checkpoint was not edited.
- The `ki-skills` sources past cadence predate this run and were not touched.

## Queries

### DONE-FRAME - redraw the DONE frame to match?

**Summary.** The live banner is now a framed label; the DONE frame shown once at Project close still uses the block-letter glyphs it shares with `ki-recap`'s single-session frame, so a closing Project renders a different shape from every report before it.

**Need from you.** Say whether the DONE frame and `ki-recap`'s frame should take the new shape, with `closed <UTC>` on the bottom border in place of `mark`, or stay as they are.

**Recommendation.** Redraw both in the new shape, with `closed` on the bottom border, in one small follow-on under [KI-HARNESS-GOV-191](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-191-banner-frame.md)'s Discussion.

```text
DONE-FRAME

Redraw the DONE frame and ki-recap's frame in the new shape, closed <UTC> on the bottom border, as a follow-on to KI-HARNESS-GOV-191.
```

```text
╭─ coordination ──────────── 2026-10-14T17:16:42Z ─╮
│                                                  │
│ KI Model - ways-of-working                       │
│                                                  │
╰────────────────────── mark 2026-10-14T13:54:34Z ─╯
   at rest: nothing running or queued
   waiting on you: DONE-FRAME - redraw the DONE frame to match
   checkpoint untouched · thread folder: this report uncommitted · held: PAPERCLIP-REQ until Wave F
```

```text
Resume KI Model - ways-of-working under current ki-pmo and ki-delegation since 2026-10-14T13:54:34Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
