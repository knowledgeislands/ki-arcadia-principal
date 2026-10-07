---
note_type: streams/project
slug: roadmap-model
title: Roadmap model
outcome: The territory records work under the roadmap model, and the roadmap checker enforces it.
initiative: platform-foundations
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-07T17:30:00Z
author: Written with Claude
---

# Roadmap Model

## Outcome

Every Knowledge Islands repository records work under the roadmap model of 2026-10-07: `theme` gives way to `kind`, optional `purpose`, a territory `project` or `initiative` and a repository `component`, holds and cancellations are explicit, and the territory registry in [[Projects]] and [[Initiatives]] groups the work. The test: the roadmap checker enforces the model, after its migration tolerance window closes.

This Project sits in [[platform-foundations|Platform foundations]].

---

## Update

**2026-10-07, later.** On track. [[GDR-KI-ARCADIA-005-the-roadmap-model|GDR-KI-ARCADIA-005]] records the model, citing the design papers filed beside it. The checker now fails the retired shapes and requires areas mapped to titles, and done records are being pruned.

**2026-10-07.** On track. The harness standard and checker (KI-HARNESS-GOV-149, GOV-150 and GOV-151) are done, and the harness and Arcadia records are migrated. `tools-ki` is reading the model in KI-TOOL-CLI-112.

### Decision

None open: Kris approved the model, every migration proposal and the rollout's carry-through on 2026-10-07.

### Next step

Finish KI-TOOL-CLI-112 so that `ki` reads the new fields, then close the tolerance window so the checker enforces the model.

---

## Open records

Membership is classification, not authority. Status lives in each record.

- KI-TOOL-CLI-112 - Read the roadmap model
- KI-ARCADIA-GOV-026 - Create the Initiative and Project registry
- KI-ARCADIA-GOV-027 - Migrate Arcadia to the roadmap model

Done and pruned from the harness: KI-HARNESS-GOV-149, KI-HARNESS-GOV-150 and KI-HARNESS-GOV-151; Git history keeps them.

---

## Ideas

None.

---

## Sources

Created by KI-ARCADIA-GOV-027 under decision 7 of the rollout. The decision and its design papers: [[GDR-KI-ARCADIA-005-the-roadmap-model|GDR-KI-ARCADIA-005]].
