---
type: ki-checkpoint
thread: techne
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-07T09:18:13Z
---

# techne

## Objective

Move agent work off the laptop into the Techné footprint, starting with the one agent host the hold now exempts. The checkpoint exists for one decision: at the scheduled review on 2026-11-06 ([[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]]), Kris keeps, widens or withdraws the standing agent-host exemption, and decides whether to reshape the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) for the held full footprint.

The test: that decision is made on evidence held in owning records - the host operated as the exemption describes, its credential identity and egress settled, and each of the hold's three prerequisites either evidenced or explicitly set aside by Kris. Arcadia coordinates; every item is delivered through a work record in its owning repository.

The rollout baseline is a separate thread, [baseline](baseline.md), and does not gate this one. `paperclip-bootstrap-and-recovery` owns the local Paperclip delivery that supplies the first prerequisite; `delta-evaluation` checks Delta's hosted threads against this hold.

## Current state

Records read on 2026-10-07 at about 11:30 CEST; recheck before acting.

- **Exemption.** The hold carries one standing exemption: setting up and operating the single agent host `ki-techne-agent-host` properly and durably, with Kris's own credentials through the account-local operator role, no automatic lapse, and a review on 2026-11-06. Paperclip, Kitteth and every Avatar, Telegram, wider K3s and controller changes, execution fabric and every other environment stay held ([[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]]; the hold, in force from Arcadia `e25a7f9`).
- **Controller.** The untouched controller `ki-techne-ops-007-primary` dispatches Telegram `/run` requests as busybox-only K3s Jobs with no egress on one t3.medium (the hold; GOV-020).
- **Host.** Built, reached over Tailscale SSH, and in use for Kris-opened sessions. Operator access is the account-local IAM role `ki-techne-agent-host-operator`, not an Identity Center permission set (GOV-021 discussion). The GitHub token expires on 2026-11-06, the same day as the review. The workspace is now reproducible: `setup.sh` reruns with no changes and `status.sh` reports unlanded work and expiry. The host still has the AWS default hostname and no `zsh` until it is rebuilt; the estate audit's remaining failures are 21 `BIND-2` findings because the host has no MCP source, and one `zsh`-dependent test. Codex was not signed in at acceptance and `codex login status` has not been checked since. The hand set-up backups `~/.profile.bak-ops011-*` and `~/.bashrc.bak-ops011-*` remain for Kris to delete (`TECHNE-TOOLS-OPS-011` verification and acceptance).
- **Egress.** The host's security group allows TCP 443 and 80 to any address, plus UDP 3478 and 41641; a security group cannot express named destinations (`TECHNE-TOOLS-OPS-009`). Arcadia holds no evidence that named-destination egress is bound or that the GitHub and model API credential identity is settled (`KI-ARCADIA-GOV-023` review).
- **Laptop.** Load about 6 and 17.0 of 18.0 GB swap used, observed read-only on 2026-10-07 at 01:15 CEST, with all Rig launchd services loaded. No record owns reducing the standing load; chezmoi `DOTFILES-UE-065` (mcporter same-boot stall) is Draft, waiting-for.

Records:

| Record | Status | Notes |
| --- | --- | --- |
| [[KI-ARCADIA-GOV-020-limited-remote-agent-prototype\|KI-ARCADIA-GOV-020]] - limited remote agent prototype | done | Defined and authorised the separate host |
| [[KI-ARCADIA-GOV-023-widen-the-agent-host-exemption-to-a-standing-one\|KI-ARCADIA-GOV-023]] - standing exemption | done | Widened the exemption, removed the lapse, scheduled the review |
| [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype\|KI-ARCADIA-GOV-021]] - review the agent host | draft, triage | The 2026-11-06 review this checkpoint serves |
| [[KI-ARCADIA-GOV-025-model-agent-hosts-as-recipes-and-bindings\|KI-ARCADIA-GOV-025]] - agent hosts as recipes and bindings | draft, triage | Captured before this checkpoint took over (`915f6a6`, `7845db8`, `f060331`, local only). A recipe is a harness-defined kind of host; a binding is a person's named, configured instance. Prototype recipe `direct-host`, with the existing host as its first binding; grammar `--host <binding>` with a default. A second binding needs its own authority under the hold |
| `ki-techne-harness` `TECHNE-TOOLS-OPS-008` and `OPS-009` - agent host | done | OPS-008 closed as merged into OPS-009, which delivered the stack, runbook, kill switch and teardown; FAB-001's egress narrowing went with it |
| `ki-techne-harness` `TECHNE-TOOLS-OPS-010` - runbook diagrams | done | - |
| `ki-techne-harness` `TECHNE-TOOLS-OPS-011` - manage the host footprint | done | Accepted on Kris's approval at 10:58 CEST, 2026-10-07 (`9bb2e52`, `de05a78`); not pruned, because it is the only home of its six follow-ups |
| `tools-techne` `TECHNE-TOOL-CLI-004` - `techne host` command group | in-progress | First slice done and pushed: `host status`, `start`, `stop`, `teardown` and `connect` (`0a49646`, `6d1616c`, `d215a78`). Live read-only `techne host status` not yet verified: the SSO session expired. The later step, `host setup` and a workspace object in `host status`, is being built by agent `techne/cli` with no live host calls |
| chezmoi `DOTFILES-UE-068` - agent-host operator tooling | done | The `techne-agent-host` helper, assuming the account-local role; to be removed once CLI-004 is complete |

