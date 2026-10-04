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
status: awaiting-review
priority: medium
horizon: now
blocks: []
blocked_by: []
baseline_ref: 0d1a2e0e697a38caf68ad6d1e0e8bb8cd9aa1a22
created_at: 2026-06-29T17:12:25Z
updated_at: 2026-10-04T11:53:14Z
---

# Agentic Tool Documentation Proposal

Document the agentic harness and its connected MCP servers as KB notes, establishing a human-legible map of the tool ecosystem and its relationships to ki-arcadia-principal and ki-website.

## Governance

Follows the [[Admin/Operations/Processes/Enactment Process|Enactment Process]].

---

## Scope

**Phase 1 - Tool notes**: create a KB note in `Pillars/Philosophy/Model/Tools/` for each MCP server that does not yet have one, following the existing tool-note pattern established by [[Tools/Microsoft 365/Microsoft 365|Microsoft 365]] and [[Tools/Claude/Claude|Claude]].

Gaps being filled:

- Git Audit (`mcp-git-audit`) - [[Tools/Git Audit/Git Audit|Git Audit]]
- KB Filesystem (`mcp-ki-kb-fs`) - [[Tools/KB Filesystem/KB Filesystem|KB Filesystem]]
- Notion Mirror (`mcp-kb-notion-mirror`) - [[Tools/Notion Mirror/Notion Mirror|Notion Mirror]]
- Gmail (`mcp-gmail`) - [[Tools/Gmail/Gmail|Gmail]]
- Claude Housekeeping (`mcp-claude-housekeeping`) - [[Tools/Claude Housekeeping/Claude Housekeeping|Claude Housekeeping]]

**Phase 2 - System map**: a note in `Pillars/Technē/` that shows how the harness, MCPs, KB, and website interrelate as a system.

**Phase 3 - Realisation principle**: author `Pillars/Philosophy/Realisation/Arcadia/Arcadia.md` to formally state that ki-website is the public realisation of ki-arcadia-principal and name the current architectural gap.

### Pickup checkpoint - 2026-09-27

Before further implementation, reconcile the current destination branch, linked coordination tasks, and retained worktrees where applicable. Missing evidence does not release ownership or a hold; this checkpoint is guidance, not a mechanical execution block.

- **Observed:** All five tool notes named in Phase 1 are present and non-empty under `Pillars/Philosophy/Model/Tools/`. `Pillars/Technē/Tool Ecosystem Map.md` covers the Phase 2 system map. `Pillars/Philosophy/Realisation/Arcadia/Arcadia.md` covers the Phase 3 publication relationship and describes the remaining source-labelled vendor-path gap.
- **Resolve:** Review those seven notes against the three phase outcomes, especially whether the current framework-level website description supersedes the original wording that called it Arcadia's public realisation. Record any actual content gap here rather than re-creating an existing note.
- **Close:** If the reviewed outputs satisfy the scope, prepare the required delivery review packet and seek owner acceptance through `ki-accept`. Mark this record `done` only after that review; retain the accepted record. Pruning is a separate later owner choice.

## Current state

Reviewed on 2026-10-04 against current repository sources. Phases 2 and 3 are satisfied: [[Tool Ecosystem Map]] covers the system map and defers repository identities to [[Known Lands]]; [[Pillars/Philosophy/Realisation/Arcadia/Arcadia|Arcadia]] describes the website as the framework-level publication with source-labelled vendor paths, which deliberately supersedes the original "public realisation" wording. Phase 1 has a content gap: four of the five tool notes have drifted from their servers.

- **Gmail** names a non-existent `mcp-gmail` server and `gmail_*` tools. Gmail access is now provided by `mcp-gsuite` (Google Workspace), whose tools use the `gsuite_email_*` family alongside Calendar, Drive and Sheets.
- **KB Filesystem** names `kb_note_*` tools; the server now exposes `kb_*` tools over one or more aliased knowledge bases.
- **Notion Mirror** names `mcp-kb-notion-mirror` and `notion_mirror_*` tools; the server is `mcp-ki-kb-notion-mirror` with `kb_notion_mirror_note_*` and `kb_notion_mirror_tree_*` families.
- **Claude Housekeeping** names `mcp-claude-housekeeping`, three `housekeeping_*` tools and a read-only claim; the server is `mcp-housekeeping-claude`, with `claude_desktop_*`, `claude_code_*` and `vscode_*` families and access-gated destructive prune tools.
- **Git Audit** is accurate.

