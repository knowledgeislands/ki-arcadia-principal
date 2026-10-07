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
updated_at: 2026-10-07T04:25:11Z
---

# Review the Agent-Host Prototype

## Goal

On 2026-11-06, Kris decides the limited remote agent prototype's future: renew it through a new authorisation, or tear it down. The prototype does not continue past that date by default.

## Context

KI-ARCADIA-GOV-020 defined the prototype, a separate EC2 agent host, `ki-techne-agent-host`, reached only over Tailscale SSH, and Kris accepted it on 2026-10-07. Its time-box bound sets a 30-day term: the prototype authority lapses on 2026-11-06 unless Kris renews it, and without an explicit extension the prototype is torn down on that date. [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] records the matching time-boxed exemption from the [[Techne Programme Hold]]. GOV-020 noted that no record tracked the review date; this record tracks it.

The host build, runbook, kill switch and teardown are in `ki-techne-harness` (`TECHNE-TOOLS-OPS-009`, `docs/guides/operator/agent-host.md`), and the Mac-side tooling is in the chezmoi source (`DOTFILES-UE-068`).

## Boundary

- In scope: on or before 2026-11-06, a review of what the prototype showed, then one of two outcomes. **Renew** through a new authorisation that states its own bounds and term and amends the hold with a new or superseding Decision Record. **Tear down** through the runbook's teardown, removing the stack, its parameters, the tailnet device and policy entries, the GitHub token, the permission set and the chezmoi entries.
- Out of scope: extending the prototype by inaction, widening its bounds without a new authorisation, and any remote action by an agent; the teardown and any renewed build are Kris's operations.

## Discussion

### Review inputs

The review should weigh whether the host was used and for what, its running cost, any boundary incident, the egress limits a security group cannot enforce (recorded in the runbook), and whether the GitHub token and tailnet policy stayed within their stated scope. The GitHub token expires after 30 days, close to the same date, so a renewal also needs a new token.

### Operator access is an account-local role - 2026-10-07

On Kris's instruction that the prototype is independent of any organisation setup, operator access is an account-local IAM role, not an IAM Identity Center permission set. The `KnowledgeIslandsTechneAgentHost` permission set and its account assignment were deleted from the organisation's Identity Center, and nothing else there was changed. The role `arn:aws:iam::655383751458:role/ki/ki-techne-agent-host-operator` carries the `KI-ARCADIA-GOV-020` least-privilege policy unchanged, can be assumed only from the Techne account's `AWSAdministratorAccess` SSO role, and is reached through the `knowledge-islands-techne-agent-host` profile. Teardown therefore removes that role rather than a permission set. `KI-ARCADIA-GOV-020` and `GDR-KI-ARCADIA-004` still say "permission set"; the review should decide whether the Decision Record needs a superseding wording.
