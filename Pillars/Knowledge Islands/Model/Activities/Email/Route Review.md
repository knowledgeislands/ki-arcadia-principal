---
tags:
  - card/note
  - topic/productivity
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
author: Written with Claude
---

# Route Review

## Overview

The single human-touchpoint activity for the rule system. Triggered explicitly in a chat session after the user has reviewed the queue file and marked suggestions `agreed` or `disagreed`.

Runs in four phases: a **taxonomy check** surfaces structural issues in the folder/route configuration; a **collision check** identifies rule conflicts and offers disambiguation; the **rule application** phase writes agreed rules and clears processed rows; and a final **Unknown re-evaluation** applies the freshly compiled rules to `_TRIAGE/000 Unknown` to clear any newly resolvable emails.

No changes are made automatically - all writes require the taxonomy and collision phases to complete first.

---

## Taxonomy Check

Checks structural consistency of the route configuration against the actual mailbox.

| Check                | Description                                                                      |
| -------------------- | -------------------------------------------------------------------------------- |
| Undeclared folders   | `_TRIAGE` subfolders in the mailbox with no matching route - possible orphans    |
| Declared but missing | Routes targeting a folder that does not exist in the mailbox - prompts to create |
| Unreferenced routes  | `Route - *.md` files not referenced in `Email Routing Config.md`                 |
| Missing route files  | `Email Routing Config.md` entries referencing a route with no matching file      |

---

## Collision Check

Identifies rule interactions that may produce unexpected routing.

| Check                  | Description                                                                                                          |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------- |
| Cross-route collisions | Patterns in different routes that would match the same emails - the first wins, but the conflict indicates ambiguity |
| Allow/deny conflicts   | A deny pattern overlapping with an allow pattern within the same route or across routes                              |
| Shadowed rules         | A broad pattern earlier in the order making a later, more specific pattern unreachable                               |
| Duplicate patterns     | Identical pattern strings appearing more than once, regardless of target                                             |

Where a fix is clear, a suggested change is offered inline for confirmation. Where a collision cannot be resolved or the correct fix is unclear, the affected rule is **disabled** - emails matching it fall through to `000 Unknown` until corrected and Route Review is run again.
