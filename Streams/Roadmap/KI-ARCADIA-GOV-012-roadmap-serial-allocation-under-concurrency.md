---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-012
area: GOV
title: Name roadmap write locus
theme: governance
horizon: now
status: done
blocks: []
blocked_by: []
baseline_ref: 56f2d132546414c25cc1c63841e76584f05c971d
created_at: 2026-09-26T16:29:58Z
updated_at: 2026-10-06T21:19:43Z
---

# Name Roadmap Write Locus

## Goal

Arcadia's Streams Conventions name where roadmap writes happen and how identifiers are reserved, so that two agents working at once cannot silently allocate the same roadmap identifier.

---

## Context

On 2026-09-26 two sessions wrote to `Streams/Roadmap/` within minutes of each other. The `ECO` high-water mark moved from 002 to 005 while the other session's capture was in flight, and `KI-ARCADIA-ECO-003-disposition-mcp-and-tools-roadmaps.md` was committed as `a384642` during a single recap. A second session captured `KI-ARCADIA-GOV-011` and `KI-ARCADIA-OPS-010` in `efd646a` and had to re-read the ledger immediately before editing to avoid a stale serial.

No collision occurred, but the hazard is structural: `_ISSUES.md` holds every area's counter, so a read-modify-write by one agent can drop a row another advanced moments earlier, and a regression is silent - the table still parses and the next allocation reuses a live identifier.

The structural fix has since landed in the shared standard. `ki-agentic-harness` commit `db4635d0` (2026-09-26, "order roadmap number reservation before the record") changed `ki-work-roadmap`'s `standards-repository-roadmaps.md` so that the `_ISSUES.md` advance is committed on its own before the record is written (`### Number reservation`), and every write under the roadmap directory is serialised through one designated writing checkout per repository (`### Roadmap write locus`). The same commit aligned `ki-next`, `ki-repo-kb-streams` and the Paperclip coordination standard. What remains for Arcadia is to name its own write locus in its local convention.

---

## Boundary

- Edit only `Admin/Governance/Conventions/Streams Conventions/Streams Conventions.md`; `Streams/Roadmap/_ISSUES.md` is not touched.
- Name the write locus as the registry-resolved primary checkout of this repository, without recording a physical path; the local `ki` registry owns physical paths.
- Reference the shared reservation ordering rather than restating it; `ki-work-roadmap` in `ki-agentic-harness` remains its owner.
- No change to the `ki` CLI, shared skills or worktree policy, and no cross-repository write.

---

## Current state

- `Admin/Governance/Conventions/Streams Conventions/Streams Conventions.md` has `## Structure` and `## Authority` sections and says nothing about write locus, reservation or concurrent writers.
- `ki-agentic-harness/skills/change-management/ki-work-roadmap/references/standards-repository-roadmaps.md` carries `### Number reservation` and `### Roadmap write locus` from `db4635d0`.
- Root `AGENTS.md` already directs ordinary interactive work to the primary checkout and commits of explicit paths only.

---

## Steps

- [x] Add a `## Write locus` section to Streams Conventions stating that every write under `Streams/Roadmap/` (capture, shaping, lifecycle transition, acceptance, prune) is made in this repository's registry-resolved primary checkout, that concurrent writers queue rather than write from isolated checkouts, and that a run in an isolated checkout takes its number and writes its record in the primary checkout.
- [x] In the same section, state that identifiers are reserved by committing the `_ISSUES.md` advance on its own before writing the record, citing the `ki-work-roadmap` repository-roadmaps standard as the owner of the rule.
- [x] Update the note's `status` month per its existing convention. Already `current - October 2026` at baseline, so no edit was needed.

---

## Files touched

- `Admin/Governance/Conventions/Streams Conventions/Streams Conventions.md`
- this record

---

## Verify

- `grep -n "## Write locus" "Admin/Governance/Conventions/Streams Conventions/Streams Conventions.md"` finds the section, and it names the registry-resolved primary checkout without a physical path (`grep -n "/Users/"` on the note returns nothing).
- `git diff --quiet <baseline> -- Streams/Roadmap/_ISSUES.md` succeeds.
- `ki repo audit --skill ki-repo-kb-streams --repo . --progress never` PASS.
- `ki repo audit --progress never` PASS.

