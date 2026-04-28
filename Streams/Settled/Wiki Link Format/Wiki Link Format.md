---
tags:
  - card/stream
  - topic/knowledge-islands
  - topic/conventions
status: current - April 2026
priority: medium
dependencies:
  - Page Registry
author: Written with Claude
---

# Wiki Link Format

## Overview

Wiki links currently use full paths throughout the island (e.g. `[[Pillars/Knowledge Islands/Concept/Concept|Concept]]`). This is unambiguous but verbose - every token in a link path is a token consumed in every AI interaction with the island. The question is whether switching to a shorter format is worth the trade-offs, and if so, which format to adopt and how agents should resolve links.

---

## Options

WikiLinks come in 3 formats.  Most systems opt for Shortest due to the compactness and readability, and tools that support it do so by caching page information.  For example, Obsidian has its own cache, so Humans get the benefit of that, whereas Agentic AI does not.  That said, Obsidian often falls back to full paths when there is only a little ambiguity.

| Format       | Unambiguous | Write Efficient | Read Efficient | Token-efficient | Native Support | Flexible | Example                                                                        |
| ------------ | ----------- | --------------- | -------------- | --------------- | -------------- | -------- | ------------------------------------------------------------------------------ |
| **Shortest** | ✓           | ~               | ~              | ✓               | ✓              | ✓        | `[[Concept]]`; or `[[Knowledge Islands/Governance]]` on collision              |
| **Full**     | ✓           | ✓               | ✓              | ✗               | ✓              | ✗        | `[[Pillars/Knowledge Islands/Concept/Concept\|Concept]]`                       |
| **Relative** | ✓           | ✓               | ✓              | ~               | ✗              | ~        | `[[../Concept]]` for a sibling; `[[../../Governance/Governance]]` for a cousin |
We can do better.  In order for Shortest to also become read and write efficient, the [[Page Registry]] is required — it provides the pre-built index needed to efficiently detect collisions and compute minimum disambiguating prefixes without live filesystem scanning.  Obsidian has its own cache, so Human agents get the benefit of that, whereas Agentic AI does not.

---

## Checklist

- [x] Decide migration approach for existing full-path body links — migrated all at once in April 2026
- [x] Run migration pass — 94 files, 334 links rewritten

---

## Related Topics

- [[Streams/Settled/Settled|Settled]] - parent stream index
- [[Streams/Active/Page Registry/Page Registry|Page Registry]] - dependency; provides the index for collision detection and shortest-path resolution
- [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Notes|Notes]] - conventions for note content and formatting
- [[Pillars/Knowledge Islands/Governance/Conventions/Structure/Structure|Structure]] - library structure conventions
- [[Streams/Active/Boundary Rules/Boundary Rules|Boundary Rules]] - related stream on content boundary rules
