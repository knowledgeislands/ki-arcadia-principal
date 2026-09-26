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
updated_at: 2026-09-26T16:22:01Z
---

# Record How Delegated Agents Reach Governance Skills

## Goal

Write down, where a delegating agent will read it before writing a prompt, that the Knowledge Islands governance skills are not invocable through the runtime `Skill` tool, and that a delegated agent must read them from the Agentic Harness working tree instead.

## Context

During the 2026-09-22 batch, ten delegation prompts instructed their agents to invoke `ki-guides` and `ki-authoring` through the `Skill` tool. Every one of those calls failed with `Unknown skill`. The first agent to hit it recovered on its own by reading the skill sources directly out of the harness; the remaining prompts had to be corrected mid-flight to say so up front. The batch still delivered, but each affected agent paid for the same discovery.

The cause is now confirmed rather than inferred. `ki bootstrap` installs only the change-management skills as user skills - `ki-accept`, `ki-batch`, `ki-bootstrap`, `ki-implement`, `ki-next`, `ki-plan`, and `ki-recap` are present under `~/.claude/skills/`. The governance set, including `ki-authoring`, `ki-delegation`, `ki-engineering`, `ki-guides`, and `ki-specs`, exists only in the harness at `skills/governance/`, so a runtime that resolves skills by installed name cannot see them.

This is a fact about how the skill estate is installed, not a fault in any one prompt. It belongs in the Agentic Harness, which owns both the skills and the delegation convention, rather than in an agent's memory where no other writer can see it.

## Boundary

Arcadia records the finding and hands it over. It does not change the harness, alter what `ki bootstrap` installs, or decide whether the governance skills should become installed user skills. The receiving repository owns that question. If the answer is to install them, this record's observation becomes obsolete rather than authoritative, so the harness must own the wording.

## Steps

- [ ] Re-confirm the installed skill set and the harness governance set before handing over; both may have changed since 2026-09-26.
- [ ] Open a receiver-owned record in `ki-agentic-harness` to document how a delegated agent reaches a governance skill, naming this record as the origin.
- [ ] Let the harness decide between documenting the harness path in its delegation guidance and installing the governance skills so the `Skill` tool resolves them.
- [ ] Ensure whatever the harness decides is reachable from `ki-delegation`, since that is the skill a delegating agent reads before writing a prompt.
- [ ] Mark this record `done` once the harness record exists, whatever the harness chooses to do about it.

## Files touched

- `Streams/Roadmap/KI-ARCADIA-ECO-005-record-delegated-skill-access.md`
- `Streams/Roadmap/_ISSUES.md`
- The harness record is created by the harness.

## Verify

- The claim is restated from a fresh listing of `~/.claude/skills/` and the harness `skills/governance/` directory at the time of handover, not from this record.
- A delegating agent following the harness's delegation guidance can tell, without trying it, whether a named skill is invocable.
- Nothing is written into agent memory in place of the harness record; the point of the item is that the fact must be visible to other writers.

## Dependencies and blocks

Independent of `KI-ARCADIA-ECO-003` and `KI-ARCADIA-ECO-004`. It affects how future batches are delegated rather than the work those records carry.

## Escalation points

Whether the governance skills should be installed as user skills is a harness decision with estate-wide consequences for delegation, prompt length, and what an agent can be told to do. Arcadia should not pre-empt it.

## Governance

This roadmap record adheres to [[Enactment Process]]. The Agentic Harness owns the skills and the delegation convention; Arcadia owns only the observation and the handover.
