---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - April 2026
purpose: Additions and exceptions to Note Format specific to collection cards
author: Written with Claude
---

# Collection Card

## Overview

Defines the delta from [[Notes]] for collection cards. Collection cards are lightweight reference entries for people, organisations, concepts, and index notes. They use a `card/*` type tag rather than the generic `card/note`.

---

## Frontmatter

The `tags` field uses a specific `card/` type tag. Common types:

| Tag            | Use for                                 |
| -------------- | --------------------------------------- |
| `card/note`    | Standard index notes and overview notes |
| `card/person`  | Individual people                       |
| `card/org`     | Organisations                           |
| `card/concept` | Concepts and ideas                      |
| `card/adr`     | Architecture Decision Records           |

See [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Frontmatter/Tags|Tags]] for the full tag reference.

---

## Structure

Collection cards follow the same structural rules as full notes but with fewer body sections. The body should reflect what is meaningful for the card type:

- **Person cards** — role, context, relationship to the island, key notes
- **Organisation cards** — what they are, relationship to the island, key contacts
- **Index notes** — body prose introducing direct children; `## Contents` for any children not contextualised in the body

`## Further Reading` is rarely appropriate for collection cards. Omit it unless there is a clear reason to include it.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Types/Types|Notes]] - parent index
