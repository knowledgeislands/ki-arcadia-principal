---
type: ki-checkpoint
thread: platform-foundations.estate-factorisation
label: 'Fnd: estate-factorisation'
state: active
created_at: 2026-10-08T08:35:00Z
updated_at: 2026-10-12T06:55:02Z
---

# platform-foundations.estate-factorisation

## Objective

Close out the registry-resolved `mcp-*`, `tools-*`, `apps-*` and homebrew-tap roadmaps in Knowledge Islands under [estate-factorisation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/estate-factorisation.md), Initiative [platform-foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md). Raise every triage item for an informed adoption decision, deliver authorised work and preserve owner holds. Kris approves every acceptance, cancellation and release. Capture no new records unless unavoidable.

## Current state

- Consolidated the master's 2026-10-12 07:10 BST handover with current Git and registry evidence. Capital: knowledgeislands/ki-principal; roots now resolve under `/Users/krisbrown/workspaces/<territory>/<repository>`. Apps are apps-observatory.local and apps-knowledgeislands.info; record IDs use current re-keyed codes.
- Sixteen scoped repositories contain seven open records: tools-ki four, tools-rig one, tools-techne two. All Knowledge Islands MCPs/apps, homebrew-tap, tools-mgit and tools-git-almanac have zero open records. Twelve governance/Harness records in this territory and eighteen Valle Armonia app records remain outside this thread's scope.
- Three KI deliveries are Awaiting review. Independent review recommends acceptance of [KI-TOOL-KI-CLI-116](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-116-launcher-held-wait-gates.md) (launcher wait gates) and [KI-TOOL-KI-CLI-121](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-121-config-writer-and-relaunch.md) (config preservation/local relaunch). [KI-TOOL-KI-CLI-118](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-118-capital-stores-and-territory-aliases.md) (Capital store naming/territory aliases) is implemented and verified, but acceptance awaits master's retained policy dispositions and ownership reconciliation.
- Four triage records remain: writing-checkout enforcement, Dock filtering, guarded host commands and patching-field/status parity. Master Decision 83 holds the Dock/Techne owner work. Preparing adoption choices does not release those holds.
- Earlier Rig removal, self-update, sudo and default-handler records are accepted and pruned; Observatory territory selection and KI personal ranking are also already pruned. RIG-PRUNE has no remaining deletion target. Only stale owner-owned references remain, detailed under RIG-REFS. Do not prune absent records twice.
- The pre-existing KNIP-2 failure is fixed by removing unused internal re-exports from tools-ki's estate barrel. Focused checks, build and audits passed; verified explicit-path normal-hook commit was pushed fast-forward. Existing unrelated warnings remain visible in the review evidence.
- Run `tools-burndown`: both detached preparation agents, `triage-brief` and `closeout-prep`, are DONE; their reports retain the decision briefs and immutable review evidence. Master's cli-118 and kb-ids are also DONE. Nothing running in this run; no new work records or lifecycle transitions made during preparation.
- ki-delegation revision f2b14dca. No mark has been struck. State: waiting on Kris's adoption/acceptance choices and master's retained alias-policy decisions.

## Decisions made

- Run Decision 9 records the post-reshape close-out handover. Decision 10 records Kris's request for consolidation and every triage item's adoption choices. These authorise preparation and the focused KNIP fix, not closure, cancellation, hold release or publication.
- Fresh evidence corrects two obsolete blockers: the host marker path is already settled as `~/.config/ki/host-marker`, and the reviewed Harness safety pilot/status contract already exists. Writing-designation and CLI integration choices remain real work.
- Recommend preserving the valid writing-safety obligation. Adopting it on Hold keeps tools-ki non-zero; cancelling it solely to obtain zero obscures that trade-off. If Kris chooses the master's cancellation proposal, use `resolution: rejected`, no checkpoint resolution target, and require an owner-approved carry of the complete obligation before pruning. The requirement is not obsolete.
- Formal Hold requires human-approved adoption to `kind: deliver`, `status: draft`, then `horizon: hold` and an observable explicit-owner-release condition. Triage cannot simply gain a horizon. A useful alternative is to release only the small patching-fields record for local planning while holding the other owner work; plan approval precedes delivery.
- Master Decision 114 supersedes KI-PLAN. CLI118-PREFIX, CLI118-HISTSCAN and CLI118-OWNERS remain with master: registered-key fallback, dual-convention read-only scan, and Harness/Principal alias governance. Do not declare the real Capital alias until those owners align.
- The Techne Programme Hold remains: no remote agents or remote-environment operations. Local planning does not authorise host operations. Owner checkpoints remain untouched.
- Local-mode launch is repaired but retains documented review limitations. The run's `coordination/run-ki.py` guards exact config restoration after ki rewrites; backup launcher remains available. Keep primary checkouts current, stage explicit paths, use normal hooks and own-commit fast-forward pushes. No force-push, hook bypass or release without Kris's specific grant. Inform master through this checkpoint.

