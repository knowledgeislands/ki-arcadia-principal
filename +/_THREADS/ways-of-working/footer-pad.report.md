# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › footer-pad

**Run report at 19:53 BST · last mark 14:54 BST**

---

## Done

- The two footer amendments Kris approved on 2026-10-14, "What about with some spaces around it, so that it's got a bit more impact?" and "Okay, I'm really happy with that. Yeah, let's go with it.", are applied on every surface `heading-rich` touched: the `ki-pmo` standard with its Banner section, REST, BUSY and DONE examples and agent's-report paragraph, its SKILL.md and sources, the `ki-coordinator` output style, the hook line with its test and README, `scripts/banner.test.ts`, PMO-6 and RUN-4 with both rubrics regenerated, `ki-delegation`'s Reporting section, all four authority footers and the run-prompt skeleton, and HARN-012 and HARN-013 in the harness specification.
- The footer's top border now reads `╭─ <form> · <YYYY-MM-DDTHH:MM:SSZ> ─` filled with `─` to 52 code points, the form being `summary`, `recap`, `full summary`, `re-bootstrap` or, in an agent's report, `run report`, in place of `issued`; the run of `─` after the time is 17 for `summary` and 19 for `recap`. One blank framed line, `│`, 50 spaces and `│`, stands directly under the top border and directly above the bottom border in the REST, BUSY and DONE frames. The DONE example carries `full summary` as its form word, since the standard names no form for the close-out report; the standard says the DONE border carries the closing report's form.
- The three block-letter word rows are unchanged from revision `e60b4e45`, and the test asserts them. Reports issued before the approval keep their `issued` border and unpadded frame, and checks accept both; the test reads a frame to its bottom border, so `ki-recap`'s five-line frame still passes.
- [KI-HARNESS-GOV-191](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-191-banner-frame.md) quotes both approvals, records the fifth delivery and stays at `awaiting-review`.
- Harness commit `b81bcfa3` on `main`, built on `cf601d66`, pushed fast-forward to `origin`; no commit by anyone else stood between. The untracked `+/diagrams/` folder was left alone.
- Checks after the change: `bun run test` 1152 pass, 0 fail; `bunx tsc --noEmit` clean; the skill-graph check in sync; the banner and hook tests 22 pass; both rubrics in sync; `ki repo audit` for `ki-pmo`, `ki-delegation` and `ki-work-roadmap` pass, and `ki-skills` passes with its two standing refresh-cadence warnings.

## In Progress

Nothing is running.

Outstanding - no action requested now

- The BUSY word rows in the brief's drawing differ from the standard's fixed rows in the `Y` glyph by one column; the standard's rows were kept. See `BUSY-Y-GLYPH` below.
- This report is written but not committed: the `ki-principal` thread folder holds other sessions' work, a modified `decisions.md`, a staged `gate-scope.report.md` and several untracked reports from `banner-frame` to `harness-links`, so the thread commits its folder at its next resting point as the standard sets.

## Queries

### [BUSY-Y-GLYPH](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-191-banner-frame.md) - which BUSY word rows stand

**Context:** The brief asked me to copy its BUSY word rows exactly and to report any difference from the standard's current rows rather than choose silently. They differ in the `Y` glyph only: the standard, revision `e60b4e45` and the test draw its second and third rows as ` ▀█▀ ` and `  █  `, while the brief's drawing shifts both one column left, `▀█▀` and ` █   `. The `B`, `U` and `S` glyphs, the captions and the REST rows are identical. I kept the standard's rows, because the approved amendments were the padding and the form word, the rows are fixed so transcript archives can search for them, and the brief's drawing was most likely retyped rather than redrawn. The delivery otherwise stands as approved.

**Query:** Should the BUSY `Y` glyph stay as the standard has carried it since revision `e60b4e45`, or move one column left as the brief's drawing shows?

**Options:** a) (recommended) Keep the standard's rows; nothing changes. b) Adopt the brief's rows: a one-line follow-up changes the `Y` glyph in the standard, the output style and the test.

```text
BUSY-Y-GLYPH

keep the standard's BUSY word rows as revision e60b4e45 carries them; no change
```

```text
╭─ run report · 2026-10-14T18:53:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯

- [at rest] nothing running or queued
- [waiting] BUSY-Y-GLYPH
- [waiting] HR-SHAPE
- [committed] harness delivery, pushed
```

```text
Resume KI Model - ways-of-working under current ki-pmo and ki-delegation since 2026-10-14T13:54Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
