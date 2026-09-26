---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-003
area: ECO
title: Disposition the MCP and tools roadmap backlog
theme: ecosystem-coordination
horizon: now
status: draft
blocks: []
blocked_by: []
baseline_ref: 95f85a1a14ab9ff2834fe6d4f32355754e6de708
created_at: 2026-09-26T16:22:01Z
updated_at: 2026-09-26T16:22:01Z
---

# Disposition the MCP and Tools Roadmap Backlog

## Goal

Bring the MCP server and tools repositories to a clean roadmap by giving each of the twenty-one records that now wait on an owner decision its terminal disposition: accept the fourteen delivered records, and settle the seven conformance-audit proposals that were opened but never adopted.

## Context

A batch across ten repositories delivered two duplicate roadmap families as coordinated sets on 2026-09-22: the migration to the `2026-07-28` MCP protocol profile in five servers, and audience-centric guide collections in ten repositories. Every record was delivered, verified against its repository's own gates, committed, and subsequently pushed. None was closed, because closure needs the owner's approval and none has been given.

A third family was proved already resolved rather than delivered. Seven repositories carry a near-identical `review conformance audit` proposal, each written as a discussion item that explicitly disclaims implementation authority. Full `ki repo audit` runs over all seven passed, so the condition each proposal was opened to investigate no longer holds. Each record states that it stays an unadopted draft until it receives an exact human-approved terminal Triage disposition.

Without that decision the backlog reads as twenty-one open items when the underlying work is finished. This record exists so the decision survives the session that surfaced it.

## Boundary

Arcadia owns the roll-up, the evidence, and the request for disposition. It does not own closure: each repository closes its own records through its own `ki-accept` run, under the owner's approval, and each repository's audit evidence is its own. This record must not edit another repository's roadmap, lower an issue ledger high-water mark, or treat Arcadia's tracking as acceptance on a receiver's behalf.

The record covers only the three duplicate families. The roughly thirty remaining `draft` records across those repositories are genuine feature work, they are each repository's own to shape, and they are out of scope here.

## Records awaiting disposition

Fourteen records are `awaiting-review` and need acceptance:

| Repository | Record | Family |
| --- | --- | --- |
| `mcp-gsuite` | `MCP-GSUITE-FND-003` | Protocol profile |
| `mcp-ki-kb-fs` | `MCP-KBFS-FND-002` | Protocol profile |
| `mcp-ki-kb-notion-mirror` | `MCP-NOTION-TOOL-006` | Protocol profile |
| `mcp-m365` | `MCP-M365-FND-002` | Protocol profile |
| `mcp-housekeeping-claude` | `MCP-CH-FND-004` | Protocol profile |
| `mcp-git-audit` | `MCP-GIT-FND-004` | Guides |
| `mcp-gsuite` | `MCP-GSUITE-FND-006` | Guides |
| `mcp-ki-kb-fs` | `MCP-KBFS-FND-004` | Guides |
| `mcp-ki-kb-notion-mirror` | `MCP-NOTION-TOOL-008` | Guides |
| `mcp-m365` | `MCP-M365-FND-005` | Guides |
| `mcp-acquire-whatsapp` | `MCP-WA-FND-006` | Guides |
| `mcp-housekeeping-claude` | `MCP-CH-FND-006` | Guides |
| `tools-mgit` | `MGIT-CLI-008` | Guides |
| `tools-git-almanac` | `ALMANAC-CLI-007` | Guides |

Seven records remain `draft` at horizon `future` and need a terminal Triage disposition: `MCP-GIT-FND-003`, `MCP-GSUITE-FND-004`, `MCP-KBFS-FND-003`, `MCP-NOTION-TOOL-007`, `MCP-M365-FND-003`, `MCP-CH-FND-005`, and `ALMANAC-CLI-005`.

## Steps

- [ ] Re-ground the list above against each repository before acting on it; a record may have been closed by another session since 2026-09-26.
- [ ] Obtain the owner's explicit approval to accept the fourteen delivered records, or the list of those to hold.
- [ ] Run `ki-accept` per repository for the approved records, one writer per checkout, so each repository's own review packet and issue ledger stay consistent.
- [ ] Obtain the owner's terminal Triage disposition for the seven conformance proposals, with the passing audit runs cited as the evidence that resolves them.
- [ ] Apply that disposition in each repository, recording the audit evidence in the record rather than closing it silently.
- [ ] Resolve the two deferred questions in [Escalation points](#escalation-points) before closing the records they affect.
- [ ] Confirm each repository's roadmap holds only genuine forward work afterwards, and report the remaining count per repository.

## Files touched

- `Streams/Roadmap/KI-ARCADIA-ECO-003-disposition-mcp-and-tools-roadmaps.md`
- `Streams/Roadmap/_ISSUES.md`
- No file in any receiving repository is touched from Arcadia; each receiver edits its own records.

## Verify

- Every record named above reaches a terminal state in its own repository, with its disposition and evidence written into the record.
- Each affected repository passes `ki repo audit` after closure, and its issue ledger high-water marks are unchanged or raised, never lowered.
- The count of open records per repository is reported against a fresh read, not against this record's table.
- No record is closed without the owner's approval recorded in the conversation that closed it.

## Dependencies and blocks

`KI-ARCADIA-ECO-004` carries the defects that were deliberately left out of these records' boundaries. It does not block this record: the delivered work is acceptable on its own terms, and holding acceptance behind unrelated defects is what turns a delivered item into a stalled one.

## Escalation points

Two questions are the owner's and were left open when the batch was delivered.

The live-smoke allowlist in `mcp-acquire-whatsapp` omitted `whatsapp_history_backfill_run` from an otherwise sixteen-of-nineteen list. The delivering agent permitted it. Confirm that permission or prohibit the tool explicitly, so the omission is a decision rather than an oversight.

The protocol-profile records were promoted off `soon` inconsistently: three to `now` and two to `next`. The horizons no longer affect the delivered work, but the inconsistency should be settled before the records close so the estate reads coherently.

## Governance

This roadmap record adheres to [[Enactment Process]]. Arcadia tracks the estate position; each repository retains acceptance authority over its own records, and no disposition here is effective until that repository applies it.