## Steps

- [x] Correct the four drifted tool notes so each states the current repository identity, the tool families by purpose and the access-level model, and points to the repository README as the authoritative tool catalogue rather than duplicating exact tool lists.
- [x] Keep note paths, titles and inbound wikilinks unchanged, use ASCII hyphens and British English, and refresh each note's `status` line to October 2026.
- [x] Align the four matching sections of [[How Tools Connect]] with the corrected notes (added after review round 1).
- [x] Prepare the delivery review packet.

## Files touched

- `Pillars/Philosophy/Model/Tools/Gmail/Gmail.md`
- `Pillars/Philosophy/Model/Tools/KB Filesystem/KB Filesystem.md`
- `Pillars/Philosophy/Model/Tools/Notion Mirror/Notion Mirror.md`
- `Pillars/Philosophy/Model/Tools/Claude Housekeeping/Claude Housekeeping.md`
- `Pillars/Philosophy/Model/Tools/How Tools Connect.md`
- `Streams/Roadmap/KI-ARCADIA-OPS-001-agentic-tool-documentation.md`

## Verify

- Every backticked tool name or tool-family prefix in the four notes occurs in the owning repository's `src/` or README.
- Each note names its canonical repository as listed in [[Known Lands]].
- No em or en dashes in the changed notes; `ki repo audit` passes.

## Dependencies / blocks

None. Notes for the WhatsApp acquisition and ChatGPT or Codex housekeeping servers are out of scope: [[Tool Ecosystem Map]] routes current identities to [[Known Lands]] rather than a per-tool note list.

## Adherence

Follows the [[Enactment Process]]. Content reaches `Pillars/` only once this proposal reaches `ready` status and the enactment process clears it.

## Review

### Delivered

Phase 1 tool-note corrections from immutable baseline `0d1a2e0e697a38caf68ad6d1e0e8bb8cd9aa1a22`, with the Phase 2 and Phase 3 outputs reviewed and found satisfied as recorded under Current state. Excluded: new notes for servers without one, and any change to Git Audit, [[Tool Ecosystem Map]] or [[Pillars/Philosophy/Realisation/Arcadia/Arcadia|Arcadia]].

### Change Summary

- Rewrote the bodies of the Gmail, KB Filesystem, Notion Mirror and Claude Housekeeping notes to name `mcp-gsuite`, `mcp-ki-kb-fs`, `mcp-ki-kb-notion-mirror` and `mcp-housekeeping-claude`, describe tool families by purpose and access level, and link each repository README as the authoritative catalogue.
- Refreshed their `status` lines to October 2026; paths, titles, tags and `note_type` are unchanged.
- Dropped the KB Filesystem remark about Claude Code's Read tool failing on paths with spaces: it described a client quirk rather than the server and is unverified today.
- Corrected the Claude Housekeeping read-only claim: destructive prune tools exist behind the access gate.
- Review round 1 (independent review returned CHANGES): aligned the KB Filesystem, Notion Mirror, Gmail and Claude Housekeeping sections of [[How Tools Connect]] with the corrected notes; replaced em-dashes and arrows in this record's Scope with ASCII hyphens, dropped the stale "(in progress)" label, and pointed the Governance link at the canonical Admin Enactment Process.

### Verification

- Every backticked tool name or family prefix in the four notes was found in its repository's `src/` or README (scripted check, no misses).
- Each named repository matches its [[Known Lands]] identity.
- No em or en dashes in the four notes, How Tools Connect (two further pre-existing em-dashes there were also replaced), or this record. `ki repo audit` passed after review round 1.

### Outstanding concerns

The tool notes still carry the older `source: claude` and dated `status` frontmatter shared by the whole Tools folder, and the folder has no same-name index note; both are pre-existing, folder-wide questions outside this record's scope.

### Post-change review

Scope held to the recorded Phase 1 gap. Inbound wikilinks are unaffected because no note moved or was renamed. Pointing to READMEs for exact tool lists reduces future drift. Ready for acceptance.

### Mini recap

Phases 2 and 3 were already delivered; Phase 1 drift in four notes is corrected. Possible learning route: a folder-wide metadata refresh for `Pillars/Philosophy/Model/Tools/`, not promoted automatically.

## Discussion
