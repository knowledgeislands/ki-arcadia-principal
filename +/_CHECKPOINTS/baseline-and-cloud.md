---
type: ki-checkpoint
thread: baseline-and-cloud
state: active
created_at: 2026-10-06T20:50:00Z
updated_at: 2026-10-06T21:05:00Z
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

Observed read-only on 2026-10-06 at 22:45 CEST; recheck before acting.

- **Laptop.** Load is about 8, and 23.0 of 24.6 GB of swap is used. All Rig launchd services are loaded: Paperclip, observatory, mcporter daemon and bridge, headroom, good-morning, the testbed and WhatsApp refreshes, and the health and update agents. No record owns reducing that standing load.
- **Release.** `ki` v0.7.1 is tagged and installed locally, but the `homebrew-tap` formula still points at v0.7.0.
- **Queue.** The harness has 18 records ready, 3 in progress, 10 awaiting review and 9 in draft. Arcadia has 12 ready, 2 awaiting review and 5 in draft. The twelve records awaiting review are the main throughput constraint.

Baseline records:

| Record | Status | Why it matters |
| --- | --- | --- |
| `KI-HARNESS-FND-026` - complete conform activation | ready, now | Rollout depends on conform working everywhere |
| `KI-HARNESS-GOV-109` - enforce commit gates | ready, now | Consistent gates before rollout |
| `KI-HARNESS-GOV-095` - align roadmap diagnostics | done, now | Trustworthy roadmap audits across islands |
| `KI-HARNESS-GOV-092` - align generated normal forms | done, now | Stable generated output for rollout |
| `KI-HARNESS-RTP-013` - route portable skill doctrine | done, now | Doctrine out of private files, needed for unattended runs |
| `KI-HARNESS-GOV-115` - require a current worktree base | ready, now | Reports base drift in coordinated delivery |
| `KI-HARNESS-RTP-015` - verify run MCP connection | ready, now | Agent runs reaching the mcporter bridge |
| `KI-ARCADIA-GOV-012` - roadmap serial allocation under concurrency | done, now | Safe serial allocation while agents work concurrently |
| `KI-ARCADIA-GOV-019` - veto wording | done, now | Governance text matches the layout |
| [[KI-ARCADIA-OPS-008-scheduled-automations\|KI-ARCADIA-OPS-008]] - scheduled automations | ready, now | Tending prompts and scheduled work that survives a laptop move |
| [[KI-ARCADIA-EXT-003-ki-skill-extractions\|KI-ARCADIA-EXT-003]] - skill extractions | ready, now | Arcadia-only doctrine becomes portable skills |
| [[KI-ARCADIA-ECO-009-legacy-serve-fallback-policy\|KI-ARCADIA-ECO-009]] - legacy serve fallback evidence | ready, now | MCP launch evidence; also mapped in `estate-factorisation` |
| [[KI-ARCADIA-OPS-002-tooling-rollout\|KI-ARCADIA-OPS-002]] - tooling rollout | draft, next | Obsolete as written; waiting on Kris to close it or fold it into OPS-008 |
| chezmoi `DOTFILES-UE-067` - serve Observatory under launchd | awaiting-review, now | Standing laptop services |
| chezmoi `DOTFILES-UE-065` - diagnose same-boot mcporter stall | draft, now | Standing laptop services |

Cloud records and evidence:

| Item | Status | Notes |
| --- | --- | --- |
| `ki-techne-harness` `TECHNE-TOOLS-FAB-001` - agent-host execution profile | ready, now | Local build; permitted under the hold |
| `ki-techne-harness` `TECHNE-TOOLS-OPS-008` - supervised agent host | draft, triage | Waiting on Kris: separate host or the controller node |
| `tools-techne` | v0.2.0, no open records | AWS CLI only |
| Target footprint | Captured, not adopted | `+/_ACQUIRE/chatgpt/knowledge-islands/2026-10-03-techne-and-first-footprint.md` and siblings. One EC2 instance with K3s; Paperclip as a workload; Kitteth as operator; Tailscale, SSH and Zed remote; Telegram; work survives the Rig disconnecting; a reconstructability inventory |
| Hold prerequisite 1 - local review-to-live-main cycle and recovery | Not met | Next step items 1 and 2 of `paperclip-bootstrap-and-recovery` |
| Hold prerequisite 2 - what Paperclip supplies versus what Techné must add | Partial | `ki-techne-harness/+/paperclip-as-techne-prior-art.md` (working analysis, 2026-09-24), never promoted |
| Hold prerequisite 3 - repository-owned remote-delivery policy | Not met | Boundary owned by the harness `ki-agent-coordination-paperclip` skill; no record |

Today's Techné controller dispatches Telegram `/run` requests as busybox-only K3s Jobs with no egress on one t3.medium. Paperclip, Kitteth, Tailscale and SSH access, agent execution and the reconstructability inventory are all missing.

## Decisions made

- The Techne Programme Hold stands: local design, build and test may proceed, but no remote execution or remote-environment management. Moving Paperclip off the laptop is remote-environment management. Only Kris can authorise, reshape or retire the hold, once the three prerequisites are evidenced.

## Files touched

None beyond this record.

## Open questions

- Should the hold be reshaped so Paperclip can move to an owned host before all three prerequisites are met?
- `TECHNE-TOOLS-OPS-008`: a separate agent host, or the controller node?
- Should `KI-ARCADIA-OPS-002` be closed as obsolete or folded into OPS-008?
- Which repository owns reducing the laptop's standing load: chezmoi, `tools-rig` or both?
- Should the `homebrew-tap` formula be bumped to `ki` v0.7.1 now? This needs Kris's go-ahead.
- Should `tools-ki` add a terminal Granola disposition for meetings dropped without harvest? The ledger has none, so the dropped 2026-10-05 Alec catch-up is recorded as `harvested-locally`. No record exists yet.

## Next step

Proposed sequence; Kris has not yet approved it. It treats the factorisation remainder under `estate-factorisation` as not gating the cloud move.

1. **Clear the review stack.** With Kris, take the twelve awaiting-review records through `ki-accept`, starting with GOV-012, GOV-019, RTP-013 and GOV-092.
2. **Relieve the laptop.** Capture a standing-load record in its owning repository, then pause non-essential Rig agents and trim the MCP inventory.
3. **Finish the baseline.** Work through FND-026, GOV-109, GOV-095, GOV-115 and RTP-015 in the harness, and OPS-008, EXT-003 and ECO-009 in Arcadia. Gate: `ki repo audit --estate` is green and the released `ki` is installed everywhere.
4. **Capture the cloud initiative.** Use `ki-next` to capture an Arcadia "Techné cloud readiness" record. It promotes the prior-art note as prerequisite 2, owns the reconstructability inventory and the Paperclip workload design (container, Postgres persistent volume, backup, host sizing), and hands prerequisite 3 to the harness as a reciprocal blocking item. FAB-001 can proceed in parallel.
5. **Decide the hold.** Once `paperclip-bootstrap-and-recovery` lands one VA result, bring the three prerequisites to Kris to authorise, reshape or retire the hold.
