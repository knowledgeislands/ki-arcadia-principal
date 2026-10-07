---
note_type: streams/project
slug: baseline-rollout
title: Baseline rollout
outcome: Every Knowledge Islands repository meets the solid baseline - `ki repo audit --estate` is green and the released `ki` is installed on every island.
initiative: platform-foundations
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-07T14:05:00Z
author: Written with Claude
---

# Baseline Rollout

## Outcome

Reach a solid Knowledge Islands baseline and roll it out to every island. The test: `ki repo audit --estate` is green and the released `ki` is installed everywhere. Arcadia coordinates; each item is delivered through a work record in its owning repository.

This Project sits in [[platform-foundations|Platform foundations]]. The move of agent work into the Techne footprint is the separate [[agent-host]] Project, and neither gates the other. [[estate-factorisation]] owns structure, MCP, distribution and `ki` pin automation, and its remainder does not gate this Project; [[paperclip-bootstrap-and-recovery]] and [[territories-and-trades]] own their own scope.

---

## Update

Seeded on 2026-10-07 from records read at about 11:00 CEST; recheck before acting.

- **Health.** At risk: the gate has no current result and delivery is held by the `state-of-play` pause. A stated judgement for Kris to confirm.
- **Release.** `ki` v0.7.1 is tagged, installed locally and published in the `homebrew-tap` formula (`ki --version`).
- **Gate.** Not yet evidenced. A run of `ki repo audit --estate` on 2026-10-07 did not finish within five minutes, so the gate has no current result.
- **Pause.** Work across Knowledge Islands repositories is paused while the `state-of-play` review runs. The proposed first delivery window keeps FND-026, GOV-109 and GOV-117 in their own dependency chain.
- **Moved out on 2026-10-07**, since none moves `ki repo audit --estate` or the `ki` install: harness GOV-115 and RTP-015 to [[paperclip-bootstrap-and-recovery]], Arcadia OPS-008 to [[island-model-and-tending]], EXT-003 to standards upkeep and ECO-009 to [[estate-factorisation]]. Arcadia OPS-002 has approved closure as obsolete.
- **Already delivered and pruned:** harness GOV-092, GOV-095 and RTP-013; Arcadia GOV-012 and GOV-019.

Why each open record matters:

- **FND-026** - rollout depends on conform working everywhere.
- **GOV-109** - consistent gates before rollout; the prepare proposal must preserve the supported boundary install.
- **GOV-117** - waits on GOV-109.
- **GOV-127** - in progress, but needs re-planning against existing DESIGN-2 evidence; [[estate-factorisation]]'s ALIGN-1 refers to it.
- **REV-011** - must show current criterion coverage.

### Decision

Kris has not yet approved the delivery order in the next step. The test: once approved and the pause is released, the order is followed until the gate is evidenced.

### Next step

Once Kris releases the `state-of-play` pause, repair the small plan defects above, then deliver FND-026, GOV-109 and GOV-117 in order, alongside REV-011 and the re-planned GOV-127. Then run `ki repo audit --estate` to completion and check the released `ki` on every island against the gate.

---

## Constraints

- Kris decided on 2026-10-07 to split `baseline-and-cloud` into this Project and the Techne agent-host work.
- Kris confirmed on 2026-10-07 that this Project holds only the five records below; the others moved as listed above.
- The `state-of-play` pause holds this Project's delivery until Kris releases it.

---

## Open records

Membership is classification, not authority; each owning repository decides whether its record joins when the migration tags it. Status lives in each record.

- [KI-HARNESS-FND-026](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-FND-026-complete-conform-activation.md) - Complete conform activation
- [KI-HARNESS-GOV-109](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-109-fail-when-commit-gates-absent.md) - Enforce commit gates
- [KI-HARNESS-GOV-117](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-117-govern-hooks-beyond-packages.md) - Govern hooks beyond packages
- [KI-HARNESS-GOV-127](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-127-adopt-dependency-cruiser-estatewide.md) - Adopt Dependency Cruiser estatewide
- [KI-HARNESS-REV-011](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-REV-011-review-harness-automation-coverage.md) - Review harness automation

---

## Ideas

- `tools-ki` could add a terminal Granola disposition for meetings dropped without harvest. The ledger has none, so the dropped 2026-10-05 Alec catch-up is recorded `harvested-locally`. Kris has not decided whether to capture it in `tools-ki` or leave it.

---

## Sources

Seeded by KI-ARCADIA-GOV-026 from `+/_CHECKPOINTS/baseline.md` at `d9931d4`.
