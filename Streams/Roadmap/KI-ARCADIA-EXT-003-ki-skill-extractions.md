---
note_type: stream-roadmap
id: KI-ARCADIA-EXT-003
area: EXT
title: KI skill extractions
kind: investigate
purpose: upkeep
initiative: platform-foundations
tags:
  - topic/knowledge-islands
  - topic/engineering
status: ready
priority: medium
horizon: now
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-06-25T15:59:04Z
updated_at: 2026-10-07T14:08:03Z
author: Written with Claude
---

# KI Skill Extraction Candidates Proposal

## Goal

Settle the six skill-extraction candidates identified in June 2026: retire each one the harness now covers, with evidence, and hand each genuine gap to `ki-agentic-harness` as a work trade, so no island has to re-implement these patterns from scratch.

## Context

During the Admin normalisation session (June 2026, the [[GDR-KI-ARCADIA-002-admin-zone-governance-and-operations|GDR-KI-ARCADIA-002]] follow-up), six patterns were found implemented independently in Arcadia and `kit-legal` with no portable skill governing them. The candidates named `knowledgeislands-*` skills and a `knowledgeislands-harness` repository; those are now the `ki-*` skills in `ki-agentic-harness`.

The original candidates and suggested extractions:

| Candidate | June 2026 status | Suggested extraction |
| --- | --- | --- |
| Admin zone structure (Governance and Operations arms) | Zones declared; no skill governs the arms | Extend the KB skill or a new Admin skill |
| Activity system (`[Group] [Name] Activity.md`, `Activities.md` index) | Type declared; no naming or index rule | New activities skill |
| Charter and Conformance baseline | Implied by SDR-003 and SDR-005 only | Bootstrap checker for mandatory Charter fields |
| Live artifacts (`.md` plus `.html`) | `kit-legal` pattern only | New live-artifacts skill |
| Note templates (`Admin/Governance/Note Templates/`) | Template type declared only | Extend the KB skill |
| Conventions sub-folders (Admin, Pillars, Streams Conventions) | No skill | Extend the KB skill's conform mode |

The 2026-09-27 checkpoint warned that a similarly named skill is not proof of full coverage; each candidate needs mapping against the actual rubric.

## Boundary

- Gaps become work trades to `knowledgeislands/ki-agentic-harness` over the declared work route; Arcadia builds no skill and writes no file in the harness checkout.
- The receiver owns disposition, design and priority of each handed-off gap.
- No Arcadia canonical change; island-local conventions such as Arcadia's `Admin/Governance/Note Templates/` folder are not altered here.
- No remote operation under the [[Techne Programme Hold]].

## Current state

Preliminary mapping at planning against `ki-agentic-harness` `skills/repo-structure/` (to be re-verified at implementation):

| Candidate | Current skill coverage | Evidence | Preliminary disposition |
| --- | --- | --- | --- |
| Admin zone structure | `ki-repo-kb` ADMIN-1 (optional Governance and Operations subdivisions with same-name indexes), ADMIN-2, ADMIN-3; `ki-repo-kb-principal` required surface | `ki-repo-kb/references/rubric.md`, `ki-repo-kb-principal/references/standards-principal.md` | Retire, subject to confirming what each arm holds is stated |
| Activity system | `ki-repo-kb-activities` ACT-S (index, collection `Admin/Operations/Activities/`), ACT-F, ACT-R, ACT-J | `ki-repo-kb-activities/references/standards-activities.md` | Retire; the standard uses `<Activity Name>.md`, so the `[Group] [Name] Activity.md` form is island-local |
| Charter and Conformance baseline | Presence only: ADMIN-2, ADMIN-3, PRINCIPAL-1; PRINCIPAL-3 is a judgement item | `ki-repo-kb/references/rubric.md`, `ki-repo-kb-principal/references/rubric.md` | Likely gap: no mechanical check of the Charter fields the principal standard requires (scope, stewardship, territory, Capital, authority boundary) |
| Live artifacts | `ki-repo-kb-live-artifacts` LA-S, LA-F, LA-J | `ki-repo-kb-live-artifacts/references/standards-live-artifacts.md` | Retire |
| Note templates | `ki-repo-kb` ships `assets/templates/{admin,calendar,pillars,resources}` and accepts `[skills.ki-repo-kb.templates]` overrides | `ki-repo-kb/references/standards-knowledge-base.md`, `ki-repo-kb/references/mode-query.md` | Retire; Arcadia declares no template override, which is an island-local matter |
| Conventions sub-folders | No rubric item; the principal surface requires only `Admin/Governance/Conventions/Conventions.md` | `ki-repo-kb/references/rubric.md`, `ki-repo-kb-principal/references/standards-principal.md` | Likely gap |

