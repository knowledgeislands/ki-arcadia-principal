---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-020
area: GOV
title: Define and authorise the limited remote agent prototype
theme: governance
horizon: now
status: done
blocks: []
blocked_by: []
baseline_ref: 2f06a58678cb9b575935c64fb4923a8e8606c694
created_at: 2026-10-06T23:21:00Z
updated_at: 2026-10-07T00:22:01Z
---

# Define and Authorise the Limited Remote Agent Prototype

## Goal

Kris accepts one bounded definition of a limited remote agent prototype, and the [[Techne Programme Hold]] is amended, with a governance Decision Record, to permit that prototype and nothing more for a fixed 30-day term. Kris accepted the definition on 2026-10-07; the amendment and its Decision Record are this record's output.

## Context

On 2026-10-07 Kris decided, within the `state-of-play` review, to lift the hold up to an expressly limited remote prototype defined in that review. Kris needs at least one remotely capable agent environment soon, because connectivity is poor at times and the laptop is swap-bound under its current local load.

The definition is grounded in:

- The acquired ChatGPT captures of 2026-10-03 in `+/_ACQUIRE/chatgpt/knowledge-islands/`, in particular `2026-10-03-techne-and-first-footprint.md` and `2026-10-03-open-questions-and-actions.md`. They describe a larger target footprint (K3s, Paperclip as a workload, Kitteth as operator, Telegram, Tailscale and Zed remote). They are reviewed, not adopted, and most of that footprint stays held here.
- The `baseline-and-cloud` checkpoint, which records the three hold prerequisites as not met or partial, and today's controller: one t3.medium running busybox-only K3s Jobs with no egress.
- `ki-techne-harness` `TECHNE-TOOLS-FAB-001` (accepted and pruned 2026-10-07), which declared the agent-host execution profile in `deploy/kubernetes/execution/agent-host-network-policy.yaml`. Its egress rule still allows any TCP 443 destination, with placeholders for the model API and repository host.
- `ki-techne-harness` `TECHNE-TOOLS-OPS-008` (draft, triage), the costed decision record for the supervised agent host: session-manager access needs no ingress, the controller node has a few gigabytes of headroom after a checkout and a shared blast radius, and every grant should be named with its revocation.

## Boundary

- **Authorisation only.** This record fixes the accepted bounds, amends the hold and records the governance Decision Record. It builds nothing and acts on no remote system.
- **Gate.** No remote action, including creating the agent host for connection testing, happens before Kris's acceptance (2026-10-07) and the hold amendment both stand. No agent creates access; the host build and any AWS action use Kris's own credentials.
- **Handoffs, not deliverables.** The operator tooling in Kris's chezmoi source and the agent-host build in `ki-techne-harness` are separate handoff items that this record enables; each is captured, planned and accepted in its own repository. This record writes to no other repository.

## Moving parts

Kris asked on 2026-10-07 what the moving parts are. The table maps each concept from the 2026-10-03 captures, and each part of today's Techné controller, to its component in this prototype. Status is `now` (in the prototype), `held` (exists or is planned but stays outside the prototype) or `later` (not yet built).

