---
note_type: stream-roadmap
id: KI-PRINCIPAL-MOD-006
area: MOD
title: Knowledge acquisition lifecycle
kind: deliver
project: knowledge-acquisition
component: model
tags:
  - topic/knowledge-islands
  - topic/acquisition
status: awaiting-review
priority: medium
horizon: now
blocks: []
blocked_by: []
baseline_ref: 3c8544a21e8a80680ed1669e56a6f9c4f8850bcd
created_at: 2026-08-23T12:33:49Z
updated_at: 2026-10-15T02:20:00Z
---

# Knowledge Acquisition Lifecycle

## Goal

Make the provider-neutral Knowledge Islands acquisition lifecycle operationally clear in one Pillars note, so material from AI sessions and other external sources can enter an island faithfully, be harvested into durable knowledge, and eventually leave its transient source safely.

## Context

[[ADR-KI-PRINCIPAL-001-provider-neutral-knowledge-acquisition|ADR-KI-PRINCIPAL-001]] establishes one lifecycle: discover, acquire, stage, harvest, durable knowledge, then archive or delete source. It requires every adapter to preserve available original content, source identity, timestamps, media as byte-preserved assets, provenance and declared omissions, and to distinguish content-minimised discovery and checkpoint data from faithful source reads. It applies to ChatGPT, Granola, Codex, Claude, Slack, email, documents and future sources; provider mechanics remain below the architectural boundary.

The decision states the architecture but not the operational picture: what a provenance package contains, what checkpoint makes a capture safe to harvest, and how material moves after imperfect routing. Two local evidence sets now exist to derive that picture from observation rather than design: Claude housekeeping as a direct local source and Granola as an export/API-style source, staged since 2026-10-10 in the private `acquire` repository (`krisb/acquire`), which now receives every Granola capture. The installed ChatGPT application has an opaque local session cache, which confirms that discovery, faithful raw acquisition, interpretation and source retirement must remain separate concerns.

## Boundary

- Governs the KI-wide operational model, source-class boundaries and observed provenance evidence only.
- No live provider calls: no `ki acquire` run without `--dry-run`, no Granola API read, no write-level or destructive `mcp-housekeeping-claude` tool. A read-level local housekeeping invocation is permitted only to confirm the documented checkpoint shape.
- Does not implement a provider MCP or `ki acquire` adapter, decrypt or reverse-engineer private provider storage, require perfect initial routing, or mutate, archive or delete any source session or staged capture.
- Does not decide the archive or deletion threshold; that remains a later provider-specific decision.
- No cross-repository write; provider work stays in its owning repository's roadmap. No remote operation under the [[Techne Programme Hold]].

## Current state

- `Admin/Governance/Decisions/ADR-KI-PRINCIPAL-001-provider-neutral-knowledge-acquisition.md` is `status: current` and names `ki acquire import --adapter <provider>` as the repository-context staging operation.
- Export/API evidence, in the `acquire` repository: `.acquire/granola/ledger.json` (schema 3) records adapter, provider, hashed account identity, source-schema and identity-checkpoint SHA-256 values, the acquisition interval, `exhaustive: true` and per-window counts with response hashes. Each staged capture is a folder `captures/<territory>/granola/<date>--<slug>--<source_id>/` holding `meeting.md`, `routing.json` and `source-variants/`; `meeting.md` carries `source_id`, `acquired_at`, `transcript_state`, `transcript_observed_at`, folder membership and an explicit `omissions` list, and the ledger keeps per-meeting `document_sha256`, `detail_sha256`, `transcript_sha256`, versions and harvest disposition. The 2026-10-10 consolidation from the former per-island Harbours, including this island's, is proven by `.acquire/granola/migration/2026-10-10/manifest.json` and per-source ledgers. This island's `+/_ACQUIRE/granola/` is retired.
- Direct local evidence: `mcp-housekeeping-claude` exposes read-level `claude_code_sessions_discover`, `claude_code_sessions_list`, `claude_code_sessions_checkpoint` (content-minimised, provenance-preserving, writes nothing) and `claude_code_session_read`; access defaults to `read`. Its README in the `mcp-housekeeping-claude` repository is the authoritative tool catalogue.
- Asymmetry observed at planning: `tools-ki` `src/core/acquire/` ships only `granola` and `chatgpt` adapters, so the Claude source is evidenced at discovery and checkpoint level, not as a Harbour-staged capture. AI session acquisition is in flight in `ki-agentic-harness`.
- No Pillars note describes the lifecycle operationally; `Pillars/Philosophy/Model/Processes/` holds [[How Change Happens]] and the Enactment and Contribution processes.

