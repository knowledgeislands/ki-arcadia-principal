---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-004
area: ECO
title: Route deferred MCP and tools findings to their owners
theme: ecosystem-coordination
horizon: next
status: draft
blocks: []
blocked_by: []
baseline_ref: 95f85a1a14ab9ff2834fe6d4f32355754e6de708
created_at: 2026-09-26T16:22:01Z
updated_at: 2026-10-04T10:41:57Z
---

# Route Deferred MCP and Tools Findings to Their Owners

## Goal

Reconcile the findings deferred from the 2026-09-22 MCP and tools deliveries, then route only reproduced, still-open work to its owning repository. Preserve the disposition of historical observations so they do not reappear as unverified defects.

## Context

The original findings were reports from bounded delivery lanes, not verified defects. A fresh 2026-10-04 source and fixture review separated live issues from fixes and unsupported claims. Receiver roadmaps, trade records, and issue ledgers still need a deduplication pass before any new work is captured. Arcadia owns this evidence and routing plan; receivers decide their own priority and implementation.

## Boundary

This record changes no receiving repository and does not authorise live MCP operations, publishing, or a shared utility migration. Authentication persists tokens in GSuite and M365, so its write annotation remains truthful. Recovery guidance should explain how an operator reaches the required tier. A `--dry-run` investigation must use mocked roots and mutation calls, never a real Notion workspace.

## Reconciled findings

- **Live — authentication recovery, M365 and GSuite.** At default `read`, a synthetic 401 points to `m365_auth_start` or `gsuite_auth_start`, yet each is registered as a write tool and absent from that tier. Fixture-only registration reproduced the mismatch at M365 `8d7d09d7e9a1` and GSuite `f9ab8d400806`. Route reachable recovery instructions to both owners; do not relabel token-persisting authentication as read-only.
- **Live — Notion Mirror publish dry-run.** `roots publish --dry-run` parses the flag but the publish branches do not consume it and can still call mutating touch/update operations. This is more serious than the original “silent no-op” description. Source evidence is `src/cli/cli.ts` at `4774ab686f84`; a mocked CLI reproduction is still needed before a receiver fix. No live publish was run.
- **Live — GSuite authentication commands.** Startup guidance still names `server:auth:dev` and `server:auth:start`, while package scripts use the `ki:` prefix. Source evidence is `src/main/auth-info/index.ts` and `package.json` at `f9ab8d400806`. This can be scoped with GSuite's recovery-guidance fix.
- **Partly resolved — tool catalogues.** Current README name sets match registration and smoke inventories in GSuite (49), Claude housekeeping (44), M365 (44), and Git Audit (12). The historical missing-tool counts are no longer a defect. GSuite's access-tier prose remains inaccurate at `f9ab8d400806`. Generated or checked catalogues remain a separate maintenance decision, subject to full rubric and receiver review.
- **Resolved — npm badges and M365 installation claim.** Git Audit removed its dead badge in `171ac88`; KBFS did so in `b63fd39`. Fresh registry metadata checks returned 404 for the GSuite and M365 badge targets, so those owners removed their badges in `9f290cd` and `cdd8bf2`. M365 also corrected its published-package installation claim in `60bc8c1`. This evidence does not establish that every `@knowledgeislands` package is unpublished; registry publication is outside this record's scope.
- **Resolved or unsupported — four KBFS claims.** The root-contract test passes, coverage upload was corrected in `6a4991b`, and the current guides and package minimum agree. The notes module has a public export and `createFolder` is used by an MCP tool, so the blanket dead-code claim is unsupported. No receiver defect should be created from these claims without new evidence.
- **Resolved in source — tools-ki guide cycle.** Local guides and README routes replaced the circular source links in `03fe090`; current source at `ba0e68a690d1` contains no old guidance links in the reviewed surfaces. Deployed website redirects were not checked and should not be inferred from this source result.
- **Open policy question — legacy serve fallback.** Six migrated servers retain `legacy: 'serve'`, and the Harness transition contract permits it. A retirement decision needs observed client compatibility evidence; retention is not a conformance defect.

## Receiver intake

Deduplication found no existing receiver roadmap or trade record for the three live concerns. GSuite captured `MCP-GSUITE-FND-007` in `0f61e97`, M365 captured `MCP-M365-FND-006` in `06c50a4`, and Notion Mirror captured `MCP-NOTION-TOOL-009` in `31a70e8`. Each receiver first committed its issue-ledger reservation separately, then published a `triage` / `draft` record citing this Arcadia origin. These captures grant no adoption, priority, readiness, or implementation authority.

## Steps

- [x] Recheck the historical observations against current receiver source, fixture evidence, and known fix commits.
- [x] Distinguish resolved or unsupported claims from reproduced live issues without deleting their history.
- [x] Deduplicate live findings against each receiver's roadmap and trade records; capture only uncovered substantive work in receiver-owned Triage with an Arcadia origin reference.
- [ ] Review the catalogue-check and legacy-fallback policy questions against the full skill rubrics and receiver implementations before proposing any shared change.
- [x] Record reciprocal receiver references in this ledger and each receiver Triage record.
- [ ] Present Arcadia's routing packet for its own review and acceptance.

## Files touched

- `Streams/Roadmap/KI-ARCADIA-ECO-004-route-deferred-mcp-findings.md`

Receiver records, if justified, are authored and governed in their own repositories.

## Verify

Each live finding needs an owning receiver record or a documented deduplication result. Resolved claims retain their fix or counter-evidence here. The Notion dry-run path needs a mocked behavioural reproduction before changing publication code. Estate policy questions need a written decision only after client or rubric evidence supports one.

The sequential 2026-10-04 MCP audit of all nine repositories had no failures and four warnings: GSuite registration order twice, Notion Mirror registration order once, and Codex housekeeping's stale `zod` hold. These are retained findings, not blanket proof that every historical observation reproduces.

## Dependencies and blocks

This record does not block `KI-ARCADIA-ECO-003` or the receiver approvals already completed. Receiver intake and priority remain independent.

## Escalation points

The owner should settle catalogue generation or verification and the eventual `legacy: 'serve'` policy only after the stated rubric and client evidence is assembled. Neither question is an automatic per-repository conformance fix.

## Governance

This roadmap record adheres to [[Enactment Process]]. Arcadia owns the routing ledger; each receiving repository owns whether to adopt a finding, how to fix it, and when to accept it.
