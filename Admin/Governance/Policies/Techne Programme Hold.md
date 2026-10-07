---
note_type: admin/governance/policy
updated: 2026-10-07T20:46:37Z
author: AI-assisted
---

# Techne Programme Hold

## Authority

Arcadia maintains the remote-execution and remote-environment hold across the independent Techné harness and CLI products. The principal is the accountable human owner of this constraint; relocation of knowledge does not change that decision authority.

## Holding position

Techné tool-building is not generally on hold. Local design, implementation, architecture, testing, review and branch integration may proceed in `ki-techne-harness` and `tools-techne` under each repository's normal approval, review and Git rules. Keep the products building and current with their declared KI repository, engineering and tool-building standards: maintain the applicable lint, typecheck, test, build, package and governance checks rather than leaving the tooling frozen. Ordinary hosted CI is permitted when it exercises isolated build and test paths without operating live Techné environments.

The hold applies to using tooling to dispatch or run agents remotely and to provision, deploy, configure, change, stop or otherwise manage a remote runtime, service or environment. It applies whether initiated locally, from hosted CI or from another project. An approved local work record, a passing check or a Ready task does not authorise a remote operation. Read-only inspection may continue under normal access and secret-handling rules; existing remote services and state must be preserved.

The former `TECHNE-OPS-002` candidates `0f77071572aa649a936be3069f635ab8ea721858` and `eb7292a1f1bd515fcb7c44715caac48bfe5770ad` were never accepted. On the source's retirement they were preserved unaccepted on its archived remote; any later use must be captured afresh by an owning repository and gives no remote-operation authority.

Before remote execution or environment management resumes, the Convenor must bring back evidence of the local review-to-live-main cycle and recovery of accumulated output; a review of what Paperclip already supplies and what Techné still needs to add; and a repository-owned remote-delivery policy covering destination, visibility, review, integration, synchronisation and recovery. The `ki-agent-coordination-paperclip` skill owns the reusable policy boundary. The principal explicitly decides whether to authorise, reshape or retire the remote-running work. These remote-operation prerequisites do not suspend local tool-building.

## Agent-host exemption

Kris Brown accepted the bounds of [[KI-ARCADIA-GOV-020-limited-remote-agent-prototype|KI-ARCADIA-GOV-020]] on 7 October 2026 and widened them the same day through [[KI-ARCADIA-GOV-023-widen-the-agent-host-exemption-to-a-standing-one|KI-ARCADIA-GOV-023]], so that the exemption covers setting the agent host up and operating it properly, not only as a stopgap. [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] records this exemption. It covers one agent host and nothing more.

- **Scope.** Setting up and operating the single agent host `ki-techne-agent-host`, the EC2 instance tagged `ki-agent-host-id=agent-host` in the Techne account `655383751458` in `eu-west-1`, properly and durably: building, rebuilding or replacing that one host through the `ki-techne-harness` stack; its rerunnable workspace setup, updates and status; its operator commands in the `techne` CLI, acting only on that host; its account-local operator role, its `/ki/techne/agent-host/` parameters, its tailnet tag and policy entries; and rotating its credentials.
- **Bounds.** Exactly one host, separate from the controller instance. No public inbound access; Kris reaches it with Tailscale SSH. Agents run on it only in sessions Kris opens, with no unattended or scheduled agents. Agents keep the local rules: explicit-path commits, no push unless Kris asks, no prune and no acceptance. A kill switch and a teardown stay documented and available. Anything outside these bounds is not exempt.
- **Prerequisites.** The three prerequisites above are waived for this host only. They stay in force for every other remote operation.
- **Order.** No remote action under the exemption preceded GOV-020's acceptance and the hold amendment.
- **Credentials.** The binding owner is the person whose `agent-host` binding operates the host. Building, rebuilding and tearing down the host use the binding owner's administrator session in the Techne account; day-to-day operation (start, stop and status) uses the host's account-local operator role. No agent creates access or holds AWS credentials of its own. The host's GitHub token and Claude login are the binding owner's own identities, because only the binding owner opens sessions there; a machine identity is decided only when unattended agents arrive, and they stay held.
- **Term.** The exemption has no automatic lapse. It stands until the island owner changes or withdraws it through the [[Enactment Process]]. The prototype review, [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]], keeps it as it stands, with `direct-host` remaining a recipe.
- **What stays held.** Remote Paperclip in any form; Kitteth and any Avatar; Telegram and every other messaging channel; wider K3s or controller changes; the execution fabric; every other environment; anything in the organisation or its management account; and any change to existing remote services, including the controller instance `ki-techne-ops-007-primary`, its stack and its Telegram dispatch path.

[[Agent Host Prototype Rollout]] illustrates the order of these gates, the kill switch, the review and teardown.

Outside this exemption the hold stands unchanged.

## Knowledge-owner transition

The approved [knowledge consolidation](https://github.com/knowledgeislands/ki-arcadia-principal/blob/688fb4e4a019a0ef9590edb0e2f95413010c6318/Streams/Roadmap/KI-ARCADIA-ECO-007-consolidate-techne-knowledge.md) transfers canonical engineering knowledge to [[Engineering Practice/Engineering Practice|Engineering Practice]] while retaining source evidence and existing work. The human's exception to the retiring source's Enactment prerequisite permits the scoped documentary authority transition only. It does not itself accept candidates, change source work records or permit remote operations.

The source `knowledgeislands/ki-techne-principal` was retired on 4 October 2026 under [[KI-ARCADIA-ECO-008-disposition-retained-techne-source|ECO-008]] and is archived read-only. Its snapshots, closed work records, frozen ledger and preserved candidate branches remain readable there as historical evidence; its own `AGENTS.md` and `README.md` now point to this policy rather than carrying a hold of their own. Retirement neither lifts nor broadens this hold.

## Provenance

The broader original hold is preserved as historical evidence in [the source instruction](https://github.com/knowledgeislands/ki-techne-principal/blob/b25e9c950fd87715d12f76b69bb2079c3a4fc054/AGENTS.md#techne-holding-position) at revision `b25e9c950fd87715d12f76b69bb2079c3a4fc054`. The principal narrowed its live scope on 2 October 2026 to remote running and remote-environment management. The local acceptance and prune commits for `KI-ARCADIA-GOV-013` preserve the delivery record in Git history.
