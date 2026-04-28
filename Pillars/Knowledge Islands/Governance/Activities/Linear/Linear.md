---
tags:
  - card/note
  - topic/productivity
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Index of Linear project management sync activities
author: Written with Claude
---

# Linear

## Overview

The Linear activity group keeps the island's stream notes aligned with the live state of the Linear workspace. Linear is the external source of truth for active projects and initiatives; the KB is the source of truth for knowledge and context. Drift accumulates naturally as Linear items are created, completed, or reprioritised without corresponding changes to stream notes. The Linear Sync surfaces that drift daily rather than letting it compound.

The group contains a single scheduled automation. The MCP connection it relies on is documented in [[Pillars/Knowledge Islands/Governance/Tools/Linear/Linear|Tools/Linear]].

---

## Linear Sync

[[Linear Sync]] runs each working day at 09:00. It reads live Linear initiatives and projects via MCP, compares them against the current KB stream notes and a mapping table, and surfaces misalignment: stream notes that no longer correspond to a live Linear item, Linear items that have no corresponding stream note, and cases where the KB description has drifted from the Linear state. It flags candidates for new stream notes or archival but does not make changes autonomously - decisions are surfaced for human review.

---

## Adoption Requirements

To adopt this activity group, an island must create the following Knowledge Capital notes. A vetoed island must create an index stub at `Knowledge Capital/Governance/Activities/Linear/Linear` acknowledging the veto.

| Note | Path | Purpose |
| --- | --- | --- |
| Linear index | `Knowledge Capital/Governance/Activities/Linear/Linear` | Group index; for adoption: contains Initiative→KB Mapping table, naming conventions, and project labels; for veto: stub acknowledging the veto |
| Schedule | `Knowledge Capital/Governance/Activities/Schedule` | Day-type taxonomy read by the Linear Sync schedule |

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - parent index
- [[Pillars/Knowledge Islands/Governance/Tools/Linear/Linear|Tools/Linear]] - Linear MCP connection and browser-based interaction patterns
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Activities/Linear/Linear|Tools/Claude/Activities/Linear]] - Layer 5 prompts that drive this activity
