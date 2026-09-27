---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-005
area: ECO
title: Record how delegated agents reach governance skills
theme: ecosystem-coordination
horizon: next
status: draft
blocks: []
blocked_by: []
baseline_ref: 95f85a1a14ab9ff2834fe6d4f32355754e6de708
created_at: 2026-09-26T16:22:01Z
updated_at: 2026-09-27T16:56:00Z
---

# Record How Delegated Agents Reach Governance Skills

## Goal

Preserve the observed delegation-access failure and its handoff to the harness-owned principal ticket, so the reusable remedy has one delivery owner rather than a second implementation plan in Arcadia.

## Context

During the 2026-09-22 batch, ten delegation prompts instructed their agents to invoke `ki-guides` and `ki-authoring` through the `Skill` tool. Every one of those calls failed with `Unknown skill`. The first agent to hit it recovered on its own by reading the skill sources directly out of the harness; the remaining prompts had to be corrected mid-flight to say so up front. The batch still delivered, but each affected agent paid for the same discovery.

The cause is now confirmed rather than inferred. `ki bootstrap` installs only the change-management skills as user skills - `ki-accept`, `ki-batch`, `ki-bootstrap`, `ki-implement`, `ki-next`, `ki-plan`, and `ki-recap` are present under `~/.claude/skills/`. The governance set, including `ki-authoring`, `ki-delegation`, `ki-engineering`, `ki-guides`, and `ki-specs`, exists only in the harness at `skills/governance/`, so a runtime that resolves skills by installed name cannot see them.

This is a fact about how the skill estate is installed, not a fault in any one prompt. It belongs in the Agentic Harness, which owns both the skills and the delegation convention, rather than in an agent's memory where no other writer can see it.

## Boundary

Arcadia records the finding and hands it over. It does not change the harness, alter what `ki bootstrap` installs, or decide whether the governance skills should become installed user skills. The receiving repository owns that question. If the answer is to install them, this record's observation becomes obsolete rather than authoritative, so the harness must own the wording.

## Coordination

[KI-HARNESS-GOV-118](https://github.com/knowledgeislands/ki-agentic-harness/blob/main/docs/roadmap/KI-HARNESS-GOV-118-resolve-delegated-skill-access.md) is the principal delivery record. It owns fresh runtime grounding, the supported access route, any bounded downstream implementation records and final verification. The principal approved this ownership split on 27 September 2026; the existing Next / draft position is preserved in both this originating handoff record and the relocated principal scope, without implementation approval.

Arcadia retains the dated batch observation and local handoff verification only. The installation claims in Context remain historical evidence, not a standing assertion about every current runtime. Creating the principal ticket is not delivery or acceptance of its outcome.

## Steps

- [x] Establish the harness-owned principal record, KI-HARNESS-GOV-118, with a reciprocal origin reference.
- [ ] Review that the principal preserves the reported failure, evidence limitations and authority boundary; request correction there if needed.
- [ ] Seek explicit lifecycle disposition of this handoff record once its limited remit is verified, without claiming the principal's implementation has completed.

## Files touched

- Streams/Roadmap/KI-ARCADIA-ECO-005-record-delegated-skill-access.md

Implementation files and any further downstream roadmap records belong to the principal ticket and their respective repositories, not this Arcadia handoff.

## Verify

- The principal ticket and this origin refer to each other by canonical repository and record path.
- The principal owns fresh validation of the reported access limitation rather than treating the 26 September installation snapshot as universally current.
- Arcadia contains no competing implementation plan, private-memory remedy or automatic completion claim.

## Dependencies and blocks

Independent of KI-ARCADIA-ECO-003 and KI-ARCADIA-ECO-004. KI-HARNESS-GOV-118 is the delivery principal, not a local build-order blocker. Arcadia can verify the handoff independently; closing that handoff does not close or accept the principal outcome.

## Escalation points

Whether the governance skills should be installed as user skills is a harness decision with estate-wide consequences for delegation, prompt length, and what an agent can be told to do. Arcadia should not pre-empt it.

## Governance

This roadmap record adheres to [[Enactment Process]]. The Agentic Harness owns the skills and the delegation convention; Arcadia owns only the observation and the handover.

## Discussion

### Retained provenance

The originating diagnosis and sharing boundary remain in Arcadia. Reusable guidance and any runtime-specific downstream changes are coordinated from KI-HARNESS-GOV-118; no Agora membership or display order transfers implementation authority.
