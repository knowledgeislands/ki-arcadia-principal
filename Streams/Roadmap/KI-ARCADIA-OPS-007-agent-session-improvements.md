---
note_type: stream-roadmap
id: KI-ARCADIA-OPS-007
area: OPS
title: Agent session improvements
theme: operational-tooling
tags:
  - topic/knowledge-islands
  - topic/ai
status: ready
priority: low
horizon: now
candidate: true
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-04-28T18:32:31Z
updated_at: 2026-10-05T08:14:47Z
author: Written with Claude
---

# Agent and Session Improvements Proposal

## Goal

Each of the four April 2026 agent and session ideas is either shown to be covered by current shared harness capability and retired, or handed to the harness as one concrete gap, so Arcadia stops carrying a speculative idea list.

---

## Context

The record was captured in April 2026, before the shared harness matured, as four ideas for how Claude operates in the island: semantic retrieval (RAG), routing background and batch work to a lighter model, a start-of-session check-in ritual, and a `/teach` pattern for capturing preferences mid-session. Since then `ki-agentic-harness` has grown skills that own most of this ground, and Arcadia declares them in `.ki.toml`. The remaining value is a mapping that retires covered ideas and routes any genuine gap to the harness, which owns shared agent behaviour.

---

## Boundary

- Arcadia work is the mapping and its disposition in this record. No change to `Admin/`, `Pillars/` or `Resources/`.
- No harness skill change. A genuine gap becomes at most one harness Triage handoff per gap, created at implementation time under the cross-repository choreography in `AGENTS.md`; the harness owns priority and delivery.
- No new scheduled task, model binding change, spend or remote operation under the [[Techne Programme Hold]].
- No change to user-level configuration (`~/.claude/`, chezmoi).

---

## Current state

Checked against the live harness checkout on 2026-10-05:

| Idea | Current coverage | Evidence | Planned disposition |
| --- | --- | --- | --- |
| Model routing for background and batch work | Partly covered. `ki-tokenomics` owns the portable model-purpose taxonomy (`fast` for mechanical or bulk work, `standard`, `reasoning`, `frontier`) and Arcadia declares `preferred_model_type = "standard"`. `ki-subagents` defines subagent roles but has no model-type field or guidance | `ki-agentic-harness/skills/environment/ki-tokenomics/SKILL.md`; `.ki.toml` `[skills.ki-tokenomics]`; grep of `skills/agentic-systems/` for model type returns nothing | Retire the policy part; confirm and hand off the per-role model-type gap |
| Session check-in ritual | Covered. Arcadia `CLAUDE.md` requires loading [[Admin/MEMORY\|MEMORY]] before island work; `ki-checkpoint` RESUME reconstructs an active thread; `ki-next` selects outstanding work | `CLAUDE.md`; `skills/governance/ki-checkpoint/SKILL.md`; `skills/change-management/ki-next/SKILL.md` | Retire |
| Preference capture (`/teach`) | Covered. The user memory-scope rule routes durable guidance to `AGENTS.md`, `CLAUDE.md` or managed user configuration; `ki-recap` names durable learning routes; `ki-authoring` owns knowledge promotion | `~/.claude/memory-scope.md` (chezmoi-managed); `skills/change-management/ki-recap/references/standards-session-recap.md`; `skills/governance/ki-authoring/references/standards-knowledge-promotion.md` | Retire |
| Semantic retrieval (RAG) | In flight in the harness. `KI-HARNESS-FND-028` (Now, Ready) adopts qmd hybrid search behind `kb_search`, `ki kb search` and the `ki-repo-kb` QUERY procedure | `ki-agentic-harness/docs/roadmap/KI-HARNESS-FND-028-adopt-qmd-kb-search.md` | Retire locally; Arcadia consumes the harness outcome |

---

## Steps

- [ ] Re-check each row of the Current state table against the harness at implementation time and record the harness commit inspected.
- [ ] For the model-routing row, confirm whether `ki-subagents` (or its runtime adapters) still lacks a way to assign a portable model type per role. If the gap stands, create one Triage handoff in `ki-agentic-harness/docs/roadmap/` titled for per-role model-type assignment, citing this record as origin and stating it `blocks` nothing here; link it from this record. If the gap has closed, retire the row.
- [ ] Mark the check-in, preference-capture and RAG rows retired in Discussion with the evidence above; raise no handoff for them.
- [ ] Add a `### Disposition` subsection to Discussion summarising the four outcomes in one line each.

---

## Files touched

- `Streams/Roadmap/KI-ARCADIA-OPS-007-agent-session-improvements.md`
- At most one new file in `ki-agentic-harness/docs/roadmap/` (handoff), only if the model-routing gap is confirmed.

---

## Verify

- Discussion maps all four ideas, each with evidence and a retired or handed-off disposition.
- If a handoff was raised, it exists in `ki-agentic-harness/docs/roadmap/`, names `KI-ARCADIA-OPS-007` as origin, and this record links to it (reciprocal).
- `git diff --stat HEAD` in Arcadia shows only this record changed.
- `ki repo audit --skill ki-repo-kb-streams --repo . --progress never` PASS.
- `ki repo audit --progress never` PASS.

---

## Dependencies / blocks

No local dependency. Retrieval relies on `KI-HARNESS-FND-028` in `ki-agentic-harness`; that is context, not a blocker, because this record retires the idea locally whatever its timing. A model-routing handoff, if raised, is non-blocking for this record.

---

## Documentation impact

### Decision Records

None. Retiring covered ideas and raising a handoff are routine roadmap dispositions.

### Specifications

None. Model-purpose policy is owned by the harness `ki-tokenomics` standard; any change is harness-owned.

### Guides

None in Arcadia. The harness may update `ki-subagents` guidance if it accepts the handoff.

### Roadmap

This record moves to awaiting-review on delivery, with possibly one reciprocal harness Triage record.

---

## Discussion

### Decisions under delegated autonomy

- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: scope is mapping the four ideas to current harness coverage, retiring covered ones and raising one harness handoff per genuine gap.
- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: RAG was to be recorded as deferred until an island-size trigger. Planning found the harness already has `KI-HARNESS-FND-028` at Now/Ready adopting qmd search, so the row is retired locally in favour of that record rather than deferred.

### Planning corrections

- The triage mapped model routing to `ki-tokenomics` plus `ki-subagents`. `ki-tokenomics` does carry the model-purpose policy, but `ki-subagents` has no model-type guidance today, so per-role routing is the one candidate gap.
- The triage mapped check-in to `ki-bootstrap`. `ki-bootstrap` covers first-time activation, not session start; the real coverage is the `CLAUDE.md` MEMORY load, `ki-checkpoint` RESUME and `ki-next`.

### Original ideas (April 2026)

- **Semantic retrieval (RAG)**: keyword and filename search plus selective reading; investigate once island size makes this slow. Options named then: Smart Connections Obsidian plugin, or a local vector store (Chroma, Qdrant).
- **Subagent routing by task type**: route background and batch tasks (inbox processing, nightly review) to a lighter model to preserve the larger model for reasoning-heavy work.
- **Session check-in ritual**: an explicit start-of-session command that loads context, reviews outstanding items and primes Claude.
- **Preference capture (`/teach`)**: record preferences and conventions mid-session without hand-editing `CLAUDE.md`, perhaps via a `Preferences.md` file.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
