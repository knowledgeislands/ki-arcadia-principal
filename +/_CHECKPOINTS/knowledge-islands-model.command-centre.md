---
type: ki-checkpoint
thread: knowledge-islands-model.command-centre
label: 'Knowledge Islands Model: command-centre'
state: active
created_at: 2026-10-11T02:41:28Z
updated_at: 2026-10-11T02:41:28Z
---

# knowledge-islands-model.command-centre

## Objective

One shared vocabulary and model for Kris's command centre, adopted across the harness, Observatory, kit-hnr and kit-legal, with one read-only state-of-play view ([command-centre](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/command-centre.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md)).

## Current state

- New Project, created 2026-10-11 with `lifecycle: planned` (state-of-play Decision 42). Queued behind the active-thread cap; the master thread prepared this checkpoint. No thread has opened it yet.
- The survey and crosswalk live in `~/.local/state/ki/agents/state-of-play/command-centre.report.md`: 21 concepts across 12 repositories, five word clashes (Council, Project, State of play, Control plane, Checkpoint) and four same-thing clusters.
- The parked "state-of-play view" item moved here from the ways-of-working checkpoint and is an idea in the Project note.
- A non-blocking handoff to kit-hnr raises the "HNR Council" clash with Arcadia's Council (CC-HNR, state-of-play run `cc-batch`).
- No roadmap records; none are proposed until the pilot view is chosen.

## Decisions made

- The name is "Command centre"; "Council" stays Arcadia's constitutional governance body (CC-NAME, state-of-play Decision 42 in `~/.local/state/ki/agents/state-of-play/decisions.md`).
- Thread rules and marks stay with the ways-of-working Project; this Project owns the vocabulary and the view.
- The master thread `_state-of-play` owns cross-project priorities, releases and decisions; this thread works only its Project's records (state-of-play Decisions 17 and 18).

## Files touched

None yet in this thread. The master thread's `cc-batch` run wrote the Project note and its index entries.

## Open questions

- **CC-VOCAB:** settle the glossary (Command centre, Convenor, Council, Beacon or attention, Bridge or command, projection) and one attention taxonomy, as one bounded decision for Kris, recorded in an Arcadia Decision Record if accepted.
- Handoffs still to offer: kit-legal moving `+/_RESUME/` onto `ki-checkpoint`, and kit-principal's Project Portfolio pointing at the Arcadia registry rather than restating it.

## Next step

Run `ki-design-loop` with the command-centre report as the brief to settle CC-VOCAB, then write the crosswalk into `Streams/Projects/command-centre/design/` and pilot the read-only view in the cheapest place, likely an Observatory Instrument.
