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

# Briefings

## Overview

Briefings prime the island and the working day. They run before any other work begins, ensuring that calendar infrastructure exists, today's daily note is ready, and the agenda - tasks due, meetings, and inbox items - is surfaced in one place. A briefing does not produce knowledge; it produces context. Its output is a prepared environment from which the rest of the day's work starts.

The Morning Briefing is the sole activity in this group. It is scheduled to run automatically each working day and creates missing notes (weekly, monthly) as needed before populating today's daily note.

---

## Morning Briefing

[[Morning Briefing]] runs each working day at 06:00. It fetches calendar events for the day, surfaces tasks due today and overdue, pulls in upcoming tasks for the next five working days, and lists any items sitting in the `+/` inbox. If the current week's weekly note or month's monthly note does not yet exist, the briefing creates it before proceeding. The result is a daily note that is ready to use as the anchor for the day.

---

## Adoption Requirements

To adopt this activity group, an island must create the following Knowledge Capital notes. A vetoed island must create an index stub at `Knowledge Capital/Activities/Briefings/Briefings` acknowledging the veto.

| Note | Path | Purpose |
| --- | --- | --- |
| Briefings index | `Knowledge Capital/Activities/Briefings/Briefings` | Group index; confirms adoption and links to tool config |
| Schedule | `Knowledge Capital/Activities/Schedule` | Day-type taxonomy read by the Morning Briefing schedule |

---

## Related Topics

- [[Pillars/Knowledge Islands/Activities/Activities|Activities]] - parent index
- [[Pillars/Knowledge Islands/Tools/Claude/Activities/Briefings/Briefings|Tools/Claude/Activities/Briefings]] - Layer 5 prompts that drive this activity
