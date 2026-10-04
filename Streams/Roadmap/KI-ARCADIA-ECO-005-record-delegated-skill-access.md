---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-005
area: ECO
title: Record how delegated agents reach governance skills
theme: ecosystem-coordination
horizon: next
status: awaiting-review
blocks: []
blocked_by: []
baseline_ref: d2a8147521e1faa6dbe56fa46a849b5b5ab75034
created_at: 2026-09-26T16:22:01Z
updated_at: 2026-10-04T11:47:30Z
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

## Current state

On 2026-10-04 the harness principal record was read at `ki-agentic-harness` `9fda7bc0b178` (record last changed in `7032da5b`). It links this origin by canonical URL, treats the 26 September installation observation as dated evidence to recheck, keeps its own Next / draft position, and excludes Arcadia knowledge files and runtime configuration from its remit. No correction request is needed.

## Steps

- [x] Establish the harness-owned principal record, KI-HARNESS-GOV-118, with a reciprocal origin reference.
- [x] Review that the principal preserves the reported failure, evidence limitations and authority boundary; request correction there if needed.
- [x] Prepare the handoff delivery review packet for independent review and `ki-accept`, without claiming the principal's implementation has completed.

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

## Review

### Delivered

Verification of this Arcadia handoff only, from immutable baseline `d2a8147521e1faa6dbe56fa46a849b5b5ab75034`. Excluded: any change to KI-HARNESS-GOV-118, the harness, `ki bootstrap` or runtime configuration, and any claim about the principal's outcome.

### Change Summary

Only this record changed: a Current state section with the dated harness evidence, the two remaining Steps completed, lifecycle metadata, and this packet. No harness file was touched and no correction request was raised.

### Verification

- The harness record links this origin by canonical GitHub URL, and this record links the harness record by canonical URL: reciprocal.
- The harness record states the 26 September observation is dated evidence to recheck and keeps a Next / draft position with fresh grounding as its first Step.
- This record contains no implementation plan, private-memory remedy or completion claim for the principal.
- `ki repo audit --skill ki-repo-kb-streams` passed.

### Outstanding concerns

None for the handoff. The principal outcome remains open in KI-HARNESS-GOV-118 under harness authority.

### Post-change review

The limited remit - preserve the observation and verify the handoff - is met without scope expansion. Closing this record does not close or accept the principal. Ready for acceptance.

### Mini recap

Handoff to KI-HARNESS-GOV-118 verified as faithful and reciprocal; no corrections needed. No learning route proposed.

## Discussion

### Retained provenance

The originating diagnosis and sharing boundary remain in Arcadia. Reusable guidance and any runtime-specific downstream changes are coordinated from KI-HARNESS-GOV-118; no Agora membership or display order transfers implementation authority.

### Pickup checkpoint - 2026-09-27

Before further implementation, reconcile the current destination branch, linked coordination tasks, and retained worktrees where applicable. Missing evidence does not release ownership or a hold; this checkpoint is guidance, not a mechanical execution block.

- **Observed:** The harness-owned `KI-HARNESS-GOV-118` record exists, and the first local Step is checked. Its implementation remains the harness's work, not a prerequisite for closing this Arcadia handoff.
- **Resolve:** Compare the harness record with the reported failure, evidence limits, reciprocal origin, and authority boundary. Record any correction request there, then verify whether Arcadia's remaining two Steps are complete.
- **Close:** Once the local handoff is verified, prepare its delivery review packet and seek owner acceptance through `ki-accept`. Retain the `done` record; leave pruning to a later explicit owner selection.