| Concept | Component in this prototype | Where it runs | Name | Status |
| --- | --- | --- | --- | --- |
| Human | Kris: the source of intent and authority, who opens every session | - | Kris | now |
| Rig | Kris's Mac with Zed, the Tailscale client, Granted (`assume`) and the chezmoi operator helpers | Kris's Mac | Kris's tailnet devices | now |
| Realm | The Knowledge Islands Realm: logical and governed, not any technology | - | Knowledge Islands Realm | later |
| Footprint | A second, new EC2 instance: the prototype agent host, alongside the existing controller instance | AWS account `655383751458`, `eu-west-1` | Instance `Name` `ki-techne-agent-host`, `ki-agent-host-id = agent-host` | now: connection testing first |
| Tailnet | Kris's tailnet; the Tailscale daemon on the node's operating system, with Tailscale SSH | Kris's Mac and the node's operating system | Tailscale tag `tag:ki-techne-agent-host` | now |
| K3s | Single-node K3s server on the controller instance; on the agent host only if its build installs it | Node operating system | K3s | held on the controller; agent host per its build |
| Controller host | The existing controller EC2 instance and its stack | AWS account `655383751458`, `eu-west-1` | `ki-techne-ops-007-primary`, `ki-controller-id = primary` | held: untouched (bound 16) |
| Controller (Techné dispatcher) | `techne-controller` Deployment: a Python process that polls Telegram as `kitteth_bot`, accepts `/run` from the operator and creates busybox Jobs | K3s workload in namespace `techne-controller` on the controller instance, not the agent host | `techne-controller` | held: preserved as is (bound 16) |
| Execution fabric | Jobs in namespace `techne-execution` (busybox only), plus the `TECHNE-TOOLS-FAB-001` agent-host profile | K3s workloads | `techne-execution` | held |
| Agent sessions | Claude Code run by Kris in a Zed remote or SSH terminal | Node operating system, not a K3s workload | - | now, after the gate |
| Secrets | Parameter Store SecureString parameters written through `ki-techne-harness` provisioning | AWS SSM Parameter Store, read on the agent host | `/ki/techne/agent-host/` | now: Tailscale key; GitHub and model keys once the credential identity is decided |
| Operator / Architect | Kris's privileged access: the permission set, Tailscale SSH and `ki-techne-harness` provisioning | Kris's Mac and AWS | `KnowledgeIslandsTechneAgentHost`, profile `knowledge-islands-techne-agent-host` | now: human only |
| Avatar | Kitteth, the persistent personification with delegated agency | Would be a workload outside Paperclip | Kitteth | held |
| Avatar channel | Telegram (two-way Kitteth interaction) | Telegram, via the controller | `kitteth_bot` | held |
| Paperclip | Agent coordination workload | Would be a K3s workload | Paperclip | held: not used in any form (bound 6) |
| Techné | `ki-techne-harness` (controller stack, `provision.sh`, runtime bootstrap) and `tools-techne` (`techne controller status` and `bootstrap`) | Repositories, run from the Rig | Techné | now: provisioning path |

Notes:

- **What the Tailscale tag names.** Tailscale runs on the agent host's operating system, not inside K3s, so `tag:ki-techne-agent-host` identifies the whole agent-host instance and every agent session on it. The controller instance does not carry it. Kris confirmed the tag on that understanding, so the agent-host component names in "Access Kris grants" stand.
- **Where the controller runs.** In `ki-techne-harness`, `infra/aws/controller-stack.yaml` builds the node and installs K3s; `deploy/kubernetes/controller/deployment.yaml` runs the dispatcher as the `techne-controller` Deployment. The controller is therefore a K3s workload on the node, not the node itself. Its Telegram secrets are a K3s Secret (`techne-controller-secrets`) entered interactively by `deploy/runtime/controller/bootstrap.sh` over a session-manager session, not Parameter Store. It stays on the controller instance; the agent host runs none of it.
- **Is the controller the Avatar?** Not as the captures define it. The Avatar is the human's personification within a Realm, carrying identity, knowledge and delegated agency (`2026-10-03-conceptual-model.md`), and Kitteth is that Avatar, run alongside Paperclip as the "Avatar handoff and management point" (`2026-10-03-techne-and-first-footprint.md`). The node is the Footprint, kept separate from the Realm and its Avatar (`2026-10-03-design-principles.md`, principle 6). Today's dispatcher already speaks as `kitteth_bot` and is a proto-handoff: a deterministic `/run` channel with no delegated agency. Kitteth stays held, and agent sessions Kris runs are Kris's own actions, not Avatar actions (`2026-10-03-avatar-agency-and-access.md`, "Auditability and delegation").
- **Names resolved by a second instance (Kris, 2026-10-07).** The agent host is a new instance alongside `ki-techne-ops-007-primary`, so each instance keeps its own tags and nothing conflicts:
  - The controller keeps its `Name` `ki-techne-ops-007-primary`, `ki-controller-id = primary`, `ki-lifecycle = retained-controller` and `ki-work-item = TECHNE-OPS-007`, all untouched.
  - The agent host carries only its own: `Name = ki-techne-agent-host`, `ki-agent-host-id = agent-host`, `ki-lifecycle = prototype` and provenance `ki-work-item = KI-ARCADIA-GOV-020`.
  - The draft policy denies `ec2:CreateTags`, so the `ki-techne-harness` host build applies these tags at creation, as part of that repository's handoff work.
  - The agent host has its own security group, so the permission set cannot reach the controller's Telegram dispatch egress, which bound 16 preserves.

