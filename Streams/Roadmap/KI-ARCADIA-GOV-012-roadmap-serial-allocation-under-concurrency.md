---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-012
area: GOV
title: Name roadmap write locus
theme: governance
horizon: now
status: ready
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-26T16:29:58Z
updated_at: 2026-10-06T01:36:00Z
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

- [ ] Add a `## Write locus` section to Streams Conventions stating that every write under `Streams/Roadmap/` (capture, shaping, lifecycle transition, acceptance, prune) is made in this repository's registry-resolved primary checkout, that concurrent writers queue rather than write from isolated checkouts, and that a run in an isolated checkout takes its number and writes its record in the primary checkout.
- [ ] In the same section, state that identifiers are reserved by committing the `_ISSUES.md` advance on its own before writing the record, citing the `ki-work-roadmap` repository-roadmaps standard as the owner of the rule.
- [ ] Update the note's `status` month per its existing convention.

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
