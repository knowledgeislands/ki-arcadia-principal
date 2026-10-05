---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-009
area: ECO
title: Gather evidence for a legacy serve fallback policy
theme: ecosystem-coordination
horizon: now
status: ready
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-04T11:57:35Z
updated_at: 2026-10-05T08:14:47Z
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
- At most one harness handoff, and only if the evidence supports a time-boxed retirement; the harness owns the policy and receiver repositories schedule their own removal.
- No remote operation under the [[Techne Programme Hold]]; no change to binding configuration or chezmoi.

---

## Current state

- `legacy: 'serve'` is declared in `src/mcp-server/index.ts` of `mcp-housekeeping-claude`, `mcp-ki-kb-fs`, `mcp-ki-kb-notion-mirror`, `mcp-gsuite`, `mcp-m365` and `mcp-git-audit`, each with a comment stating the choice is deliberate.
- `$KI_MCP_SOURCE` resolves to `~/.local/share/chezmoi/.chezmoidata/mcp-servers.yaml`; there is no `~/.config/ki/mcp-servers.yaml`. In that inventory all six are declared as `kit-mcp-housekeeping-claude`, `kit-mcp-ki-kb-fs`, `hnr-mcp-ki-kb-notion-mirror`, `kit-mcp-gsuite`, `hnr-mcp-m365` and `kit-mcp-git-audit` with `clients: [claude-desktop, mcporter]`; Claude Code and Codex reach mcporter-managed servers through the `ki-mcporter` bridge (`clients: [claude-code, chatgpt-codex]`).
- Client configuration exists at `~/Library/Application Support/Claude/claude_desktop_config.json`, `~/.claude.json` and `~/.codex/config.toml`; `mcporter` is installed at `/opt/homebrew/bin/mcporter`.

---

## Steps

- [ ] For each of the six servers, read its inventory entry and record declared clients, launch command and package version.
- [ ] For each declared client (Claude Desktop direct; mcporter daemon; Claude Code and Codex via `ki-mcporter`), record the client version and the rendered launch path from its configuration file.
- [ ] For each server and client pair, determine whether the opening handshake uses the legacy `initialize` path or the modern profile: observe it from a local log or trace where one exists, otherwise infer it from the client's documented protocol support and mark the cell "inferred".
- [ ] Write the evidence table in Discussion: server, client, launch path, client version, handshake observed or inferred, source of evidence.
- [ ] State the conclusion: retain (some client still needs the fallback, naming the migration path first) or time-box (no client needs it).
- [ ] If the conclusion is time-box, create one Triage handoff in `ki-agentic-harness/docs/roadmap/` proposing a dated retirement window, citing this record as origin, and link it here reciprocally. If retain, raise no handoff.

---

## Files touched

- `Streams/Roadmap/KI-ARCADIA-ECO-009-legacy-serve-fallback-policy.md`
- At most one new file in `ki-agentic-harness/docs/roadmap/` (handoff), only on a time-box conclusion.

---

## Verify

- The evidence table covers all six servers against every client declared for each, with a launch path and an observed or inferred handshake in every row.
- A retain or time-box conclusion is stated.
- If a handoff was raised, it exists in the harness roadmap, names `KI-ARCADIA-ECO-009` as origin, and this record links to it.
- `git status --porcelain` in each of the six MCP repositories and in chezmoi is unchanged by this work.
- `ki repo audit --skill ki-repo-kb-streams --repo . --progress never` PASS.
- `ki repo audit --progress never` PASS.

---

## Dependencies / blocks

No dependency. The harness transition contract already permits retention, so nothing waits on this record; a handoff, if raised, is non-blocking and the harness schedules it.

---

## Documentation impact

### Decision Records

None in Arcadia. A retirement policy, if adopted, would be a harness Decision Record or standard change owned by `ki-agentic-harness`.

### Specifications

None in Arcadia. The transition compatibility rule lives in the harness `ki-repo-mcp` standard; any change is harness-owned.

### Guides

None. The evidence table in this record is the deliverable.

### Roadmap

This record moves to awaiting-review on delivery, with at most one reciprocal harness Triage record.

---

## Discussion

### Decisions under delegated autonomy

- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: evidence is limited to local binding surfaces (the portable `mcp-servers.yaml` inventory, Claude Code, Claude Desktop, Codex and mcporter) across the six servers; no server or contract change.

### Planning corrections

- The triage named the portable inventory as XDG `mcp-servers.yaml`. On this machine `$KI_MCP_SOURCE` overrides the XDG default and points at the chezmoi data file, which is therefore the evidence source.
- The triage listed "kb-fs" among the six. Its inventory name is `kit-mcp-ki-kb-fs`, and `hnr-mcp-ki-kb-notion-mirror` and `hnr-mcp-m365` carry an `hnr-` prefix; the table uses inventory names.

### Original framing

Useful evidence shows, per supported runtime and binding surface, whether any configured server is still opened through the legacy entry point. If none is, the harness could time-box the fallback; if some are, the policy should name the migration path first. Any adopted outcome becomes a harness handoff under the cross-repository convention in `AGENTS.md`, with receiver repositories scheduling their own removal.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
