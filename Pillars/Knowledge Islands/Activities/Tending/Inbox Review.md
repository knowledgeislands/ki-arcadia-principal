---
tags:
  - card/note
  - topic/productivity
  - topic/knowledge-management
  - source/claude
status: current - April 2026
author: Written with Claude
---

# Inbox Review

## Overview

A weekly manual review of the `+/` inbox folder. New notes arrive here from voice notes (via plugin), quick captures, and anything unsorted. The review files each note to the correct Pillar, Resource, or Stream and ensures the inbox stays clear.

---

## When

Weekly - _"ki inbox review"_. Typically on Monday alongside the [[Health Check]] automation.

---

## What It Does

1. Open `+/` in Obsidian and list all files not under `+/_Voice Notes/`
2. For each file, determine the correct destination using the routing rules in [[Structure]]
3. Move the file to its destination folder
4. Check that the destination folder's index note is updated to include the new note
5. If the note needs structural work (frontmatter, sections), apply it on move

---

## Notes

- `+/_Voice Notes/` is managed by the voicenotes-sync plugin - do not touch those files here
- If a note's destination is unclear, leave it in `+/` and mark it `status: draft` so it surfaces in future reviews
- Bulk additions (e.g. a batch of voice notes) may be deferred to a focused session rather than handled all at once

---

## Related Topics

- [[Pillars/Knowledge Islands/Activities/Tending/Tending|Tending]] - parent index
- [[Pillars/Knowledge Islands/Activities/Activities|Activities]] - grandparent index
