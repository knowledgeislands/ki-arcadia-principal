---
tags:
  - card/note
  - topic/productivity
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Weekly manual activity - reviewing and updating status fields on island notes
author: Written with Claude
---

# Status Review

## Overview

A weekly pass over notes with stale or pending status values. Status fields signal the health of a note - `draft` means unfinished, `current` means maintained, `outdated` means flagged for review, and `archive` means superseded. This task keeps those signals accurate.

---

## When

Weekly - _"ki status review"_. Typically at the end of the week or during Monday review.

---

## What It Does

1. Search for notes with `status: draft` that are older than two weeks - decide: finish them, move them, or archive
2. Search for notes with `status: outdated` - review each; either bring up to standard (`current`) or archive
3. Review any notes recently touched in the week - check whether the status still reflects reality
4. Update status fields in place, preserving all other frontmatter

---

## Status Values

| Value      | Meaning                                                                |
| ---------- | ---------------------------------------------------------------------- |
| `draft`    | Note exists but is incomplete - needs more work before it is canonical |
| `current`  | Actively maintained; reflects the latest state of thinking             |
| `outdated` | Flagged for review; content may be stale or structure non-compliant    |
| `archive`  | Superseded or no longer relevant; kept for historical reference only   |

---

## Live View

### Outdated

```dataview
TABLE status, purpose
FROM ""
WHERE contains(status, "outdated")
SORT file.path ASC
```

### Draft

```dataview
TABLE status, purpose
FROM ""
WHERE contains(status, "draft")
SORT file.mtime DESC
```

### Archive

```dataview
TABLE status, purpose
FROM ""
WHERE contains(status, "archive")
SORT file.path ASC
```

---

## Notes

- The `outdated` status was introduced in March 2026 during a bulk audit; many notes from that pass still need individual review
- Do not delete archived notes - they provide historical context
- Status updates alone do not require a session digest unless they surface a substantive decision

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Maintenance|Maintenance]] - parent index
- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - grandparent index