`.ki.toml` declares `[skills.ki-trades.routes."knowledgeislands/ki-agentic-harness"]` with `export = ["work", "knowledge"]`. No existing harness roadmap item covers a Charter field checker or Conventions sub-folder rules.

## Steps

- [ ] Re-read the named harness rubrics and standards at their current revision and record the harness commit used.
- [ ] For each of the six candidates, confirm or correct the preliminary mapping and record the final disposition with skill name and evidence path.
- [ ] For each genuine gap (expected: the Charter field checker and Conventions sub-folder rules), prepare one work trade with `ki-trade prepare` for `knowledgeislands/ki-agentic-harness`, citing `KI-ARCADIA-EXT-003` as origin and describing the gap, the evidence and the Arcadia and `kit-legal` precedents.
- [ ] Submit each trade with `ki-trade submit <TRD>` and record its `TRD-` identity against its row.
- [ ] Prepare the review packet and set the record to `awaiting-review`.

## Files touched

- `-/_TRADES/knowledgeislands/ki-agentic-harness/TRD-<hex>.md`, one per genuine gap (new, sender-owned).
- This record.

## Verify

- Discussion holds a six-row table in which each row names a skill and evidence path (retired) or a `TRD-` identity (handed off).
- Each trade file exists with `phase: submitted` and names `KI-ARCADIA-EXT-003` as origin.
- `ki repo audit --skill ki-trades --repo . --progress never` PASS.
- `git diff --name-only <baseline_ref>..HEAD` lists only this record and the trade files.
- `ki repo audit --progress never` PASS.

## Dependencies / blocks

No local build-order dependency. Trades are non-blocking: this record closes once the mapping is complete and each gap's trade is submitted. Reciprocity is carried by the trade identities recorded here and the receiver's `transferred_from`, not by `blocks` or `blocked_by`.

## Documentation impact

### Decision Records

None. Handing gaps to the skill owner follows existing trade governance and needs no new decision.

### Specifications

None in Arcadia. Any new rubric item is a harness standard change owned by the receiver.

### Guides

None. Arcadia's island-local conventions stay as they are.

### Roadmap

Adds one outbound work trade per genuine gap. No further Arcadia item unless the receiver declines a gap and Arcadia later wants a local mitigation.

## Discussion

### Decisions under delegated autonomy

Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: genuine gaps become harness handoffs, never Arcadia-built skills.

Planning correction (2026-10-05): the triage named `ki-agentic-harness/docs/roadmap/` as the handoff location. `ki-trade` never writes a peer checkout, so each handoff is a sender-owned trade in `-/_TRADES/`; the harness records any resulting work in its own roadmap on receipt. The retired `candidate` frontmatter field was removed, as the work-roadmap standard requires.

### Original priority reasoning

The June 2026 ordering was: activity system first (both islands needed it), then Admin zone structure (to save future migrations), the Charter checker (immediate signal for a new island), note templates, and live artifacts last (niche). The first, second, fourth and fifth now appear covered, which leaves the Charter checker as the highest-value residual.
