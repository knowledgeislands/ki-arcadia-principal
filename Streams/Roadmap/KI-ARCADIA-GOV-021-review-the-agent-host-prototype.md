---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-021
area: GOV
title: Review the agent-host prototype
kind: decide
purpose: governance
project: agent-host
component: governance
status: done
blocks: []
blocked_by: []
baseline_ref: 4fcb560bde571cd4ed024dddc830625ff84648ab
created_at: 2026-10-07T00:33:11Z
updated_at: 2026-10-08T07:21:03Z
---

# Review the Agent-Host Prototype

## Goal

Kris reviews the standing agent-host exemption from the [[Techne Programme Hold]]: its scope, its bounds, its cost, and whether to widen it, keep it or withdraw it. The review was scheduled for 2026-11-06 and is decided early, on 2026-10-07, as **keep**: the exemption stands as it is and `direct-host` stays as a recipe.

## Context

KI-ARCADIA-GOV-020 defined a separate EC2 agent host, `ki-techne-agent-host`, reached only over Tailscale SSH, and Kris accepted it on 2026-10-07 for a 30-day term. The same day, KI-ARCADIA-GOV-023 widened the exemption to setting the host up and operating it properly and durably, removed the automatic lapse, and made this record a scheduled review on 2026-11-06. [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] records the standing exemption: it stands until Kris changes or withdraws it.

The host build, runbook, kill switch and teardown are in `ki-techne-harness` (`TECHNE-TOOLS-OPS-009`, `docs/guides/operator/agent-host.md`), with workspace setup, updates and status planned in `TECHNE-TOOLS-OPS-011`. The `techne host` command group is captured in `tools-techne` (`TECHNE-TOOL-CLI-004`), and the Mac-side tooling is in the chezmoi source (`DOTFILES-UE-068`).

## Boundary

- In scope: on or about 2026-11-06, a review of the standing exemption and what the host has shown, ending in one of three outcomes. **Keep** the exemption as it stands. **Widen or reshape** it through a new Enactment record that amends the hold and GDR-KI-ARCADIA-004 in place. **Withdraw** it through an Enactment record, followed by the runbook's teardown, removing the stack, its parameters, the tailnet device and policy entries, the GitHub token, the operator role and the chezmoi entries.
- Out of scope: changing the exemption without an Enactment record, and any remote action by an agent; any teardown or rebuild is Kris's operation.

## Decision

Kris decided the review early on 2026-10-07, choosing "Decide 'keep' now": `direct-host` stays as a recipe, the review is decided as keep, and no evidence pack is needed ([decisions](<../Projects/agent-host/design/agent-host-durability-decisions.md>), related decisions). The exemption therefore stands as written in [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]], with no widening and no withdrawal. [[KI-ARCADIA-GOV-029-agent-host-credential-wording|KI-ARCADIA-GOV-029]] records the keep in the GDR and the hold, together with the role-based credential wording and the credential-identity decision.

## Current state

Decided and awaiting Kris's approval to close. The keep needs no remote action and no Enactment change of its own beyond KI-ARCADIA-GOV-029. Before this update the record was untriaged intake for a review on 2026-11-06.

## Steps

- [x] Record Kris's keep decision and its source in this record.
- [x] Point to KI-ARCADIA-GOV-029, which records the keep in GDR-KI-ARCADIA-004 and the hold.
- [x] Write the review packet.

## Files touched

- This record.

## Verify

- `ki repo audit --repo .` passes the Streams and roadmap checks for this record.

## Dependencies / blocks

None. KI-ARCADIA-GOV-029 carries the canonical amendment independently.

## Documentation impact

### Decision Records

None here: KI-ARCADIA-GOV-029 amends GDR-KI-ARCADIA-004 in place, and ODR-KI-ARCADIA-001 records the durability design.

### Specifications

None: no behaviour-level contract changes.

### Guides

None here. The harness operator guide's token expiry change is owned by the `ki-techne-harness` pilot record.

### Roadmap

No new work. The rollout records from ODR-KI-ARCADIA-001 are captured in `ki-techne-harness` and `tools-techne`.

## Review

### Delivered

The keep decision, recorded with its source; no evidence pack, as Kris decided. Baseline `4fcb560bde571cd4ed024dddc830625ff84648ab`; the result is this record's commit.

### Change Summary

- This record: adopted at `now` and set to `awaiting-review`; the Goal states the early keep; new Decision, plan and review sections; the Review inputs note now gives the GitHub token's 90-day expiry.

### Verification

- `ki repo audit --repo .` on 2026-10-07: the Streams, roadmap and Knowledge Base checks pass. The audit's one failure is in `ki-decision-records`, from another session's uncommitted edits to that skill in the local `ki-agentic-harness` checkout, and is unrelated to this record.

### Outstanding concerns

- **No later review date.** With the review decided, nothing schedules a further review of the exemption. Whether to set one is Kris's call; KI-ARCADIA-GOV-029 raises the same point.
- **Review date in tooling.** `host/status.sh` in `ki-techne-harness` still prints the review as due 2026-11-06; the harness pilot record owns it.

### Post-change review

The goal is met: the review has an outcome, keep, with its source, and the GDR change is carried by its own Enactment record. No scope was added. Regression risk is nil: no canonical content changes in this record. This is the implementing agent's own check, not an independent review.

### Mini recap

GOV-021 records Kris's early keep of the agent-host exemption, with `direct-host` staying a recipe and no evidence pack. Learning route: none.

## Done

Accepted 2026-10-08 by Kris Brown under Decision 6 of the Techne run's decisions log (2026-10-07): "Kris approved accepting KI-ARCADIA-GOV-029 and KI-ARCADIA-GOV-021 through ki-accept and pruning both once accepted." The same decision resolves the first outstanding concern: the exemption has no fixed review date and is revisited when the hold is reshaped. The review-date output in `ki-techne-harness` stays with TECHNE-TOOLS-OPS-014, now scoped to remove it.

## Discussion

### Review inputs

The review should weigh how the host was used and for what, its running cost, any boundary incident, the egress limits a security group cannot enforce (recorded in the runbook), whether the GitHub token and tailnet policy stayed within their stated scope, and whether the scope or bounds should widen or narrow. The GitHub token was rotated on 2026-10-07 with a 90-day expiry; rotating it is part of operating the host under the standing exemption.

### Operator access is an account-local role - 2026-10-07

On Kris's instruction that the prototype is independent of any organisation setup, operator access is an account-local IAM role, not an IAM Identity Center permission set. The `KnowledgeIslandsTechneAgentHost` permission set and its account assignment were deleted from the organisation's Identity Center, and nothing else there was changed. The role `arn:aws:iam::655383751458:role/ki/ki-techne-agent-host-operator` carries the `KI-ARCADIA-GOV-020` least-privilege policy unchanged, can be assumed only from the Techne account's `AWSAdministratorAccess` SSO role, and is reached through the `knowledge-islands-techne-agent-host` profile. Teardown therefore removes that role rather than a permission set. `KI-ARCADIA-GOV-020` still says "permission set" as accepted history; GDR-KI-ARCADIA-004 now names the account-local operator role (KI-ARCADIA-GOV-023).
