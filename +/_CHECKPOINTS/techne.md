---
type: ki-checkpoint
thread: techne
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-07T09:05:00Z
---

# techne

## Objective

Move agent work off the laptop into the Techné footprint, starting with the one agent host the hold now exempts. The checkpoint exists for one decision: at the scheduled review on 2026-11-06 ([[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]]), Kris keeps, widens or withdraws the standing agent-host exemption, and decides whether to reshape the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) for the held full footprint.

The test: that decision is made on evidence held in owning records - the host operated as the exemption describes, its credential identity and egress settled, and each of the hold's three prerequisites either evidenced or explicitly set aside by Kris. Arcadia coordinates; every item is delivered through a work record in its owning repository.

The rollout baseline is a separate thread, `baseline`, and does not gate this one. `paperclip-bootstrap-and-recovery` owns the local Paperclip delivery that supplies the first prerequisite; `delta-evaluation` checks Delta's hosted threads against this hold.

## Current state

Records read on 2026-10-07 at about 11:00 CEST; recheck before acting.

- **Exemption.** The hold carries one standing exemption: setting up and operating the single agent host `ki-techne-agent-host` properly and durably, with Kris's own credentials through the account-local operator role, no automatic lapse, and a review on 2026-11-06. Paperclip, Kitteth and every Avatar, Telegram, wider K3s and controller changes, execution fabric and every other environment stay held ([[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]]; the hold, in force from Arcadia `e25a7f9`).
- **Controller.** The untouched controller `ki-techne-ops-007-primary` dispatches Telegram `/run` requests as busybox-only K3s Jobs with no egress on one t3.medium (the hold; GOV-020).
- **Host.** Built, reached over Tailscale SSH, and in use for Kris-opened sessions. Operator access is the account-local IAM role `ki-techne-agent-host-operator`, not an Identity Center permission set (GOV-021 discussion). The GitHub token expires on 2026-11-06, the same day as the review (`TECHNE-TOOLS-OPS-011` verification).
- **Egress.** The host's security group allows TCP 443 and 80 to any address, plus UDP 3478 and 41641; a security group cannot express named destinations (`TECHNE-TOOLS-OPS-009`). Arcadia holds no evidence that named-destination egress is bound or that the GitHub and model API credential identity is settled (`KI-ARCADIA-GOV-023` review).
- **Laptop.** Load about 6 and 17.0 of 18.0 GB swap used, observed read-only on 2026-10-07 at 01:15 CEST, with all Rig launchd services loaded. No record owns reducing the standing load; chezmoi `DOTFILES-UE-065` (mcporter same-boot stall) is Draft, waiting-for.

Records:

| Record | Status | Notes |
| --- | --- | --- |
| [[KI-ARCADIA-GOV-020-limited-remote-agent-prototype\|KI-ARCADIA-GOV-020]] - limited remote agent prototype | done | Defined and authorised the separate host |
| [[KI-ARCADIA-GOV-023-widen-the-agent-host-exemption-to-a-standing-one\|KI-ARCADIA-GOV-023]] - standing exemption | done | Widened the exemption, removed the lapse, scheduled the review |
| [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype\|KI-ARCADIA-GOV-021]] - review the agent host | draft, triage | The 2026-11-06 review this checkpoint serves |
| `ki-techne-harness` `TECHNE-TOOLS-OPS-008` and `OPS-009` - agent host | done | OPS-008 closed as merged into OPS-009, which delivered the stack, runbook, kill switch and teardown; FAB-001's egress narrowing went with it |
| `ki-techne-harness` `TECHNE-TOOLS-OPS-010` - runbook diagrams | done | - |
| `ki-techne-harness` `TECHNE-TOOLS-OPS-011` - manage the host footprint | awaiting-review | Rerunnable workspace setup, read-only status report, `zsh` in future builds, OS hostname on rebuild |
| `tools-techne` `TECHNE-TOOL-CLI-004` - `techne host` command group | in-progress | Handlers, tests and documentation done; definition-of-done gates and a read-only live `techne host status` remain |
| chezmoi `DOTFILES-UE-068` - agent-host operator tooling | done | The `techne-agent-host` helper, assuming the account-local role |

