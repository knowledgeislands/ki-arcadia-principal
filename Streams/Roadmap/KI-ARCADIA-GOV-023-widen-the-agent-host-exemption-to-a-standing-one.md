---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-023
area: GOV
title: Widen the agent-host exemption to a standing one
theme: governance
horizon: now
status: done
blocks: []
blocked_by: []
baseline_ref: 68f245cd7485592f6e98d2c5642c82806721ce1d
created_at: 2026-10-07T06:58:00Z
updated_at: 2026-10-07T07:40:00Z
---

# Widen the Agent-Host Exemption to a Standing One

## Goal

The [[Techne Programme Hold]] exemption made by [[KI-ARCADIA-GOV-020-limited-remote-agent-prototype|KI-ARCADIA-GOV-020]] covers setting up and operating the one agent host properly and durably, not only as a stopgap. It has no automatic lapse: it stands until Kris changes or withdraws it, with a scheduled review on 2026-11-06. GDR-KI-ARCADIA-004 is amended in place to match.

## Context

GOV-020 authorised a limited remote agent prototype, one EC2 instance `ki-techne-agent-host` beside the untouched controller, for a 30-day term that lapses on 2026-11-06 unless renewed. [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]] tracks that date as a renew-or-teardown decision.

Since then the host has been built and is running and in use. `ki-techne-harness` delivered the stack and runbook (`TECHNE-TOOLS-OPS-009`) and their diagrams (`TECHNE-TOOLS-OPS-010`), and has planned rerunnable workspace setup, updates and status (`TECHNE-TOOLS-OPS-011`). `tools-techne` has captured a `techne host` command group (`TECHNE-TOOL-CLI-004`). The chezmoi operator tooling (`DOTFILES-UE-068`) was corrected to assume the account-local operator role. The time-boxed wording treats this ongoing set-up work as a stopgap.

Kris Brown, 2026-10-07 08:40 CEST: "I want the exemption to cover setting this agent-host up correctly, not just a stop gap". Kris chose no automatic lapse: the exemption stays in force for this one host until Kris changes or withdraws it, and GOV-021 becomes a scheduled review on 2026-11-06 rather than a renew-or-teardown expiry. At 08:52 CEST Kris decided that GDR-KI-ARCADIA-004 is amended in place and retitled, per the `ki-decision-records` skill, with no new Decision Record. Kris's instruction is the approval to enact this record, including the canonical edits in `Admin`.

## Boundary

- In scope: the hold's exemption section; GDR-KI-ARCADIA-004 amended in place, retitled and renamed, with every link to it updated; the Decisions index and the hold entries in [[Policies]], [[Admin/MEMORY|MEMORY]] and `Pillars/Engineering Practice/MEMORY.md`; GOV-021 reshaped to a scheduled review; the rollout and concept-map notes and diagrams only where they state the lapse or a stopgap; the `state-of-play` and `techne` checkpoints.
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

Delivered and awaiting Kris's review. The hold, GDR-KI-ARCADIA-004 and every note that summarised them now state the standing exemption; before this record they described a 30-day term lapsing on 2026-11-06 unless renewed, and both diagrams carried a lapse label.

## Steps

- [x] Amend the hold's exemption section to the scope, unchanged bounds and term above; no other section changes.
- [x] Amend GDR-KI-ARCADIA-004 in place to the new scope and term, retitle it "Standing agent-host exemption from the Techne Programme Hold", rename its file to match, and update every link to it.
- [x] Update the Decisions index entry and the hold entries in [[Policies]], [[Admin/MEMORY|MEMORY]] and `Pillars/Engineering Practice/MEMORY.md`.
- [x] Reshape GOV-021 into a scheduled review on 2026-11-06 of the standing exemption: scope, bounds, cost, and whether to widen or withdraw it.
- [x] Update the rollout and concept-map notes where they state the lapse; change the lapse labels in both Archify sources and re-render their SVGs with Archify.
- [x] Update the `state-of-play` and `techne` checkpoints with this outcome and the rollout facts since their last update.
- [x] Run the verification below and write the review packet.

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
- `+/_CHECKPOINTS/state-of-play.md` and `+/_CHECKPOINTS/techne.md`
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

## Review

### Delivered

The [[Techne Programme Hold]] exemption now covers setting up and operating the single agent host properly and durably, with the unchanged bounds and still-held items listed above, and no automatic lapse: it stands until Kris changes or withdraws it, with a scheduled review on 2026-11-06. GDR-KI-ARCADIA-004 is amended in place and retitled "Standing agent-host exemption from the Techne Programme Hold". The widened exemption is in force from commit `e25a7f9`, as GOV-020's was from its amendment commit; acceptance of this record closes the record, not the exemption's effect.

### Change Summary

