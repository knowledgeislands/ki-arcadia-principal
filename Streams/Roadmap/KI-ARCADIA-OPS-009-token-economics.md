---
note_type: stream-roadmap
id: KI-ARCADIA-OPS-009
area: OPS
title: Token economics
kind: deliver
project: island-model-and-tending
component: operations
tags:
  - topic/knowledge-islands
  - topic/ai
status: cancelled
resolution: obsolete
priority: low
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-04-28T18:43:39Z
updated_at: 2026-10-07T17:20:40Z
author: Written with Claude
---

# Token Economics Proposal

## Goal

Arcadia has one island-local note on how its scheduled prompts and interactive sessions spend tokens, including a reusable pre-invocation gate pattern, that defers to the harness `ki-tokenomics` policy rather than restating it.

---

## Context

The record was captured in April 2026 to understand and reduce token spend across island AI operations in three areas: scheduled task prompt design, interactive session efficiency, and tooling for measurement or reduction. Wasteful prompts inflate cost and exhaust context budgets; lean prompts do more with less.

Since capture, the harness `ki-tokenomics` skill has become the owner of portable context budgets, standing-surface attribution and model-purpose policy, and Arcadia declares it in `.ki.toml` (`headroom = "recommended"`, `preferred_model_type = "standard"`, `budgets.mcp_servers = 20`). What remains island-local is practice: how Arcadia's own Cowork prompts are shaped, the gate pattern [[KI-ARCADIA-OPS-008-scheduled-automations|OPS-008]] will apply, and the island's standing-context tending triggers.

Legacy design themes worth carrying into the note:

- **Scheduled prompts**: keep prompts lean; include only context the model needs; run a cheap pre-invocation gate before full inference and return early on quiet days; order prompt structure for cache reuse.
- **Interactive sessions**: context-window discipline (what to load, when to summarise, when to start fresh); batch independent tool calls; keep memory files lean.
- **Tooling**: assess `caveman` as a token-efficiency aid.

---

## Boundary

- One standalone convention note plus index and cross-link changes. No per-prompt annotations; [[KI-ARCADIA-OPS-008-scheduled-automations|OPS-008]] applies the gate pattern to prompts.
- No restatement of harness `ki-tokenomics` policy, budgets or model taxonomy; the note links to the harness skill for those.
- No `.ki.toml` budget change, no new tool installation, no scheduled task change, no spend and no remote operation under the [[Techne Programme Hold]].
- No harness or user-configuration change.

---

## Current state

