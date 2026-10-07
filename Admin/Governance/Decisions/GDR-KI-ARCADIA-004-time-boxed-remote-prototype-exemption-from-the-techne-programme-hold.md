---
note_type: admin/governance/decision
id: GDR-KI-ARCADIA-004
title: 'Time-boxed remote prototype exemption from the Techne Programme Hold'
date: 2026-10-07
status: current
decision_type_url: https://knowledgeislands.info/specifications/decision-records/gdr
decision_type: governance
decision_depends_on: ['SDR-KI-ARCADIA-004']
---

# GDR-KI-ARCADIA-004: Time-boxed remote prototype exemption from the Techne Programme Hold

## Context

The [[Techne Programme Hold]] holds every remote agent run and every act of remote-environment management for Techné until three prerequisites are evidenced: the local review-to-live-main cycle and recovery of accumulated output, a review of what Paperclip supplies against what Techné must add, and a repository-owned remote-delivery policy. None is fully met.

Kris Brown needs at least one remotely reachable agent environment, because connectivity is poor at times and the laptop is swap-bound under its local load. The existing Techné controller is one EC2 instance, `ki-techne-ops-007-primary`, running a Telegram dispatcher and busybox-only K3s Jobs; it has little headroom and serves a different purpose.

Kris accepted a bounded prototype definition on 2026-10-07 in [[KI-ARCADIA-GOV-020-limited-remote-agent-prototype|KI-ARCADIA-GOV-020]] and asked for the hold change to be recorded as a governance decision.

## Decision

The hold carries one narrow exemption for the GOV-020 limited remote agent prototype, and for nothing else.

- **Scope.** One new EC2 instance, `ki-techne-agent-host`, in the Techne account `655383751458` in `eu-west-1`, separate from the controller instance. Kris reaches it over Tailscale with Tailscale SSH and Zed remote development, and agents run on it only in sessions Kris opens. Egress is limited to named destinations, and every credential is least-privilege, held in a secret store and named with its revocation step. The bounds accepted in GOV-020 govern the detail.
- **Prerequisites.** The three hold prerequisites are waived for this prototype only. They stay in force for every other remote operation.
- **Order.** No remote action under the exemption, including creating the host for connection testing, precedes Kris's acceptance and the hold amendment. Connection testing needs only a tagged, single-use Tailscale auth key. Which identity holds the GitHub and model API credentials is decided before any agent works on the host.
- **Credentials.** The host build and every AWS action use Kris's own credentials, through an IAM Identity Center permission set and Granted. No agent creates access or acts in AWS on credentials of its own.
- **Term.** The exemption runs for 30 days from acceptance on 2026-10-07 and lapses on 2026-11-06 unless Kris renews it through the Enactment Process. The review date is 2026-11-06. Without renewal the prototype is torn down and the hold applies in full.
- **What stays held.** Remote Paperclip in any form; Kitteth and any Avatar; Telegram and every other messaging channel; K3s beyond the agent host; every other environment; and any change to existing remote services, including the controller instance and its Telegram dispatch path.

## Consequences

- Agent work can move to a remote host for a fixed term without lifting the hold for anything else. The prerequisites remain the route to any wider remote operation.
- The operator tooling in Kris's chezmoi source and the agent-host build in `ki-techne-harness` can proceed as handoff work in those repositories. Neither gains authority beyond these bounds.
- The controller instance keeps its name, tags and dispatch path. The agent host carries only its own tags, so the agent-host permission set cannot reach the controller.
- The exemption needs an explicit decision by 2026-11-06: renew it, reshape it or let it lapse with teardown.
- A standing cost for the second instance is incurred for the term.

## References

- [[Techne Programme Hold]]
- [[KI-ARCADIA-GOV-020-limited-remote-agent-prototype|KI-ARCADIA-GOV-020]] - the accepted bounds, access grants, gate and order.
- [[SDR-KI-ARCADIA-004-the-enactment-process|SDR-KI-ARCADIA-004]] - the Enactment Process through which the exemption was made and through which it is renewed.
