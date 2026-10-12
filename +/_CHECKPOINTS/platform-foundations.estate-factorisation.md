---
type: ki-checkpoint
thread: platform-foundations.estate-factorisation
label: 'Fnd: estate-factorisation'
state: active
created_at: 2026-10-08T08:35:00Z
updated_at: 2026-10-12T06:24:50Z
---

# platform-foundations.estate-factorisation

## Objective

Close out the registry-resolved `mcp-*`, `tools-*`, `apps-*` and homebrew-tap roadmaps in Knowledge Islands under [estate-factorisation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/estate-factorisation.md), Initiative [platform-foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md). Present every triage item for a reasoned adoption/disposition decision, finish authorised work and preserve held-owner boundaries. Kris approves every acceptance, cancellation and release; no new records unless unavoidable.

## Current state

- Re-bootstrapped from the master's 2026-10-12 07:10 BST handover. Capital: knowledgeislands/ki-principal; physical roots now live under `/Users/krisbrown/workspaces/<territory>/<repository>`, resolved with `ki registry list`. apps-observatory.local and apps-knowledgeislands.info replace the old app/website names. Current record IDs use the overnight re-keyed codes.
- Fresh physical census: sixteen scoped repositories, seven open records - tools-ki four, tools-rig one and tools-techne two. All Knowledge Islands MCPs/apps, homebrew-tap, tools-mgit and tools-git-almanac have zero open records. Valle Armonia's eighteen app records belong to its master and are outside this scope.
- Four triage records require an explicit disposition/adoption review: [KI-TOOL-KI-CLI-115](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-115-enforce-roadmap-writing-checkout.md), [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md), [KI-TOOL-TECHNE-CLI-006](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-006-guarded-host-commands.md) and [KI-TOOL-TECHNE-CLI-008](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-008-host-patching-fields.md). The last three belong to threads held under master Decision 83; formal hold metadata is still missing. Do not interpret a request to prepare adoption decisions as release of those holds.
- [KI-TOOL-KI-CLI-116](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-116-launcher-held-wait-gates.md) is Awaiting review after master delivery; HOST-GATES is resolved as an implementation gap, with acceptance still pending. The master's `cli-118` agent delivers [KI-TOOL-KI-CLI-118](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-118-capital-stores-and-territory-aliases.md) and [KI-TOOL-KI-CLI-121](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-121-config-writer-and-relaunch.md); its current source work must finish before this thread writes tools-ki. Take over independent review from its report/committed packets, never start parallel tools-ki delivery.
- Earlier Rig removal, self-update, sudo and default-handler work is accepted and now pruned. Current tools-rig contains only its held Dock triage record: RIG-PRUNE is resolved. Observatory territory selection is accepted and its Done record has also been pruned. The personal-ranking Done record in tools-ki is already pruned. Fresh Git deletion evidence supersedes the master's older census prune targets; do not prune absent records twice.
- Prior KI-PLAN and OBS-EVIDENCE approval requests are superseded by the master's intervening delivery/closure. Master Decision 114 chose Capital-store/alias delivery; the master holds CLI118-PREFIX, CLI118-HISTSCAN and CLI118-OWNERS. New batch approval is still required for the remaining lifecycle transitions.
- Run: `tools-burndown`; decisions log under `/Users/krisbrown/.local/state/ki/agents/tools-burndown/`. Old agents have finished. Preparation lanes are next: all-triage decision briefs and gated close-out/KNIP review. Master retains cli-118, domains, cf-builds and kb-ids; only cli-118 and kb-ids were active at bootstrap.
- ki-delegation read at f2b14dca. No mark has been struck in this thread; do not move another thread's mark. State: working on close-out preparation, waiting on the master's delivery before tools-ki mutation.

## Decisions made

