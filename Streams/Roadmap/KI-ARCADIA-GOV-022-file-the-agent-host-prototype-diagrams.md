---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-022
area: GOV
title: File the agent-host prototype diagrams
theme: governance
horizon: now
status: awaiting-review
blocks: []
blocked_by: []
baseline_ref: 11fbc2f8cb2016bd09640e90f0923a079d723b98
created_at: 2026-10-07T04:45:00Z
updated_at: 2026-10-07T04:58:00Z
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

- [x] Concept map: correct the operator sublabel to the account-local role, re-render and pass Archify's `finalize` gates, then file the JSON source and an SVG export with a `pillars/note` explaining it in `Pillars/Engineering Practice/Architecture/Diagrams/`.
- [x] Rollout: file the current JSON source and an SVG export with an `admin/governance/policy` note explaining it in `Admin/Governance/Policies/`, beside the hold whose exemption it explains.
- [x] Rewrite the Diagrams index as an overview with one section per child, and add a rollout section to [[Policies]].
- [x] Add one pointer sentence to the hold's exemption section; no other line changes.
- [x] Run the verification below and write the review packet.

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

## Review

### Delivered

The approved boundary: the concept map and the rollout filed with their Archify sources, an explaining note each, the index entries, and one pointer from the hold. Excluded, as planned: the architecture and session diagrams, which `ki-techne-harness` files under its own record, any change to the hold's meaning, and the generated HTML. Baseline `11fbc2f8cb2016bd09640e90f0923a079d723b98` (the ready plan); delivery in the commit that moves this record to `awaiting-review`.

### Change Summary

- `Pillars/Engineering Practice/Architecture/Diagrams/Agent Host Prototype Concept Map.archify.json`, `.svg` and `.md`: new. The source is the draft with one correction: the Operator / Architect sublabel now reads "account-local role, human only" instead of "permission set, human only", matching the role recorded in [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]]. The SVG (about 170 KB) is the viewer's "SVG Auto" export, which embeds its font and follows the reader's light or dark theme.
- `Admin/Governance/Policies/Agent Host Prototype Rollout.archify.json`, `.svg` and `.md`: new. The source is the current draft unchanged apart from `meta.output`. The note is typed `admin/governance/policy`, as `ki-repo-kb` types everything under `Admin/Governance/Policies/`, and states that the hold and GDR-KI-ARCADIA-004 govern where it differs from them.
- `Pillars/Engineering Practice/Architecture/Diagrams/Diagrams.md`: rewritten from a contents list into an overview with one section per diagram, keeping its provenance.
- `Admin/Governance/Policies/Policies.md`: a section for the rollout.
- `Admin/Governance/Policies/Techne Programme Hold.md`: one sentence pointing to the rollout, before "Outside this exemption the hold stands unchanged", and the `updated` value. No other line changed.
- This record: plan ticked, lifecycle and review packet.

No deviation from the plan.

### Verification

- `archify finalize` from both committed sources (copied to a scratch folder): validate, deliver, check and browser-check all pass at `showcase` quality.
- The rollout source matches the current draft except `meta.output`.
- `ki repo audit --repo .` (24 skills): PASS. `--skill` runs for `ki-repo-kb`, `ki-repo-kb-streams`, `ki-repo-kb-principal`, `ki-authoring`, `ki-work` and `ki-decision-records`: PASS.
- `rumdl check` on the touched folders and this record: no issues.
- No en-dash or em-dash in any added line or new file.
- The SVGs were inspected by eye as PNG exports of the same render.

### Outstanding concerns

- **The SVG omits the viewer's cards.** Archify's canonical export carries the diagram and legend but not the HTML viewer's explanatory cards, so each note carries that content in prose.
- **Export is a viewer step.** Archify has no command-line SVG export; the SVGs were exported by driving the viewer's own export in headless Chrome, locally. Each note says how to regenerate.
- **"Permission set" elsewhere.** GOV-020 and GDR-KI-ARCADIA-004 still say "permission set"; GOV-021 already holds that question. The concept map now follows the role.
- **Rollout in Policies.** The rollout note sits beside the hold rather than beside GDR-KI-ARCADIA-004, because the Decisions collection is reserved for Decision Records.

### Post-change review

The goal is met: both diagrams are filed beside the knowledge they illustrate, embedded and explained, with editable sources. Scope held: nine canonical files plus this record. Regression risk is low; the only change to existing policy text is one pointer sentence. The review was the implementing agent's own rereading against the drafts, the hold and the audits, not an independent reviewer.

### Mini recap

GOV-022 filed the concept map in Engineering Practice Diagrams and the rollout beside the Techne Programme Hold, each as Archify JSON, SVG and an explaining note, corrected the concept map's stale "permission set" label, and restructured the Diagrams index. Every audit passes. Proposed learning route: how to export Archify diagrams for Markdown, to the `archify` or `ki-authoring` guidance through its own record.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