Hold prerequisites (the hold's "Holding position"):

| Prerequisite | Status | Evidence |
| --- | --- | --- |
| 1 - local review-to-live-main cycle and recovery | Not met | Next step items 1 and 2 of `paperclip-bootstrap-and-recovery` |
| 2 - what Paperclip supplies versus what Techné must add | Partial | `ki-techne-harness/+/paperclip-as-techne-prior-art.md` (working analysis, 2026-09-24), never promoted |
| 3 - repository-owned remote-delivery policy | Not met | Boundary owned by the harness `ki-agent-coordination-paperclip` skill; no record |

Acquired ChatGPT captures in `+/_ACQUIRE/chatgpt/knowledge-islands/` (2026-10-03), read in full by `state-of-play` and not adopted: `overview`, `design-principles`, `techne-and-first-footprint` and `open-questions-and-actions` map here. They describe the full footprint - one EC2 instance with K3s, Paperclip as a workload, Kitteth as operator, Tailscale, SSH and Zed remote, Telegram, work surviving the Rig disconnecting, and a reconstructability inventory. They do not widen the exemption; `state-of-play` found no new generic cloud-readiness item is needed for the already-owned host subset.

Planned, not yet scheduled:

- **Host rebuild** at a time Kris chooses, under the standing exemption, to pick up the OS hostname `ki-techne-agent-host` and `zsh`, then prove that setup re-converges on the fresh host.

Untracked ideas, kept here rather than captured:

- **OPS-011 follow-ups**, named in its acceptance and not captured: work durability in `stop.sh` and `destroy.sh`; the two-checkout rule and a designated roadmap writing checkout; keeping the host's pins current; a standing expiry view; an MCP source for the host (the 21 `BIND-2` failures); and moving the three `ki` behaviour fixes found live (`ki dev local set` while the checkout is active, bootstrap without `--refresh`, the estate `diag` exit status) to `tools-ki`.
- **Laptop relief.** Capture a standing-load record in its owning repository, then pause non-essential Rig agents and trim the MCP inventory.
- **Techné cloud readiness.** An Arcadia record for the held footprint: promote the prior-art note as prerequisite 2, own the reconstructability inventory and the Paperclip workload design (container, Postgres persistent volume, backup, host sizing), and hand prerequisite 3 to the harness as a reciprocal blocking item. Only relevant if Kris moves to reshape the hold.

## Decisions made

- Outside the exemption the hold stands: local design, build and test proceed, but no remote execution or remote-environment management. Moving Paperclip off the laptop is remote-environment management. Only Kris can authorise, reshape or retire the hold.
- Kris accepted GOV-020 on 2026-10-07 and widened it the same day through GOV-023 to a standing exemption with a scheduled review (GDR-KI-ARCADIA-004).
- Operator access is an account-local role, independent of any organisation setup (GOV-021 discussion, on Kris's instruction).
- Kris decided on 2026-10-07 to run this thread separately from the baseline rollout.
- Kris decided on 2026-10-07 that once CLI-004 is complete the chezmoi `techne-agent-host` helper is removed outright, not kept as an alias: "get rid of any temporary local scripts in chezmoi".

## Files touched

This record takes over the cloud half of `baseline-and-cloud`, which was renamed to `baseline` on 2026-10-07; Git retains the original. No canonical content, roadmap record or remote state changed through this checkpoint.

## Open questions

- Should the hold be reshaped so Paperclip can move to an owned host before all three prerequisites are met? The exemption does not answer this.
- Which identity holds the host's GitHub and model API credentials, and where is named-destination egress recorded as bound?
- Does GOV-025 stay a Triage record or revert to an idea in this checkpoint, pending how ideas become records?
- Should `techne host teardown` later delegate to the harness's whole-stack deletion rather than port the helper's instance-only teardown (CLI-004 "Teardown scope")?
- OPS-011's open questions: should teardown refuse or warn on unlanded work; is the Mac or the host the designated roadmap writing checkout; is Tailscale key expiry on for the host?
- May the OPS-011 backup files on the host be deleted?
- Which repository owns reducing the laptop's standing load: chezmoi, `tools-rig` or both? Approve the bounded, sanitised mcporter trace in UE-065?

## Next step

Finish CLI-004's `host setup` and workspace status wrap; Kris runs `techne auth login` and verifies `techne host status` live. Then retire the chezmoi `techne-agent-host` helper, rebuild the host when Kris chooses and prove setup re-converges. Only after that, ahead of 2026-11-06, assemble GOV-021's inputs from the owning records - how the host has been used, cost, credential identity, egress, token rotation, CLI-004's state and each prerequisite's status - and bring them to Kris for the keep, widen or withdraw decision and the question of reshaping the hold.
