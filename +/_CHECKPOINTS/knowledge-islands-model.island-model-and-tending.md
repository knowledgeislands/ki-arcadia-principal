---
type: ki-checkpoint
thread: knowledge-islands-model.island-model-and-tending
label: 'KI Model: island-model-and-tending'
state: active
created_at: 2026-10-08T08:35:00Z
updated_at: 2026-10-11T02:40:00Z
---

# knowledge-islands-model.island-model-and-tending

## Objective

Arcadia's current island-model and tending records each delivered, handed to an owner or closed, leaving model and tending practice with no speculative backlog ([island-model-and-tending](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/island-model-and-tending.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md)). Since 2026-10-09 the Project also takes Arcadia's tidy-up: Decision Record references, runtime-specific notes, and Admin conventions.

## Current state

- **Mark:** struck 2026-10-11 02:37 BST, replacing the mark of 2026-10-09 22:41 BST (one mark per thread). A summary "since the mark" covers what changed after it plus everything still outstanding: Needs-Kris items in `Open questions` that remain relevant, open records, running or queued agents, and parked tangents.
- Active since re-bootstrap at 22:30 BST on 2026-10-09; `ki-delegation` read at harness revision b03a5d55. Run `island-model-and-tending` (decisions log `~/.local/state/ki/agents/island-model-and-tending/decisions.md`, Decisions 1-22; reports beside it) has no agents running.
- Delivered 2026-10-09 to 2026-10-10: GitHub Apps note and KI-ARCADIA-GOV-030 pruned; first `ki-repo` REVIEW; repository tidy (description, CI pin layout, committed `.githooks` gate); Decision Record consolidation; KI-ARCADIA-MOD-007 delivered, accepted and handed two follow-ups to the harness; index-note overviews and the four Realisation notes written.
- Delivered 2026-10-11 (Decisions 18-22):
  - `agora-tidy`: retired Agora wording replaced by territory selection across 13 repositories, including GDR-KI-HARNESS-006 rewritten in place as "Territory-derived working sets".
  - `links`: 33 dangling wikilinks resolved by purpose and about 45 unlinked record and Decision Record IDs linked; [KI-ARCADIA-MOD-007](https://github.com/knowledgeislands/ki-arcadia-principal/blob/e3ca805f6a2b8775189f3c0fe5b78dc51efe7147/Streams/Roadmap/KI-ARCADIA-MOD-007-retire-runtime-specific-realisation-notes.md) pruned.
  - `great-library`: [Great Library of Arcadia](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Pillars/Philosophy/Realisation/Arcadia/Great%20Library%20of%20Arcadia/Great%20Library%20of%20Arcadia.md) written as a full concept, with five open questions in the note.
  - `chatgpt-trim`: of the seven 2026-10-03 ChatGPT notes, three deleted as held elsewhere and four trimmed to their open items; open Realm and lineage items pointed from the Project note, Techne items from the agent-host Project.
- The Project has no open roadmap records (STREAM-10 warns).
- Arcadia primary checkout diverged from origin (another session's unpushed commits); left to its owner, not pulled.

## Decisions made

- Relayed from master on 2026-10-09 (this run's Decisions 1-3): first full Arcadia review against the `ki-repo` REVIEW checklist here, no new roadmap records; GitHub Apps note edit and KI-ARCADIA-GOV-030 closed and pruned; thread labelled `KI Model: island-model-and-tending`.
- The master thread `_state-of-play` owns cross-project priorities, releases and decisions; this thread works only its Project's records (Decisions 17 and 18 in `~/.local/state/ki/agents/state-of-play/decisions.md`).
- New or reworked content in `Admin`, `Pillars` and `Resources` goes through the Enactment Process; an explicit owner instruction for a bounded change stands in for a record (KI-ARCADIA-GOV-024).
- No runtime-specific notes in the island (KI-ARCADIA-MOD-007, Decision 9).
- Keep `bunx` in lint-staged and add no check script; `ki repo audit` is the verification gate (Decisions 14-15).
- References to old roadmap records and Decision Records are repaired by purpose, never by bare removal (Decision 19).
- Acquired ChatGPT items are trimmed once dealt with, so what remains in the acquire stays visible (Decision 22).
- Project close-out waits until the acquired ChatGPT items are checked against it (master Decision 7); now done, leaving the open items below.

## Files touched

Arcadia changes are made by run agents and pushed; see each report under `~/.local/state/ki/agents/island-model-and-tending/`. Remaining ChatGPT items: four trimmed notes in `/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_ACQUIRE/chatgpt/knowledge-islands/`.

## Open questions

Needs Kris, raised 2026-10-11:

- **GL-SCOPE:** what the Great Library covers - Calendar, Pillars and Resources (Structure, The Home of Knowledge), Pillars and Resources (SDR-KI-ARCADIA-002) or Pillars only (SDR-KI-ARCADIA-007) - plus the note's four smaller open questions.
- **GL-FIXES:** one-line fixes to the stale Great Library sentences in Knowledge Islands and the Arcadia note (recommended).
- **STUBS:** nine placeholder or thin notes with recommendations (EMAIL-STUBS, LINEAR-STUB, PILLARS-CONV, SKILLS-IDX, LIVE-ARTS-IDX, AUTHORING-LOCAL, STRUCT-TODO, TECHNE-V01, BRIEF-TEND) in `great-library.report.md`; EMAIL-LINEAR (framework definitions deleted 2026-06-25 with no successor) decided with EMAIL-STUBS.
- **ACQ-HOMES:** home for two unowned design principles (not lowest common denominator, FOSS-first) and the Knowledge Realms domain check.
- **REALM-CLOSEOUT:** whether the open Realm and lineage items become records or stay as acquire notes when the Project closes.
- **XREPO-CITES:** reword Release Cascade, GitHub Apps and the territory-selection brief around durable Decision Records and guides, since `AGENTS.md` now forbids citing another repository's roadmap records (recommended, one small run).
- **AGORA-FOLLOW-UPS** from `agora-tidy.report.md`: apps-observatory still implements Agoras (engineering record needed); stale chezmoi `_ki` and `_mgit` completions; stale ki-website vendored CLI and skill data (needs a network sync); kit-principal ChatGPT instructions source versus the live field; obsolete triage record HNR-HARNESS-004 to cancel; VA-PRINCIPAL-GOV-003 still names its Agora binding; GDR-KI-HARNESS-006 rewritten in place rather than archived.
- Passed to master: **CI-RELEASE** (CI needs a harness and ki release carrying the checkpoint `label` field, then a pin bump) and **CHEZMOI-HEADING**.
- Parked 2026-10-09: review tags - do we still need them?
- Parked 2026-10-09: Admin conventions and knowledge-base structure tidy-up.

## Next step

1. Bring Kris the 2026-10-11 Needs items and act on Kris's answers through run agents.
2. Route AGORA-FOLLOW-UPS that belong to other owners once Kris decides.
3. Close the Project once REALM-CLOSEOUT is settled.
