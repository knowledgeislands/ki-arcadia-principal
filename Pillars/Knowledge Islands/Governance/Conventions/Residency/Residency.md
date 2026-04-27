---
tags:
  - card/note
  - topic/knowledge-management
  - topic/knowledge-islands
status: current - April 2026
purpose: Define where knowledge lives across the three-tier model - KB, canonical memory, and auxiliary memory - and how it moves between them
author: Written with Claude
memory_file: project_{kb_prefix}_structure.md
---

# Residency

## Overview

Knowledge on the island does not live in one place. It exists across three tiers depending on its maturity, purpose, and who needs to access it. The Library is the authoritative store — durable, structured, version-controlled, permanent. But agents also carry working knowledge in their own memory: operational shorthand, session observations, patterns not yet stable enough for the Library.

These tiers are complementary, not competing. The Library is what the knowledge _is_; agent memory is how it is _accessed_ efficiently. Understanding where knowledge resides determines how it is maintained, when it is promoted, and when it can be discarded.

---

## Three Tiers

| Tier                 | What it is                                                                            | Lifetime                                          |
| -------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------- |
| **The Library**      | Structured notes in the KB vault - rules, conventions, style, architecture            | Permanent - versioned in git                      |
| **Canonical memory** | Operational distillation of KB notes - rebuilt regularly from the KB                  | Rebuilt on a schedule; always derived from the KB |
| **Auxiliary memory** | In-flight observations from sessions - corrections, patterns, not-yet-validated rules | Temporary - promoted to KB or pruned              |

---

## What Belongs Where

The guiding question for each piece of knowledge:

- **Would it be useful to a human reading the KB?** → KB
- **Is it only needed to prime Claude at session start?** → canonical memory only
- **Did it emerge from a single session and hasn't been validated?** → auxiliary memory until proven
- **Is it a rule Claude keeps violating?** → KB (permanent lesson) and memory (operational reminder)
- **Is it an implementation detail likely to change?** → auxiliary memory; do not promote until stable

More specifically:

| Type of knowledge                          | KB        | Canonical memory   | Auxiliary memory           | Memory `type`           |
| ------------------------------------------ | --------- | ------------------ | -------------------------- | ----------------------- |
| Folder structure and routing rules         | ✅        | ✅ summary         | -                          | `project`               |
| Note format and frontmatter conventions    | ✅        | ✅ summary         | -                          | `project`               |
| Tag taxonomy                               | ✅        | ✅ full list       | -                          | `project`               |
| Operational rules (file ops, known errors) | ✅ source | ✅ actionable form | -                          | `feedback`              |
| Communication style and voice              | ✅        | ✅ user profile    | -                          | `user`                  |
| Activity schedules and integration config  | ✅        | ✅ summary table   | -                          | `reference`             |
| In-session corrections (one-off)           | -         | -                  | ✅ until promoted          | `feedback`              |
| Recurring corrections (validated)          | ✅        | ✅ via rebuild     | ✅ auxiliary until rebuilt | `feedback`              |
| Volatile implementation details            | -         | -                  | ✅ if useful               | `project` or `feedback` |
| User preferences (chat behaviour)          | ✅        | ✅ user profile    | -                          | `user`                  |
| Pointers to where knowledge lives          | -         | ✅                 | -                          | `reference`             |

---

## Lifecycle

```
New observation in a session
    → saved as auxiliary memory (ad-hoc)
        → recurs / proves stable
            → promoted to KB note
                → canonical memory rebuilt from KB
                    → auxiliary file deleted
```

Auxiliary files that never recur or are situational should be pruned, not promoted. The test: _would a future Claude session benefit from knowing this, and is it stable enough to belong in the KB?_

**Deletion after rebuild:** Auxiliary files whose content is fully covered by canonical memory are deleted after the next [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Knowledge Rebuild|Knowledge Rebuild]] confirms coverage. There is no value in keeping a redundant auxiliary - the canonical file is the live version. At rebuild time: compare auxiliary content against the five canonical files; delete any auxiliary whose rules, facts, or pointers are fully present in canonical.

---

## Promotion Criteria

Promote an auxiliary memory file to a KB note when any of the following apply:

- It has been relied on across three or more sessions
- It captures a rule that prevents a repeatable mistake
- It is specific enough to be placed in a named KB note
- A scheduled gap analysis surfaces it as memory-only for a second consecutive cycle

Do not promote:

- Implementation details likely to change (API internals, property keys, IDs)
- Session-specific context with no future relevance
- Rules already covered by canonical KB notes

---

## Cross-Referencing Conventions

Bidirectional links keep KB and memory in sync and enable automated drift detection.

**KB → memory** - `memory_file:` frontmatter property on the KB note. Generic (portable) notes use placeholder syntax; [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Knowledge Rebuild|Knowledge Rebuild]] substitutes the actual prefix from [[Pillars/Knowledge Capital/Identity|KB Identity]] at runtime:

```yaml
# Generic note - portable across islands
memory_file: reference_{kb_prefix}_key_notes.md

# User-scoped - uses the user prefix from KB Identity
memory_file: user_{user_prefix}_profile.md

# Cross-context - no substitution needed
memory_file: feedback_any_claude_behaviour.md

# List form when one note feeds multiple memory files
memory_file:
  - feedback_{kb_prefix}_operations.md
  - feedback_{kb_prefix}_multi_column.md
```

Notes in `Knowledge Capital/` are already KB-specific by definition; they may use either form - placeholder is preferred for consistency.

**Memory → KB** - `## KB Sources` section at the bottom of each memory file:

```markdown
## KB Sources

- `Pillars/Knowledge Islands/Governance/Conventions/Structure/Structure.md` - folder layout, routing rules
- `Pillars/.../Routing Rules.md` - three-domain model
```

Both directions should be maintained. `memory_file:` enables Knowledge Rebuild to verify that referenced memory files still exist - any tooling that reads `memory_file:` values must expand `{kb_prefix}` and `{user_prefix}` placeholders using the values from KB Identity before resolving filenames. `## KB Sources` tells Claude (and human readers) where to find the authoritative version.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Conventions/Conventions|Conventions]] - parent index
- [[Pillars/Knowledge Islands/Governance/Agents/Claude/Memory Architecture|Memory Architecture]] - the Claude-specific implementation of this model for this KB
- [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Knowledge Rebuild|Knowledge Rebuild]] - the scheduled task that maintains the canonical memory layer
