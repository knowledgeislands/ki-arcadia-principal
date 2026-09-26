---
note_type: stream-roadmap
id: KI-ARCADIA-OPS-010
area: OPS
title: Repair Granola capture note metadata
theme: operational-tooling
horizon: triage
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-26T16:26:40Z
updated_at: 2026-09-26T16:26:40Z
---

# Repair Granola Capture Note Metadata

This record is a discussion proposal captured from an audit observation. It is not accepted, prioritised, or implementation authority.

## Goal

Decide whether the two staged Granola captures should be relabelled in place or whether the acquisition staging area should be delegated out of the note-type rule, then apply the chosen resolution so `ki repo audit --skill ki-repo-kb` returns a clean result.

## Context

`ki repo audit` on 2026-09-26 reported `explicit note type metadata (NOTE-1c)` against two files:

- `+/_ACQUIRE/granola/2026-07-28--catch-up-w-alec--e8fbfc78-dc6c-448c-9ce0-d262c3316499.md`
- `+/_ACQUIRE/granola/2026-08-24--ancient-civilizations-insights--3989eee1-0033-4a72-b0f7-a37ec3b60834.md`

Each is flagged twice, for a missing `note_type` and for a legacy `type` field. Both carry `type: granola-meeting` in frontmatter, which is the classifier the acquisition adapter wrote, alongside faithful provenance fields: `source`, `source_id`, `acquired_at`, `detail_sha256`, `transcript_sha256`, `folders`, `participants`, and an explicit `omissions` list. A sibling `ledger.json` holds the capture checkpoint.

The root cause is a gap rather than a typo. NOTE-1c delegates metadata classification to the owning skill for `Streams/Roadmap/**`, `Streams/Housekeeping/**`, direct batch records under `+/_BATCHES/`, active `+/_CHECKPOINTS/<thread>.md`, and peer-qualified `TRD-*.md` records, but it does not delegate `+/_ACQUIRE/**`. The `ki-repo-kb` frontmatter standard does not mention `+/_ACQUIRE` at all, and its note-type registry is location-constrained, so there is no published note type that a Granola capture in that path is expected to declare.

## Boundary

This record covers the two staged captures in this repository and the local decision about how acquisition captures should be classified. It does not edit the acquisition adapter, change the NOTE-1c delegation list in `ki-agentic-harness`, rewrite provenance fields or hashes, re-run acquisition, harvest the captures into durable knowledge, or retire the source meetings.

## Discussion

### Two candidate resolutions

The narrow fix renames `type` to `note_type` in both files, which needs a registry-valid value and a path pattern that admits it, and therefore probably needs the registry extended first. The structural fix adds `+/_ACQUIRE/**` to the paths NOTE-1c delegates, on the same reasoning that already exempts batches and checkpoints: the adapter owns the capture schema, and a faithful raw capture should not be reshaped to satisfy a KB note rule. The structural fix belongs to `ki-agentic-harness` and would be a handoff, recorded reciprocally, rather than local work.

### Do not reshape a capture to satisfy a checker

Under [[Streams/Roadmap/KI-ARCADIA-MOD-006-knowledge-acquisition-lifecycle|KI-ARCADIA-MOD-006]] and ADR-KI-ARCADIA-001, the first acquisition operation favours preservation over interpretation, and a later adapter may improve interpretation without rewriting the original evidence. Whichever resolution is chosen, the provenance fields, hashes, and `omissions` list stay exactly as acquired.

### Relationship to harvesting

These two captures are also unharvested: nothing yet extracts them into durable knowledge. That is `KI-ARCADIA-MOD-006` territory and is deliberately out of scope here, so this record does not become a cover for the wider lifecycle work.

### Verification

`ki repo audit --skill ki-repo-kb` is the gate, and it currently fails only on this finding.
