---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-029
area: GOV
title: Agent-host credential wording
kind: deliver
purpose: governance
project: agent-host
component: governance
horizon: now
status: awaiting-review
blocks: []
blocked_by: []
baseline_ref: 59263d985cc53d5411275e0258e706841b5bb35f
created_at: 2026-10-07T20:47:00Z
updated_at: 2026-10-07T21:30:00Z
---

# Agent-Host Credential Wording

## Goal

The standing agent-host exemption describes the credentials the host actually uses, by role rather than by name, records whose identities the host's GitHub token and Claude login are, and records that the prototype review keeps the exemption as it stands.

## Context

The agent-host durability design loop found that [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] said the host build and every AWS action go "through the host's account-local operator role", while the runbook, `provision.sh` and `destroy.sh` build and destroy under the administrator SSO profile the binding declares ([merged report](<../Projects/agent-host/design/agent-host-durability-report.md>), decision 5). The GDR also required the GitHub and model API credential identity to be decided before agents work on the host, and that was not yet evidenced.

On 2026-10-07 Kris agreed the report and asked for the credential wording not to name him: "The GDR's credential wording - don't mention me directly, what should be the right approach here?" He then chose the role-based wording, chose "Mine, for now" for the credential identity, and chose "Decide 'keep' now" for [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]] ([decisions](<../Projects/agent-host/design/agent-host-durability-decisions.md>), [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]]). His grant authorises amending GDR-KI-ARCADIA-004 through an Enactment record covering the role-based wording, the identity decision and the GOV-021 keep, with this record taken to `awaiting-review`.

On 2026-10-07, in Decision 6 of the run's decisions log, Kris extended this record before acceptance: GDR-KI-ARCADIA-004's Context and Bounds are reworded by role too, not naming him where a role serves; the exemption has no fixed review date, standing until he changes it and revisited when the hold is reshaped; and the [[Agent Host Prototype Rollout]] note drops the 6 November review, with its diagram re-rendered.

## Boundary

- In scope: the Credentials and Term bullets and the review consequence of GDR-KI-ARCADIA-004, amended in place; the matching Order, Credentials and Term bullets of the [[Techne Programme Hold]]'s exemption section; and the hold's one-line summary in [[Admin/MEMORY|MEMORY]].
- Extension (Decision 6): the GDR's Context, Bounds and Consequences reworded by role; the Term bullet stating that there is no fixed review date and that the exemption is revisited when the hold is reshaped, matched in the hold and MEMORY; the hold's Bounds bullet matching the GDR; and the [[Agent Host Prototype Rollout]] note, its Archify source and its SVG, dropping the 6 November review.
- Out of scope: the exemption's scope, bounds and held items, which do not change in substance; the historical mentions of Kris elsewhere in the hold; review-date output in `ki-techne-harness` tooling, which TECHNE-TOOLS-OPS-014 owns; and any remote action.

## Current state

Delivered and awaiting Kris's review. Before this record, GDR-KI-ARCADIA-004 and the hold named Kris's own credentials through the operator role for every AWS action, left the credential identity undecided, and scheduled a review on 2026-11-06.

## Steps

- [x] Amend GDR-KI-ARCADIA-004's Credentials bullet to the role-based wording, defining the binding owner and recording the GitHub token and Claude login identity.
- [x] Amend its Term bullet and review consequence to record that the prototype review keeps the exemption, with `direct-host` remaining a recipe.
- [x] Make the same changes in the hold's exemption section, dropping the now-met identity condition from Order, and update the MEMORY summary.
- [x] Run the verification below and write the review packet.
- [x] Extension: reword the GDR's Context, Bounds and Consequences by role, state that there is no fixed review date in the GDR, the hold and MEMORY, and match the hold's Bounds bullet.
- [ ] Extension: drop the 6 November review from the rollout note and its Archify source, and re-render the SVG with Archify.

## Files touched

