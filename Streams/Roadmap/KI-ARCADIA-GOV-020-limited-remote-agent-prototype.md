---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-020
area: GOV
title: Define and authorise the limited remote agent prototype
theme: governance
horizon: now
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-06T23:21:00Z
updated_at: 2026-10-06T23:28:00Z
---

# Define and Authorise the Limited Remote Agent Prototype

## Goal

Kris accepts or refines one bounded definition of a limited remote agent prototype, and the [[Techne Programme Hold]] is amended to permit that prototype and nothing more. The amendment is this record's output; the definition below is a draft until Kris accepts it.

## Context

On 2026-10-07 Kris decided, within the `state-of-play` review, to lift the hold up to an expressly limited remote prototype defined in that review. Kris needs at least one remotely capable agent environment soon, because connectivity is poor at times and the laptop is swap-bound under its current local load.

The definition is grounded in:

- The acquired ChatGPT captures of 2026-10-03 in `+/_ACQUIRE/chatgpt/knowledge-islands/`, in particular `2026-10-03-techne-and-first-footprint.md` and `2026-10-03-open-questions-and-actions.md`. They describe a larger target footprint (K3s, Paperclip as a workload, Kitteth as operator, Telegram, Tailscale and Zed remote). They are reviewed, not adopted, and most of that footprint stays held here.
- The `baseline-and-cloud` checkpoint, which records the three hold prerequisites as not met or partial, and today's controller: one t3.medium running busybox-only K3s Jobs with no egress.
- `ki-techne-harness` `TECHNE-TOOLS-FAB-001` (accepted and pruned 2026-10-07), which declared the agent-host execution profile in `deploy/kubernetes/execution/agent-host-network-policy.yaml`. Its egress rule still allows any TCP 443 destination, with placeholders for the model API and repository host.
- `ki-techne-harness` `TECHNE-TOOLS-OPS-008` (draft, triage), the costed decision record for the supervised agent host: session-manager access needs no ingress, the controller node has a few gigabytes of headroom after a checkout and a shared blast radius, and every grant should be named with its revocation.

## Boundary

- **Gate.** Kris's explicit acceptance of the definition below, recorded in this record, is required before any remote action: no provisioning, credential creation, network change, agent dispatch or host change happens until then. Readying this record does not itself act remotely.
- This record does not edit the hold. The amendment reaches `Admin/Governance/Policies/` only on Kris's approval of a `ready` record under the [[Admin/Operations/Processes/Enactment Process|Enactment Process]].
- No write to `ki-techne-harness`, `tools-techne` or any other repository. Implementation (host choice, egress narrowing, provisioning) is handed off to `ki-techne-harness` as its own work once the definition is accepted.

## Discussion

### Draft prototype definition

Each line is a proposed bound. Kris may strike or change any of them.

Refined by Kris on 2026-10-07: the prototype does not use Paperclip in any form (bound 6); access moves from session-manager only to Tailscale with Zed remote over SSH (bound 3); egress adds what Tailscale needs, and Zed's release host only if the host downloads the Zed server binary (bound 4); Tailscale and Zed leave the held list, while Paperclip remote, Kitteth and messaging including Telegram stay held (bound 11).

1. **Purpose.** One remotely reachable agent environment that can edit, commit and run `ki` audits across the `kis` Agora repositories while Kris has poor connectivity.
2. **Host.** Exactly one host. Open decision, as in `TECHNE-TOOLS-OPS-008`: the existing controller t3.medium (shared blast radius, marginal headroom) or a separate host (more capacity, new standing cost). OPS-008 recommends a separate host.
3. **Access.** Kris connects over Tailscale and uses Zed "Open Remote" (Zed remote development over SSH) to the host.
   - **Tailnet.** The host joins Kris's tailnet. Tailscale ACLs restrict access to the host to Kris's devices.
   - **SSH.** SSH is reachable only over the tailnet, with no public inbound rule in the security group. Open sub-decision: Tailscale SSH, or `sshd` bound to the tailnet interface only.
   - **Auth key.** The Tailscale auth key is a one-off or tagged key, held in the secret store and named with its revocation step when it is created.
   - **Zed server binary.** Zed remote installs its server binary on the host. It is either downloaded by the host, which needs egress to Zed's release host, or uploaded from Kris's machine over the SSH connection (Zed's `upload_binary_over_ssh` connection setting), which needs no extra egress. Default: upload from Kris's machine, because it keeps egress narrowest. Kris to confirm.
4. **Egress.** Limited to named destinations: GitHub, the model API and the package registries the toolchain needs, plus what Tailscale needs: its coordination server (`controlplane.tailscale.com`, TCP 443) and DERP relays (TCP 443, with STUN on UDP 3478), or direct peer connections on UDP 41641. Zed's release host is added only if the download option in bound 3 is kept. The open FAB-001 TCP 443 rule must be narrowed to those destinations before any apply.
5. **Credentials.** Least-privilege, scoped to the `kis` repositories and the model API, held in a secret store and injected at runtime; never in prompts, chat, repositories or logs. Each grant is named with its revocation step when it is made.
6. **Sessions.** Kris-initiated sessions only: agents are run directly by Kris in sessions Kris opens. No unattended schedules, cron jobs, webhooks or messaging-triggered runs. The prototype does not use Paperclip in any form: no remote Paperclip and no Paperclip-dispatched runs.
7. **Agent rules.** Agents keep the local rules: explicit-path commits, no push without Kris's request, no prune, no acceptance, no force-push and no `--no-verify`.
8. **Time box.** 30 days from Kris's acceptance, with a review date set at acceptance. Without an explicit extension the prototype is torn down on that date.
9. **Kill switch and teardown.** One documented stop that halts sessions and revokes every grant, and a teardown that removes the host changes, credentials and network rules the prototype added.
10. **Preservation.** Existing remote services and state are preserved: the controller, its Telegram dispatch path and its data are not changed beyond what bound 2 and bound 4 require.
11. **What stays held.** Paperclip remote in any form, Kitteth, messaging channels including Telegram, K3s changes beyond the one agent-host profile, any other environment, and anything else beyond this prototype.

### Hold prerequisites waived for the prototype only

Subject to Kris's acceptance, the amendment waives these three unmet prerequisites for this prototype only; they stay in force for every other remote operation:

- Evidence of the local review-to-live-main cycle and recovery of accumulated output.
- A review of what Paperclip already supplies and what Techné still needs to add.
- A repository-owned remote-delivery policy covering destination, visibility, review, integration, synchronisation and recovery.

### Intended output

An amendment to the [[Techne Programme Hold]] that names this prototype, its accepted bounds, the waived prerequisites, its time box and its teardown, and states that the hold otherwise stands.

### Open questions

- Which host: the controller node or a separate host?
- Which secret store, and which identity holds the GitHub and model API credentials?
- Is a 30-day time box right, and what review date?
- Should the amendment also be recorded as a Decision Record?
- Tailscale SSH, or `sshd` bound to the tailnet interface only?
- Confirm the default of uploading the Zed server binary from Kris's machine rather than letting the host download it.
- One-off or tagged Tailscale auth key?

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