- `Pillars/Philosophy/Model/Tools/Claude/Claude.md` already carries a `## Token Economics` section with a standing-context size table, three design rules and tending triggers. Its figures are stale: it cites `CLAUDE.md` at about 9,000 bytes, but `CLAUDE.md` is now 129 bytes importing `AGENTS.md`, which is 13,544 bytes, already above the section's own ~10,000-byte review trigger.
- No `Token Economics.md` note exists anywhere in the KB.
- `Admin/Governance/Conventions/Authoring.md` records "None" under `## Local Decisions`.
- `ki repo audit --skill ki-tokenomics --repo . --progress never` PASS on 2026-10-05.
- A `caveman` skill (terse output voice) is installed at `~/.agents/skills/caveman`, linked into `~/.claude/skills/`. Separately, the harness [ADR-KI-HARNESS-TOOLCHAIN-002](https://github.com/knowledgeislands/ki-agentic-harness/blob/main/docs/decisions/ADR-KI-HARNESS-TOOLCHAIN-002-complementary-tooling-current-adoptions.md) declined the wider Caveman toolkit (proxy, memory layer, agent) because headroom and file-based memory already own that ground.

---

## Steps

- [ ] Create `Pillars/Philosophy/Model/Tools/Claude/Token Economics.md` (`note_type: pillars/note`) with sections for: scope and pointer to harness `ki-tokenomics` as policy owner; standing-context sizes measured at delivery (`wc -c` of `CLAUDE.md`, `AGENTS.md`, `Admin/MEMORY.md` and the island skill) and tending triggers; scheduled prompt practice; the pre-invocation gate pattern; interactive session practice; and tooling notes.
- [ ] Define the gate pattern concretely: a cheap first step (file-count, `git log --since` or date check) with an explicit early-exit instruction and a one-line "nothing to do" report, plus the rule that any heading or output an automation reads must still be produced.
- [ ] In tooling notes, record that the `caveman` output skill is installed and optional for interactive sessions, and that the wider Caveman toolkit is declined by the harness ADR; link both rather than re-arguing them.
- [ ] Move the existing token content out of `Claude.md`: replace its `## Token Economics` section with a two-to-four-sentence child section introducing the new note, keeping no duplicate table or rules.
- [ ] Add a `## Local Decisions` entry to `Admin/Governance/Conventions/Authoring.md` that points prompt-efficiency practice to `Token Economics.md`.

---

## Files touched

- `Pillars/Philosophy/Model/Tools/Claude/Token Economics.md` (new)
- `Pillars/Philosophy/Model/Tools/Claude/Claude.md`
- `Admin/Governance/Conventions/Authoring.md`
- `Streams/Roadmap/KI-ARCADIA-OPS-009-token-economics.md`

---

## Verify

- `Token Economics.md` exists; `Claude.md` has a `## Token Economics` child section linking to it and no longer holds the size table or design-rule list.
- `Authoring.md` links to `Token Economics.md`.
- No duplication of harness policy: the note contains no budget values and no restatement of the model-type taxonomy (`grep -nE 'frontier|reasoning|budgets\.' 'Pillars/Philosophy/Model/Tools/Claude/Token Economics.md'` returns nothing other than a link context).
- `ki repo audit --skill ki-tokenomics --repo . --progress never` PASS.
- `ki repo audit --skill ki-repo-kb --repo . --progress never` PASS.
- `ki repo audit --progress never` PASS.
- New prose uses British English and ASCII hyphens only.

---

## Dependencies / blocks

No dependency. [[KI-ARCADIA-OPS-008-scheduled-automations|OPS-008]] applies the gate pattern this note defines, so delivering this record first is preferred; that is a sequencing preference, not a blocker, and `blocks` stays empty.

---

## Documentation impact

### Decision Records

None. Choosing a standalone note over per-prompt annotations is reversible practice, not a structural decision.

### Specifications

None. Portable token policy is owned by the harness `ki-tokenomics` standard.

### Guides

The new Token Economics note is the guidance; `Claude.md` and `Authoring.md` gain pointers to it.

### Roadmap

This record moves to awaiting-review on delivery and supplies the gate pattern consumed by OPS-008.

---

## Cancelled

Approved by Kris on 2026-10-07 under decision 13 of the state-of-play design ("Yes please, lets reduce stuff": cancel and prune obsolete or ownerless records).

Its scope was scheduled-task prompt design under the retired Cowork stack. The harness `ki-tokenomics` skill now owns portable context budgets and model-purpose policy, and Arcadia declares it in `.ki.toml`. No outstanding changes.

## Discussion

### Decisions under delegated autonomy

- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: produce one standalone convention note, not per-prompt annotations.
- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: the harness `ki-tokenomics` skill owns policy; the island note owns island-local prompt and session practice, including the gate pattern.
- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: `caveman` is recorded as already installed rather than assessed afresh.

### Original open questions

The legacy open questions ("standalone note or guidance in prompts?" and "general principles or prompt-by-prompt annotations?") were resolved by the delegated decisions above: a standalone note of general practice, with prompt changes carried by OPS-008.

### Planning correction

The legacy Inputs pointed at `Tools/Claude/Activities/` and the Outputs at an undecided `Pillars/Philosophy/` path. The current prompt notes live under `Pillars/Philosophy/Model/Tools/Claude/Activities/`, and the note belongs beside them in `Pillars/Philosophy/Model/Tools/Claude/`, where `Claude.md` already introduced token economics.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
