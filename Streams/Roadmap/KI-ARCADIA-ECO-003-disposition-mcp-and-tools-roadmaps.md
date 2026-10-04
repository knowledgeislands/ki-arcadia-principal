---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-003
area: ECO
title: Disposition the MCP and tools roadmap backlog
theme: ecosystem-coordination
horizon: now
status: done
blocks: []
blocked_by: []
baseline_ref: b81116d407c4b1765e0d877060a8926861faace2
created_at: 2026-09-26T16:22:01Z
updated_at: 2026-10-04T11:52:38Z
---

# Disposition the MCP and Tools Roadmap Backlog

## Goal

Reconcile Arcadia's coordination record with the twenty-one receiver-owned dispositions and prune commits. The receiver work is complete; Arcadia still needs to review and close its own roll-up.

## Context

Five MCP protocol migrations and nine guide deliveries across nine repositories were accepted on 2026-09-26. Six later conformance reviews were accepted on 2026-10-02, and the remaining Almanac audit intake was rejected on 2026-10-03. Each receiver then pruned its terminal record in a later commit. The list below is historical evidence, not an open request for receiver acceptance.

The protocol records' three `now` and two `next` horizons remain historical queue facts. The WhatsApp live-smoke allowlist omission was fixed by `da9a181d741e` before guide acceptance in `5d7d37db5d15`. Neither calls for rewriting pruned receiver history.

## Boundary

Arcadia records the estate position and its own review. Each repository retained authority over its acceptance or Triage disposition. This reconciliation makes no receiver roadmap, ledger, or Git change. Other retained MCP drafts remain owner-controlled forward work; `KI-ARCADIA-ECO-004` separately tracks verified deferred findings.

## Current state

The receiver evidence is reconciled and the retained-work count is current as of 2026-10-04. The only remaining work is Arcadia's own delivery review packet, followed by independent review and acceptance through `ki-accept`.

## Receiver dispositions

The Done commit contains the receiver's approval and disposition evidence. The later prune commit removes only that terminal record; each repository's issue ledger retains its issued identity.

| Repository | Record | Outcome | Done commit | Prune commit |
| --- | --- | --- | --- | --- |
| `mcp-gsuite` | `MCP-GSUITE-FND-003` | Delivery accepted | `13fbc5835073` | `e4d2636af77f` |
| `mcp-ki-kb-fs` | `MCP-KBFS-FND-002` | Delivery accepted | `251a7c8751ca` | `ac753aae42e3` |
| `mcp-ki-kb-notion-mirror` | `MCP-NOTION-TOOL-006` | Delivery accepted | `9e7927e776eb` | `7c942d1654b4` |
| `mcp-m365` | `MCP-M365-FND-002` | Delivery accepted | `a3be6418b3b6` | `7fac3ca2b8e1` |
| `mcp-housekeeping-claude` | `MCP-CH-FND-004` | Delivery accepted | `43b197a689ac` | `ae701999ed05` |
| `mcp-git-audit` | `MCP-GIT-FND-004` | Delivery accepted | `480a3ac43e39` | `977370fce2b4` |
| `mcp-gsuite` | `MCP-GSUITE-FND-006` | Delivery accepted | `13fbc5835073` | `e4d2636af77f` |
| `mcp-ki-kb-fs` | `MCP-KBFS-FND-004` | Delivery accepted | `251a7c8751ca` | `ac753aae42e3` |
| `mcp-ki-kb-notion-mirror` | `MCP-NOTION-TOOL-008` | Delivery accepted | `9e7927e776eb` | `7c942d1654b4` |
| `mcp-m365` | `MCP-M365-FND-005` | Delivery accepted | `a3be6418b3b6` | `7fac3ca2b8e1` |
| `mcp-acquire-whatsapp` | `MCP-WA-FND-006` | Delivery accepted | `5d7d37db5d15` | `1469fa774d98` |
| `mcp-housekeeping-claude` | `MCP-CH-FND-006` | Delivery accepted | `43b197a689ac` | `ae701999ed05` |
| `tools-mgit` | `MGIT-CLI-008` | Delivery accepted | `1e383737db17` | `6fe92956840e` |
| `tools-git-almanac` | `ALMANAC-CLI-007` | Delivery accepted | `e1a7ce6fd507` | `4a146638484d` |
| `mcp-git-audit` | `MCP-GIT-FND-003` | Review accepted | `c7cc09c91910` | `1245077f16ec` |
| `mcp-gsuite` | `MCP-GSUITE-FND-004` | Review accepted | `e4b97c000b9f` | `9744724d966d` |
| `mcp-ki-kb-fs` | `MCP-KBFS-FND-003` | Review accepted | `ddc97a48664a` | `5ff4ec015f1e` |
| `mcp-ki-kb-notion-mirror` | `MCP-NOTION-TOOL-007` | Review accepted | `76257b6f9bfd` | `c7e12e7f7050` |
| `mcp-m365` | `MCP-M365-FND-003` | Review accepted | `e128a099a92d` | `f6a4465f6660` |
| `mcp-housekeeping-claude` | `MCP-CH-FND-005` | Review accepted | `c3cd823ead8b` | `08d7e9496014` |
| `tools-git-almanac` | `ALMANAC-CLI-005` | Intake rejected | `fea7533f0489` | `d92583c15b8c` |

