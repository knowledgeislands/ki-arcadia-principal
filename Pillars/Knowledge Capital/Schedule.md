---
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
purpose: Timing parameters for KB automations
author: Written with Claude
memory_file: reference_{kb_prefix}_key_notes.md
---

# Schedule

## Overview

Timing parameters and day-type taxonomy for KB automations. Arcadia currently has no scheduled automations defined. Parameters are added here as automations are introduced.

---

## Day Types

Every daily note carries a `day_type` frontmatter property. Automations read this to branch behaviour.

| Value          | Meaning                      |
| -------------- | ---------------------------- |
| `work-day`     | Standard Mon-Fri working day |
| `bank-holiday` | UK bank holiday              |
| `annual-leave` | Annual leave day             |
| `weekend`      | Saturday or Sunday           |

### Determining day type

When creating a daily note, set `day_type` as follows (first match wins):

1. Day of week is Saturday or Sunday → `weekend`
2. Date appears in `Calendar/YYYY/YYYY UK Bank Holidays.md` → `bank-holiday`
3. Date appears in `Calendar/YYYY/YYYY Annual Leave.md` → `annual-leave`
4. Otherwise → `work-day`

---

## Related Topics

- [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] - parent index
