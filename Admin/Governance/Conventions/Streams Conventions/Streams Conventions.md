---
note_type: admin/governance/convention
tags:
  - card/note
  - topic/knowledge-islands
status: current - October 2026
author: Mixed
---

# Streams Conventions

Conventions specific to the `Streams/` zone - how flat roadmap records and recurring-work runs are routed and named.

## Structure

`Streams/Roadmap/` holds flat finite work records. Recurring obligations are Activity notes in the configured collection, currently `Admin/Operations/Activities/`. Opted-in housekeeping Activities create ordinary roadmap runs when due. Horizon and lifecycle are frontmatter metadata, so Streams has no Focus, priority, or completion folders.

## Write locus

Every write under `Streams/Roadmap/` - capture, shaping, lifecycle transition, acceptance, or prune - is made in this repository's primary checkout as resolved by the local `ki` registry, which owns its physical path. Concurrent writers queue for that checkout rather than writing roadmap records from isolated checkouts. A run that delivers its work in an isolated checkout takes its number and writes its record in the primary checkout.

Identifiers are reserved by committing the `_ISSUES.md` high-water mark advance on its own before the record is written; nothing else reserves a number. The rule and its rationale are owned by the repository-roadmaps standard of `ki-work-roadmap` in `ki-agentic-harness` (`### Number reservation` and `### Roadmap write locus`); this section names only Arcadia's locus.

## Authority

The canonical container and routing are defined by `ki-repo-kb-streams`. `ki-repo-kb-activities` owns Activity definitions; `ki-work-housekeeping` owns opted-in recurrence. The shared change-management skills own record lifecycle, planning, delivery, review, and closure.
