---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-009
area: ECO
title: Gather evidence for a legacy serve fallback policy
kind: investigate
purpose: learning
project: estate-factorisation
status: cancelled
resolution: rejected
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-04T11:57:35Z
updated_at: 2026-10-07T20:35:45Z
---

# Gather Evidence for a Legacy Serve Fallback Policy

## Goal

The estate has a recorded, local evidence base showing how each client launches the six MCP servers that still keep the `legacy: 'serve'` fallback, so the harness can decide whether to keep the fallback or time-box its retirement.

---

## Context

This record was carved out of [KI-ARCADIA-ECO-004](https://github.com/knowledgeislands/ki-arcadia-principal/blob/688fb4e4a019a0ef9590edb0e2f95413010c6318/Streams/Roadmap/KI-ARCADIA-ECO-004-route-deferred-mcp-findings.md). The 2026-10-04 reconciliation there found six migrated MCP servers retaining `legacy: 'serve'`. The harness `ki-repo-mcp` standard permits this under "Transition compatibility" (`standards-mcp-servers.md` section 12): a modern server may keep a deliberate legacy client fallback while the fleet migrates. Retention is therefore not a conformance defect, but a retirement policy would affect every client that still opens a session the legacy way, so it needs evidence of which supported clients still depend on it.

---

## Boundary

- Evidence comes from local binding surfaces only: the portable inventory resolved by `$KI_MCP_SOURCE`, Claude Code, Claude Desktop, Codex and mcporter configuration, plus client versions and any local logs or traces.
- No MCP server change, no harness contract change and no fallback removal in any repository.
- At most one work trade to `knowledgeislands/ki-agentic-harness` over the declared work route, and only if the evidence supports a time-boxed retirement; Arcadia writes no file in the harness checkout, and the harness owns the policy while receiver repositories schedule their own removal.
- No remote operation under the [[Techne Programme Hold]]; no change to binding configuration or chezmoi.

---

## Cancelled

Approved by Kris on 2026-10-07 under decision 17 of the state-of-play design, which approved every cancel and merge in the easiest-first delivery plan.

Resolution `rejected`: evidence for a decision nobody is waiting on. The legacy fallback is harmless, trades are on hold, and MCP-1 to MCP-3 wait on FND-5. Recapture if a fallback causes a fault. It leaves no outstanding change.

## Discussion

### Decisions under delegated autonomy

- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: evidence is limited to local binding surfaces (the portable `mcp-servers.yaml` inventory, Claude Code, Claude Desktop, Codex and mcporter) across the six servers; no server or contract change.

### Planning corrections

- The triage named the portable inventory as XDG `mcp-servers.yaml`. On this machine `$KI_MCP_SOURCE` overrides the XDG default and points at the chezmoi data file, which is therefore the evidence source.
- The triage listed "kb-fs" among the six. Its inventory name is `kit-mcp-ki-kb-fs`, and `hnr-mcp-ki-kb-notion-mirror` and `hnr-mcp-m365` carry an `hnr-` prefix; the table uses inventory names.
- The plan first raised the handoff directly in `ki-agentic-harness/docs/roadmap/`. On the Fable reviewer's advice (2026-10-05) it now uses the declared route: Arcadia's `.ki.toml` declares a `work` export to `knowledgeislands/ki-agentic-harness` and `ki-trade` never writes a peer checkout, so the handoff is a sender-owned trade in `-/_TRADES/`, matching `KI-ARCADIA-OPS-003` and `KI-ARCADIA-EXT-003`.

### Original framing

Useful evidence shows, per supported runtime and binding surface, whether any configured server is still opened through the legacy entry point. If none is, the harness could time-box the fallback; if some are, the policy should name the migration path first. Any adopted outcome becomes a harness handoff, with receiver repositories scheduling their own removal.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
