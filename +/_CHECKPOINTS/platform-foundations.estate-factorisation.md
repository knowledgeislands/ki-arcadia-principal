---
type: ki-checkpoint
thread: platform-foundations.estate-factorisation
label: 'Platform Foundations: tools-burndown'
state: active
created_at: 2026-10-08T08:35:00Z
updated_at: 2026-10-11T09:19:55Z
---

# platform-foundations.estate-factorisation

## Objective

Bottom out every open roadmap record in the registry-resolved `mcp-*`, `tools-*` and `apps-*` repositories under the Knowledge Islands workspace, within [estate-factorisation](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/estate-factorisation.md), Initiative [platform-foundations](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Initiatives/platform-foundations.md). Finish deliverable work, present evidenced acceptance candidates, or propose cancellation, merger or an idea. Close nothing without Kris's approval and capture no new records unless unavoidable.

## Current state

- Kris reopened this coordinating thread as `Platform Foundations: tools-burndown`, reusing this checkpoint and its Project identity. Background run: `tools-burndown`; decisions log: `/Users/krisbrown/.local/state/ki/agents/tools-burndown/decisions.md`.
- Verified starting/current count: 10 open records - tools-ki 2, tools-rig 5, tools-techne 2, apps-observatory 1. The eight MCP repositories, tools-git-almanac and tools-mgit have none. All fourteen registry-resolved scoped repositories were reviewed; all ten records started in triage. No record was initially eligible for immediate acceptance; Observatory now has delivery evidence and one bounded correction underway. No cancellation, merger or idea demotion is recommended. No record has closed or been captured.
- Three detached background agents are running under `tools-burndown`: `obs-correct` fixes an independently reproduced picker path-disclosure gap in the existing Observatory record; `rig-deliver` plans and delivers four handed-on generic engine records serially; `delivery-review` independently assesses committed candidates against captured requirements. `obs-deliver` finished and published Observatory through Awaiting review; acceptance is deferred pending its bounded correction. `host-prep` completed read-only plans for the four Techne: agent-host records; its [local handoff report](/Users/krisbrown/.local/state/ki/agents/tools-burndown/host-prep.report.md) is ready for that owner and the master. The initial inventory and plan agents have finished. A detached run monitor and next-completion waiter are maintained under the run's `coordination/` area.
- Current count remains 10. Five records are assigned for delivery: [KI-OBS-APP-041](/Users/krisbrown/workspaces/kit/knowledgeislands/apps-observatory/docs/roadmap/KI-OBS-APP-041-adopt-territory-selection.md), [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md), [RIG-CORE-043](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-043-self-updating-applications.md), [RIG-CORE-044](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-044-single-sudo-prompt.md) and [RIG-CORE-045](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-045-default-applications.md). Four host-owned records have a preparation lane; protected Dock/profile work remains with its active thread. No record has closed and no new record has been captured.
- ki-delegation read at c15053c4.
- No mark has yet been struck for the burndown run; use the ki-delegation first-recap rule unless Kris strikes one earlier.
- The previous factorisation close-out remains in the Project note: groundwork delivered, no phase gate met, FND-3 to EVAL-2 remain ideas, Project lifecycle active. This run does not approve those phases.

## Decisions made

- Decision 1 in `tools-burndown`: review every open scoped record and return one tagged batch of recommended dispositions. No acceptance, cancellation, merger closure or pruning without Kris's approval. Avoid new records.
- Decision 2: Kris has approved adoption and planning of [KI-OBS-APP-041](/Users/krisbrown/workspaces/kit/knowledgeislands/apps-observatory/docs/roadmap/KI-OBS-APP-041-adopt-territory-selection.md) in apps-observatory; delivery requires his approval of the plan. The change replaces retired Agora scope with territory selection.
- Decision 3: Kris approved proceeding from the captured requirements and prioritised getting existing work delivered over creating more changes. The saved Observatory plan, including its bounded picker adapter, is approved for implementation. Use existing records and report material unresolved choices; no new backlog or self-acceptance.
- Decision 4: Kris explicitly requires as much concurrent progress across tooling, apps and MCPs as possible through agents, while this coordinator remains available for steering. Three detached local lanes have started. The four generic Rig handoffs are engine work handed to the Rig Initiative; their source threads retain personal configuration. Original active-thread protection remains for the four host-owned records and Dock/profile work. MCPs have no open records and receive no invented work.
- Leave records owned by Rig: chezmoi, Techne: agent-host, Rig: mac-studio-bootstrap and KI Model: island-model-and-tending untouched. Read their checkpoints first and route ownership crossings through Kris; notify the state-of-play master thread.
- No remote agent execution or remote-environment operations. The Techne Programme Hold applies; this run uses no exemption.
- Local background agents use `ki agent` in run `tools-burndown`. Push only this run's verified explicit-path commits directly to main after tests and audit; never force-push or bypass hooks. Keep primary checkouts current.
- Use stable mnemonic Needs tags without numbers, absolute local links for records, and dated parked tangents under Open questions. Releases remain on demand.

