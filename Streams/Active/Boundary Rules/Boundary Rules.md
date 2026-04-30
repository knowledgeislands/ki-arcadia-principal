---
tags:
  - card/stream
  - topic/knowledge-islands
status: draft - April 2026
priority: urgent
dependencies: []
author: Written with Claude
---

# Boundary Rules

## Overview

A stream to establish explicit content boundary rules (conceptually Boundary Walls) across the Knowledge Islands pillar structure. Without these rules, sections accumulate content that belongs elsewhere - Arcadia-specific detail in generic Knowledge Islands notes, tool references in convention notes, activity references in agent notes, and so on. The rules make the separation of concerns enforceable rather than aspirational.

---

## Governance

This stream follows the [[Knowledge Islands/Model/Processes/Enactment Process|Enactment Process]].

---

## Outputs

| Type                 | Detail                                                                                                                   |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| Convention note      | `Pillars/Knowledge Islands/Model/Conventions/Boundary Rules.md` - new standalone note                              |
| Tending activity | Boundary rules scan activity in `Pillars/Knowledge Capital/Activities/` (schedule and trigger TBD at rollout) |

---

## Checklist

- [ ] Create `Pillars/Knowledge Islands/Model/Conventions/Boundary Rules.md`
- [ ] Update `Pillars/Knowledge Islands/Model/Conventions/Conventions.md` index to reference the new note
- [ ] Create boundary-rules scan maintenance activity in `Pillars/Knowledge Capital/Activities/`
- [ ] Audit existing notes in each area against the new rules and flag violations (follow-on; may become its own stream)
- [ ] Audit for content duplication between Knowledge Islands and KC (follow-on; may become its own stream)

---

## Open Questions

1. **Where do the rules live?** ~~Options: a single `Conventions/Boundary Rules.md` note; additions to each area's index note; or additions to the existing `Conventions/Structure.md`. The last is probably cleanest - Structure already governs what goes where.~~

   **Resolved:** New standalone `Conventions/Boundary Rules.md`. Keeps Structure clean; makes the rules citable and auditable as a unit.

2. **How are violations surfaced?** ~~The Conformance Check or Health Check could include a boundary rule scan. Alternatively, rules are enforced by convention and surfaced only during structural audits.~~

   **Resolved:** Violations surfaced by a dedicated maintenance activity. Keeps the rules lightweight and avoids a dependency on the Conformance stream.

---

## Design

### Model

Boundary rules are conceptually **boundary walls with gates**. Each area of the island is enclosed; content and references may only pass through a gate, and gates check both entry and exit.

- A **Hard** wall has no gate - nothing passes
- A **Soft** wall has a gate that logs passage - content may pass but is flagged for review
- A **None** entry is an open gate - passage is explicitly permitted

The gate check runs in both directions: entry (content arriving into an area) and exit (references or content leaving an area). A route entry makes a gate explicit.

A boundary rule is a **route entry**: `(content, target_path, severity)`.

- **content** - what is being checked at the gate: a content type (e.g. "owned methodology"), a source-area character (e.g. "Resources-type content"), or a specific entity class (e.g. "named agents")
- **target_path** - the area whose wall the gate belongs to; rules cascade to all notes under the path unless a more specific entry overrides
- **severity** - Hard / Soft / None; more specific paths take precedence over less specific ones

**Severity:**

| Level | Meaning                                                                                                                                        |
| ----- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Hard  | Gate is closed. Flagged by maintenance scan; must be resolved by removal, relocation, or a more specific None entry with documented rationale. |
| Soft  | Gate logs passage. Flagged by maintenance scan; an inline exception comment in the note clears it.                                             |
| None  | Gate is open. Overrides a broader rule at a more specific target path, or makes an implicit permission explicit.                               |

### Exception mechanism

Exceptions are additional route entries with lower severity at a more specific target path. The pair `(broad_rule, exception_path)` is the route pair. No separate exceptions list is needed - the table is self-contained.

For Soft violations that are intentionally retained, the note carrying the exception includes an inline comment: `> [!exception] Boundary rule exception: <rule> - <rationale>`.

### Rules table (draft)

| Content | Target Path | Severity | Notes |
|---------|-------------|----------|-------|
| Internally-owned methodology or island knowledge | `Resources` | Hard | Belongs in Pillars; relocate if found |
| External reference material (content that exists independently) | `Pillars` | Soft | Primary record belongs in Resources; Pillars note may summarise or link |
| References to Pillars notes | `Resources` | Hard | Resources content exists independently of the island; it must not point inward |
| References to Resources notes | `Pillars` | None | Pillars may link outward to Resources freely |
| Named island entities (principals, citizens, organisations) | `Pillars/Knowledge Islands` | Hard | |
| Named island entities | `Pillars/Knowledge Islands/Knowledge Capital` | None | KC is island-specific by design |
| Arcadia as custodian of Knowledge Islands | `Pillars/Knowledge Islands` | None | One named exception; Arcadia may be named in this role |
| KC operational content | `Pillars/Knowledge Islands` | Hard | Prevents bleed-back into the portable framework |
| KI framework content | `Pillars/Knowledge Capital` | None | KC may freely reference KI |
| Named agents (specific tools, AI systems, automations) | `Pillars/Knowledge Islands/Model/Agents` | Hard | |
| Named agents | `Pillars/Knowledge Islands/Model/Activities` | Soft | Capability statements permitted; name only where no capability abstraction is possible |
| Named agents | `Pillars/Knowledge Capital/Agents` | None | KC agent config is inherently specific |
| Named activities | `Pillars/Knowledge Islands/Model/Agents` | Soft | |
| Named activities | `Pillars/Knowledge Capital/Agents` | None | KC agent config may list assigned activities |
| Specific tools or integrations | `Pillars/Knowledge Islands/Model/Conventions` | Hard | Generic capability references permitted |
| Specific tools or integrations | `Pillars/Knowledge Islands/Model/Processes` | Hard | |
| Specific tools or integrations | `Pillars/Knowledge Capital/Tools` | None | KC tools config is inherently specific |
| KM/PKM/KB terminology | `Pillars` | Soft | Historical context permitted; document inline |