- `Admin/Governance/Decisions/GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold.md`
- `Admin/Governance/Policies/Techne Programme Hold.md`
- `Admin/MEMORY.md`
- `Admin/Governance/Policies/Agent Host Prototype Rollout.md`, `.archify.json` and `.svg` (extension)
- This record

## Verify

- `ki repo audit --repo .` passes.
- The amended bullets name no person where a role serves, and no added line contains an en-dash or em-dash.

## Dependencies / blocks

None. KI-ARCADIA-GOV-021 records the same keep decision on its own record.

## Documentation impact

### Decision Records

GDR-KI-ARCADIA-004 is amended in place. ODR-KI-ARCADIA-001 records the durability design and already refers to the role-based credentials.

### Specifications

None: Arcadia holds no specification for the exemption.

### Guides

The hold policy changes as listed. The `ki-techne-harness` operator guide is changed by its own pilot record, not here.

### Roadmap

None beyond KI-ARCADIA-GOV-021, which records the keep on its own record.

## Review

### Delivered

The approved boundary: the role-based credential wording, the credential-identity decision and the prototype-review keep, applied in place to GDR-KI-ARCADIA-004, the hold's exemption section and the MEMORY summary. Exclusions are as listed under Boundary. Baseline `59263d985cc53d5411275e0258e706841b5bb35f`; the result is this record's commit.

### Change Summary

- GDR-KI-ARCADIA-004: the Credentials bullet now defines the binding owner as the person whose `agent-host` binding operates the host, puts build, rebuild and teardown under the binding owner's administrator session in the Techne account and day-to-day operation under the operator role, and records that the GitHub token and Claude login are the binding owner's own identities until unattended agents arrive, which stay held. The Term bullet replaces "Kris reviews it on 2026-11-06" with the review's keep outcome, and the review consequence now says that widening or withdrawing needs an Enactment record.
- Techne Programme Hold: the Credentials and Term bullets match the GDR; the Order bullet drops the identity condition, which is now met; `updated` advances.
- MEMORY: the hold summary says the prototype review keeps the exemption instead of naming the review date.
- Extension: GDR-KI-ARCADIA-004's Context names the island owner where it named Kris, its Bounds name the binding owner as the person who reaches the host, opens sessions and asks for pushes, and its Consequences place the operator tooling in the binding owner's chezmoi source. Its Term bullet, and the hold's, now say there is no fixed review date and that the exemption is revisited when the hold is reshaped; the hold's Bounds bullet matches the GDR, its rollout pointer no longer mentions a review, and MEMORY says there is no fixed review date.

### Verification

- `ki repo audit --repo .` on 2026-10-07: 24 skills pass. The one failure, `ki-decision-records` RUBRIC-1 (`references/rubric.md` differs from the structured catalogue), comes from uncommitted edits to that skill in the local `ki-agentic-harness` checkout made by another session, as do its new BODY-11 warnings on links outside the decisions collection; neither is caused by this record. With the committed skill, `ki repo audit --skill ki-decision-records` passed earlier the same evening.
- No en-dash or em-dash in any added line; the amended Credentials and Term bullets name no person.

### Outstanding concerns

- **Review date in tooling.** `host/status.sh` in `ki-techne-harness` still prints the exemption review as due 2026-11-06; TECHNE-TOOLS-OPS-014 owns removing that line.
- Resolved by the extension: the rollout note and diagram, and the question of a later review date (none, per Decision 6).

### Post-change review

The goal is met: the exemption states credentials by role, matches the build and destroy practice, records the identity decision and records the keep. Scope held to the three files. Regression risk is low: scope, bounds and held items are unchanged. This is the implementing agent's own check against Kris's words, not an independent review.

### Mini recap

GOV-029 rewords the agent-host exemption's credentials by role, records the binding owner's GitHub and Claude identities and the early keep, in GDR-KI-ARCADIA-004 and the hold. Learning route: none beyond the outstanding concerns above.

## Discussion

### Role wording

"Binding owner" ties the credentials to the `agent-host` binding rather than to a person, so the text stays true if the binding changes hands, and "island owner" names who changes or withdraws the exemption, as the Enactment Process's approver.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
