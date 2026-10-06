---
type: ki-checkpoint
thread: state-of-play
state: active
created_at: 2026-10-06T21:07:00Z
updated_at: 2026-10-06T21:20:00Z
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
- **Outside scope but depended on.** chezmoi `DOTFILES-UE-067` (serve Observatory under launchd, awaiting review) and `DOTFILES-UE-065` (diagnose same-boot mcporter stall, draft) are cited by `baseline-and-cloud` for the laptop's standing load.

Records approved for acceptance and pruning (approval given 2026-10-06; not yet actioned):

| Repository | Records |
| --- | --- |
| `ki-agentic-harness` | `GOV-092` align generated normal forms, `GOV-095` align roadmap diagnostics, `GOV-096` detect zero-match generators, `GOV-098` render every derived signal, `GOV-100` report push as action, `GOV-105` state ordering in ledger, `GOV-112` apply September source refreshes, `GOV-124` review artefact idempotence, `GOV-129` reconcile separate Git indexes, `RTP-013` route portable skill doctrine; prune `FND-027` (already done) |
| `ki-arcadia-principal` | `GOV-012` name roadmap write locus, `GOV-019` align the veto wording with the current layout |
| `ki-website` | `SITE-042` auto-accept verified tool versions |

Checkpoint conformance, reported by each owning thread on 2026-10-06. All five pass `ki repo audit --skill ki-checkpoint` mechanically; four fail on judgement, and no mechanical check catches any of those failures:

| Checkpoint | Judgement failures | Owning thread's proposed fix (not done) |
| --- | --- | --- |
| `territories-and-trades` | About 900 words, not concise. Only copy of the proposed trade-config format. Related-items list makes it act as a roadmap | Move the proposal and related items into a draft Arcadia roadmap record; cut the checkpoint to a short snapshot pointing at it |
| `estate-factorisation` | Acts as a work tracker: 13 factorisation items have no work records, so their status table and phase detail exist only here. `updated_at` (21:00Z, set in `3548852`) is later than a subsequent commit's write (20:47Z) | Capture the items through `ki-next` in their owning repositories; correct the timestamp |
| `paperclip-bootstrap-and-recovery` | About 1,200 words. Standing constraints (ticket-status freeze, pilot scope, login position) held only in "Decisions made". "Next step" is an 11-item to-do list | Move the constraints to the harness coordination skill or an Arcadia decision record; give the to-do items roadmap records; cut "Next step" to a single resumable action |
| `baseline-and-cloud` | Thread name was chosen by an agent at Kris's request, not by Kris (RECORD-1). Otherwise points to owners rather than copying | Kris confirms or renames |
| `delta-evaluation` | No report received yet | - |

Gaps in the checkpoint standard and audit, raised by those threads:

- The audit does not warn on length, list-heavy "Next step" sections, decisions held only in the checkpoint, or untracked work.
- The audit does not compare `updated_at` with commit time.
- The standard has no position on a checkpoint used as the "single place to look" for a thread, which is how Kris wants to use them; it conflicts with the rule that checkpoints only point to owners.

## Decisions made

- Kris decided on 2026-10-06 to pause and take stock across the Knowledge Islands repositories, building the review in this single checkpoint. For the review's duration it deliberately aggregates in-flight inventory and findings, which checkpoints normally avoid; it stays derived from the owning records and is never their only copy.
- Other work across the Knowledge Islands repositories is paused while the review runs.
- The thirteen awaiting-review records are to be accepted, and those with `FND-027` pruned, to start from a clean sheet.
- The review's themes are the checkpoint threads: `baseline-and-cloud`, `delta-evaluation`, `estate-factorisation`, `paperclip-bootstrap-and-recovery` and `territories-and-trades`. Every open record maps to one of them; a record that fits none is itself a finding.
- Linear and TickTick are out of scope.

## Files touched

None beyond this record.

## Open questions

- Should the two chezmoi records be included in the review under `baseline-and-cloud`?
- Should the checkpoint standard allow the "single place to look" use, or should the audit warn on length, list-heavy "Next step" sections and checkpoint-only decisions? This needs a harness record either way.
- Is `baseline-and-cloud` the name Kris wants for that thread?
- Once the review completes, should the sibling checkpoints be folded into this one or each be removed as its scope is routed?

## Next step

Nothing runs until Kris has read this record and directs the next action. Proposed order:

1. **Clean sheet.** Accept the thirteen awaiting-review records through `ki-accept` in their owning repositories, then prune them and `FND-027`.
2. **Per-record read.** Read every remaining open record in full and capture its intended outcome, canonical owner, dependencies, overlaps or conflicts, and whether its status and horizon are still true.
3. **Map to themes.** Assign each record to one checkpoint thread; list duplicates, reversals, superseded items and records that fit no thread.
4. **Specification check.** Test each record against its canonical owner and list remedial work.
5. **Checkpoint remediation.** Apply the owning threads' proposed fixes once Kris approves them, and capture the standard and audit gaps as a harness record.
6. **Dispositions.** Bring one table of proposed dispositions to Kris; route only approved changes through the owning repositories.