## Current state

The [[Techne Programme Hold]] holds every remote operation and has no exemption. The Decisions collection holds GDR-KI-ARCADIA-001 to 003, so the next governance serial in the `KI-ARCADIA` scope is 004; no GDR ledger exists beyond the collection itself. The hold is listed in [[Policies]], [[Admin/MEMORY|MEMORY]] and the Engineering Practice memory index. Kris accepted the bounds on 2026-10-07.

## Steps

- [x] Reserve GDR-KI-ARCADIA-004 as the next governance serial in the collection and write it.
- [x] Add GDR-KI-ARCADIA-004 to the Decisions index in reveal order.
- [x] Amend the [[Techne Programme Hold]] with a narrow, time-boxed exemption for this prototype only, citing this record and the GDR, keeping every other part of the hold intact.
- [x] Update the hold entries in [[Policies]], [[Admin/MEMORY|MEMORY]] and `Pillars/Engineering Practice/MEMORY.md` to mention the exemption and its lapse date.
- [x] Run the verification below and write the review packet.

## Files touched

- `Admin/Governance/Decisions/GDR-KI-ARCADIA-004-time-boxed-remote-prototype-exemption-from-the-techne-programme-hold.md` (new)
- `Admin/Governance/Decisions/Decisions.md`
- `Admin/Governance/Policies/Techne Programme Hold.md`
- `Admin/Governance/Policies/Policies.md`
- `Admin/MEMORY.md`
- `Pillars/Engineering Practice/MEMORY.md`
- This record

## Verify

- `ki repo audit --skill ki-repo-kb-streams --repo ki-arcadia-principal` passes.
- `ki repo audit --skill ki-decision-records --repo ki-arcadia-principal` passes.
- `ki repo audit --skill ki-checkpoint --repo ki-arcadia-principal` passes.
- `grep -n "2026-11-06\|6 November 2026" "Admin/Governance/Policies/Techne Programme Hold.md"` finds the lapse date, and the hold's other sections are unchanged in the diff.
- No en-dash or em-dash appears in any line this record adds.

## Dependencies / blocks

No blocking dependency: Kris's acceptance on 2026-10-07 was the only prerequisite. This record enables two handoff items owned elsewhere: the operator tooling in Kris's chezmoi source and the agent-host build in `ki-techne-harness`. Each is captured, planned and accepted in its own repository; neither is a deliverable here, and neither is recorded in `blocks` because their identifiers are not yet confirmed from this repository.

## Documentation impact

### Decision Records

New GDR-KI-ARCADIA-004 records the time-boxed exemption from the hold, as Kris decided.

### Specifications

None. No behaviour-level contract changes; the hold is a policy, not a specification.

### Guides

None in this repository. Operator guidance for connecting to the host belongs to the chezmoi handoff.

### Roadmap

Enables the chezmoi operator-tooling and `ki-techne-harness` host-build handoffs. The 2026-11-06 review, renewal or teardown has no record yet; it is proposed for capture through `ki-next`.

## Review

### Delivered

The approved boundary: the accepted bounds recorded, the [[Techne Programme Hold]] amended with one narrow, time-boxed exemption for this prototype only, and GDR-KI-ARCADIA-004 recording the decision. Excluded, as planned: any remote action, the chezmoi operator tooling and the `ki-techne-harness` host build, which are handoff items in those repositories, and any write outside this repository. Baseline `2f06a58678cb9b575935c64fb4923a8e8606c694` (the ready plan); delivery in `a16314ae1bcd9ddd6d75d14229dd5e66cad26364`.

### Change Summary

