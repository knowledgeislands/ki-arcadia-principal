---
note_type: admin/governance/decision
id: GDR-KI-ARCADIA-004
title: 'Standing agent-host exemption from the Techne Programme Hold'
date: 2026-10-07
status: current
decision_type_url: https://knowledgeislands.info/specifications/decision-records/gdr
decision_type: governance
decision_depends_on: ['SDR-KI-ARCADIA-004']
---

# GDR-KI-ARCADIA-004: Standing agent-host exemption from the Techne Programme Hold

## Context

The [[Techne Programme Hold]] holds every remote agent run and every act of remote-environment management for Techné until three prerequisites are evidenced: the local review-to-live-main cycle and recovery of accumulated output, a review of what Paperclip supplies against what Techné must add, and a repository-owned remote-delivery policy. None is fully met.

Kris Brown needs at least one remotely reachable agent environment, because connectivity is poor at times and the laptop is swap-bound under its local load. The existing Techné controller is one EC2 instance, `ki-techne-ops-007-primary`, running a Telegram dispatcher and busybox-only K3s Jobs; it has little headroom and serves a different purpose.

Kris accepted bounds for one separate agent host on 2026-10-07 in [[KI-ARCADIA-GOV-020-limited-remote-agent-prototype|KI-ARCADIA-GOV-020]], and set the scope and term below through [[KI-ARCADIA-GOV-023-widen-the-agent-host-exemption-to-a-standing-one|KI-ARCADIA-GOV-023]]: the host is to be set up and operated properly and durably, not as a stopgap.

## Decision

The hold carries one exemption, for the single agent host, and for nothing else.

- **Scope.** Setting up and operating the single agent host `ki-techne-agent-host`, the EC2 instance tagged `ki-agent-host-id=agent-host` in the Techne account `655383751458` in `eu-west-1`, properly and durably. This covers building, rebuilding or replacing that one host through the `ki-techne-harness` stack; its rerunnable workspace setup, updates and status; its operator commands in the `techne` CLI, acting only on that host; its account-local operator role, its `/ki/techne/agent-host/` parameters, and its tailnet tag and policy entries; and rotating its credentials.
- **Bounds.** Exactly one host, separate from the controller instance, with no public inbound access, reached by Kris over Tailscale SSH. Agents run on it only in sessions Kris opens; no agent runs unattended or on a schedule. Agents commit with explicit paths, push only when Kris asks, and never prune or accept. A kill switch and a teardown stay documented and available.
- **Prerequisites.** The three hold prerequisites are waived for this host only. They stay in force for every other remote operation.
- **Credentials.** The binding owner is the person whose `agent-host` binding operates the host. Building, rebuilding and tearing down the host use the binding owner's administrator session in the Techne account; day-to-day operation (start, stop and status) uses the host's account-local operator role. No agent creates access or holds AWS credentials of its own. The host's GitHub token and Claude login are the binding owner's own identities, because only the binding owner opens sessions there; a machine identity is decided only when unattended agents arrive, and they stay held.
- **Term.** The exemption has no automatic lapse. It stands until the island owner changes or withdraws it through the Enactment Process. The prototype review, [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]], keeps it as it stands, with `direct-host` remaining a recipe.
- **What stays held.** Remote Paperclip in any form; Kitteth and any Avatar; Telegram and every other messaging channel; wider K3s or controller changes; the execution fabric; every other environment; anything in the organisation or its management account; and any change to existing remote services, including the controller instance, its stack and its Telegram dispatch path.

## Consequences

- Agent work can move to a remote host, and the host can be built, rebuilt and maintained properly, without lifting the hold for anything else. The prerequisites remain the route to any wider remote operation.
- The host build and workspace management in `ki-techne-harness`, the operator commands in `tools-techne` and the operator tooling in Kris's chezmoi source proceed as work in those repositories. None gains authority beyond these bounds.
- The controller instance keeps its name, tags and dispatch path. The agent host carries only its own tags, so the operator role cannot reach the controller.
- The host is not torn down by default. Widening or withdrawing the exemption needs an Enactment record; withdrawal means teardown and the hold applies in full.
- A standing cost for the second instance continues while the exemption stands.

## References

- [[Techne Programme Hold]]
- [[KI-ARCADIA-GOV-020-limited-remote-agent-prototype|KI-ARCADIA-GOV-020]] - the accepted bounds, access grants, gate and order.
- [[KI-ARCADIA-GOV-023-widen-the-agent-host-exemption-to-a-standing-one|KI-ARCADIA-GOV-023]] - the standing scope and term.
- [[SDR-KI-ARCADIA-004-the-enactment-process|SDR-KI-ARCADIA-004]] - the Enactment Process through which the exemption was made and through which it is changed or withdrawn.
