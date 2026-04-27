---
tags:
  - card/note
  - topic/productivity
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Adhoc activity - surfacing broken wikilinks and orphan notes across the repository
author: Written with Claude
---

# Wikilink Review

## Overview

A focused review of wikilink health across the repository. Surfaces broken outlinks (wikilinks pointing to files that do not exist) and orphan notes (files with no incoming links). Run before or after a Structural Audit, or whenever navigation across the repository feels incomplete.

---

## When

Adhoc - _"kb wikilink review"_. Typically paired with [[Structural Audit]] or [[Inbox Review]]. Run any time new notes are created in bulk or a section of the repository has been significantly restructured.

---

## What It Does

1. Query for broken outlinks - wikilinks that point to a file which does not exist; decide whether to create the missing note or correct the link
2. Query for orphan notes - files with no backlinks; decide whether to link them from an appropriate index or parent note, or whether they are genuinely standalone
3. Cross-reference both lists against [[Inbox Review]] - new notes in `+/` that haven't been linked yet are the most common source of orphans

---

## Link Types

| Type             | Description                                                                | Resolution                                          |
| ---------------- | -------------------------------------------------------------------------- | --------------------------------------------------- |
| Broken outlink   | A `[[wikilink]]` in a note that has no matching file in the repository     | Create the missing note, or correct/remove the link |
| Orphan note      | A file that no other note links to - it exists but is unreachable by graph | Link from a parent index note, or archive           |
| Placeholder link | A link that was intentionally left unresolved pending future note creation | Create the note when the topic is ready to develop  |

---

## Live View

### Broken Links

Wikilinks pointing to files that do not exist in the repository.

```dataview
TABLE without id out AS "Broken Link", file.link AS "Origin"
FLATTEN file.outlinks AS out
WHERE !(out.file) AND !contains(meta(out).path, "/")
SORT out ASC
```

### Orphan Notes

Notes with no incoming links - unreachable by graph navigation. Calendar notes and inbox items are excluded.

```dataview
TABLE status, purpose
FROM ""
WHERE length(file.inlinks) = 0
AND !contains(file.path, "Calendar/")
AND !contains(file.path, "+/")
AND !contains(file.path, ".obsidian/")
SORT file.path ASC
```

---

## Notes

- Requires the [Dataview](https://github.com/blacksmithgu/obsidian-dataview) plugin to be installed and enabled
- The broken links query only catches simple single-level wikilinks - path-based links (e.g. `[[Folder/Note]]`) require the query to be extended
- Not all orphan notes are problems - some reference notes are genuinely standalone; use judgement
- Do not remove a link without first checking whether the target note should exist

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Maintenance|Maintenance]] - parent index
- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - grandparent index