- `Admin/Governance/Decisions/GDR-KI-ARCADIA-004-time-boxed-remote-prototype-exemption-from-the-techne-programme-hold.md`: new governance record of the exemption, its scope, order, credentials, term and what stays held. Serial 004 is the next `GDR-KI-ARCADIA` serial in the collection; the skill derives serials from the collection and names no separate ledger.
- `Admin/Governance/Decisions/Decisions.md`: entry 13 for GDR-KI-ARCADIA-004.
- `Admin/Governance/Policies/Techne Programme Hold.md`: new `## Limited remote prototype exemption` section between "Holding position" and "Knowledge-owner transition", and the `updated` timestamp. No other line changed.
- `Admin/Governance/Policies/Policies.md`, `Admin/MEMORY.md` and `Pillars/Engineering Practice/MEMORY.md`: the hold entries name the exemption and its lapse date.
- This record: decisions, ready plan and lifecycle.

No deviation from the plan.

### Verification

- `ki repo audit --skill ki-repo-kb-streams --repo ki-arcadia-principal`: PASS.
- `ki repo audit --skill ki-decision-records --repo ki-arcadia-principal`: PASS.
- `ki repo audit --skill ki-checkpoint --repo ki-arcadia-principal`: PASS.
- `ki repo audit` for `ki-work`, `ki-repo-kb`, `ki-repo-kb-principal` and `ki-authoring`: PASS.
- The hold states the lapse date "6 November 2026" twice; the diff of the hold against the baseline removes only the old `updated` value.
- No en-dash or em-dash in any added line.

### Outstanding concerns

- **When the amendment takes effect.** The canonical gate requires explicitly approved forward work. Kris approved enacting this ready record, including the edit to the hold, so the exemption has been in force since `a16314a` was committed. Closing this record through `ki-accept` does not hold it back. If Kris wants the exemption to wait for acceptance, the hold section must say so before any remote action.
- **Review date not tracked.** No roadmap record or Activity tracks the 2026-11-06 review, renewal or teardown. Proposed for capture through `ki-next`.
- **Credential identity.** Which identity holds the GitHub and model API credentials is still open. It is a gate on agents working on the host, not on this record.
- **Handoff identifiers.** The chezmoi and `ki-techne-harness` handoff records are being created in those repositories; this record names them in prose only and does not set `blocks`.
- **Older bound numbers.** The refinement notes under "Prototype definition" cite bound numbers from earlier drafts (for example "bound 6" for Paperclip). The record flags this; the bounds themselves are unambiguous.
- Nothing is pushed.

### Post-change review

The goal is met: the hold now permits this one prototype for a fixed term and nothing more, and a Decision Record carries the rationale. Scope held: six canonical files plus this record, and nothing in another repository. Regression risk is low, because the hold's existing sections are byte-identical apart from the timestamp and the exemption repeats everything that stays held, including the controller instance and its Telegram path. The review was the implementing agent's own rereading against Kris's five decisions and the audits, not an independent reviewer. The record is ready for Kris's acceptance.

### Mini recap

GOV-020 recorded Kris's acceptance and five decisions, amended the hold with a 30-day exemption lapsing on 2026-11-06, and added GDR-KI-ARCADIA-004 with its index and memory entries. Every audit passes. Open items are the untracked review date, the deferred credential identity and the handoff identifiers. Proposed learning route: Kris's naming principle (durable resources named by component, never by roadmap ID) to the Techné naming conventions through its own record.

## Done

Accepted 2026-10-07 by Kris Brown on the review packet above.

## Discussion

### Acceptance and decisions

On 2026-10-07 Kris Brown, the island owner, accepted the bounds ("accept GOV-020 as recommended", then "second instance") and authorised enacting them through the [[Admin/Operations/Processes/Enactment Process|Enactment Process]], including the canonical edit to the hold. The decisions:

1. **Second instance.** A second, new EC2 instance, `ki-techne-agent-host`, runs alongside the existing controller instance `ki-techne-ops-007-primary`, which stays untouched. This resolves the name and tag conflicts: the agent host carries only its own tags.
2. **Order.** Acceptance and the hold amendment come before any remote action, including creating the host for connection testing.
3. **Credential identity deferred.** Connection testing needs only the Tailscale auth key. Which identity holds the GitHub and model API credentials must be decided before agents work on the host.
4. **Time box.** 30 days from acceptance: the prototype authority lapses on 2026-11-06 unless renewed, and the review date is 2026-11-06.
5. **Decision Record.** A governance Decision Record, GDR-KI-ARCADIA-004, records the hold change.

