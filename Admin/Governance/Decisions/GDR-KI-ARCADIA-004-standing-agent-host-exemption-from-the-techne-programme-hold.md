---
note_type: admin/governance/decision
id: GDR-KI-ARCADIA-004
title: 'Standing agent-host exemption from the Techne Programme Hold'
date: 2026-10-07
updated: 2026-10-11
status: current
decision_type_url: https://knowledgeislands.info/specifications/decision-records/gdr
decision_type: governance
decision_depends_on: ['SDR-KI-ARCADIA-004']
---

# GDR-KI-ARCADIA-004: Standing agent-host exemption from the Techne Programme Hold

## Context

The Techne Programme Hold holds every remote agent run and every act of remote-environment management for Techné until three prerequisites are evidenced: the local review-to-live-main cycle and recovery of accumulated output, a review of what Paperclip supplies against what Techné must add, and a repository-owned remote-delivery policy. None is fully met.

The island owner needs at least one remotely reachable agent environment, because connectivity is poor at times and the laptop is swap-bound under its local load. The existing Techné controller is one EC2 instance, `ki-techne-ops-007-primary`, running a Telegram dispatcher and busybox-only K3s Jobs; it has little headroom and serves a different purpose.

The island owner needs that host set up and operated properly and durably, not as a stopgap.

The island owner also runs agents on their own Mac Studio workstation as a remote agent host, outside the hold and treated like the agent host. The Mac Studio is an owned machine, reached over the tailnet; it lets agent work continue on local hardware with more headroom when the owner is away from it.

## Decision

The hold carries one exemption, for the single agent host and the owned remote agent host, and for nothing else.

- **Scope.** Setting up and operating the single agent host `ki-techne-agent-host`, the EC2 instance tagged `ki-agent-host-id=agent-host` in the Techne account `655383751458` in `eu-west-1`, properly and durably. This covers building, rebuilding or replacing that one host through the `ki-techne-harness` stack; its rerunnable workspace setup, updates and status; its operator commands in the `techne` CLI, acting only on that host; its account-local operator role, its `/ki/techne/agent-host/` parameters, and its tailnet tag and policy entries; and rotating its credentials.
- **Owned remote agent host.** The island owner's Mac Studio workstation, reached over the tailnet as `sol`, is exempt as a remote agent host and is treated like the agent host. This covers bootstrapping and maintaining it (Homebrew, chezmoi, Rig, `ki`, `mgit` and its workspace), running its tailnet daemon and its tailnet entries, administering it remotely over Tailscale SSH and Screen Sharing, and running agents on it.
  - **Shared terms.** The bounds, prerequisites, credentials and term below apply to it as to the agent host.
  - **Differences.** It is an owned machine, not a cloud instance, so it has no stack, account, parameters or operator role, and nothing in the Techne account reaches it. Its identities are its owner's own. Its kill switch is ending agent sessions and stopping its tailnet daemon; its teardown removes agent credentials and its tailnet node without wiping the workstation. Its disk is encrypted at rest, so after a restart it stays unreachable until it is unlocked in person.
- **Bounds.** Exactly one cloud host, separate from the controller instance, and the one owned host above, with no public inbound access, reached by the binding owner over Tailscale SSH. Agents run on it only in sessions the binding owner opens; no agent runs unattended or on a schedule. Agents commit with explicit paths, push only when the binding owner asks, and never prune or accept. A kill switch and a teardown stay documented and available.
- **Prerequisites.** The three hold prerequisites are waived for this host only. They stay in force for every other remote operation.
- **Credentials.** The binding owner is the person whose `agent-host` binding operates the host. Building, rebuilding and tearing down the host use the binding owner's administrator session in the Techne account; day-to-day operation (start, stop and status) uses the host's account-local operator role. No agent creates access or holds AWS credentials of its own. The host's GitHub token and Claude login are the binding owner's own identities, because only the binding owner opens sessions there; a machine identity is decided only when unattended agents arrive, and they stay held.
- **Term.** The exemption has no automatic lapse and no fixed review date. It stands until the island owner changes or withdraws it through the Enactment Process, and is revisited when the hold is reshaped. `direct-host` is the recipe.
- **What stays held.** Remote Paperclip in any form; Kitteth and any Avatar; Telegram and every other messaging channel; wider K3s or controller changes; the execution fabric; every other environment; anything in the organisation or its management account; and any change to existing remote services, including the controller instance, its stack and its Telegram dispatch path.

## Consequences

- Agent work can move to a remote host, and the host can be built, rebuilt and maintained properly, without lifting the hold for anything else. The prerequisites remain the route to any wider remote operation.
- The host build and workspace management in `ki-techne-harness`, the operator commands in `tools-techne` and the operator tooling in the binding owner's chezmoi source proceed as work in those repositories. None gains authority beyond these bounds.
- The controller instance keeps its name, tags and dispatch path. The agent host carries only its own tags, so the operator role cannot reach the controller.
- The host is not torn down by default. Widening or withdrawing the exemption needs an Enactment record; withdrawal means teardown and the hold applies in full.
- A standing cost for the second instance continues while the exemption stands.
- The Mac Studio's bootstrap proceeds as the `mac-studio-bootstrap` Project in Arcadia, with defects routed to the repository that owns them. Its role as a workstation is unchanged; the exemption adds remote agent use and remote administration only.

## References

- [[SDR-KI-ARCADIA-004-the-enactment-process|SDR-KI-ARCADIA-004]] - the Enactment Process through which the exemption was made and through which it is changed or withdrawn.