## Files touched

- This checkpoint: refreshed estate, ownership, delivery review, triage recommendations and actual remaining Needs.
- tools-ki `src/core/estate/index.ts`: focused unused-export fix, verified and published by the detached close-out worker.
- Run-local reports/evidence in `/Users/krisbrown/.local/state/ki/agents/tools-burndown/`, including `triage-brief.report.md`, `closeout-prep.report.md` and `coordination/rig-reference-residual.json`. No held record, owner checkpoint, foreign-territory record or Project state changed.

## Open questions

- `BATCH-A`: approve acceptance of [KI-TOOL-KI-CLI-116](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-116-launcher-held-wait-gates.md) and [KI-TOOL-KI-CLI-121](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-121-config-writer-and-relaunch.md). Defer [KI-TOOL-KI-CLI-118](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-118-capital-stores-and-territory-aliases.md) until master's policy/owner reconciliation. Any future prune is a separate eligible deletion-only commit after committed closure and owner reference repairs; older Done targets are already absent.
- `HOST-WRITES`: [KI-TOOL-KI-CLI-115](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-115-enforce-roadmap-writing-checkout.md) - adopt the valid requirement on Hold, explicitly release local planning, or reject the standalone CLI intake with complete owner carry. Real choices: writing designation, shared preflight and every native/manual write route. Recommend preservation over cancellation merely to reduce the count.
- `RIG-DOCK`: [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md) - adopt on Hold, or release local planning with mac-studio-bootstrap. Recommend tool-linked filtering; settle dependency behaviour and omitted-item reporting. Selected missing apps must remain visible errors.
- `HOST-GUARDS`: [KI-TOOL-TECHNE-CLI-006](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-006-guarded-host-commands.md) - adopt on Hold, or release local planning with agent-host. Existing pilot removes the old prerequisite; structured status/exit handling, guarded stop/rebuild/withdraw and teardown transition remain. Recommend Hold pending owner release.
- `HOST-PATCHING`: [KI-TOOL-TECHNE-CLI-008](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-008-host-patching-fields.md) - settled recipe fields make this the smallest local planning candidate: validate `reboot_window`/`livepatch`, pass fields through and render optional update status. Recommend explicit planning release if Kris wants the next deliverable. Sequence its shared status-file writer with guarded-command work; no remote operations.
- `RIG-REFS`: deletion work is complete; master should route stale references/prose to [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.mac-studio-bootstrap.md), [chezmoi](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.chezmoi.md) and the chezmoi software-alignment owner. Also repair master's pre-rekey KI wait-gate link and agent-host's obsolete launcher claims before new pruning. This thread repairs its own candidate links when approved closure permits it.
- `KI-RELEASE`: ask Kris for ki/mgit release under master Decision 115 only once both have zero open records. Keeping writing-checkout enforcement on Hold delays that trigger; no release has been authorised.
- `PROJECT-CLOSE`: prepare the bounded burndown close-out once only proper holds remain. Wider Project phases are still declared incomplete: master/Kris must reconcile that boundary rather than mark unperformed phases delivered.

## Next step

Present the consolidated seven-item state and four triage decision briefs. Apply only the exact dispositions Kris approves, carry cancellation context through its owner, commit closure before any eligible prune, and retain unresolved policy/reference conditions. Return local planning through its owner if released; no parallel tools-ki producer remains, but no new feature implementation is yet authorised.