The tag `tag:ki-techne-agent-host` and the component names in "Moving parts" and "Access Kris grants" are confirmed. The operator tooling in chezmoi and the agent-host build in `ki-techne-harness` proceed as handoff items in those repositories, which this record enables.

### Prototype definition

Each line is a bound that Kris accepted on 2026-10-07 (see "Acceptance and decisions"). The [[Techne Programme Hold]] exemption and [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] cite this section, "Access Kris grants" and "Gate and order" as the prototype's bounds. Numbered cross-references in the refinement notes below name the list items as they then stood.

Refined by Kris on 2026-10-07: the prototype does not use Paperclip in any form (bound 6); access moves from session-manager only to Tailscale with Zed remote over SSH (bound 3); egress adds what Tailscale needs, and Zed's release host only if the host downloads the Zed server binary (bound 4); Tailscale and Zed leave the held list, while Paperclip remote, Kitteth and messaging including Telegram stay held (bound 11).

Further decisions by Kris on 2026-10-07:

- **Zed server binary (confirmed).** The binary is uploaded from Kris's Mac with `upload_binary_over_ssh`; the download option and Zed's release host leave bounds 3 and 4.
- **SSH (confirmed by Kris).** Tailscale SSH, as recorded in bound 3.
- **Auth key (confirmed by Kris).** A tagged, pre-approved, single-use key, as recorded in bound 3.
- **Operator tooling.** The operator-side helpers live in Kris's chezmoi source; see "Operator tooling in chezmoi".
- **AWS access.** Kris, not an agent, creates a dedicated, least-privilege AWS access for this prototype after accepting the bounds; see "Access Kris grants".
- **Gate and order.** The sequence is fixed; see "Gate and order".

Clarified by Kris on 2026-10-07: AWS credentials reach a session through Granted (`assume <profile>`) with AWS IAM Identity Center (SSO), as documented in the chezmoi guide `docs/guides/tools/granted.md`; profiles live in the chezmoi source `dot_aws/private_config` under the SSO session `humansnotrobots`. "Access Kris grants" and "Operator tooling in chezmoi" now route the prototype's access that way.

Decided by Kris on 2026-10-07:

- **Account (confirmed).** The Techne account `655383751458` is reachable through the `humansnotrobots` SSO organisation; Kris confirmed this with `assume`. The open question is closed.
- **Naming principle (Kris's, 2026-10-07).** Names of durable resources describe the component, never a roadmap ID. The prototype's durable component is the agent host, matching the agent-host execution profile from `TECHNE-TOOLS-FAB-001`, so the Parameter Store path, AWS CLI profile, permission set, `Name` tag and authorising tag all name the agent host. A work-item tag may remain only as non-authoritative provenance. "Access Kris grants" and the draft policy apply it. The principle may be worth adding to the Techné naming conventions through its own record; this record does not edit any canonical note. The existing controller stack predates it: its `Name` tag embeds `ki-techne-ops-007`.

Decided by Kris on 2026-10-07 (host, access and provisioning):

1. **Host.** The prototype host is a second, new EC2 instance, `ki-techne-agent-host`, alongside the existing controller instance `ki-techne-ops-007-primary`, which stays untouched (decided by Kris, 2026-10-07). It is first used only to test the connection.
2. **SSH.** Tailscale SSH.
3. **Auth key and tag.** A tagged, single-use Tailscale auth key with the tag `tag:ki-techne-agent-host`. Kris confirmed it after learning that the tag names the whole instance (see "Moving parts").
4. **Region.** `eu-west-1`.
5. **Provisioning.** The host is created, and its secrets written, through `ki-techne-harness` provisioning.
6. **Names and policy.** The component-based names and the draft policy in "Access Kris grants" are accepted; the second instance resolves the name conflicts (see "Moving parts").
7. **Purpose.** One remotely reachable agent environment that can edit, commit and run `ki` audits across the `kis` Agora repositories while Kris has poor connectivity.
8. **Host.** Exactly one agent host: a new instance separate from the controller, as `TECHNE-TOOLS-OPS-008` recommends. It adds a standing cost for the term and shares no blast radius with the controller.
9. **Access.** Kris connects over Tailscale and uses Zed "Open Remote" (Zed remote development over SSH) to the host.
   - **Tailnet.** The host joins Kris's tailnet. Tailscale ACLs restrict access to the host to Kris's devices.
   - **SSH.** SSH is reachable only over the tailnet, with no public inbound rule in the security group. Confirmed by Kris: Tailscale SSH. There are no SSH keys to manage, access is governed by tailnet ACLs and Tailscale identity, revocation is removing the device or its tag, and it works with Zed's ordinary `ssh` client. Alternative: `sshd` bound to the tailnet interface only, with keys managed by Kris.
   - **Auth key.** Confirmed by Kris: a tagged, pre-approved, single-use Tailscale auth key with the tag `tag:ki-techne-agent-host`. The tag places the host under the tailnet ACL that admits only Kris's devices, pre-approval avoids a manual device approval on a host Kris cannot yet reach, and single use means the key cannot enrol a second device. It is held in the secret store and named with its revocation step when it is created.
   - **Zed server binary.** Confirmed by Kris: the Zed server binary is uploaded from Kris's Mac over the SSH connection (Zed's `upload_binary_over_ssh` connection setting). The host never downloads it, so no egress to Zed's release host is needed.