## Steps

- [x] Re-read [[ADR-KI-PRINCIPAL-001-provider-neutral-knowledge-acquisition|ADR-KI-PRINCIPAL-001]], the `acquire` repository's `.acquire/granola/ledger.json` and migration manifest, two or three staged Granola `meeting.md` captures, and the `mcp-housekeeping-claude` README and checkpoint tool source; optionally run one read-level `claude_code_sessions_checkpoint` scoped to this repository.
- [x] Tabulate the provenance fields each source actually provides against the ADR's required set (original content, source identity, timestamps, assets, provenance, omissions, content hash, repository context), marking absent fields honestly.
- [x] Choose the note's folder under `Pillars/Philosophy/Model/` (likely `Processes/Acquisition Process/`) and create the note plus its same-name index if a new folder is needed, following the index-note rule.
- [x] Write the note: the six lifecycle stages with an owner per stage; the common provenance package; the harvest checkpoint as observed (source identity, timestamps, content hash, declared omissions); imperfect-routing handling (move within the Harbour or to another island without rewriting acquisition evidence); and source retirement stated as open, requiring a later provider-specific decision.
- [x] Cite both evidence sets by path and record the Claude staging asymmetry as an observed gap, not a design choice.
- [x] Add the note to its parent index with a two-to-four-sentence section.
- [x] Compare the observed checkpoint with [[ADR-KI-PRINCIPAL-001-provider-neutral-knowledge-acquisition|ADR-KI-PRINCIPAL-001]]; amend the ADR in place only if the evidence contradicts it, otherwise leave it unchanged and say so in the review packet.
- [x] Prepare the review packet and set the record to `awaiting-review`.

## Files touched

- New note and, if a folder is created, its index under `Pillars/Philosophy/Model/` (folder chosen at implementation, likely `Pillars/Philosophy/Model/Processes/Acquisition Process/Acquisition Process.md`).
- Parent index: `Pillars/Philosophy/Model/Processes/Processes.md` (or `Pillars/Philosophy/Model/Model.md` if placed elsewhere).
- Conditional: `Admin/Governance/Decisions/ADR-KI-PRINCIPAL-001-provider-neutral-knowledge-acquisition.md`, only if the evidence contradicts it.
- This record.

## Verify

- The note cites the `acquire` repository's `.acquire/granola/ledger.json`, at least one staged Granola capture, and the `mcp-housekeeping-claude` checkpoint tool by path or name.
- The note states that the archive and deletion threshold is undecided.
- `git -C <acquire checkout> status --short -- captures .acquire` is unchanged by delivery: no staged capture or ledger changed.
- No `ki acquire` command ran without `--dry-run` and no non-read housekeeping tool was invoked (stated in the review packet).
- `grep -nP '[\x{2013}\x{2014}]' <new note paths>` returns nothing (ASCII hyphens only).
- `ki repo audit --skill ki-repo-kb --repo . --progress never` PASS.
- `ki repo audit --progress never` PASS.

## Dependencies / blocks

No local build-order dependency. Evidence comes from read-only inspection of the `acquire` repository's Granola captures and the read-level contract of `mcp-housekeeping-claude`. `ki-agentic-harness`'s AI session acquisition work may later supply a Harbour-staged Claude capture; this record does not wait for it, and the note can be refreshed when it lands. That harness work also carries an isolated browser trial, beginning with ChatGPT acquisition. It belongs to the same acquisition cluster as this record, but neither blocks the other, so it appears in neither `blocks` nor `blocked_by`.

## Documentation impact

### Decision Records

[[ADR-KI-PRINCIPAL-001-provider-neutral-knowledge-acquisition|ADR-KI-PRINCIPAL-001]] is amended in place only if the observed evidence contradicts it; otherwise no Decision Record changes. No new decision is needed for an operational description of an existing decision.

### Specifications

None now. A portable acquisition specification belongs in `ki-specifications` once two source mechanisms are both Harbour-staged through a common record; the Claude asymmetry means that threshold is not yet met.

### Guides

The new Pillars note is the island's operational explanation. Operator procedure for `ki acquire` stays with `tools-ki`.

### Roadmap

