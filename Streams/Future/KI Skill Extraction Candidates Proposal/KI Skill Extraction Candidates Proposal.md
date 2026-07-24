---
tags:
  - stream/future
  - topic/knowledge-islands
  - topic/engineering
status: draft
author: Written with Claude
---

# KI Skill Extraction Candidates

## Overview

Several patterns are implemented independently in both `ki-arcadia-principal` and `kit-legal`, with no corresponding `knowledgeislands-*` skill to govern them. Any new island that adopts Knowledge Islands would need to re-implement these patterns from scratch. This stream captures the extraction candidates - patterns that warrant codification as portable skills.

Identified during the Admin normalisation session (June 2026, GDR-KI-ARCADIA-003 follow-up).

---

## Extraction Candidates

| Pattern                          | Current status in skills          | Suggested extraction                  |
| -------------------------------- | --------------------------------- | ------------------------------------- |
| Admin zone structure             | †                                 | †                                     |
| Activity system ‡                | ‡                                 | ‡                                     |
| Charter + Conformance baseline   | §                                 | §                                     |
| Live artifacts (`.md` + `.html`) | No skill - kit-legal pattern only | New `knowledgeislands-live-artifacts` |
| Note templates system            | ¶                                 | Extend `knowledgeislands-kb`          |
| Conventions zone sub-folders ‖   | No skill                          | ‖                                     |

† **Pattern:** Admin zone structure (Governance/Operations arms). **Current status in skills:** `knowledgeislands-kb` declares zones; no skill governs the arm structure or what belongs in each arm. **Suggested extraction:** Extend `knowledgeislands-kb` or new `knowledgeislands-admin` skill.

‡ **Pattern:** Activity system (naming convention, `[Group] [Name] Activity.md`, Activities.md index). **Current status in skills:** Activity type declared in `admin/operations/activity`; no skill governs file naming or the index format. **Suggested extraction:** New `knowledgeislands-activities` or extend `knowledgeislands-kb`.

§ **Current status in skills:** No skill - only implied by SDR-003 and SDR-005 in Arcadia; kit-legal implemented independently. **Suggested extraction:** Extend `knowledgeislands-kb` with a bootstrap checker that validates a new island's Charter has the mandatory fields.

¶ **Current status in skills:** Template type declared; no skill governs the template structure or the `Admin/Governance/Note Templates/` convention.

‖ **Pattern:** Conventions zone sub-folders (Admin Conventions/, Pillars Conventions/, Streams Conventions/). **Suggested extraction:** Extend `knowledgeislands-kb` CONFORM mode.

---

## Suggested Priority

1. **Activity system** - both islands need it; clearly defined by kit-legal; straightforward to extract.
2. **Admin zone structure** - GDR-KI-ARCADIA-003 established the pattern; a skill that bootstraps the Governance/Operations arms would save the entire migration work for any future island.
3. **Charter bootstrap checker** - high value: any new island would immediately know if their Charter is missing mandatory fields.
4. **Note templates** - lower urgency; the pattern is simple but not blocking for new islands.
5. **Live artifacts** - niche; only applies if an island publishes rendered HTML artifacts.

---

## Notes

- These are all forward-looking extractions, not blockers for current work.
- The `knowledgeislands-kb` skill is the natural home for the Admin zone, Conventions, and Charter patterns - it already governs zone structure.
- A standalone `knowledgeislands-activities` skill would allow any island to get the activity naming and index convention for free.
- The `knowledgeislands-harness` repo is where the extracted skills would live.

## Related

- [[Admin/Governance/Decisions/GDR-KI-ARCADIA-003-admin-zone-governance-and-operations|GDR-KI-ARCADIA-003]] - the decision that established the Admin zone structure being extracted.
- [[Admin/Governance/Decisions/Decisions|Decisions]] - the Decision Records index.