10. **Egress.** Limited to named destinations: GitHub, the model API and the package registries the toolchain needs, plus what Tailscale needs: its coordination server (`controlplane.tailscale.com`, TCP 443) and DERP relays (TCP 443, with STUN on UDP 3478), or direct peer connections on UDP 41641. The open FAB-001 TCP 443 rule must be narrowed to those destinations before any apply.
11. **Credentials.** Least-privilege, scoped to the `kis` repositories and the model API, held in a secret store and injected at runtime; never in prompts, chat, repositories or logs. Each grant is named with its revocation step when it is made. Which identity holds the GitHub and model API credentials is decided before any agent works on the host; connection testing needs only the Tailscale auth key.
12. **Sessions.** Kris-initiated sessions only: agents are run directly by Kris in sessions Kris opens. No unattended schedules, cron jobs, webhooks or messaging-triggered runs. The prototype does not use Paperclip in any form: no remote Paperclip and no Paperclip-dispatched runs.
13. **Agent rules.** Agents keep the local rules: explicit-path commits, no push without Kris's request, no prune, no acceptance, no force-push and no `--no-verify`.
14. **Time box.** 30 days from Kris's acceptance on 2026-10-07: the prototype authority lapses on 2026-11-06 unless Kris renews it, and the review date is 2026-11-06. Without an explicit extension the prototype is torn down on that date.
15. **Kill switch and teardown.** One documented stop that halts sessions and revokes every grant, and a teardown that removes the host changes, credentials and network rules the prototype added.
16. **Preservation.** Existing remote services and state are preserved: the controller instance, its Telegram dispatch path and its data are not changed; the agent host is a separate instance.
17. **What stays held.** Paperclip remote in any form, Kitteth, messaging channels including Telegram, K3s changes beyond the one agent-host profile, any other environment, and anything else beyond this prototype.

### Hold prerequisites waived for the prototype only

Kris accepted on 2026-10-07 that the amendment waives these three unmet prerequisites for this prototype only; they stay in force for every other remote operation:

- Evidence of the local review-to-live-main cycle and recovery of accumulated output.
- A review of what Paperclip already supplies and what Techné still needs to add.
- A repository-owned remote-delivery policy covering destination, visibility, review, integration, synchronisation and recovery.

### Access Kris grants

Kris, not an agent, creates this access, and only after accepting the bounds (see "Gate and order"). It exists solely for this prototype and is removed at teardown.

