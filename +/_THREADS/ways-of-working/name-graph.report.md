# name-graph: owner report

Run `ways-of-working`, agent `name-graph`, 2026-10-13. Governing decisions: [Decision 19](</Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md#decision-19-2026-10-13>) ("I'd like that skill graph to be done using archify"), [Decision 21](</Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md#decision-21-2026-10-13>) ("BLUEPRINT-FIT - Name for ki-design-loop: ki-pmo-review, and how does it differ from ki-pmo (question open). DESIGN-AREA - Keep design area, ki-design-system and ki-design-inspiration.") and [Decision 22](</Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md#decision-22-2026-10-13>) ("Skill names: show an Archify graph of the skills and how they interrelate, as part of reviewing current and proposed naming."). Model: Claude Fable 5.1 on Claude Code.

## What has been done

### The diagram

- One Archify architecture diagram, committed as working design material in the design folder: [change-management-skills.architecture.json](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-skills.architecture.json>) (source, 41 components, 22 connections, three views) and [change-management-skills.svg](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-skills.svg>) (static export, 1198 by 1238px). The interactive HTML is at `+/diagrams/change-management-skills/change-management-skills.html`, untracked as `ki-diagrams` requires.
- Two regions, so the drawing is a before/after pair in one picture. TODAY shows the 20 skills in the set with the reliance each declares in its `SKILL.md` frontmatter at harness revision `1cfa7d89` (solid for `ki-depends-on`, dashed for `ki-optional-depends-on`; eight edges in all) and a box saying `ki-work` and its adapters declare nothing between them. PROPOSED shows the same skills in the report's six units (Work, PMO, Delegation, Continuity, Design loop, Model policy) with the names you decided: "NAMES (c) ki-pmo, ki-work-recurring, ki-design-loop -> ki-blueprint." (Decision 17) as revised by "BLUEPRINT-FIT - Name for ki-design-loop: ki-pmo-review" (Decision 21). Every renamed skill shows its new name as the label, "was <old name>" as the sublabel and a RENAMED tag; `ki-pmo` is tagged NEW, `ki-delegation` REDUCED, `ki-pulse` MOVES; six emphasised arrows show the hand-offs (thread material moves to `ki-pmo`; `ki-pmo` dispatches runs, invokes `ki-pmo-review`, persists through `ki-checkpoint`, takes purpose by reference from `ki-tokenomics`; `ki-pmo-review` hands rollout records to `ki-next`). Cards quote your three naming decisions verbatim, list what moves from `ki-delegation` to `ki-pmo`, and name the hand-offs not drawn.
- The `ki-pmo` node cites the harness standard [standards-background-runs.md](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md>) lines 248 to 360 as the thread material that moves, so Archify's source-evidence check binds the drawing to the code.

### The note in design.md

- [design.md](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/design.md>) gains a Skill graph section introducing the two files, quoting Decisions 17, 21 and 22 inline, embedding the SVG, and naming the current names that fail your glance test with a reason each: `ki-work-housekeeping` ("housekeeping" says cleanup), `ki-design-loop` (names the activity not the subject and reads as interface design beside `ki-design-system`), `ki-delegation` (its name does not cover the thread material it holds today; remedied by the move, not a rename), `ki-pulse` (a pulse is a heartbeat, the skill triages signals; no rename proposed) and `ki-next` as borderline (a horizon, not an act; no rename proposed). The rest of the set is listed as passing.

### Checks, commit and push

- Archify 3.0.1 `finalize` at showcase quality: all four gates pass (validate, deliver, check, browser-check), zero diagnostics, update check current. Its advisory route review reports two resolved crossings (beside `ki-pmo-review` and beside `ki-pmo`) and three routes over suggested bend or stretch. I applied its hint once (moved `ki-tokenomics`, pinned endpoint sides) into `review-2`; Archify rejected that layout twice (a border run, then an edge through `ki-decision-records`), so per its protocol I restored the passing candidate and re-finalized into `review-3`, which passes. No second placement round. Readability rests on the automated gates; I did not inspect captures, so I claim no visual review.
- `ki repo audit --repo .` on ki-principal: identical to the pre-run baseline, FAIL=3 WARN=2, all pre-existing (`ki-checkpoint` RECORD-2 on the ways-of-working checkpoint's `updated_at`, `ki-repo` TOPICS-1 on the GitHub topic `arcadia`, `ki-repo-kb-principal` PRINCIPAL-2). No new FAIL. One MD012 trailing-blank-line failure my first edit introduced was fixed before commit.
- Privacy: the committed source and SVG contain no absolute path, address or private repository name; the only `@` tokens are CSS at-rules.
- Commit `dbb7b42` on ki-principal `main`, `docs(design): add Archify graph of change-management skills with current and proposed names`, three files, staged by explicit path, pre-commit hooks (lint-staged, syncpack, `ki repo audit --skill ki-repo-kb`) passed, no `--no-verify`. Commitlint gave one warning about a blank line before the trailer; the trailer is present. Fetched, rebased on `origin/main` (nothing new), pushed fast-forward; `main` and `origin/main` are level at `dbb7b42`. Only my commit was pushed.

### Rules kept

- No checkpoint, `Admin`, `Pillars` or `Resources` edited; no network fetch, package install or remote call beyond the one fast-forward push; no environment, scheduler or credential change; no record accepted, pruned or deleted; no background subagent used.
- The SVG was exported by the route the `skill-graph` agent used: the `ki-diagrams` exporter with `NODE_PATH` on the sibling checkout `apps-observatory.local`'s Playwright 1.63.0 and the Chromium already in `~/Library/Caches/ms-playwright`; no install, no network.
- [change-management-decisions.md](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-decisions.md>) was dirty from another session for most of this run and changed on disk mid-run; I did not touch it. By the time I committed it was clean, so another session had committed it (now `07560fd`). Its entry 6 already records `ki-pmo-review` superseding `ki-blueprint`.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- Receiver-owned: the three pre-existing audit failures above predate this run.
- Receiver-owned: the Decisions paragraph of `design.md` still says "One item stays open: the Claude Code `fast` binding", which Decision 21 closed; outside this brief, so left as it was.
- Retained: `+/diagrams/change-management-skills/` (HTML, receipts, `review-2`, `review-3`) stays on disk and out of Git; the harness's `+/diagrams/skill-graph/` from the earlier run is likewise untouched.
- Verification limitation: Archify's two advisory crossings remain in the committed drawing; nothing reads through a node or along a border, which its gates enforce.

## Outstanding queries

### PMO-REVIEW-DIFF - how ki-pmo-review differs from ki-pmo

- **Summary:** your Decision 21 words: "Name for ki-design-loop: ki-pmo-review, and how does it differ from ki-pmo (question open)." The drawing answers it structurally: `ki-pmo` is the coordinating thread that owns Projects and dispatches runs; `ki-pmo-review` is the loop `ki-pmo` invokes when a decision is costly (brief, two independent reviews, merge, decisions), ending in records handed to `ki-next`. The `design.md` note states the question as open and does not answer it, because another agent is answering it per the decisions document.
- **Need from you:** confirm that reading, or let the other agent's answer stand alone.
- **Recommendation:** adopt the reading above and record it in `change-management-decisions.md` entry 13 when that answer lands.

### PULSE-NAME - ki-pulse and the glance test

- **Summary:** I judged `ki-pulse` a glance-test failure (a pulse is a heartbeat or health check; the skill triages incoming signals into records). The report only moves it to `acquire`. No name is proposed.
- **Need from you:** keep the name, or add it to the naming wave with a candidate such as `ki-signals` or `ki-triage`.
- **Recommendation:** keep the name for now and revisit after the pilot; the move to `acquire` already changes its catalogue entry once.

### DEFAULTS - defaults unless you say otherwise

- **Summary:** one file pair rather than separate before and after diagrams; `ki-next` listed as borderline not failing; `ki-delegation` listed as failing by content not by word; the SVG embedded in `design.md` with an Obsidian embed; the diagram cites harness revision `1cfa7d89`; `+/diagrams/` left untracked.
- **Need from you:** nothing, unless you object.
- **Recommendation:** keep the defaults.

```text
PMO-REVIEW-DIFF - <confirm / let the other answer stand>; recommended confirm.
PULSE-NAME - <keep / add to the naming wave>; recommended keep.
DEFAULTS - keep the defaults.
```
