---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-022
area: GOV
title: File the agent-host prototype diagrams
theme: governance
horizon: now
status: ready
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-07T04:45:00Z
updated_at: 2026-10-07T04:45:00Z
---

# File the Agent-Host Prototype Diagrams

## Goal

The two GOV-020 diagrams that explain the prototype in Knowledge Islands terms and its governance, the concept map and the rollout, are filed in Arcadia beside the knowledge they support, each embedded and explained by a note, with its editable source alongside.

## Context

During the GOV-020 work four Archify diagrams were drafted outside any repository: the agent-host architecture, a concept map of the prototype in Knowledge Islands terms, the rollout with its gates, and one working session. Operator access was later made an account-local IAM role (see [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]]), and the architecture and rollout drafts were updated to match.

On 2026-10-07 Kris asked for the diagrams in Arcadia, noting that some might sit better in `ki-techne-harness`, and approved in principle this split: the concept map and the rollout here; the architecture and the session sequence beside the agent-host runbook in `ki-techne-harness`, through that repository's own roadmap. Kris's instruction is the approval to enact this record.

## Boundary

- In scope: the concept map and the rollout, as an Archify JSON source and a rendered SVG each, with one explaining note per diagram and the index entries the structure rules require; a pointer from the [[Techne Programme Hold]] exemption to the rollout.
- Out of scope: the architecture and session diagrams, which `ki-techne-harness` files; any change to the hold's meaning, to GDR-KI-ARCADIA-004 or to the GOV-020 bounds; the large generated Archify HTML, which is not committed; any remote action.

## Current state

No diagram of the prototype is filed anywhere. [[Pillars/Engineering Practice/Architecture/Diagrams/Diagrams|Diagrams]] holds only the Engineering Estate diagram and its Mermaid source, and its index is a contents list. [[Policies]] holds the hold and its index. The concept-map draft still labels operator access "permission set", which the account-local role superseded.

## Steps

- [ ] Concept map: correct the operator sublabel to the account-local role, re-render and pass Archify's `finalize` gates, then file the JSON source and an SVG export with a `pillars/note` explaining it in `Pillars/Engineering Practice/Architecture/Diagrams/`.
- [ ] Rollout: file the current JSON source and an SVG export with an `admin/governance/policy` note explaining it in `Admin/Governance/Policies/`, beside the hold whose exemption it explains.
- [ ] Rewrite the Diagrams index as an overview with one section per child, and add a rollout section to [[Policies]].
- [ ] Add one pointer sentence to the hold's exemption section; no other line changes.
- [ ] Run the verification below and write the review packet.

## Files touched

- `Pillars/Engineering Practice/Architecture/Diagrams/Agent Host Prototype Concept Map.md` (new)
- `Pillars/Engineering Practice/Architecture/Diagrams/Agent Host Prototype Concept Map.svg` (new)
- `Pillars/Engineering Practice/Architecture/Diagrams/Agent Host Prototype Concept Map.archify.json` (new)
- `Pillars/Engineering Practice/Architecture/Diagrams/Diagrams.md`
- `Admin/Governance/Policies/Agent Host Prototype Rollout.md` (new)
- `Admin/Governance/Policies/Agent Host Prototype Rollout.svg` (new)
- `Admin/Governance/Policies/Agent Host Prototype Rollout.archify.json` (new)
- `Admin/Governance/Policies/Policies.md`
- `Admin/Governance/Policies/Techne Programme Hold.md`
- This record

## Verify

- `archify validate` passes for both committed JSON sources, and `archify finalize` passes every gate when rendered from them.
- `ki repo audit` passes for `ki-repo-kb`, `ki-repo-kb-streams`, `ki-repo-kb-principal`, `ki-authoring` and `ki-work`.
- The diff of the hold adds one sentence and the `updated` value only.
- No en-dash or em-dash appears in any added line.

## Dependencies / blocks

None. The `ki-techne-harness` half is independent and tracked in that repository.

## Documentation impact

### Decision Records

None. Filing explanatory diagrams makes no decision.

### Specifications

None.

### Guides

None here. The operator runbook in `ki-techne-harness` receives the architecture and session diagrams through its own record.

### Roadmap

None beyond this record.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
