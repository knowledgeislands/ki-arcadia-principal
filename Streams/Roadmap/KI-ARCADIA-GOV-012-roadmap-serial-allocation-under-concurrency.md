---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-012
area: GOV
title: Make roadmap serial allocation safe under concurrent writers
theme: governance
horizon: triage
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-26T16:29:58Z
updated_at: 2026-09-26T16:29:58Z
---

# Make Roadmap Serial Allocation Safe Under Concurrent Writers

This record is a discussion proposal captured from a live observation. It is not accepted, prioritised, or implementation authority.

## Goal

Decide how two agents working in this checkout at the same time should allocate roadmap identifiers without either silently overwriting the other's high-water mark in `Streams/Roadmap/_ISSUES.md`.

## Context

On 2026-09-26 two sessions wrote to `Streams/Roadmap/` within minutes of each other. The `ECO` high-water mark moved from 002 to 005 while the other session's capture was in flight, and `KI-ARCADIA-ECO-003-disposition-mcp-and-tools-roadmaps.md` appeared and was committed as `a384642` during a single recap. A second session captured `KI-ARCADIA-GOV-011` and `KI-ARCADIA-OPS-010` in commit `efd646a` and had to re-read the ledger immediately before editing to avoid allocating a stale serial.

No collision occurred, but only because the two sessions happened to be working in different areas and each edited a single table row. The hazard is structural: `_ISSUES.md` is one file holding every area's counter, so any read-modify-write of it by one agent can drop a row another agent advanced moments earlier. The `ki-next` capture rule already requires re-reading the applicable scope immediately before writing and reallocating if the mark moved, which contains the read side. It does not stop a whole-table rewrite from regressing a peer's row.

The wider working convention says one writer per checkout. That is the real control, and this record exists because the convention was not in force in practice on the day.

## Boundary

This record covers identifier allocation for this repository's `Streams/Roadmap/` ledger. It does not redesign the roadmap record model, change the `ki-next` capture procedure or the `ki-repo-kb-streams` container standard in `ki-agentic-harness`, introduce locking into the `ki` CLI, or settle the wider question of worktrees for concurrent agents.

## Discussion

### The cheapest resolutions may be sufficient

Three options are worth comparing before anything is built. Enforce one writer per checkout and treat the ledger as needing no further protection. Or require surgical single-row edits to `_ISSUES.md`, never a whole-table rewrite, which is what actually saved the 2026-09-26 case. Or derive the high-water mark from the record filenames on disk at allocation time and demote the table to a cached view, which removes the shared mutable counter altogether.

### A regression here is silent

A dropped high-water row does not fail an audit: the table still parses, the affected area simply looks lower than it is, and the next allocation reuses a live identifier. Two records then share an ID, which is the kind of corruption that is discovered much later and by reading, not by a gate. That asymmetry argues for the option that removes the shared counter rather than the one that documents care around it.

### Possible handoff

If the resolution changes how the ledger is defined rather than how this repository edits it, the change belongs to `ki-repo-kb-streams` in `ki-agentic-harness` and should be recorded as a reciprocal handoff under the cross-repository convention in `AGENTS.md`. Nothing has been written to that repository from this record.