- **Credentials.** Credentials come from Granted. Kris runs `assume <profile>` in the shell that starts the session and verifies the account and role with `aws sts get-caller-identity` before any AWS change. They are short-lived IAM Identity Center session credentials, cached by Granted in the macOS Keychain, and never exported to files or chat. `assume --unset` ends them. Agents started from that shell inherit them only for that session; a new shell or session starts without them. Never long-lived access keys.
- **Permission set.** The least-privilege policy below becomes an IAM Identity Center permission set (the inline policy as drafted) assigned to Kris for the one account, rather than a standalone IAM role. Kris creates the permission set and the assignment as administrator.
- **Profile.** A new SSO profile entry in the chezmoi source `dot_aws/private_config` with `sso_session = humansnotrobots`, `sso_account_id`, `sso_role_name` set to the permission set name, and `region = eu-west-1`. It is added through the GOV-020 chezmoi deliverable (see "Operator tooling in chezmoi") and reaches `~/.aws/config` only through Kris's reviewed apply. Proposed profile name `knowledge-islands-techne-agent-host`, alongside and separate from the existing `knowledge-islands-techne` profile, and proposed permission set name `KnowledgeIslandsTechneAgentHost`; both name the component and are accepted by Kris.
- **Account and region.** Account `655383751458`, region `eu-west-1`, as declared by the existing Techne defaults in `tools-techne` `src/config.ts` and `ki-techne-harness` `operations/aws/controller/provision.sh`. Kris confirmed the account is reachable through the `humansnotrobots` SSO organisation; Kris confirmed the prototype uses `eu-west-1`.
- **Tagging.** `ki-techne-harness` `infra/aws/controller-stack.yaml` tags each resource with `Name`, a component-style identifier `ki-controller-id = controller` (from its `ControllerId` parameter), `ki-lifecycle = retained-controller` and `ki-work-item = TECHNE-OPS-007`. The agent host's instance and security group follow the same pattern by component: `Name = ki-techne-agent-host`, `ki-agent-host-id = agent-host`, `ki-lifecycle = prototype`, and `ki-work-item = KI-ARCADIA-GOV-020`. `ki-agent-host-id` is the authorising tag: the policy's resource conditions match on it. `ki-work-item` follows the existing convention as non-authoritative provenance only; no permission depends on it. The agent host is a separate instance, so it carries only these tags and the instance condition stands as drafted. Kris accepted the key and values.
- **Secret names.** No existing Parameter Store or Secrets Manager naming convention was found in either repository. Proposed SSM Parameter Store SecureString parameters under `/ki/techne/agent-host/` (`tailscale-auth-key`, `github-token`, `model-api-key`), named by component and accepted by Kris; `ki-techne-harness` provisioning writes them.

