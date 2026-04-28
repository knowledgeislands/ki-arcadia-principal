---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - April 2026
author: Written with Claude
---

# Meeting Note

## Overview

Defines the delta from [[Notes]] for meeting notes. Meeting notes are point-in-time records of a specific meeting - one note per meeting, filed in the Calendar alongside the daily note for that date.

---

## Frontmatter

Required tags in addition to any topic tags:

- `calendar/meeting`
- `date/YYYY/MM/DD` - matching the meeting date

---

## Structure

### Overview section

The `## Overview` section must include:

- **Attendees:** comma-separated list of names
- **Date:** written out in full (e.g. `21 April 2026`)
- A 2-3 sentence summary of what the meeting covered and its key outcome
- **Transcript:** link to Granola or other source, if available - wrapped in angle brackets or as a labelled link

### Body sections

One H2 section per theme covered in the meeting. The section title is the theme name.

Each theme section may optionally include any or all of the following H3 sub-sections:

- `### Key Decisions` - decisions locked in during this theme
- `### Open Items` - questions or tensions that remain unresolved and need further discussion
- `### Action Items` - named actions from this theme, each with owner and deadline where agreed

Not every theme will need all three sub-sections. Omit any that are empty.

### Related Topics section

Must include, in order:

1. The corresponding daily note - `[[Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD DayName|YYYY-MM-DD DayName]]`
2. Relevant Streams or Pillars notes for the project or context covered

---

## Exceptions

- `## Further Reading` - never used in meeting notes
- `## Contents` - never used in meeting notes; they have no sub-notes

---

## Related Topics

- [[Pillars/Knowledge Islands/Conventions/Notes/Types/Types|Notes]] - parent index
