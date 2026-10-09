---
note_type: streams/project
slug: baseline-rollout
title: Baseline rollout
outcome: Every Knowledge Islands repository meets the solid baseline - `ki repo audit --estate` is green and the released `ki` is installed on every island.
initiative: platform-foundations
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-09T21:35:00Z
author: Written with Claude
---

# Baseline Rollout

## Outcome

Reach a solid Knowledge Islands baseline and roll it out to every island. The test: `ki repo audit --estate` is green and the released `ki` is installed everywhere. Arcadia coordinates; each item is delivered through a work record in its owning repository.

This Project sits in [[platform-foundations|Platform foundations]]. The move of agent work into the Techne footprint is the separate [[agent-host]] Project, and neither gates the other. [[estate-factorisation]] owns structure, MCP, distribution and `ki` pin automation, and its remainder does not gate this Project; [[paperclip-bootstrap-and-recovery]] and [[trades-revamp]] own their own scope.

---

## Notes

- Kris split `baseline-and-cloud` into this Project and the Techne agent-host work on 2026-10-07. Work that moves neither `ki repo audit --estate` nor the `ki` install belongs elsewhere.
- The delivery order runs conform activation first, then consistent commit gates before rollout, then hook governance, with the criterion-coverage and dependency-cruiser work alongside. Kris approves the order before delivery starts.
- The commit-gate work must preserve the supported boundary install.
- An estate audit did not finish within five minutes on 2026-10-07, so the gate needs a run that completes before it can be judged.
- `tools-ki` could add a terminal Granola disposition for meetings dropped without harvest. The ledger has none, so the dropped 2026-10-05 Alec catch-up is recorded `harvested-locally`. Kris has not decided whether to capture it in `tools-ki` or leave it.
- **Idea: Bun boundary proof adapter.** Let the `ki-engineering` boundary check prove a repository whose suite runs under `bun test` with TypeScript outside `src/`, and a flat repository's root `scripts/`, so `ki-agentic-harness` can adopt Dependency Cruiser as the reference Bun adopter. Kept as an idea on 2026-10-09 in place of a cancelled harness work record (Decision 31).
- **Idea: Observatory adopts `ki-diagrams`.** `apps-observatory` could declare `[skills.ki-diagrams]`, retire its own `scripts/diagrams/export-svg.ts` for the harness copy, and move the operational fields of its seven diagrams from `docs/diagrams/README.md` into `docs/diagrams/diagrams.toml`. Kept as an idea on 2026-10-09 in place of a cancelled Observatory work record (Decision 31).

### Close-out assessment

Nothing has been delivered against the Outcome: the Project has carried no work since it was registered, and the estate audit has never run to completion, so the gap is unmeasured. The Outcome still stands. The first step is to measure the starting point: a completed `ki repo audit --estate` run and a check of the released `ki` on every island, with each gap captured as a record in its owning repository. That follow-up was a separate Arcadia audit record until it was folded into this note on 2026-10-09 (Decision 31). The Project stays open.
