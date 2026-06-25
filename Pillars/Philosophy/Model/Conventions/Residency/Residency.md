---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: draft - April 2026
author: Written with Claude
---

# Residency

## Overview

Knowledge on the island does not live in one place. It exists across three tiers depending on its maturity, purpose, and who needs to access
it. The Library is the authoritative store - durable, structured, version-controlled, permanent. But agents also carry working knowledge in
their own memory: operational shorthand, session observations, patterns not yet stable enough for the Library.

These tiers are complementary, not competing. The Library is what the knowledge _is_; agent memory is how it is _accessed_ efficiently.
Understanding where knowledge resides determines how it is maintained, when it is promoted, and when it can be discarded.

---

## Three Tiers

| Tier                 | What it is                                                                            | Lifetime                                              |
| -------------------- | ------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| **The Library**      | Structured notes in the island - rules, conventions, style, architecture              | Permanent - versioned in git                          |
| **Canonical memory** | Operational distillation notes - rebuilt regularly from the island                    | Rebuilt on a schedule; always derived from the island |
| **Auxiliary memory** | In-flight observations from sessions - corrections, patterns, not-yet-validated rules | Temporary - promoted to island notes or pruned        |

---

## What Belongs Where

The guiding question for each piece of knowledge:

- **Would it be useful to a human reading the island notes?** → Library
- **Is it only needed to prime an agent at session start?** → canonical memory only
- **Did it emerge from a single session and hasn't been validated?** → auxiliary memory until proven
- **Is it a rule an agent keeps violating?** → Library (permanent lesson) and memory (operational reminder)
- **Is it an implementation detail likely to change?** → auxiliary memory; do not promote until stable

More specifically:

| Type of knowledge                          | Library   | Canonical memory   | Auxiliary memory           | Memory `type`           |
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

````text
New observation in a session
    → saved as auxiliary memory (ad-hoc)
        → recurs / proves stable
            → promoted to island note
                → canonical memory rebuilt from island
                    → auxiliary file deleted
```text

Auxiliary files that never recur or are situational should be pruned, not promoted. The test: _would a future agent session benefit from
knowing this, and is it stable enough to belong in the island notes?_

**Deletion after rebuild:** Auxiliary files whose content is fully covered by canonical memory are deleted after the next scheduled rebuild
confirms coverage. At rebuild time: compare auxiliary content against the canonical files; delete any auxiliary whose rules, facts, or
pointers are fully present in canonical.

---

## Promotion Criteria

Promote an auxiliary memory file to an island note when any of the following apply:

- It has been relied on across three or more sessions
- It captures a rule that prevents a repeatable mistake
- It is specific enough to be placed in a named island note
- A scheduled gap analysis surfaces it as memory-only for a second consecutive cycle

Do not promote:

- Implementation details likely to change (API internals, property keys, IDs)
- Session-specific context with no future relevance
- Rules already covered by canonical island notes

---

## Cross-Referencing Conventions

Bidirectional links keep island notes and memory in sync and enable automated drift detection.

**Island → memory** - `memory_file:` frontmatter property on the island note. Generic (portable) notes use placeholder syntax; a scheduled
rebuild activity substitutes the actual prefix from the Charter at runtime:

```yaml
# Generic note - portable across islands
memory_file: reference_{ki_prefix}_key_notes.md

# User-scoped - uses the user prefix from the island identity
memory_file: user_{user_prefix}_profile.md

# Cross-context - no substitution needed
memory_file: feedback_any_claude_behaviour.md

# List form when one note feeds multiple memory files
memory_file:
  - feedback_{ki_prefix}_operations.md
  - feedback_{ki_prefix}_multi_column.md
```text

**Memory → island** - `## Island Sources` section at the bottom of each memory file:

```markdown
## Island Sources

- `Pillars/Philosophy/Model/Conventions/Structure/Structure.md` - folder layout, routing rules
- `Pillars/.../Routing Rules.md` - three-domain model
```text

Both directions should be maintained. `memory_file:` enables Knowledge Rebuild to verify that referenced memory files still exist.
`## Island Sources` tells agents (and human readers) where to find the authoritative version.
````