Draft least-privilege inline policy for the permission set. EC2 `Describe*` calls do not support resource-level scoping, so they are read-only across the region; every mutating action is limited to resources carrying the agent-host component tag. Accepted by Kris on 2026-10-07.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DescribeInRegion",
      "Effect": "Allow",
      "Action": ["ec2:DescribeInstances", "ec2:DescribeInstanceStatus", "ec2:DescribeSecurityGroups", "ec2:DescribeSecurityGroupRules", "ec2:DescribeTags"],
      "Resource": "*",
      "Condition": { "StringEquals": { "aws:RequestedRegion": "eu-west-1" } }
    },
    {
      "Sid": "OperateTheAgentHostInstance",
      "Effect": "Allow",
      "Action": ["ec2:StartInstances", "ec2:StopInstances", "ec2:RebootInstances", "ec2:TerminateInstances"],
      "Resource": "arn:aws:ec2:eu-west-1:655383751458:instance/*",
      "Condition": { "StringEquals": { "aws:ResourceTag/ki-agent-host-id": "agent-host" } }
    },
    {
      "Sid": "NarrowTheAgentHostSecurityGroup",
      "Effect": "Allow",
      "Action": ["ec2:AuthorizeSecurityGroupEgress", "ec2:RevokeSecurityGroupEgress", "ec2:RevokeSecurityGroupIngress", "ec2:DeleteSecurityGroup"],
      "Resource": "arn:aws:ec2:eu-west-1:655383751458:security-group/*",
      "Condition": { "StringEquals": { "aws:ResourceTag/ki-agent-host-id": "agent-host" } }
    },
    {
      "Sid": "ReadTheNamedSecrets",
      "Effect": "Allow",
      "Action": ["ssm:GetParameter", "ssm:GetParameters"],
      "Resource": [
        "arn:aws:ssm:eu-west-1:655383751458:parameter/ki/techne/agent-host/tailscale-auth-key",
        "arn:aws:ssm:eu-west-1:655383751458:parameter/ki/techne/agent-host/github-token",
        "arn:aws:ssm:eu-west-1:655383751458:parameter/ki/techne/agent-host/model-api-key"
      ]
    },
    {
      "Sid": "DecryptOnlyThroughParameterStore",
      "Effect": "Allow",
      "Action": "kms:Decrypt",
      "Resource": "*",
      "Condition": { "StringEquals": { "kms:ViaService": "ssm.eu-west-1.amazonaws.com" } }
    },
    {
      "Sid": "NoIdentityOrTagChanges",
      "Effect": "Deny",
      "Action": ["iam:*", "sso:*", "organizations:*", "ec2:CreateTags", "ec2:DeleteTags", "ec2:AuthorizeSecurityGroupIngress"],
      "Resource": "*"
    }
  ]
}
```

In plain words: the profile can see EC2 instances and security groups in `eu-west-1`; start, stop, reboot and terminate only the instance tagged as the agent host; narrow or remove only the security group tagged as the agent host, and never open inbound access; read only the three named secrets; and never change IAM, SSO, organisation settings or tags, so it cannot pull other resources into its own scope. Creating the host and writing the secrets are not in this policy: Kris decided that `ki-techne-harness` does them under its own provisioning path. If Secrets Manager is chosen instead, the secret statement becomes `secretsmanager:GetSecretValue` on the three named secret ARNs and the KMS condition names `secretsmanager.eu-west-1.amazonaws.com`.

Revocation: run `assume --unset` in any assumed shell, remove the permission set assignment and then the permission set, remove the profile entry from the chezmoi source and apply it after review, and delete the three parameters at teardown.

### Operator tooling in chezmoi

The operator-side helpers are a separate handoff item in Kris's chezmoi source (`~/.local/share/chezmoi`), which this record enables but does not deliver. They sit alongside the existing `private_dot_ssh/private_config`, `dot_config/zed/private_settings.json`, `dot_aws/private_config` and `bin/` scripts:

- **AWS profile.** The `knowledge-islands-techne-agent-host` SSO profile entry in `dot_aws/private_config`, as described in "Access Kris grants".
- **Connect.** A helper that checks `tailscale status` for the host and then opens the host in Zed. If it needs AWS (for example, to start a stopped host), it may call `assume` for the `knowledge-islands-techne-agent-host` profile before any AWS call.
- **Zed connection.** An `ssh_connections` entry for the host in Zed's settings with `upload_binary_over_ssh` enabled.
- **SSH config.** A `Host` entry for the host's tailnet name in the SSH config.
- **Kill switch and teardown.** Wrappers for the bound 9 stop and teardown.

They are written and reviewed locally. Any helper that calls AWS is not run before the gate clears. Kris reviews `chezmoi diff` before applying.

### Gate and order

1. Kris accepts the bounds in this record. Done 2026-10-07.
2. The [[Techne Programme Hold]] is amended through this record, with GDR-KI-ARCADIA-004.
3. Kris grants the access in "Access Kris grants".
4. The agent host is built through the `ki-techne-harness` handoff, with Kris's own credentials, and first used only to test the connection, which needs only the Tailscale auth key.
5. Kris decides which identity holds the GitHub and model API credentials before any agent works on the host.

No remote action, including creating the host for connection testing, precedes steps 1 and 2. No agent requests or uses AWS credentials before step 3 is complete, and no agent creates the access in step 3.

### Intended output

An amendment to the [[Techne Programme Hold]] that names this prototype, cites its accepted bounds, waives the three prerequisites for it alone, states its 30-day term and what stays held, and otherwise leaves the hold standing; and GDR-KI-ARCADIA-004 recording that decision.

- Which identity holds the GitHub and model API credentials? Deferred by Kris on 2026-10-07: it must be decided before any agent works on the host, and it does not block this record.

Every other question was closed on 2026-10-07; see "Acceptance and decisions".

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