- `Admin/Governance/Policies/Techne Programme Hold.md`: the exemption section is retitled "Agent-host exemption" and rewritten to the standing scope, bounds, order, credentials, term and held items; `updated` changes. No other section changes.
- `Admin/Governance/Decisions/GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold.md`: amended in place, retitled, and renamed from `GDR-KI-ARCADIA-004-time-boxed-remote-prototype-exemption-from-the-techne-programme-hold.md`. It now also names the account-local operator role in place of the permission set.
- `Admin/Governance/Decisions/Decisions.md`: entry 13 links the new filename and title.
- `Admin/Governance/Policies/Policies.md`, `Admin/MEMORY.md` and `Pillars/Engineering Practice/MEMORY.md`: the hold entries state the standing exemption and review date.
- Wikilinks to the GDR updated in GOV-020, GOV-021 and both diagram notes. GOV-020's "Files touched" and review packet still name the old path in code spans, as accepted history; they are not links.
- `Admin/Governance/Policies/Agent Host Prototype Rollout.md`, `.archify.json` and `.svg`: the "Stop and review" paragraph states the standing term and scheduled review; labels change from "term ends", "renew or tear down", "6 Nov 2026" and "not renewed" to "scheduled review", "keep, widen or withdraw", "scheduled 6 Nov 2026" and "if withdrawn", and the kill-switch card's renewal line becomes "No lapse: stands until Kris changes or withdraws it".
- `Pillars/Engineering Practice/Architecture/Diagrams/Agent Host Prototype Concept Map.md`, `.archify.json` and `.svg`: "time-boxed" and "live until 6 November 2026" become the standing exemption; the live region label reads "Live under the standing exemption (GDR-KI-ARCADIA-004)".
- Both SVGs were re-rendered with Archify `finalize` at `showcase` quality and exported through the viewer's "SVG Auto" export, driven in headless Chrome; the same route reproduced the previously committed rollout SVG exactly apart from trailing whitespace, which the committed files strip.
- `Streams/Roadmap/KI-ARCADIA-GOV-021-review-the-agent-host-prototype.md`: Goal, Context and Boundary reshaped into a scheduled review (keep, widen or reshape, or withdraw); review inputs and the operator-role note updated.
- `+/_CHECKPOINTS/state-of-play.md` and `+/_CHECKPOINTS/techne.md`: the outcome and the rollout facts since their last update (GOV-022, OPS-010, OPS-011, CLI-004, the UE-068 correction, the host running and in use).
- This record: plan, lifecycle and review packet.

Deviation: the hold keeps an "Order" bullet, restated in the past tense for the acceptance gate and kept as a standing gate for the GitHub and model API credential identity, because Arcadia holds no evidence that the identity has been decided.

### Verification

- `ki repo audit --repo .` (24 skills): PASS. `--skill` runs for `ki-repo-kb-streams`, `ki-decision-records`, `ki-checkpoint`, `ki-repo-kb`, `ki-repo-kb-principal`, `ki-authoring` and `ki-work`: PASS.
- No wikilink or Markdown link anywhere targets the old GDR filename.
- The hold's only date is the review date, stated with "until Kris changes or withdraws it"; its diff against the baseline touches only the exemption section and `updated`.
- `archify finalize` passes validate, deliver, check and browser-check for both amended sources; the committed sources are byte-identical to the rendered ones.
- No en-dash or em-dash in any added line outside the diagram files.

### Outstanding concerns

- **Credential identity and egress.** The host is in use, but Arcadia has no record that the GitHub and model API credential identity or the named-destination egress bound are settled; the owning records should confirm them.
- **Runbook term.** The `ki-techne-harness` agent-host runbook may still describe a 30-day term; that repository owns any update.
- **Stale checkpoint row.** `techne` still says FAB-001's egress rule is to be narrowed "under OPS-008", which has merged into OPS-009; left as a fact outside this record's scope.
- Nothing is pushed by this record; the push follows Kris's instruction for this run.

### Post-change review

The goal is met: the exemption, its Decision Record, every summary of them and both diagrams now describe a standing exemption for the one host with a scheduled review, and the unchanged bounds and held items are carried across intact. Scope held to the files listed. Regression risk is low; the hold's other sections are unchanged. This is the implementing agent's own rereading against Kris's instruction and the audits, not an independent review.

### Mini recap

GOV-023 widened the Techne Programme Hold's agent-host exemption to setting up and operating the host properly, removed its lapse in favour of a scheduled 2026-11-06 review, amended and retitled GDR-KI-ARCADIA-004 in place, reshaped GOV-021, re-rendered both diagrams, and updated the checkpoints. Every audit passes. No learning route proposed beyond the Archify SVG export note already proposed by GOV-022.

## Done

Accepted 2026-10-07 by Kris Brown on the review packet above.

## Discussion

### Acceptance

Kris Brown, 2026-10-07 09:30 CEST: "GOV-023 - accepted". The standing exemption has been in force since commit `e25a7f9`; acceptance closes this record. The outstanding concerns in the review packet stay with their owning records and repositories.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
