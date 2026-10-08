---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-024
area: GOV
title: Review the enactment threshold
kind: decide
purpose: governance
project: island-model-and-tending
component: operations
horizon: now
status: awaiting-review
blocks: []
blocked_by: []
baseline_ref: 13b7a2e1b528e8280556db83e7edec5635f6cb95
created_at: 2026-10-07T07:44:25Z
updated_at: 2026-10-08T19:31:00Z
---

# Review the Enactment Threshold

## Goal

Arcadia has a clear, proportionate threshold for when a change needs an Enactment record and when it can be a direct edit, so that small, owner-instructed changes do not carry the cost of a full record while substantive changes to canonical content stay gated.

## Context

Kris Brown, 2026-10-07 09:30 CEST: "I think we need to look at when an enactment record is needed too".

Today root `AGENTS.md` says substantive changes to `Admin`, `Pillars` and `Resources` go through the [[Admin/Operations/Processes/Enactment Process|Enactment Process]], with trivial typo and formatting fixes, `Calendar/` entries and `+/` triage exempt. The Enactment Process note adds "When in doubt, prefer a proposal". Neither defines "substantive", and neither names a lighter path for a small change that Kris has instructed directly.

Evidence from 2026-10-07:

- A one-paragraph change, adding `ki-techne-harness` and `tools-techne` to the cross-repository handoff list in root `AGENTS.md`, was proposed as a full Enactment record before Kris declined it: "no need for an enactment record". Root `AGENTS.md` is not a canonical zone, so the edit was made directly.
- Three records, KI-ARCADIA-GOV-021, KI-ARCADIA-GOV-022 and KI-ARCADIA-GOV-023, were opened around the one agent host that KI-ARCADIA-GOV-020 authorised.

## Boundary

- In scope: what counts as substantive; whether an explicit owner instruction for a bounded change can stand in for a record; where the line falls between canonical zones and repository orientation files such as root `AGENTS.md`; and when related changes should share one record rather than open several.
- Out of scope: changing the threshold before this record is adopted and planned; the Enactment lifecycle itself; other repositories' change-management rules.

## Current state

Kris agreed the outcome on 2026-10-08 (gov-020 decisions log, Decision 3), and that agreement approves this record for delivery and acceptance:

- An explicit owner instruction for a bounded change stands in for an Enactment record.
- Related changes share one record.
- A record is needed only for new or reworked content in `Admin`, `Pillars` or `Resources`.

Trivial typo and formatting fixes, `Calendar/` entries and `+/` triage stay exempt. The [[Admin/Operations/Processes/Enactment Process|Enactment Process]] note still says "When in doubt, prefer a proposal", and root `AGENTS.md` still gates every "substantive" change.

`ki-decision-records` reserves a new Decision Record for a genuinely independent decision and has the owning record amended in place. The threshold refines the Enactment gate that SDR-KI-ARCADIA-004 owns, so that record is amended rather than a new one added.

## Steps

1. Rewrite the in-scope and out-of-scope bullets of the local Enactment Process note to state the threshold, replacing "When in doubt, prefer a proposal".
2. Rewrite root `AGENTS.md` "Changing canonical content" to the same threshold.
3. Amend SDR-KI-ARCADIA-004 in place so its Decision and Consequences carry the threshold.
4. Run the repository's Markdown gate and the Streams, Decision Record and principal audits.

## Files touched

- `Admin/Operations/Processes/Enactment Process.md`
- `AGENTS.md`
- `Admin/Governance/Decisions/SDR-KI-ARCADIA-004-the-enactment-process.md`
- This record

## Verify

- The three documents state the same three rules and the same exemptions, and none still says "When in doubt, prefer a proposal".
- `ki repo audit` passes for `ki-repo-kb-streams`, `ki-decision-records` and `ki-repo-kb-principal`, and the commit hooks pass.

## Dependencies / blocks

None.

## Discussion

### Capture

Captured as Triage on Kris's instruction.

### Adoption and plan

Adopted to Now as `decide` and planned to Ready on 2026-10-08 under Kris's agreement of the outcome (gov-020 decisions log, Decision 3).

## Review

### Delivered

The agreed threshold is stated in all three owners from baseline `13b7a2e1b528e8280556db83e7edec5635f6cb95`.

### Change Summary

- The local Enactment Process note replaces its in-scope and out-of-scope bullets with four: when a record is needed, owner instruction, one record for related changes, and exemptions. "When in doubt, prefer a proposal" is gone.
- Root `AGENTS.md` "Changing canonical content" gates only new or reworked content and lists the owner-instruction rule, the shared-record rule and the unchanged exemptions.
- SDR-KI-ARCADIA-004 is amended in place: its Consequences carry the threshold. No new Decision Record was added, because `ki-decision-records` has the owning record amended rather than a new one created.

### Verification

`ki repo audit` passes for `ki-repo-kb-streams`, `ki-decision-records`, `ki-repo-kb-principal` and `ki-repo-kb`. A first principal run failed PRINCIPAL-2 because the reworded `AGENTS.md` sentence no longer matched its "must ... go through" anchor; the wording was corrected and the audit passes. The commit hooks' Markdown gate passes.

### Outstanding concerns

None.

### Post-change review

The intended threshold, three rules and unchanged exemptions, landed in the three planned files and nowhere else. The Enactment Process note also names root `AGENTS.md` as outside the canonical zones, matching the evidence in Context.

### Mini recap

The Enactment threshold is now proportionate and stated consistently; no follow-up work is proposed.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
