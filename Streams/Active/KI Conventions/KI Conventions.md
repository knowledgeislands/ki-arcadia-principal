---
tags:
  - card/stream
  - topic/knowledge-islands
status: draft - April 2026
purpose: Define content boundary rules for the Knowledge Islands pillar areas — what must not appear in each section to preserve separation of concerns
priority: medium
dependencies: []
author: Written with Claude
---

# KI Conventions

## Overview

A stream to establish explicit content boundary rules across the Knowledge Islands pillar structure. Without these rules, sections accumulate content that belongs elsewhere — Arcadia-specific detail in generic KI notes, tool references in convention notes, activity references in agent notes, and so on. The rules make the separation of concerns enforceable rather than aspirational.

---

## Governance

This stream follows the [[Pillars/Knowledge Islands/Governance/Processes/Enactment Process|Enactment Process]] — the standard model for how streams enact change in the knowledge base.

---

## Outputs

| Type | Detail |
| --- | --- |
| Convention note or additions | Content boundary rules for each pillar area, filed in `Pillars/Knowledge Islands/Governance/Conventions/` |

---

## Intended Destinations

- [ ] Define boundary rules for `/Pillars` — no references to HNR, Kit (except as council member), Valle Armonia, legal, etc.; no use of "knowledge management", "km", "pkm", "knowledge base", or "kb" except in historical context
- [ ] Define boundary rules for `/Pillars/Knowledge Capital/Governance` — no references to specific agents or tools except as examples
- [ ] Define boundary rules for `/Pillars/Knowledge Islands` — no Arcadia-specific content except Arcadia as the KI custodian
- [ ] Define boundary rules for `/Pillars/Knowledge Islands/Governance/Conventions` — no references to specific activities, agents, or tools
- [ ] Define boundary rules for `/Pillars/Knowledge Islands/Governance/Processes` — no references to specific activities, agents, or tools
- [ ] Define boundary rules for `/Pillars/Knowledge Islands/Governance/Activities` — no references to specific agents
- [ ] Define boundary rules for `/Pillars/Knowledge Islands/Governance/Agents` — no references to specific activities
- [ ] Audit existing notes in each area against the new rules and flag violations

---

## Open Questions

1. **Where do the rules live?** Options: a single `Conventions/Boundary Rules.md` note; additions to each area's index note; or additions to the existing `Conventions/Structure.md`. The last is probably cleanest — Structure already governs what goes where.

2. **How are violations surfaced?** The Conformance Check or Health Check could include a boundary rule scan. Alternatively, rules are enforced by convention and surfaced only during structural audits.

---

## Related Topics

- [[Streams/Active/Active|Active]] - parent stream index
- [[Pillars/Knowledge Islands/Governance/Conventions/Structure/Structure|Structure]] - likely home for the boundary rules
- [[Streams/Active/KI Conformance/KI Conformance|KI Conformance]] - related stream; violations could feed into Conformance checks