## Current retained work

| Repository | Draft records |
| --- | ---: |
| `mcp-acquire-whatsapp` | 2 |
| `mcp-git-audit` | 5 |
| `mcp-gsuite` | 5 |
| `mcp-housekeeping-chatgpt` | 0 |
| `mcp-housekeeping-claude` | 0 |
| `mcp-housekeeping-codex` | 1 |
| `mcp-ki-kb-fs` | 2 |
| `mcp-ki-kb-notion-mirror` | 3 |
| `mcp-m365` | 4 |
| `tools-git-almanac` | 0 |
| `tools-mgit` | 0 |
| **Total** | **22** |

The eighteen previously retained MCP records, three newly captured `KI-ARCADIA-ECO-004` findings, and Git Audit's shared-utility pilot `MCP-GIT-FND-005` are all drafts. The two tools repositories named by this coordination record retain no roadmap records.

## Steps

- [x] Re-ground all twenty-one records against their receiver Git histories and confirm their terminal decisions and later prune commits.
- [x] Resolve the two historical escalation questions using the accepted receiver evidence.
- [x] Count retained work in the nine MCP and two tools repositories, including four new Triage captures, without treating it as this record's closure scope.
- [x] Re-verify the twenty-one Done and prune commits and the retained draft count, then prepare the delivery review packet for independent review and `ki-accept`.

## Files touched

- `Streams/Roadmap/KI-ARCADIA-ECO-003-disposition-mcp-and-tools-roadmaps.md`

No receiving repository file is touched by this reconciliation.

## Verify

All twenty-one pre-prune record blobs contain `status: done` and the stated acceptance or rejection text. Their listed prune commits are later receiver commits. On 2026-10-04, Arcadia's `ki-work` and `ki-repo-kb-streams` audits passed without warnings.

A sequential `ki repo audit --skill ki-repo-mcp` run across all nine MCP repositories had no failures. It retained four warnings: two GSuite registration-order checks, one Notion Mirror registration-order check, and Codex housekeeping's stale `zod` dependency hold. Registration ordering needs an intentional stability judgment; the warnings are not evidence that receiver acceptance remains open.

## Dependencies and blocks

`KI-ARCADIA-ECO-004` owns the deferred defect and documentation findings. It does not block review of this completed receiver-disposition roll-up.

## Review checkpoint - 2026-10-04

The receiver decisions and pruning are complete. Arcadia's remaining action is to review this evidence and close its own coordination record; no receiver item should be recreated or reclosed from this roll-up.

## Governance

This roadmap record adheres to [[Enactment Process]]. Arcadia reports receiver decisions from their Git evidence and makes no disposition on their behalf.

## Review

### Delivered

Arcadia's own roll-up of the twenty-one receiver dispositions, re-verified from immutable baseline `b81116d407c4b1765e0d877060a8926861faace2`. Excluded: any receiver roadmap, ledger or Git change, and the deferred findings owned by `KI-ARCADIA-ECO-004`.

### Change Summary

Only `Streams/Roadmap/KI-ARCADIA-ECO-003-disposition-mcp-and-tools-roadmaps.md` changed: a Current state section, the final Step reworded to a bounded re-verification and review-packet step, lifecycle metadata, and this packet. No receiver file was touched.

### Verification

- For all twenty-one table rows, the Done commit's record blob reads `status: done`, the listed prune commit deletes that record (`D`), and the Done commit is an ancestor of the prune commit. All passed on 2026-10-04.
- Retained draft counts in the receiver checkouts re-counted as 2, 5, 5, 1, 2, 3 and 4 (total 22), matching the Current retained work table.
- `ki repo audit --skill ki-work` and `ki repo audit --skill ki-repo-kb-streams` passed.

### Outstanding concerns

None for this roll-up. The four `ki-repo-mcp` warnings recorded under Verify remain receiver-owned judgements and do not reopen any disposition.

### Post-change review

The goal - reconcile Arcadia's coordination record with receiver evidence - is met without scope expansion. Regression risk is nil because only this record changed. Ready for acceptance.

### Mini recap

Re-verified twenty-one receiver Done and prune commits plus the twenty-two retained drafts; no concerns. No learning route is proposed beyond the existing `KI-ARCADIA-ECO-004` follow-on.

## Done

Accepted 2026-10-04 on the review packet above, after an independent review returned ACCEPT, under the owner's delegated authority for the 2026-10-04 estate roadmap push.

## Discussion
