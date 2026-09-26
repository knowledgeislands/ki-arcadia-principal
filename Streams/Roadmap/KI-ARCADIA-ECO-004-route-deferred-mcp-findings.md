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
updated_at: 2026-09-26T16:22:01Z
---

# Route Deferred MCP and Tools Findings to Their Owners

## Goal

Give every defect found during the 2026-09-22 protocol and guides batch a record in the repository that owns it, so that findings deliberately excluded from their delivering item's boundary are not lost when the session that found them ends.

## Context

Ten delegated agents worked across the MCP server and tools repositories to deliver two duplicate roadmap families. Each was held to its record's stated boundary, so defects they encountered outside that boundary were reported rather than fixed. That was the correct call for the delivery, and it leaves the findings with no durable home: they exist only in a session transcript.

Several findings are behavioural rather than cosmetic, and at least two classes appear to be estate-wide rather than local. This record is the routing ledger that converts them into receiver-owned work.

## Boundary

Arcadia routes; it does not fix. This record must not change another repository, and it must not assert any finding as confirmed. Each entry is a reported observation from a delegated agent, not an Arcadia verification: the receiving repository reproduces the finding first and closes the entry as not-a-defect if it does not reproduce. Nothing here authorises publishing a package to any registry, and the dead-badge entry is to be resolved by removing the badge, consistent with the owner's standing preference against registry publication.

## Findings to route

| Finding | Owner | Shape |
| --- | --- | --- |
| `m365_auth_start` is unreachable at the default `MCP_M365_ACCESS_LEVEL=read` because of its `WRITE_REMOTE` annotation, while `errMessage()` names that same tool in the 401 hint, so the recovery path points at a tool the caller cannot call | `mcp-m365` | Defect, likely shared |
| `roots publish --dry-run` is a silent no-op; `--dry-run` is honoured by `delete` and `prune` only, so a caller rehearsing a publish gets no rehearsal and no warning | `mcp-ki-kb-notion-mirror` | Defect |
| `gsuite_auth_start` instructs the user to run `bun run server:auth:dev` or `server:auth:start`; both scripts were renamed to the `ki:` prefix, so the instruction fails | `mcp-gsuite` | Defect |
| Hand-maintained tool catalogues disagree with the servers they document: `mcp-gsuite` lists 32 against 42, `mcp-housekeeping-claude` lists 39 against 42 and omits the whole `claude_code_sessions_*` group, `mcp-m365` lists 37 against 36, and `mcp-git-audit`'s inventory claims are unverified | Each server, plus an estate decision | Drift, estate-wide |
| npm badges point at packages that do not exist; nothing is published under `@knowledgeislands`. `mcp-git-audit`, `mcp-gsuite`, and `mcp-ki-kb-fs` are affected | Each repository | Documentation defect |
| `mcp-ki-kb-fs` carries four local problems: a README H1 that disagrees with the name a test pins at `src/main/files/repository-contract.test.ts:28`, apparently dead behaviour under `src/main/notes/`, CI uploading `coverage/` while Vitest writes `reports/coverage`, and a Node floor that disagrees across the README, `engines`, and `mise.toml` | `mcp-ki-kb-fs` | Mixed |
| `tools-ki` defers four procedures to `knowledgeislands.info/guidance/cli/...` while the site derives that guidance from the repository, and those URLs have become 301 redirects under `KI-WEB-SITE-025`; the documentation depends on itself in a circle | `tools-ki` and `ki-website` | Structural |
| The migrated servers retain `legacy: 'serve'` as a deliberate compatibility fallback; whether to keep, date, or drop it is one estate decision, not five local ones | Estate decision | Decision |

## Steps

- [ ] Reproduce each finding in its owning repository before routing it; drop any entry that does not reproduce and say so here.
- [ ] Confirm whether the `m365` access-level defect is shared by the sibling servers that use the same annotation-derived model, and route it once per affected repository.
- [ ] Open a receiver-owned record in each owning repository for the findings that reproduce, stating that this record is the origin.
- [ ] Decide whether tool catalogues should be generated from the server's own registry rather than hand-maintained, as one estate decision; four of five were factually wrong, which suggests the maintenance model rather than the maintainers.
- [ ] Decide the `legacy: 'serve'` retention question once, and record it where the migrated servers can cite it.
- [ ] Record the reciprocal relationship in each receiver record and mark this one `done` when every finding has a home.

## Files touched

- `Streams/Roadmap/KI-ARCADIA-ECO-004-route-deferred-mcp-findings.md`
- `Streams/Roadmap/_ISSUES.md`
- Receiver records are created by their own repositories, not from Arcadia.

## Verify

- Every row in the table above resolves to either a receiver-owned record identifier or a written note that it did not reproduce.
- No receiver record is created without the finding being reproduced first in that repository.
- The two estate decisions are recorded as decisions, with a Decision Record where the outcome is durable, rather than being settled implicitly inside one repository's fix.

## Dependencies and blocks

This record does not block `KI-ARCADIA-ECO-003`. The delivered work in those items is acceptable on its own terms, and holding acceptance behind unrelated findings would leave delivered work permanently uncredited.

## Escalation points

The tool-catalogue question and the `legacy: 'serve'` question are both estate decisions the owner should settle, because each repository fixing them locally produces five divergent answers to one question.

## Governance

This roadmap record adheres to [[Enactment Process]]. Arcadia owns the routing ledger; each receiving repository owns whether a finding is real, how it is fixed, and when.
