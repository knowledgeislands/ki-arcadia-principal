---
type: ki-checkpoint
thread: knowledge-islands-model.island-model-and-tending
label: 'KI Model: island-model-and-tending'
state: active
created_at: 2026-10-08T08:35:00Z
updated_at: 2026-10-12T10:00:00Z
---

# knowledge-islands-model.island-model-and-tending

## Objective

Knowledge Islands Principal's (Arcadia's) current island-model and tending records each delivered, handed to an owner or closed, leaving model and tending practice with no speculative backlog ([island-model-and-tending](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/island-model-and-tending.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md)). Since 2026-10-09 the Project also takes Arcadia's tidy-up: Decision Record references, runtime-specific notes, and Admin conventions.

## Current state

- Mark: 2026-10-11T03:15:00Z, decisions log at Decision 29
- `ki-delegation` read at f2b14dca (re-bootstrapped 2026-10-12 after the territory rename). Run `island-model-and-tending` keeps its decisions log at `~/.local/state/ki/agents/island-model-and-tending/decisions.md` (Decisions 1-35) with each background agent's report beside it.
- Everything before the mark is delivered and pushed: the first `ki-repo` REVIEW, repository tidy, Decision Record consolidation, KI-PRINCIPAL-MOD-007 delivered, accepted and pruned, index-note overviews, Agora retired across the estate, dangling references repaired by purpose, the Great Library note written, and the ChatGPT acquire reconciled.
- After the mark (Decisions 25-29), all delivered and pushed:
  - Great Library of Arcadia reframed as the library of all libraries; the acquire's open concepts moved into `Pillars/Philosophy/Emerging Concepts/` (Realm Model, Fictional Lineage, Avatar Roles and Oversight); the two design principles added to Engineering Practice as candidates; the ChatGPT acquire emptied.
  - Placeholder notes settled; seven citations of other repositories' roadmap records reworded around Decision Records and guides; the philosophy review captured as [KI-PRINCIPAL-MOD-008](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-008-whole-philosophy-coherence-review.md) (now on hold, Decision 35).
  - Agora follow-ups: apps-observatory record KI-OBS-APP-041 captured; chezmoi `_ki` regenerated and `--agora` dropped from `_mgit`; ki-website CLI and skill data re-synced; personal-principal (then kit-principal) ChatGPT source reworded.
- After the mark (Decisions 30-34), also delivered and pushed: Arcadia's Pillars restored as the Great Library across the note, SDR-KI-PRINCIPAL-007, Realisation, Structure (one additive sentence: an island may name its library after buildings, artefacts or landscape) and KI-PRINCIPAL-MOD-008; personal-principal (then kit-principal) `territory_members` sorted and ChatGPT folders renamed to kebab-case territory keys; chezmoi `_mgit` fully regenerated and both completions applied.
- Territory rename landed (state-of-play Decisions 49-50): repositories now sit under `~/workspaces/<territory>/`, Arcadia is `ki-principal` with prefix KI-PRINCIPAL, kit-principal is `personal-principal`, and acquire captures already use kebab-case territory keys. This thread waits for the master's list of remaining old-name references before fixing any.
- Decision 35: the live ChatGPT instructions were re-saved and read back, and activation recorded in personal-principal; the Structure library-naming sentence is kept; KI-PRINCIPAL-MOD-008 is parked on hold until most of Arcadia's roadmap is cleared, reviewed 2026-10-16 and then weekly.
- The ki-principal primary checkout holds three unpushed commits from other sessions; this thread commits through its own worktree.

## Decisions made

- The master thread `_state-of-play` owns cross-project priorities, releases and decisions; this thread works only its Project's records (Decisions 17 and 18 in `~/.local/state/ki/agents/state-of-play/decisions.md`).
- New or reworked content in `Admin`, `Pillars` and `Resources` goes through the Enactment Process; an explicit owner instruction for a bounded change stands in for a record (KI-PRINCIPAL-GOV-024).
- No runtime-specific notes in the island (Decision 9).
- Keep `bunx` in lint-staged and add no check script; `ki repo audit` is the verification gate (Decisions 14-15).
- References to old roadmap records and Decision Records are repaired by purpose, never by bare removal; never cite another repository's roadmap record (Decisions 19 and 29).
- Acquired items are moved into the knowledge base proper once dealt with, so the acquire shows only what is left (Decisions 22 and 26).
- Philosophy guard: the established Knowledge Islands philosophy, which the website was built from, is largely sound. Additive changes are welcome; anything that goes against it is flagged to Kris and double-checked first (Decision 23).
- The whole-philosophy coherence review waits until most of the roadmap is cleared: on hold, reviewed 2026-10-16 and then weekly (Decisions 24 and 35).
- The Great Library of Arcadia is a philosophical idea - the library of all libraries, a play on the Great Library of Alexandria - and changes no knowledge-base structure (Decision 25).
- GDR-KI-HARNESS-006 stays rewritten in place as "Territory-derived working sets" (Decision 28).

## Files touched

Arcadia and other repositories are changed only by run agents in their own worktrees; see each report under `~/.local/state/ki/agents/island-model-and-tending/`.

## Open questions

Needs Kris (carried across marks):

- **KIT-NAME:** the live ChatGPT response and its source still say "Use Kit Principal's declared source store"; recommend rewording to Personal Principal's and re-saving that one line.
- **PHILO-REVIEW:** KI-PRINCIPAL-MOD-008 on hold, reviewed 2026-10-16 then weekly until most of the roadmap is cleared; its scope collects the Emerging Concepts, candidate principles, Library wording, Structure's Harbour and Routes and Customs to-dos, and Avatar names per Realm against ADR-KI-PRINCIPAL-005, and whether Calendar sits inside the Library.
- Parked 2026-10-09: review tags - do we still need them?
- Parked 2026-10-09: Admin conventions and knowledge-base structure tidy-up.

## Next step

1. Act on Kris's answers to the Needs items above.
2. Fix this Project's old-name references from the master's list when it arrives.
3. On 2026-10-16, review KI-PRINCIPAL-MOD-008's hold.
4. With KI-PRINCIPAL-MOD-008 on hold, write the Project's close-out position once the Needs items clear.