Hold prerequisites (the hold's "Holding position"):

| Prerequisite | Status | Evidence |
| --- | --- | --- |
| 1 - local review-to-live-main cycle and recovery | Not met | Next step items 1 and 2 of `paperclip-bootstrap-and-recovery` |
| 2 - what Paperclip supplies versus what Techné must add | Partial | `ki-techne-harness/+/paperclip-as-techne-prior-art.md` (working analysis, 2026-09-24), never promoted |
| 3 - repository-owned remote-delivery policy | Not met | Boundary owned by the harness `ki-agent-coordination-paperclip` skill; no record |

Acquired ChatGPT captures in `+/_ACQUIRE/chatgpt/knowledge-islands/` (2026-10-03), read in full by `state-of-play` and not adopted: `overview`, `design-principles`, `techne-and-first-footprint` and `open-questions-and-actions` map here. They describe the full footprint - one EC2 instance with K3s, Paperclip as a workload, Kitteth as operator, Tailscale, SSH and Zed remote, Telegram, work surviving the Rig disconnecting, and a reconstructability inventory. They do not widen the exemption; `state-of-play` found no new generic cloud-readiness item is needed for the already-owned host subset.

Untracked ideas, kept here rather than captured:

- **OPS-011 follow-ups**, named in that record but not captured: work durability in `stop.sh` and `destroy.sh`; the two-checkout rule and a designated roadmap writing checkout; keeping the host's pins current; a standing expiry view.
- **Laptop relief.** Capture a standing-load record in its owning repository, then pause non-essential Rig agents and trim the MCP inventory.
- **Techné cloud readiness.** An Arcadia record for the held footprint: promote the prior-art note as prerequisite 2, own the reconstructability inventory and the Paperclip workload design (container, Postgres persistent volume, backup, host sizing), and hand prerequisite 3 to the harness as a reciprocal blocking item. Only relevant if Kris moves to reshape the hold.

## Decisions made

- Outside the exemption the hold stands: local design, build and test proceed, but no remote execution or remote-environment management. Moving Paperclip off the laptop is remote-environment management. Only Kris can authorise, reshape or retire the hold.
- Kris accepted GOV-020 on 2026-10-07 and widened it the same day through GOV-023 to a standing exemption with a scheduled review (GDR-KI-ARCADIA-004).
- Operator access is an account-local role, independent of any organisation setup (GOV-021 discussion, on Kris's instruction).
- Kris decided on 2026-10-07 to run this thread separately from the baseline rollout.

## Files touched

This record takes over the cloud half of `baseline-and-cloud`, which was renamed to `baseline` on 2026-10-07; Git retains the original. No canonical content, roadmap record or remote state changed.

## Open questions

- Should the hold be reshaped so Paperclip can move to an owned host before all three prerequisites are met? The exemption does not answer this.
- Which identity holds the host's GitHub and model API credentials, and where is named-destination egress recorded as bound?
- Who retires the chezmoi `techne-agent-host` helper once `techne host` ships? CLI-004 leaves it with UE-068, which is done.
- OPS-011's open questions: should teardown refuse or warn on unlanded work; is the Mac or the host the designated roadmap writing checkout; is Tailscale key expiry on for the host?
- Which repository owns reducing the laptop's standing load: chezmoi, `tools-rig` or both? Approve the bounded, sanitised mcporter trace in UE-065?

## Next step

Kris reviews `TECHNE-TOOLS-OPS-011`, the one Techné record awaiting review. Then, ahead of 2026-11-06, assemble GOV-021's inputs from the owning records - how the host has been used, cost, credential identity, egress, token rotation, CLI-004's state and each prerequisite's status - and bring them to Kris for the keep, widen or withdraw decision and the question of reshaping the hold.
