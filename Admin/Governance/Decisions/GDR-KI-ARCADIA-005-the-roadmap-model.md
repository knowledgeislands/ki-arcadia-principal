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

Every Knowledge Islands repository records finite work as one Markdown work record per piece of work. A record has to say what sort of work it is, how far it has got, when it is intended, and which territory outcome it serves, in a form a checker can read and `ki` can turn into views. The territory spans many repositories, so the outcomes those records serve need one owner and one vocabulary rather than a classification invented in each repository.

## Decision

Knowledge Islands records work under one roadmap model.

- **Classification.** A record states its `kind` - `deliver`, `decide`, `investigate` or `audit` - and may state a `purpose`: `capability`, `corrective`, `debt`, `governance`, `learning`, `adoption` or `upkeep`. It names the territory `project` it serves and the repository `component` it touches. Upkeep has no Project and names its `initiative` directly. Recurring work's home is its Initiative, which never completes: every Activity and housekeeping definition names it, and its runs inherit it. `area` is a fixed issuing namespace, and a repository declares its areas as a map from code to title, the title being the definition.
- **Lifecycle.** Status runs `triage`, `draft`, `ready`, `in-progress`, `awaiting-review`, `done`, with `cancelled` as a second ending that carries a `resolution` and, for a duplicate, merged or superseded record, a qualified `resolution_target`. Only the owning repository closes its own record. A horizon - Now, Next, Soon, Future or Hold - is set exactly when a record is adopted and open. Hold carries its reason, `waiting-for` or `parked`, and a named release condition, and a held record keeps its status and baseline. A Project outlives its records: once they have all finished, a close-out assessment in its Notes states what was delivered and what was not, follow-up is captured as records, and only then does its lead decide to complete or cancel it. Initiatives stay open.
- **Schema.** The model is schema v1, and the checker fails retired shapes.
- **Registry.** Arcadia owns the territory registry: one note per Project in `Streams/Projects/` and one per Initiative in `Streams/Initiatives/`. Links point upwards only: a record names its Project, and a Project names its Initiative. A Project note carries its outcome, `initiative`, `lifecycle`, lead and target, with a body of only Outcome and Notes; an Initiative note carries its direction and notes. Neither lists records or Projects nor carries a dated update or status section. Status lives in the records and each note's `lifecycle`, and `ki` produces the views. A record in another territory names a Project by `<territory>/<slug>`, which classifies it without conferring authority.
- **Ideas.** An idea has no identifier or status. It lives in its Project note's Notes, or in the repository's `_IDEAS.md`, until it passes the capture test. The issue ledger `_ISSUES.md` holds only its header and area counters.
- **Checkpoints.** `ki-checkpoint` stays ephemeral thread reconstruction; Project and Initiative notes supplement it and do not replace it.
- **Trades.** No new trades are sent until the territory model is settled. Work is done directly or recorded in the receiving repository.

## Consequences

- The `ki-work-roadmap` standard and checker in `ki-agentic-harness` carry the model, and `tools-ki` reads it.
- Done records are pruned rather than kept as history.
- A Project or Initiative is shaped through the `ki-design-loop` process skill, and this record changes in place when the model does.

## References

- [SDR-KI-ARCADIA-004](SDR-KI-ARCADIA-004-the-enactment-process.md) - the Enactment Process through which this decision changes.
