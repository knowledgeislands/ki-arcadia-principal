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
updated_at: 2026-10-06T23:39:00Z
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

Further decisions by Kris on 2026-10-07:

- **Zed server binary (confirmed).** The binary is uploaded from Kris's Mac with `upload_binary_over_ssh`; the download option and Zed's release host leave bounds 3 and 4.
- **SSH (recommended, pending Kris's confirmation).** Tailscale SSH, as recorded in bound 3.
- **Auth key (recommended, pending Kris's confirmation).** A tagged, pre-approved, single-use key, as recorded in bound 3.
- **Operator tooling.** The operator-side helpers live in Kris's chezmoi source; see "Operator tooling in chezmoi".
- **AWS access.** Kris, not an agent, creates a dedicated, least-privilege AWS access for this prototype after accepting the bounds; see "Access Kris grants".
- **Gate and order.** The sequence is fixed; see "Gate and order".

Clarified by Kris on 2026-10-07: AWS credentials reach a session through Granted (`assume <profile>`) with AWS IAM Identity Center (SSO), as documented in the chezmoi guide `docs/guides/tools/granted.md`; profiles live in the chezmoi source `dot_aws/private_config` under the SSO session `humansnotrobots`. "Access Kris grants" and "Operator tooling in chezmoi" now route the prototype's access that way.

Decided by Kris on 2026-10-07:

- **Account (confirmed).** The Techne account `655383751458` is reachable through the `humansnotrobots` SSO organisation; Kris confirmed this with `assume`. The open question is closed.
- **Naming principle (Kris's, 2026-10-07).** Names of durable resources describe the component, never a roadmap ID. The prototype's durable component is the agent host, matching the agent-host execution profile from `TECHNE-TOOLS-FAB-001`, so the Parameter Store path, AWS CLI profile, permission set, `Name` tag and authorising tag all name the agent host. A work-item tag may remain only as non-authoritative provenance. "Access Kris grants" and the draft policy apply it. The principle may be worth adding to the Techné naming conventions through its own record; this record does not edit any canonical note. The existing controller stack predates it: its `Name` tag embeds `ki-techne-ops-007`.

1. **Purpose.** One remotely reachable agent environment that can edit, commit and run `ki` audits across the `kis` Agora repositories while Kris has poor connectivity.
2. **Host.** Exactly one host. Open decision, as in `TECHNE-TOOLS-OPS-008`: the existing controller t3.medium (shared blast radius, marginal headroom) or a separate host (more capacity, new standing cost). OPS-008 recommends a separate host.
3. **Access.** Kris connects over Tailscale and uses Zed "Open Remote" (Zed remote development over SSH) to the host.
   - **Tailnet.** The host joins Kris's tailnet. Tailscale ACLs restrict access to the host to Kris's devices.
   - **SSH.** SSH is reachable only over the tailnet, with no public inbound rule in the security group. Recommended, pending Kris's confirmation: Tailscale SSH. There are no SSH keys to manage, access is governed by tailnet ACLs and Tailscale identity, revocation is removing the device or its tag, and it works with Zed's ordinary `ssh` client. Alternative: `sshd` bound to the tailnet interface only, with keys managed by Kris.
   - **Auth key.** Recommended, pending Kris's confirmation: a tagged, pre-approved, single-use Tailscale auth key. The tag places the host under the tailnet ACL that admits only Kris's devices, pre-approval avoids a manual device approval on a host Kris cannot yet reach, and single use means the key cannot enrol a second device. It is held in the secret store and named with its revocation step when it is created.
   - **Zed server binary.** Confirmed by Kris: the Zed server binary is uploaded from Kris's Mac over the SSH connection (Zed's `upload_binary_over_ssh` connection setting). The host never downloads it, so no egress to Zed's release host is needed.
4. **Egress.** Limited to named destinations: GitHub, the model API and the package registries the toolchain needs, plus what Tailscale needs: its coordination server (`controlplane.tailscale.com`, TCP 443) and DERP relays (TCP 443, with STUN on UDP 3478), or direct peer connections on UDP 41641. The open FAB-001 TCP 443 rule must be narrowed to those destinations before any apply.
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

### Access Kris grants

Kris, not an agent, creates this access, and only after accepting the bounds (see "Gate and order"). It exists solely for this prototype and is removed at teardown.

- **Credentials.** Credentials come from Granted. Kris runs `assume <profile>` in the shell that starts the session and verifies the account and role with `aws sts get-caller-identity` before any AWS change. They are short-lived IAM Identity Center session credentials, cached by Granted in the macOS Keychain, and never exported to files or chat. `assume --unset` ends them. Agents started from that shell inherit them only for that session; a new shell or session starts without them. Never long-lived access keys.
- **Permission set.** The least-privilege policy below becomes an IAM Identity Center permission set (the inline policy as drafted) assigned to Kris for the one account, rather than a standalone IAM role. Kris creates the permission set and the assignment as administrator.
- **Profile.** A new SSO profile entry in the chezmoi source `dot_aws/private_config` with `sso_session = humansnotrobots`, `sso_account_id`, `sso_role_name` set to the permission set name, and `region = eu-west-1`. It is added through the GOV-020 chezmoi deliverable (see "Operator tooling in chezmoi") and reaches `~/.aws/config` only through Kris's reviewed apply. Proposed profile name `knowledge-islands-techne-agent-host`, alongside and separate from the existing `knowledge-islands-techne` profile, and proposed permission set name `KnowledgeIslandsTechneAgentHost`; both name the component, Kris to confirm.
- **Account and region.** Account `655383751458`, region `eu-west-1`, as declared by the existing Techne defaults in `tools-techne` `src/config.ts` and `ki-techne-harness` `operations/aws/controller/provision.sh`. Kris confirmed the account is reachable through the `humansnotrobots` SSO organisation; Kris to confirm the prototype uses the same region.
- **Tagging.** `ki-techne-harness` `infra/aws/controller-stack.yaml` tags each resource with `Name`, a component-style identifier `ki-controller-id = controller` (from its `ControllerId` parameter), `ki-lifecycle = retained-controller` and `ki-work-item = TECHNE-OPS-007`. The agent host's instance and security group follow the same pattern by component: `Name = ki-techne-agent-host`, `ki-agent-host-id = agent-host`, `ki-lifecycle = prototype`, and `ki-work-item = KI-ARCADIA-GOV-020`. `ki-agent-host-id` is the authorising tag: the policy's resource conditions match on it. `ki-work-item` follows the existing convention as non-authoritative provenance only; no permission depends on it. If the host is the controller node rather than a separate host, the instance already carries the controller's tags, and the instance condition must be revisited before the policy is created. Kris to confirm the key and values.
- **Secret names.** No existing Parameter Store or Secrets Manager naming convention was found in either repository. Proposed SSM Parameter Store SecureString parameters under `/ki/techne/agent-host/` (`tailscale-auth-key`, `github-token`, `model-api-key`), named by component, Kris to confirm the store and names.

Draft least-privilege inline policy for the permission set. EC2 `Describe*` calls do not support resource-level scoping, so they are read-only across the region; every mutating action is limited to resources carrying the agent-host component tag. Kris to confirm.

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

In plain words: the profile can see EC2 instances and security groups in `eu-west-1`; start, stop, reboot and terminate only the instance tagged as the agent host; narrow or remove only the security group tagged as the agent host, and never open inbound access; read only the three named secrets; and never change IAM, SSO, organisation settings or tags, so it cannot pull other resources into its own scope. Creating the host and writing the secrets are not in this policy: Kris does those, or `ki-techne-harness` does them under its own provisioning path once handed off, Kris to confirm which. If Secrets Manager is chosen instead, the secret statement becomes `secretsmanager:GetSecretValue` on the three named secret ARNs and the KMS condition names `secretsmanager.eu-west-1.amazonaws.com`.

Revocation: run `assume --unset` in any assumed shell, remove the permission set assignment and then the permission set, remove the profile entry from the chezmoi source and apply it after review, and delete the three parameters at teardown.

### Operator tooling in chezmoi

The operator-side helpers are a deliverable of this record and live in Kris's chezmoi source (`~/.local/share/chezmoi`), alongside the existing `private_dot_ssh/private_config`, `dot_config/zed/private_settings.json`, `dot_aws/private_config` and `bin/` scripts:

- **AWS profile.** The `knowledge-islands-techne-agent-host` SSO profile entry in `dot_aws/private_config`, as described in "Access Kris grants".
- **Connect.** A helper that checks `tailscale status` for the host and then opens the host in Zed. If it needs AWS (for example, to start a stopped host), it may call `assume` for the `knowledge-islands-techne-agent-host` profile before any AWS call.
- **Zed connection.** An `ssh_connections` entry for the host in Zed's settings with `upload_binary_over_ssh` enabled.
- **SSH config.** A `Host` entry for the host's tailnet name in the SSH config.
- **Kill switch and teardown.** Wrappers for the bound 9 stop and teardown.

They are written and reviewed locally. Any helper that calls AWS is not run before the gate clears. Kris reviews `chezmoi diff` before applying.

### Gate and order

1. Kris accepts the bounds in this record.
2. The [[Techne Programme Hold]] is amended through this record.
3. Kris grants the access in "Access Kris grants".
4. The host is built.

No agent requests or uses AWS credentials before step 3 is complete, and no agent creates the access in step 3.

### Intended output

An amendment to the [[Techne Programme Hold]] that names this prototype, its accepted bounds, the waived prerequisites, its time box and its teardown, and states that the hold otherwise stands.

### Open questions

- Which host: the controller node or a separate host?
- Which secret store (Parameter Store or Secrets Manager) and secret names, and which identity holds the GitHub and model API credentials?
- Confirm the draft inline policy, the permission set name, the profile name, the region, and the tag key and values in "Access Kris grants".
- Who creates the host and writes the secrets: Kris directly, or `ki-techne-harness` under its own provisioning path?
- Is a 30-day time box right, and what review date?
- Should the amendment also be recorded as a Decision Record?
- Confirm Tailscale SSH (recommended) over `sshd` bound to the tailnet interface.
- Confirm a tagged, pre-approved, single-use Tailscale auth key (recommended), and the tag name.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