---

## Dependencies / blocks

No dependency. The shared rule this convention points to already landed in `ki-agentic-harness` at `db4635d0`, so the handoff contemplated at capture is unnecessary.

---

## Documentation impact

### Decision Records

None. The rule is owned by the shared `ki-work-roadmap` standard; Arcadia only names its own locus.

### Specifications

None locally. The authoritative reservation ordering and write-locus rule are in `ki-agentic-harness` `standards-repository-roadmaps.md`.

### Guides

Streams Conventions gains a `## Write locus` section.

### Roadmap

This record moves to awaiting-review on delivery; no follow-up record is expected.

---

## Review

### Delivered

Arcadia's Streams Conventions now name the roadmap write locus and point to the shared reservation rule, within the approved boundary: one note edited, no physical path, `_ISSUES.md` untouched, no shared-skill or CLI change. Baseline `56f2d132546414c25cc1c63841e76584f05c971d`; the delivery lands in the commit that carries this review.

### Change Summary

- `Admin/Governance/Conventions/Streams Conventions/Streams Conventions.md`: new `## Write locus` section between `## Structure` and `## Authority`. Paragraph one names the registry-resolved primary checkout as the locus for every roadmap write, has concurrent writers queue, and sends isolated-checkout runs to the primary checkout for their number and record. Paragraph two states reservation by a standalone `_ISSUES.md` commit and cites `ki-work-roadmap`'s repository-roadmaps standard (`### Number reservation`, `### Roadmap write locus`) as owner.
- The note's `status` already read `current - October 2026`, so it was not changed.
- This record: steps ticked, lifecycle advanced, review packet added.

### Verification

- `grep -n "## Write locus"` on the note finds line 18; `grep -n "/Users/"` returns nothing; no em or en dashes.
- `git diff --quiet 56f2d132546414c25cc1c63841e76584f05c971d -- Streams/Roadmap/_ISSUES.md` succeeds.
- `ki repo audit --skill ki-repo-kb-streams --repo . --progress never` PASS.
- `ki repo audit --repo . --progress never --concise` PASS, 24 skills.

### Outstanding concerns

None.

### Post-change review

A Fable reviewer (2026-10-06) approved with no blocking or should-fix findings: every Step satisfied, Boundary held, wording faithful to the shared standard. Of three nits, the self-descriptive closing clause was tightened and the status step was annotated; the suggestion to name the standard's file path was not taken, because the section headings already locate it. Regression risk is negligible: the change is additive convention text that matches practice already required by root `AGENTS.md`.

### Mini recap

Arcadia now names its own write locus, completing the local half of the harness `db4635d0` change. No learning to promote.

---

## Done

Accepted 2026-10-06 by Kris Brown on the review packet above.

## Discussion

### Decisions under delegated autonomy

- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: the structural fix is taken as already landed in harness `db4635d0`, leaving only the local convention text as Arcadia's deliverable.
- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: the write locus is named as the registry-resolved primary checkout, with no physical path in public governance.

### Options considered at capture

Three options were compared: enforce one writer per checkout and treat the ledger as needing no further protection; require surgical single-row edits to `_ISSUES.md`, which is what saved the 2026-09-26 case; or derive the high-water mark from record filenames and demote the table to a cached view. The shared standard chose a fourth: commit the ledger advance first, in one designated writing checkout. That removes the window between reading and publishing without removing the ledger, which the estate relies on to remember pruned identifiers.

### Handoff no longer needed

Capture noted that a change to how the ledger is defined would belong to `ki-repo-kb-streams` in `ki-agentic-harness` as a reciprocal handoff. The harness made that change itself on the same day, so no handoff is raised.

### Scope confirmed narrow (2026-10-06)

The 2026-10-06 roadmap consolidation confirmed that the shared reservation and write-locus rule is owned by `ki-work-roadmap` in `knowledgeislands/ki-agentic-harness` from `db4635d0`, so this record's deliverable is only the local `## Write locus` text in Streams Conventions. The title was shortened from "Make roadmap serial allocation safe under concurrent writers" to the four-word limit and now names that narrowed deliverable; the identifier and slug are unchanged.