A later provider-specific record will be needed for the archive or deletion threshold. If the Claude staging gap persists after the harness's AI session acquisition lands, capture it as a separate Triage item rather than widening this one.

## Review

### Delivered

The Acquisition Process note under `Pillars/Philosophy/Model/Processes/Acquisition Process/`, with a section in the parent `Processes.md`. Excluded as bounded: any `acquire` change, adapter work, retirement threshold. Baseline `3c8544a21e8a80680ed1669e56a6f9c4f8850bcd`.

### Change Summary

- New `Pillars/Philosophy/Model/Processes/Acquisition Process/Acquisition Process.md`: six stages with owners, evidence from `acquire` (ledger, migration manifest, one HNR capture) and `mcp-housekeeping-claude` (checkpoint schema), a provenance table with absent fields marked, the harvest checkpoint as observed, imperfect routing, open retirement, and the Claude staging gap.
- `Processes.md`: overview sentence updated and an Acquisition Process section added.
- The `acquire` checkout is at `/Users/krisbrown/workspaces/personal/acquire` (not under `knowledge-islands/`). Deviation: the optional live `claude_code_sessions_checkpoint` run was skipped; the schema was read from source.
- ADR-KI-PRINCIPAL-001 left unchanged. Observation: it names staging in the receiving island's `+` Harbour, whereas Granola now stages in the shared `acquire` repository. This is a possible drift, not a contradiction of the six-stage model; left for an owner decision.

### Verification

- Dash grep on the new note: clean.
- `acquire` `git status --short -- captures .acquire`: unchanged (empty before and after).
- No `ki acquire` command ran and no non-read housekeeping tool was invoked.
- `ki repo audit --skill ki-repo-kb` and `ki repo audit`: both report FAIL, none of them on files from this delivery. Failures are other sessions' `+/_THREADS/` files (malformed frontmatter in two reports; unlinked record identifiers in two `ways-of-working` reports). No finding names the new note, `Processes.md` or this record.

### Outstanding concerns

The two audit gates are not PASS because of the unrelated thread files above. The ADR Harbour wording may need a decision.

### Post-change review

Goal met: one Pillars note gives the operational lifecycle. Scope held. Regression risk is low (new note plus an index section). Acceptance readiness depends on the owner accepting the audit failures as not caused by this work.

### Mini recap

Delivered the lifecycle note, kept the ADR as is, and found that the ADR's Harbour wording lags the `acquire` consolidation. Proposed learning route: a possible ADR amendment record if the owner confirms.

## Discussion

### Decisions under delegated autonomy

Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: the direct local source is Claude housekeeping (`mcp-housekeeping-claude`, read level only) and the export/API source is Granola as already staged in `+/_ACQUIRE/granola/` with `ledger.json`. Repointed 2026-10-14 at the owner's instruction: those captures moved to the private `acquire` repository on 2026-10-10, so the evidence set is now its `.acquire/granola/` ledger and `captures/*/granola/` folders; reading another repository is read-only evidence, not a cross-repository write.

Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: the harvest checkpoint is source identity plus timestamps plus content hash plus declared omissions, documented as observed rather than prescribed.

Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: the archive and deletion threshold is explicitly left open, and [[ADR-KI-PRINCIPAL-001-provider-neutral-knowledge-acquisition|ADR-KI-PRINCIPAL-001]] is amended only if the evidence contradicts it.

### Owner question resolved (2026-10-05)

The 2026-10-04 question (which two sources prove the provenance package, and whether hash, identity, timestamps and omissions suffice) is resolved by the delegated decisions above, using existing local evidence instead of live end-to-end provider runs.

### Knowledge acquisition, not session archiving

A source-session browser is useful only because it makes transient working state visible. The destination is durable island knowledge after review and harvesting, not a permanent second archive of every source conversation.

### Faithful first capture

The first operation must favour preservation over interpretation. Opaque source records and unavailable media remain valid acquisition evidence when their bytes, identity, timestamps and omissions are retained honestly. A later adapter may improve interpretation without rewriting the original acquisition evidence.

### Source retirement

Archive and deletion require a later, provider-specific safety decision. Successful discovery, staging, or even harvesting alone does not authorise source mutation.

### Dependencies by owner

`tools-ki` owns repository-context staging. Provider MCPs and local, API and export adapters own discovery and source reads. `ki-agentic-harness` owns reusable provider-facing skills and their paired adapter surfaces. Individual provider work stays in the owning repository's roadmap.
