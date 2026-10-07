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
updated_at: 2026-10-07T20:47:00Z
---

# Agent-Host Credential Wording

## Goal

The standing agent-host exemption describes the credentials the host actually uses, by role rather than by name, records whose identities the host's GitHub token and Claude login are, and records that the prototype review keeps the exemption as it stands.

## Context

The agent-host durability design loop found that [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] said the host build and every AWS action go "through the host's account-local operator role", while the runbook, `provision.sh` and `destroy.sh` build and destroy under the administrator SSO profile the binding declares ([merged report](<../../Admin/Governance/Decisions/references/agent-host-durability-report.md>), decision 5). The GDR also required the GitHub and model API credential identity to be decided before agents work on the host, and that was not yet evidenced.

On 2026-10-07 Kris agreed the report and asked for the credential wording not to name him: "The GDR's credential wording - don't mention me directly, what should be the right approach here?" He then chose the role-based wording, chose "Mine, for now" for the credential identity, and chose "Decide 'keep' now" for [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]] ([decisions](<../../Admin/Governance/Decisions/references/agent-host-durability-decisions.md>), [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]]). His grant authorises amending GDR-KI-ARCADIA-004 through an Enactment record covering the role-based wording, the identity decision and the GOV-021 keep, with this record taken to `awaiting-review`.

## Boundary

- In scope: the Credentials and Term bullets and the review consequence of GDR-KI-ARCADIA-004, amended in place; the matching Order, Credentials and Term bullets of the [[Techne Programme Hold]]'s exemption section; and the hold's one-line summary in [[Admin/MEMORY|MEMORY]].
- Out of scope: the exemption's scope, bounds and held items, which do not change; the other mentions of Kris in the GDR's Context and Bounds, which this record does not reword; the [[Agent Host Prototype Rollout]] note and its diagram, which still show a 6 November review; and any remote action.

## Current state

Delivered and awaiting Kris's review. Before this record, GDR-KI-ARCADIA-004 and the hold named Kris's own credentials through the operator role for every AWS action, left the credential identity undecided, and scheduled a review on 2026-11-06.

## Steps

- [x] Amend GDR-KI-ARCADIA-004's Credentials bullet to the role-based wording, defining the binding owner and recording the GitHub token and Claude login identity.
- [x] Amend its Term bullet and review consequence to record that the prototype review keeps the exemption, with `direct-host` remaining a recipe.
- [x] Make the same changes in the hold's exemption section, dropping the now-met identity condition from Order, and update the MEMORY summary.
- [x] Run the verification below and write the review packet.

## Files touched

- `Admin/Governance/Decisions/GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold.md`
- `Admin/Governance/Policies/Techne Programme Hold.md`
- `Admin/MEMORY.md`
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

### Verification

- `ki repo audit --repo .` on 2026-10-07: 24 skills pass. The one failure, `ki-decision-records` RUBRIC-1 (`references/rubric.md` differs from the structured catalogue), comes from uncommitted edits to that skill in the local `ki-agentic-harness` checkout made by another session, as do its new BODY-11 warnings on links outside the decisions collection; neither is caused by this record. With the committed skill, `ki repo audit --skill ki-decision-records` passed earlier the same evening.
- No en-dash or em-dash in any added line; the amended Credentials and Term bullets name no person.

### Outstanding concerns

- **Rollout note and diagram.** [[Agent Host Prototype Rollout]] and its Archify diagram still describe a review on 6 November 2026; the next change to that note should re-render it. Recorded in the [[agent-host]] Project note.
- **Review date in tooling.** `host/status.sh` in `ki-techne-harness` still prints the exemption review as due 2026-11-06; the harness pilot record owns its removal or replacement.
- **No later review date.** The GDR now sets no further review date. Whether to schedule one is Kris's call.
- Nothing is pushed: Arcadia main carries another session's unpushed commits.

### Post-change review

The goal is met: the exemption states credentials by role, matches the build and destroy practice, records the identity decision and records the keep. Scope held to the three files. Regression risk is low: scope, bounds and held items are unchanged. This is the implementing agent's own check against Kris's words, not an independent review.

### Mini recap

GOV-029 rewords the agent-host exemption's credentials by role, records the binding owner's GitHub and Claude identities and the early keep, in GDR-KI-ARCADIA-004 and the hold. Learning route: none beyond the outstanding concerns above.

## Discussion

### Role wording

"Binding owner" ties the credentials to the `agent-host` binding rather than to a person, so the text stays true if the binding changes hands, and "island owner" names who changes or withdraws the exemption, as the Enactment Process's approver.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
