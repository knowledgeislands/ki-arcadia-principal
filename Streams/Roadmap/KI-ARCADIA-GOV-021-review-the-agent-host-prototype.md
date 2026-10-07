---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-021
area: GOV
title: Review the agent-host prototype
theme: governance
horizon: triage
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-07T00:33:11Z
updated_at: 2026-10-07T07:20:00Z
---

# Review the Agent-Host Prototype

## Goal

On 2026-11-06, Kris reviews the standing agent-host exemption from the [[Techne Programme Hold]]: its scope, its bounds, its cost, and whether to widen it, keep it or withdraw it. The exemption has no automatic lapse; this review is scheduled, not an expiry.

## Context

KI-ARCADIA-GOV-020 defined a separate EC2 agent host, `ki-techne-agent-host`, reached only over Tailscale SSH, and Kris accepted it on 2026-10-07 for a 30-day term. The same day, [[KI-ARCADIA-GOV-023-widen-the-agent-host-exemption-to-a-standing-one|KI-ARCADIA-GOV-023]] widened the exemption to setting the host up and operating it properly and durably, removed the automatic lapse, and made this record a scheduled review on 2026-11-06. [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] records the standing exemption: it stands until Kris changes or withdraws it.

The host build, runbook, kill switch and teardown are in `ki-techne-harness` (`TECHNE-TOOLS-OPS-009`, `docs/guides/operator/agent-host.md`), with workspace setup, updates and status planned in `TECHNE-TOOLS-OPS-011`. The `techne host` command group is captured in `tools-techne` (`TECHNE-TOOL-CLI-004`), and the Mac-side tooling is in the chezmoi source (`DOTFILES-UE-068`).

## Boundary

- In scope: on or about 2026-11-06, a review of the standing exemption and what the host has shown, ending in one of three outcomes. **Keep** the exemption as it stands. **Widen or reshape** it through a new Enactment record that amends the hold and GDR-KI-ARCADIA-004 in place. **Withdraw** it through an Enactment record, followed by the runbook's teardown, removing the stack, its parameters, the tailnet device and policy entries, the GitHub token, the operator role and the chezmoi entries.
- Out of scope: changing the exemption without an Enactment record, and any remote action by an agent; any teardown or rebuild is Kris's operation.

## Discussion

### Review inputs

The review should weigh how the host was used and for what, its running cost, any boundary incident, the egress limits a security group cannot enforce (recorded in the runbook), whether the GitHub token and tailnet policy stayed within their stated scope, and whether the scope or bounds should widen or narrow. The GitHub token expires after 30 days, close to the same date; rotating it is part of operating the host under the standing exemption.

### Operator access is an account-local role - 2026-10-07

On Kris's instruction that the prototype is independent of any organisation setup, operator access is an account-local IAM role, not an IAM Identity Center permission set. The `KnowledgeIslandsTechneAgentHost` permission set and its account assignment were deleted from the organisation's Identity Center, and nothing else there was changed. The role `arn:aws:iam::655383751458:role/ki/ki-techne-agent-host-operator` carries the `KI-ARCADIA-GOV-020` least-privilege policy unchanged, can be assumed only from the Techne account's `AWSAdministratorAccess` SSO role, and is reached through the `knowledge-islands-techne-agent-host` profile. Teardown therefore removes that role rather than a permission set. `KI-ARCADIA-GOV-020` still says "permission set" as accepted history; GDR-KI-ARCADIA-004 now names the account-local operator role (KI-ARCADIA-GOV-023).