## Files touched

- [This checkpoint](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/platform-foundations.estate-factorisation.md) - thread label, burndown scope and owner authority.
- [Master checkpoint](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/_state-of-play.md) - bootstrap, ownership crossings, territory discovery prerequisite and pre-existing Rig checkpoint audit finding notified.
- [KI-OBS-APP-041](/Users/krisbrown/workspaces/kit/knowledgeislands/apps-observatory/docs/roadmap/KI-OBS-APP-041-adopt-territory-selection.md) and the four linked generic Rig records - now assigned to background delivery lanes. Actual edits, verification and publication remain owned by their workers and canonical records.
- Background prompts, decisions and reports under `/Users/krisbrown/.local/state/ki/agents/tools-burndown/` are machine-local working material.

## Open questions

- `OBS-CORRECTION`: independent review reproduced embedded private paths accepted as picker labels/handles in [KI-OBS-APP-041](/Users/krisbrown/workspaces/kit/knowledgeislands/apps-observatory/docs/roadmap/KI-OBS-APP-041-adopt-territory-selection.md). `obs-correct` is addressing this captured requirement in the same record before an acceptance recommendation. No new record.
- `OBS-RESTART`: the live Observatory service has not been restarted; delivery agents are forbidden to operate it. Route the bounded activation separately after review.
- `PROTECTED`: awaiting Kris's answer on releasing the four host-owned records and Dock engine work for local delivery in this run. The original ownership protection stays in force until an explicit answer; elapsed time is not approval. Current delivery and independent review continue meanwhile.
- `HOST-WRITES`: retain and finish [KI-TOOL-CLI-115](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/docs/roadmap/KI-TOOL-CLI-115-enforce-roadmap-writing-checkout.md) through Techne: agent-host. The marker exists, but the CLI has no write guard; agree the designation contract with its owner before planning.
- `HOST-GATES`: retain and finish [KI-TOOL-CLI-116](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/docs/roadmap/KI-TOOL-CLI-116-launcher-held-wait-gates.md) through Techne: agent-host. Launcher-held dependency gates remain absent; keep manual sequencing until verified.
- `RIG-DOCK`: retain and finish [RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md). Route profile/Dock ownership through Kris; keep the generic filtering engine separate from personal layout changes.
- `HOST-GUARDS`: retain and finish [TECHNE-TOOL-CLI-006](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-techne/docs/roadmap/TECHNE-TOOL-CLI-006-guarded-host-commands.md) through Techne: agent-host. The CLI still lacks guarded harness parity; local stubbed delivery can be planned by its owner.
- `HOST-PATCHING`: retain and finish [TECHNE-TOOL-CLI-008](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-techne/docs/roadmap/TECHNE-TOOL-CLI-008-host-patching-fields.md) through Techne: agent-host. Binding fields and status rendering remain missing; share status parsing with guarded commands without merging their distinct scopes.
- Parked 2026-10-11: previous factorisation phase/Project close decision remains with state-of-play; this burndown does not capture FND-5 or decide the Project's eventual closure.

## Next step

Keep the three lanes progressing while staying available for steering. On each completion, inspect the report and actual delivery evidence, refresh clean primary checkouts, notify the master of ownership crossings and start any next eligible bounded work. Route the five protected records through Kris/their owners, never infer reassignment from inactivity, and bring verified Awaiting-review records back for explicit closure approval. Capture no new records.
