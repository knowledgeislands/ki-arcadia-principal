---
note_type: admin/governance/decision
id: GDR-KI-ARCADIA-005
title: 'The roadmap model'
date: 2026-10-07
status: current
decision_type_url: https://knowledgeislands.info/specifications/decision-records/gdr
decision_type: governance
decision_depends_on: ['SDR-KI-ARCADIA-004']
---

# GDR-KI-ARCADIA-005: The roadmap model

## Context

Work records across the territory grouped work by a free `theme`, overloaded the horizon with acceptance and waiting states, and kept each theme's status in a standing checkpoint. The roadmap standard also contradicted itself about where deferred work in progress may sit. On 2026-10-07 a design loop examined the model: a brief, three independent reviews, a merged report and a migration survey, after which Kris Brown recorded his decisions.

## Decision

Knowledge Islands records work under the roadmap model in the [merged report](references/roadmap-model-report.md), as amended by [Kris's decisions](references/roadmap-model-decisions.md). Where the two differ, the decisions win, and the latest decision wins among them.

- **Classification.** A work record states its `kind` (deliver, decide, investigate or audit), an optional `purpose`, the territory `project` or `initiative` it serves and the repository `component` it touches. `theme` is retired, and `area` keeps its name as a fixed issuing namespace.
- **Lifecycle.** Status runs from `triage` to `done`, or to `cancelled` with a `resolution`. Horizons are Now, Next, Soon, Future and Hold; Hold carries its reason and release condition, and replaces Waiting for and Parked.
- **Schema.** Everything stays at schema v1. The migration window has closed, so the checker fails the retired shapes.
- **Registry.** Arcadia owns the territory registry: one note per Project in `Streams/Projects/` and one per Initiative in `Streams/Initiatives/`. A Project or Initiative note is the durable home of status; `ki-checkpoint` keeps its original scope as ephemeral thread reconstruction, which the notes supplement and do not replace.
- **Areas.** A repository declares its fixed areas as a map from code to title, and the title is the definition. A bare list is the legacy form: it fails in the Knowledge Islands Agora and warns elsewhere.
- **Trades.** New trades are on hold until the territory model is settled. Work is done directly or recorded in the receiving repository.

## Consequences

- The `ki-work-roadmap` standard and checker in `ki-agentic-harness` carry the model, and `tools-ki` reads it.
- Each repository migrates its open records and maps its areas to titles. Done records are pruned rather than migrated.
- Future designs of this kind follow the `ki-design-loop` process skill, which commits its artefacts beside a Decision Record like this one rather than in local state.

## References

- [Brief](references/roadmap-model-brief.md) - the problem, the proposal and the numbered reflection.
- [Review: Fable](references/roadmap-model-fable-view.md), [review: Opus](references/roadmap-model-opus-check.md) and [review: Astra](references/roadmap-model-astra-view.md) - the three independent reviews.
- [Merged report](references/roadmap-model-report.md) - the roadmap model specification.
- [Decisions](references/roadmap-model-decisions.md) - Kris's decisions 1 to 11, verbatim.
- [Migration survey](references/roadmap-model-migration-unclear.md) and its [proposals](references/roadmap-model-migration-proposals.json) - the record-by-record migration recommendations Kris accepted.
- [[roadmap-model|Roadmap model]] - the Project note.
- [[SDR-KI-ARCADIA-004-the-enactment-process|SDR-KI-ARCADIA-004]] - the Enactment Process through which this decision changes.
