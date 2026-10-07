---
type: ki-checkpoint
thread: baseline
state: active
created_at: 2026-10-06T20:50:00Z
updated_at: 2026-10-07T09:05:00Z
---

# baseline

## Objective

Reach a solid Knowledge Islands baseline and roll it out to every island. The test: `ki repo audit --estate` is green and the released `ki` is installed everywhere. Arcadia coordinates; every item is delivered through a work record in its owning repository.

Moving agent work into the Techné footprint is a separate thread, `techne`, and neither gates the other. `estate-factorisation` owns structure, MCP, distribution and `ki` pin automation, and its remainder does not gate this thread; `paperclip-bootstrap-and-recovery` and `territories-and-trades` own their own scope.

## Current state

Records read on 2026-10-07 at about 11:00 CEST; recheck before acting.

- **Release.** `ki` v0.7.1 is tagged, installed locally and published in the `homebrew-tap` formula (`ki --version`).
- **Gate.** Not yet evidenced. A run of `ki repo audit --estate` on 2026-10-07 did not finish within five minutes, so the gate has no current result.
- **Pause.** Work across Knowledge Islands repositories is paused while the `state-of-play` review runs; its proposed first delivery window keeps FND-026, GOV-109 and GOV-117 as their own dependency chain.

Records (theme B in `state-of-play`, plus the baseline items this thread already tracked):

| Record | Status | Why it matters |
| --- | --- | --- |
| `KI-HARNESS-FND-026` - complete conform activation | ready, now | Rollout depends on conform working everywhere |
| `KI-HARNESS-GOV-109` - enforce commit gates | ready, now | Consistent gates before rollout; its prepare proposal must preserve the supported boundary install |
| `KI-HARNESS-GOV-117` - govern hooks beyond packages | draft, now | Waits on GOV-109 |
| `KI-HARNESS-GOV-115` - require a current worktree base | ready, now | Reports base drift in coordinated delivery; COORD-10 is occupied and a `tools-ki` handoff is missing |
| `KI-HARNESS-RTP-015` - verify the run MCP connection | ready, now | Agent runs reaching the mcporter bridge |
| `KI-HARNESS-GOV-127` - adopt Dependency Cruiser estate-wide | in-progress, now | Needs re-planning against existing DESIGN-2 evidence |
| `KI-HARNESS-REV-011` - review harness automation | ready, now | Must show current criterion coverage |
| [[KI-ARCADIA-OPS-008-scheduled-automations\|KI-ARCADIA-OPS-008]] - scheduled automations | ready, now | Tending prompts and scheduled work; its locator-only plan leaves downstream loads broken |
| [[KI-ARCADIA-EXT-003-ki-skill-extractions\|KI-ARCADIA-EXT-003]] - skill extractions | ready, now | Arcadia-only doctrine becomes portable skills |
| [[KI-ARCADIA-ECO-009-legacy-serve-fallback-policy\|KI-ARCADIA-ECO-009]] - legacy serve fallback evidence | ready, now | MCP launch evidence; also mapped in `estate-factorisation` |
| [[KI-ARCADIA-OPS-002-tooling-rollout\|KI-ARCADIA-OPS-002]] - tooling rollout | draft, next | Obsolete as written |

Already delivered and pruned: harness GOV-092, GOV-095 and RTP-013; Arcadia GOV-012 and GOV-019. The plan findings in the table come from the `state-of-play` review.

Untracked idea, kept here rather than captured: `tools-ki` could add a terminal Granola disposition for meetings dropped without harvest. The ledger has none, so the dropped 2026-10-05 Alec catch-up is recorded as `harvested-locally`.

## Decisions made

- Kris decided on 2026-10-07 to split `baseline-and-cloud` into this thread and `techne`.
- The `state-of-play` pause holds this thread's delivery until Kris releases it.

## Files touched

None beyond this record, renamed from `baseline-and-cloud.md` on 2026-10-07.

## Open questions

- Approve the order below, which Kris has not yet approved?
- Should `KI-ARCADIA-OPS-002` be closed as obsolete or folded into OPS-008?
- Capture the Granola terminal disposition in `tools-ki`, or leave it?

## Next step

Once Kris releases the `state-of-play` pause, repair the small plan defects above, then deliver FND-026, GOV-109 and GOV-117 in order, alongside GOV-115 and RTP-015 in the harness and OPS-008, EXT-003 and ECO-009 in Arcadia. Then run `ki repo audit --estate` to completion and check the released `ki` on every island against the gate.
