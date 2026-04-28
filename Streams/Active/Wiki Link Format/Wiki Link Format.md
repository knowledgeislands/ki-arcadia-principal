---
tags:
  - card/stream
  - topic/knowledge-islands
  - topic/conventions
status: draft - April 2026
purpose: Decide the canonical wiki link format for the island - full path, shortest path, or relative path - and update conventions and tooling accordingly
priority: medium
dependencies: []
author: Written with Claude
---

# Wiki Link Format

## Overview

Wiki links currently use full paths throughout the island (e.g. `[[Pillars/Knowledge Islands/Concept/Concept|Concept]]`). This is unambiguous but verbose - every token in a link path is a token consumed in every AI interaction with the island. The question is whether switching to a shorter format is worth the trade-offs, and if so, which format to adopt and how agents should resolve links.

---

## Options

### Option A — Full Path (current)

`[[Pillars/Knowledge Islands/Concept/Concept|Concept]]`

Every link spells out the complete vault path. No resolution algorithm is needed - the path is the link.

Strengths: unambiguous; works in any tool without a resolver; safe under renames only if the new path is updated too.

Weaknesses: verbose; high token cost in AI sessions; brittle - a file move breaks every inbound link unless a find-and-replace is run.

---

### Option B — Shortest Path (Obsidian algorithm)

`[[Concept]]` or `[[Structure/Structure]]` if disambiguation is needed.

The Obsidian resolution algorithm: find all notes whose filename matches the link text; if exactly one match exists, use it; if multiple matches exist, use the shortest unique path prefix that disambiguates. This is the Obsidian default and is implemented by most wikilink plugins for other tools (including the main Eleventy wikilink plugins).

Strengths: minimal tokens; matches Obsidian's native behaviour; tooling support is broad; links read cleanly.

Weaknesses: silent ambiguity risk - adding a second note with the same filename silently changes which note an existing link resolves to; agents must implement the disambiguation search before writing a new link.

---

### Option C — Relative Path

`[[../Concept]]` or `[[../../Governance/Governance]]`

Links are resolved relative to the current file's location, using standard filesystem path semantics.

Strengths: unambiguous without a vault-wide index; parent and sibling links are very short; no collision risk.

Weaknesses: cross-folder links become long and fragile; most wikilink processors treat `[[...]]` as a title lookup, not a path - relative path syntax is non-standard and requires a custom resolver; deeply nested cross-folder links are arguably worse than full paths.

---

## Recommendation

Option B — Shortest Path with the Obsidian algorithm documented explicitly as the resolution rule. The token saving is material over a large vault. Obsidian already implements the algorithm natively; agents can replicate it by searching filenames across the vault before writing a link.

Option C is attractive for parent-relative links but introduces non-standard semantics that every tool and agent would need to handle specially. The net cost outweighs the gain.

---

## Open Questions

1. **Collision handling when writing links.** When an agent writes a new link, should it (a) always use the bare filename optimistically and rely on Obsidian's graph to surface collisions, or (b) check for existing notes with the same filename before writing and use a disambiguation prefix if needed? Option (b) is safer but requires a vault-wide filename scan on every link write.

2. **Migration.** If Option B is adopted, existing full-path links remain valid in Obsidian (it resolves them). A full migration pass is not strictly necessary but would be tidier. How and when to run it?

3. **Eleventy compatibility.** If any island content is ever ingested or published through Eleventy, shortest-path links will work with standard wikilink plugins without modification. Relative paths would not. This is a weak argument for Option B but worth noting if the island expands to published output.

4. **Pipe alias convention.** Under Option B, the pipe alias (`[[Concept|Concept]]`) becomes redundant when the bare name already reads cleanly. Convention: omit the alias unless the display text genuinely differs from the filename (e.g. `[[Structure/Structure|Library Structure]]`).

---

## Decision

*Pending.*

---

## Intended Destinations

- [ ] Update `CLAUDE.md` - replace full-path wikilink instruction with shortest-path rule, document the Obsidian resolution algorithm
- [ ] Update `Pillars/Knowledge Islands/Governance/Conventions/Notes/Notes.md` - add wiki link format section
- [ ] Update agent memory files - reflect new link format rule
- [ ] Decide migration approach for existing full-path links (all at once, opportunistic, or leave as-is)
- [ ] Run migration pass (if decided)

---

## Related Topics

- [[Streams/Active/Active|Active]] - parent stream index
- [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Notes|Notes]] - conventions for note content and formatting
- [[Pillars/Knowledge Islands/Governance/Conventions/Structure/Structure|Structure]] - library structure conventions
- [[Streams/Active/Boundary Rules/Boundary Rules|Boundary Rules]] - related stream on content boundary rules
