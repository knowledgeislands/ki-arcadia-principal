---
note_type: stream-roadmap
id: KI-ARCADIA-OPS-001
area: OPS
title: Agentic tool documentation
theme: operational-tooling
tags:
  - topic/knowledge-islands
  - topic/documentation
  - topic/ai
status: draft
priority: medium
horizon: now
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-06-29T17:12:25Z
updated_at: 2026-09-27T22:02:31Z
---

# Agentic Tool Documentation Proposal

Document the agentic harness and its connected MCP servers as KB notes, establishing a human-legible map of the tool ecosystem and its relationships to ki-arcadia-principal and ki-website.

## Governance

Follows the [[Philosophy/Model/Processes/Enactment Process|Enactment Process]].

---

## Scope

**Phase 1 — Tool notes** (in progress): create a KB note in `Pillars/Philosophy/Model/Tools/` for each MCP server that does not yet have one, following the existing tool-note pattern established by [[Tools/Microsoft 365/Microsoft 365|Microsoft 365]] and [[Tools/Claude/Claude|Claude]].

Gaps being filled:

- Git Audit (`mcp-git-audit`) → [[Tools/Git Audit/Git Audit|Git Audit]]
- KB Filesystem (`mcp-ki-kb-fs`) → [[Tools/KB Filesystem/KB Filesystem|KB Filesystem]]
- Notion Mirror (`mcp-kb-notion-mirror`) → [[Tools/Notion Mirror/Notion Mirror|Notion Mirror]]
- Gmail (`mcp-gmail`) → [[Tools/Gmail/Gmail|Gmail]]
- Claude Housekeeping (`mcp-claude-housekeeping`) → [[Tools/Claude Housekeeping/Claude Housekeeping|Claude Housekeeping]]

**Phase 2 — System map**: a note in `Pillars/Technē/` that shows how the harness, MCPs, KB, and website interrelate as a system.

**Phase 3 — Realisation principle**: author `Pillars/Philosophy/Realisation/Arcadia/Arcadia.md` to formally state that ki-website is the public realisation of ki-arcadia-principal and name the current architectural gap.

### Pickup checkpoint - 2026-09-27

Before further implementation, reconcile the current destination branch, linked coordination tasks, and retained worktrees where applicable. Missing evidence does not release ownership or a hold; this checkpoint is guidance, not a mechanical execution block.

- **Observed:** All five tool notes named in Phase 1 are present and non-empty under `Pillars/Philosophy/Model/Tools/`. `Pillars/Technē/Tool Ecosystem Map.md` covers the Phase 2 system map. `Pillars/Philosophy/Realisation/Arcadia/Arcadia.md` covers the Phase 3 publication relationship and describes the remaining source-labelled vendor-path gap.
- **Resolve:** Review those seven notes against the three phase outcomes, especially whether the current framework-level website description supersedes the original wording that called it Arcadia's public realisation. Record any actual content gap here rather than re-creating an existing note.
- **Close:** If the reviewed outputs satisfy the scope, prepare the required delivery review packet and seek owner acceptance through `ki-accept`. Mark this record `done` only after that review; retain the accepted record. Pruning is a separate later owner choice.

## Adherence

Follows the [[Enactment Process]]. Content reaches `Pillars/` only once this proposal reaches `ready` status and the enactment process clears it.
