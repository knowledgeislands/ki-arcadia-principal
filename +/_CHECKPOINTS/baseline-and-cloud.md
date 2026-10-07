---
type: ki-checkpoint
thread: baseline-and-cloud
state: active
created_at: 2026-10-06T20:50:00Z
updated_at: 2026-10-07T07:25:00Z
---

# baseline-and-cloud

## Objective

Reach a solid Knowledge Islands baseline that can be rolled out to every island, then move agent work off the laptop into the Techné cloud footprint once Kris has explicitly decided on the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>). The laptop is swap-bound under the current local load, which makes the move urgent. Arcadia coordinates; every item is delivered through a work record in its owning repository.

Neighbouring threads own their own scope; this record links to them rather than restating them:

- `paperclip-bootstrap-and-recovery` owns VA delivery, which supplies the first hold prerequisite.
- `estate-factorisation` owns structure, MCP, distribution and `ki` pin automation (`KI-ARCADIA-GOV-018`, `KI-HARNESS-GOV-141`).
- `territories-and-trades` owns route policy.
- `delta-evaluation` owns the Delta trial question.

## Current state

Observed read-only on 2026-10-07 at 01:15 CEST; recheck before acting.

- **Laptop.** Load is about 6, and 17.0 of 18.0 GB of swap is used. All Rig launchd services were loaded on 2026-10-06: Paperclip, observatory, mcporter daemon and bridge, headroom, good-morning, the testbed and WhatsApp refreshes, and the health and update agents. No record owns reducing that standing load.
- **Release.** `ki` v0.7.1 is tagged, installed locally and published in the `homebrew-tap` formula.
- **Queue.** The harness has 18 records ready, 2 in progress and 14 in draft. Arcadia has 12 ready and 5 in draft. Nothing is awaiting review across the `kis` Agora or chezmoi.

Baseline records:

| Record | Status | Why it matters |
| --- | --- | --- |
| `KI-HARNESS-FND-026` - complete conform activation | ready, now | Rollout depends on conform working everywhere |
| `KI-HARNESS-GOV-109` - enforce commit gates | ready, now | Consistent gates before rollout |
| `KI-HARNESS-GOV-095` - align roadmap diagnostics | done, pruned | Trustworthy roadmap audits across islands |
| `KI-HARNESS-GOV-092` - align generated normal forms | done, pruned | Stable generated output for rollout |
| `KI-HARNESS-RTP-013` - route portable skill doctrine | done, pruned | Doctrine out of private files, needed for unattended runs |
| `KI-HARNESS-GOV-115` - require a current worktree base | ready, now | Reports base drift in coordinated delivery |
| `KI-HARNESS-RTP-015` - verify run MCP connection | ready, now | Agent runs reaching the mcporter bridge |
| `KI-ARCADIA-GOV-012` - roadmap serial allocation under concurrency | done, pruned | Safe serial allocation while agents work concurrently |
| `KI-ARCADIA-GOV-019` - veto wording | done, pruned | Governance text matches the layout |
| [[KI-ARCADIA-OPS-008-scheduled-automations\|KI-ARCADIA-OPS-008]] - scheduled automations | ready, now | Tending prompts and scheduled work that survives a laptop move |
| [[KI-ARCADIA-EXT-003-ki-skill-extractions\|KI-ARCADIA-EXT-003]] - skill extractions | ready, now | Arcadia-only doctrine becomes portable skills |
| [[KI-ARCADIA-ECO-009-legacy-serve-fallback-policy\|KI-ARCADIA-ECO-009]] - legacy serve fallback evidence | ready, now | MCP launch evidence; also mapped in `estate-factorisation` |
| [[KI-ARCADIA-OPS-002-tooling-rollout\|KI-ARCADIA-OPS-002]] - tooling rollout | draft, next | Obsolete as written; waiting on Kris to close it or fold it into OPS-008 |
| chezmoi `DOTFILES-UE-067` - serve Observatory under launchd | done, pruned | Standing laptop services |
| chezmoi `DOTFILES-UE-065` - diagnose same-boot mcporter stall | draft, waiting-for | Standing laptop services |

Cloud records and evidence:

