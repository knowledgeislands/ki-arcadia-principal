---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-023
area: GOV
title: Widen the agent-host exemption to a standing one
theme: governance
horizon: now
status: ready
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-07T06:58:00Z
updated_at: 2026-10-07T06:58:00Z
---

# Widen the Agent-Host Exemption to a Standing One

## Goal

The [[Techne Programme Hold]] exemption made by [[KI-ARCADIA-GOV-020-limited-remote-agent-prototype|KI-ARCADIA-GOV-020]] covers setting up and operating the one agent host properly and durably, not only as a stopgap. It has no automatic lapse: it stands until Kris changes or withdraws it, with a scheduled review on 2026-11-06. GDR-KI-ARCADIA-004 is amended in place to match.

## Context

GOV-020 authorised a limited remote agent prototype, one EC2 instance `ki-techne-agent-host` beside the untouched controller, for a 30-day term that lapses on 2026-11-06 unless renewed. [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]] tracks that date as a renew-or-teardown decision.

Since then the host has been built and is running and in use. `ki-techne-harness` delivered the stack and runbook (`TECHNE-TOOLS-OPS-009`) and their diagrams (`TECHNE-TOOLS-OPS-010`), and has planned rerunnable workspace setup, updates and status (`TECHNE-TOOLS-OPS-011`). `tools-techne` has captured a `techne host` command group (`TECHNE-TOOL-CLI-004`). The chezmoi operator tooling (`DOTFILES-UE-068`) was corrected to assume the account-local operator role. The time-boxed wording treats this ongoing set-up work as a stopgap.

Kris Brown, 2026-10-07 08:40 CEST: "I want the exemption to cover setting this agent-host up correctly, not just a stop gap". Kris chose no automatic lapse: the exemption stays in force for this one host until Kris changes or withdraws it, and GOV-021 becomes a scheduled review on 2026-11-06 rather than a renew-or-teardown expiry. At 08:52 CEST Kris decided that GDR-KI-ARCADIA-004 is amended in place and retitled, per the `ki-decision-records` skill, with no new Decision Record. Kris's instruction is the approval to enact this record, including the canonical edits in `Admin`.

## Boundary

- In scope: the hold's exemption section; GDR-KI-ARCADIA-004 amended in place, retitled and renamed, with every link to it updated; the Decisions index and the hold entries in [[Policies]], [[Admin/MEMORY|MEMORY]] and `Pillars/Engineering Practice/MEMORY.md`; GOV-021 reshaped to a scheduled review; the rollout and concept-map notes and diagrams only where they state the lapse or a stopgap; the `state-of-play` and `baseline-and-cloud` checkpoints.
- Out of scope: any change to the unchanged bounds listed below; the three hold prerequisites for any other remote operation; GOV-020 itself, which is done and keeps its accepted text; any remote action, AWS, Tailscale or GitHub call; work records in other repositories.

## Exemption scope

The exemption covers setting up and operating the single agent host `ki-techne-agent-host`, the instance tagged `ki-agent-host-id=agent-host` in account `655383751458`, `eu-west-1`, properly and durably:

- building, rebuilding or replacing that one host through the `ki-techne-harness` stack;
- its rerunnable workspace setup, updates and status (`TECHNE-TOOLS-OPS-011`);
- its operator commands in the `techne` CLI acting only on it (the `tools-techne` host command group, `TECHNE-TOOL-CLI-004`);
- its account-local operator role, its `/ki/techne/agent-host/` parameters, its tailnet tag and policy entries, and rotating its credentials.

Unchanged bounds: exactly one host; no public inbound; Tailscale SSH; Kris-initiated sessions only, with no unattended or scheduled agents; the agent rules (explicit-path commits, no push unless asked, no prune, no acceptance); the kill switch and teardown; existing remote services, the controller `ki-techne-ops-007-primary` and its stack, untouched. Still held: remote Paperclip, Kitteth and any Avatar, Telegram and every other messaging channel, wider K3s or controller changes, the execution fabric, every other environment, and anything in the organisation or its management account.

Term: no automatic lapse. The exemption stands until Kris changes or withdraws it, with a scheduled review on 2026-11-06.

## Current state

The exemption section of the hold, GDR-KI-ARCADIA-004 and every note that summarises them still describe a 30-day term that lapses on 2026-11-06 unless renewed. Both diagrams carry a label stating the lapse: the rollout's GOV-021 node reads "renew or tear down" after "term ends", and the concept map's live region reads "Live until 6 November 2026".

## Steps

- [ ] Amend the hold's exemption section to the scope, unchanged bounds and term above; no other section changes.
- [ ] Amend GDR-KI-ARCADIA-004 in place to the new scope and term, retitle it "Standing agent-host exemption from the Techne Programme Hold", rename its file to match, and update every link to it.
- [ ] Update the Decisions index entry and the hold entries in [[Policies]], [[Admin/MEMORY|MEMORY]] and `Pillars/Engineering Practice/MEMORY.md`.
- [ ] Reshape GOV-021 into a scheduled review on 2026-11-06 of the standing exemption: scope, bounds, cost, and whether to widen or withdraw it.
- [ ] Update the rollout and concept-map notes where they state the lapse; change the lapse labels in both Archify sources and re-render their SVGs with Archify.
- [ ] Update the `state-of-play` and `baseline-and-cloud` checkpoints with this outcome and the rollout facts since their last update.
- [ ] Run the verification below and write the review packet.

## Files touched

- `Admin/Governance/Policies/Techne Programme Hold.md`
- `Admin/Governance/Decisions/GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold.md` (renamed from `GDR-KI-ARCADIA-004-time-boxed-remote-prototype-exemption-from-the-techne-programme-hold.md`)
- `Admin/Governance/Decisions/Decisions.md`
- `Admin/Governance/Policies/Policies.md`
- `Admin/MEMORY.md`
- `Pillars/Engineering Practice/MEMORY.md`
- `Admin/Governance/Policies/Agent Host Prototype Rollout.md`, `.archify.json` and `.svg`
- `Pillars/Engineering Practice/Architecture/Diagrams/Agent Host Prototype Concept Map.md`, `.archify.json` and `.svg`
- `Streams/Roadmap/KI-ARCADIA-GOV-021-review-the-agent-host-prototype.md`
- `+/_CHECKPOINTS/state-of-play.md` and `+/_CHECKPOINTS/baseline-and-cloud.md`
- This record

## Verify

- `ki repo audit` passes for `ki-repo-kb-streams`, `ki-decision-records`, `ki-checkpoint` and `ki-repo-kb`.
- No file outside GOV-020's done record and Git history links to the old GDR filename.
- The hold no longer states a lapse; it states "until Kris changes or withdraws it" and the review date, and its other sections are unchanged in the diff.
- `archify finalize` passes every gate for both amended sources.
- No en-dash or em-dash appears in any added line.

## Dependencies / blocks

None. The harness, CLI and chezmoi records named above proceed under the widened exemption in their own repositories; this record sets no `blocks`.

## Documentation impact

### Decision Records

GDR-KI-ARCADIA-004 is amended in place and retitled; no new Decision Record.

### Specifications

None.

### Guides

None here. The agent-host runbook in `ki-techne-harness` may restate the term; its own repository updates it.

### Roadmap

GOV-021 is reshaped from renew-or-teardown into a scheduled review.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
