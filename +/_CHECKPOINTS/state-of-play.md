---
type: ki-checkpoint
thread: state-of-play
state: active
created_at: 2026-10-06T21:07:00Z
updated_at: 2026-10-06T21:07:00Z
---

# state-of-play

## Objective

Take stock of all in-flight work across the Knowledge Islands repositories (the 21 repositories in the `knowledgeislands` workspace folder, not the wider estate) before any more is started. Too much is in flight to hold in one head, and changes are starting to undo earlier changes. The review must:

1. Inventory every open roadmap record, checkpoint, batch, authorisation, handoff and unprocessed capture.
2. Group the work into a small set of cross-repository themes, so overlap, duplication and reversal become visible.
3. Check each record is specified correctly against its canonical owner (specification, skill standard or Pillar), and identify remedial work where it is not.
4. Check that each checkpoint is being handled correctly: durable facts routed to owners, no roadmap or decision content held only in a checkpoint.
5. Produce one proposed disposition per item (keep, merge, close, respecify, re-sequence) for Kris to approve, then route approved changes through `ki-next`, `ki-plan` and `ki-accept` in each owning repository.

This checkpoint is the single place the review is built up. Every review step and finding is recorded here until it has been routed to its owner. It coordinates the five sibling checkpoints in this directory rather than replacing them.

## Current state

Mechanical inventory, read-only, 2026-10-06 at 23:06 CEST. Records were still changing during the read (`KI-HARNESS-GOV-095` and `KI-TOOL-CLI-108` were written at 23:05), so recheck before acting.

Open roadmap records by repository and status (68 open, 1 done awaiting prune):

| Repository | Draft | Ready | In progress | Awaiting review | Total |
| --- | --- | --- | --- | --- | --- |
| `ki-agentic-harness` | 9 | 18 | 2 | 10 | 39 |
| `ki-arcadia-principal` | 5 | 12 | 0 | 2 | 19 |
| `ki-specifications` | 0 | 3 | 0 | 0 | 3 |
| `ki-website` | 1 | 1 | 0 | 1 | 3 |
| `ki-techne-harness` | 1 | 1 | 0 | 0 | 2 |
| `homebrew-tap` | 1 | 0 | 0 | 0 | 1 |
| `tools-ki` | 1 | 0 | 0 | 0 | 1 |
| 14 other repositories | 0 | 0 | 0 | 0 | 0 |
| **Total** | **18** | **35** | **2** | **13** | **68** |

- **Done, not pruned.** `KI-HARNESS-FND-027` (require audience guide folders).
- **Not in `now`.** Twelve drafts sit in triage, waiting-for, next or future: `BREW-011`, `KI-HARNESS-FND-014`, `KI-HARNESS-GOV-140`, `KI-HARNESS-GOV-141`, `KI-HARNESS-OPS-001`, `KI-ARCADIA-GOV-001`, `KI-ARCADIA-GOV-010`, `KI-ARCADIA-MOD-003`, `KI-ARCADIA-OPS-002`, `TECHNE-TOOLS-OPS-008`, `KI-WEB-SITE-001` and `KI-TOOL-CLI-108`.
- **Themes are not usable as recorded.** The `theme` field carries 16 distinct values across 68 records. In the harness, 30 of 39 records share `governance-consistency`, so the field does not discriminate. Arcadia uses a different vocabulary (`governance`, `knowledge-model`, `operational-tooling`). There is no shared cross-repository taxonomy.
- **Checkpoints.** Five active in Arcadia (`baseline-and-cloud`, `delta-evaluation`, `estate-factorisation`, `paperclip-bootstrap-and-recovery`, `territories-and-trades`); none in any other repository. Their scopes already cross-reference each other, and `baseline-and-cloud` carries a record table that overlaps this inventory.
- **Other in-flight surfaces.** `ki-website` holds batch authorisation `KI-WEB-BATCH-001` and legacy handoff `CLI-006-qualified-repository-declarations`. Arcadia `+/_ACQUIRE/` holds 8 unprocessed captures (7 ChatGPT, 1 Granola). `ki-techne-harness/+/paperclip-as-techne-prior-art.md` is an unpromoted working analysis. No trade files are pending in any `+/_TRADES/`.
- **Outside scope but depended on.** chezmoi `DOTFILES-UE-065` and `DOTFILES-UE-067` are cited by `baseline-and-cloud`.

## Decisions made

- Kris decided on 2026-10-06 to pause and take stock across the Knowledge Islands repositories, building the review in this single checkpoint. For the review's duration it deliberately aggregates in-flight inventory and findings, which checkpoints normally avoid; it stays derived from the owning records and is never their only copy.

## Files touched

None beyond this record.

## Open questions

- Should new capture, adoption and implementation pause across the Knowledge Islands repositories while the review runs, so the inventory stops moving?
- Should the thirteen awaiting-review records be accepted before the thematic review (throughput), or after it (avoid accepting work that conflicts)?
- Should the review propose one shared cross-repository theme taxonomy, recorded in the owning skill, or map to themes only inside this review?
- Once the review completes, should the five sibling checkpoints be folded into this one or each be removed as its scope is routed?
- Should the chezmoi records that Knowledge Islands checkpoints depend on be included in the review?

## Next step

Proposed review method; Kris has not yet approved it.

1. **Per-record read.** Read every open record in full, in three read-only batches (harness, Arcadia, the other five repositories). For each, capture: intended outcome, what it changes, the canonical owner it relies on, dependencies, overlap or conflict with other records, and whether its status and horizon are still true.
2. **Thematic synthesis.** Propose 6 to 10 cross-repository themes, map every record to one, and list duplicates, reversals and superseded items.
3. **Specification check.** For each theme, name the canonical owner (`ki-specifications`, harness skill standards, Arcadia Pillars) and test each record against it; list remedial work where a record or the owner is wrong.
4. **Checkpoint audit.** Run `ki repo audit --skill ki-checkpoint` on Arcadia and judge each of the five checkpoints for durable facts held only there.
5. **Dispositions.** Bring one table of proposed dispositions to Kris; route only approved changes through the owning repositories.