| Item | Status | Notes |
| --- | --- | --- |
| `ki-techne-harness` `TECHNE-TOOLS-FAB-001` - agent-host execution profile | done, pruned | Local build; its TCP 443 egress rule must be narrowed under OPS-008 before any apply |
| `ki-techne-harness` `TECHNE-TOOLS-OPS-008` and `OPS-009` - agent host | OPS-008 closed as merged; OPS-009 done | Separate host chosen; stack, runbook, kill switch and teardown delivered; host built and in use |
| `ki-techne-harness` `TECHNE-TOOLS-OPS-010` and `OPS-011` | OPS-010 done; OPS-011 ready, now | OPS-010 diagrams the runbook; OPS-011 makes the host's workspace setup, updates and status rerunnable |
| `tools-techne` `TECHNE-TOOL-CLI-004` - host command group | draft, triage | Captured: `techne host` operator commands acting only on the agent host |
| Chezmoi `DOTFILES-UE-068` - agent-host operator tooling | done | Corrected after acceptance to assume the account-local operator role |
| Target footprint | Captured, not adopted | `+/_ACQUIRE/chatgpt/knowledge-islands/2026-10-03-techne-and-first-footprint.md` and siblings. One EC2 instance with K3s; Paperclip as a workload; Kitteth as operator; Tailscale, SSH and Zed remote; Telegram; work survives the Rig disconnecting; a reconstructability inventory |
| Hold prerequisite 1 - local review-to-live-main cycle and recovery | Not met | Next step items 1 and 2 of `paperclip-bootstrap-and-recovery` |
| Hold prerequisite 2 - what Paperclip supplies versus what Techné must add | Partial | `ki-techne-harness/+/paperclip-as-techne-prior-art.md` (working analysis, 2026-09-24), never promoted |
| Hold prerequisite 3 - repository-owned remote-delivery policy | Not met | Boundary owned by the harness `ki-agent-coordination-paperclip` skill; no record |

Today's Techné controller dispatches Telegram `/run` requests as busybox-only K3s Jobs with no egress on one t3.medium. Beside it, the separate agent host `ki-techne-agent-host` is built, reached over Tailscale SSH, and in use for Kris-opened agent sessions. Paperclip, Kitteth and the reconstructability inventory are still missing.

## Decisions made

- The Techne Programme Hold stands: local design, build and test may proceed, but no remote execution or remote-environment management. Moving Paperclip off the laptop is remote-environment management. Only Kris can authorise, reshape or retire the hold, once the three prerequisites are evidenced.
- Kris accepted `KI-ARCADIA-GOV-020` on 2026-10-07: the hold carries one exemption, for a single new agent-host instance `ki-techne-agent-host` beside the untouched controller, with Kris-opened sessions only, Kris's own credentials for the build and any AWS action, and Paperclip, Kitteth, Telegram, wider K3s and existing remote services still held. On 2026-10-07 at 08:40 CEST Kris widened it through `KI-ARCADIA-GOV-023` to setting up and operating that one host properly and durably, with no automatic lapse: it stands until Kris changes or withdraws it, with a scheduled review on 2026-11-06 (GDR-KI-ARCADIA-004, retitled "Standing agent-host exemption from the Techne Programme Hold"). The widened exemption is in force from Arcadia `e25a7f9`. It does not move Paperclip and does not satisfy the three prerequisites.

## Files touched

None beyond this record.

## Open questions

- Should the hold be reshaped so Paperclip can move to an owned host before all three prerequisites are met? The GOV-020 exemption does not answer this.
- At the scheduled 2026-11-06 review (`KI-ARCADIA-GOV-021`): keep, widen or withdraw the standing agent-host exemption?
- Should `KI-ARCADIA-OPS-002` be closed as obsolete or folded into OPS-008?
- Which repository owns reducing the laptop's standing load: chezmoi, `tools-rig` or both?
- Should `tools-ki` add a terminal Granola disposition for meetings dropped without harvest? The ledger has none, so the dropped 2026-10-05 Alec catch-up is recorded as `harvested-locally`. No record exists yet.

## Next step

Proposed sequence; Kris has not yet approved it. It treats the factorisation remainder under `estate-factorisation` as not gating the cloud move.

1. **Clear the review stack.** Done 2026-10-07: every awaiting-review record is accepted and pruned.
2. **Relieve the laptop.** Capture a standing-load record in its owning repository, then pause non-essential Rig agents and trim the MCP inventory.
3. **Finish the baseline.** Work through FND-026, GOV-109, GOV-095, GOV-115 and RTP-015 in the harness, and OPS-008, EXT-003 and ECO-009 in Arcadia. Gate: `ki repo audit --estate` is green and the released `ki` is installed everywhere.
4. **Capture the cloud initiative.** Use `ki-next` to capture an Arcadia "Techné cloud readiness" record. It promotes the prior-art note as prerequisite 2, owns the reconstructability inventory and the Paperclip workload design (container, Postgres persistent volume, backup, host sizing), and hands prerequisite 3 to the harness as a reciprocal blocking item. FAB-001 is already delivered.
5. **Decide the hold.** Once `paperclip-bootstrap-and-recovery` lands one VA result, bring the three prerequisites to Kris to authorise, reshape or retire the hold.