- tools-burndown Decision 9 consolidates the new handover: prepare batch A for Kris's approval, clear the pre-existing KNIP-2 estate-barrel export failure after the producer finishes, reconcile real prune blockers, ask KI-RELEASE once tools-ki/tools-mgit have zero open records, and write the Project close-out once only held work remains. This supersedes the old proposed release of protected delivery.
- tools-burndown Decision 10 asks for consolidation and every triage item to be raised with enough evidence for Kris to decide adoption. Prepare recommendations and material choices, not automatic adoption or delivery.
- Proposed batch A: accept [KI-TOOL-KI-CLI-116](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-116-launcher-held-wait-gates.md), [KI-TOOL-KI-CLI-121](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-121-config-writer-and-relaunch.md) and [KI-TOOL-KI-CLI-118](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-118-capital-stores-and-territory-aliases.md) after complete independent review; propose cancelling [KI-TOOL-KI-CLI-115](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-115-enforce-roadmap-writing-checkout.md) while preserving its design/questions in [Techne: agent-host](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/techne.agent-host.md); prune only newly eligible selected terminal records; formalise [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md), [KI-TOOL-TECHNE-CLI-006](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-006-guarded-host-commands.md) and [KI-TOOL-TECHNE-CLI-008](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-008-host-patching-fields.md) as held. The two older Done targets have already been pruned.
- The Techne Programme Hold continues. No remote agent or remote-environment operations, and no use of its exemptions. Held-thread work stays with its owners unless Kris explicitly releases it.
- Until the local-mode relaunch fix is proven, launch detached agents with `/Users/krisbrown/.local/state/ki/agents/state-of-play/backups/local-chezmoi/ki.bin`. After any ki command rewrites `/Users/krisbrown/.config/ki/config.toml`, run `chezmoi apply --force` for that exact target. The run's `coordination/run-ki.py` guards this restoration without exposing configuration contents.
- Keep primary checkouts current and use explicit-path verified commits, normal hooks and own-commit fast-forward pushes only. Never force-push, bypass hooks or publish releases without Kris's specific grant. Tell the master through this checkpoint.

## Files touched

- [This checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/platform-foundations.estate-factorisation.md) - current estate, ownership, completed/pruned work and pending triage/close-out decisions refreshed after the overnight reshape.
- Run-local guarded launcher and fresh census evidence under `/Users/krisbrown/.local/state/ki/agents/tools-burndown/coordination/`; these are runtime working material, not durable policy.
- No product source, held record, foreign-territory record or owner checkpoint has been changed by this re-bootstrap.

## Open questions

- `BATCH-A`: after the master's delivery report, present the exact acceptance/cancellation/prune batch with passing evidence. The cancellation resolution must be valid for the current work schema; a Project checkpoint is preserved context, not a fabricated work-record resolution target.
- `HOST-WRITES`: [KI-TOOL-KI-CLI-115](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-115-enforce-roadmap-writing-checkout.md) - recommend assessing the master's proposal to remove premature CLI backlog into its held owner checkpoint; show the alternative of adoption/local planning and the writing-designation choices before Kris decides.
- `RIG-DOCK`: [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md) - present the captured tool/profile filtering design, dependency/reporting choices and whether Kris keeps the owner's hold or releases local planning. Personal layout and machine operations remain separate.
- `HOST-GUARDS`: [KI-TOOL-TECHNE-CLI-006](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-006-guarded-host-commands.md) - present safe host-command parity, actual harness contract/pilot readiness and the hold/resume condition. Local stubbed work never authorises a host stop/rebuild/withdrawal.
- `HOST-PATCHING`: [KI-TOOL-TECHNE-CLI-008](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-008-host-patching-fields.md) - present the settled optional binding fields/status rendering and whether local planning can be released independently; remote patching/reboot operations remain forbidden.
- `KNIP-CLEAN`: clear only the evidenced pre-existing unused exports in tools-ki's `src/core/estate/index.ts` after cli-118 ends DONE and leaves a safely reconcilable checkout. Verify the focused fix without weakening checks or capturing another record.
- `KI-RELEASE`: master Decision 115 requires Kris's ki/mgit release grant once their roadmaps are zero. Releases remain master-owned and on demand.
- `PROJECT-CLOSE`: write the estate-factorisation standing close-out once only properly held records remain; reconcile any earlier phase ideas through the master rather than inventing delivery.

## Next step

Launch bounded background preparation in `tools-burndown`, using the backup launcher and config restoration. Raise all four triage records for Kris's determinations, reconcile prior work with current Git/roadmap evidence, wait for the master's immutable delivery packets, clear KNIP-2 only after the writer gate, and return one consolidated close-out/adoption batch. Make no acceptance, cancellation, hold transition or release merely because a proposed census disposition exists.
