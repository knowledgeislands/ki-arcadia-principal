---
type: stream-proposal
tags:
  - topic/knowledge-islands
  - topic/documentation
  - topic/ai
status: active
---

# Agentic Tool Documentation

Document the agentic harness and its connected MCP servers as KB notes, establishing a human-legible map of the tool ecosystem and its relationships to arcadia-principal and arcadia-website.

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

**Phase 3 — Realisation principle**: author `Pillars/Philosophy/Realisation/Arcadia/Arcadia.md` to formally state that arcadia-website is the public realisation of arcadia-principal and name the current architectural gap.

## Adherence

Follows the [[Enactment Process]]. Content reaches `Pillars/` only once this proposal reaches `ready` status and the enactment process clears it.
