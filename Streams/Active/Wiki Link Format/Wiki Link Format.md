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

| Format       | Unambiguous | Token-efficient | Native Support | Flexible | Example                                                                        |
| ------------ | ----------- | --------------- | -------------- | -------- | ------------------------------------------------------------------------------ |
| **Full**     | ✓           | ✗               | ✓              | ✗        | `[[Pillars/Knowledge Islands/Concept/Concept\|Concept]]`                      |
| **Shortest** | ~           | ✓               | ✓              | ✓        | `[[Concept]]`; or `[[Knowledge Islands/Governance]]` on collision              |
| **Relative** | ✓           | ~               | ✗              | ~        | `[[../Concept]]` for a sibling; `[[../../Governance/Governance]]` for a cousin |

*~ = partial: Shortest is unambiguous only when no collision exists; Relative is token-efficient for nearby notes only, and flexible locally but awkward cross-folder.*

---

## Open Questions

1. **Collision handling when writing links.** When an agent writes a new link, should it (a) always use the bare filename optimistically and rely on Obsidian's graph to surface collisions, or (b) check for existing notes with the same filename before writing and use a disambiguation prefix if needed? Option (b) is safer but requires a vault-wide filename scan on every link write.

2. **Migration.** If Option B is adopted, existing full-path links remain valid in Obsidian (it resolves them). A full migration pass is not strictly necessary but would be tidier. How and when to run it?

3. **Eleventy compatibility.** If any island content is ever ingested or published through Eleventy, shortest-path links will work with standard wikilink plugins without modification. Relative paths would not. This is a weak argument for Option B but worth noting if the island expands to published output.

4. **Pipe alias convention.** Under Option B, the pipe alias (`[[Concept|Concept]]`) becomes redundant when the bare name already reads cleanly. Convention: omit the alias unless the display text genuinely differs from the filename (e.g. `[[Structure/Structure|Library Structure]]`).

---

## Collision Registry Proposal

Rather than scanning the filesystem on every link write, maintain a pre-built **collision registry** — a map from leaf filename to the list of vault paths that share that name. Only collisions are stored; unique filenames have no entry. The registry is rebuilt by a maintenance/tending activity and is compact enough to load into an agent session as a JSON blob.

[[A]]
[[B/A|A]]
### Structure

```json
{
  "Pillars": {
    "Governance": ["Knowledge Capital", "Pillars"],
    "": [] 
  },
  "Governance": {
    "Knowledge Capital": "Pillars",
    "Knowledge Islands": "Pillars"
  },
  "Activities": {
    "Governance": "*"
  },
  "Linear": ["Tools", "Governance", "Knowledge Islands", "Pillars"]
}
```

### Tree diagram — Governance collision

Both `Knowledge Capital` and `Knowledge Islands` have a `Governance` folder with the same set of child names (`Activities`, `Agents`, `Conventions`, `Processes`, `Tools`), so almost every index note in the subtree collides.

```
Home.md
Pillars
|── Pillars.md  ←─────-----------───────────── [[Pillars/Pillars]]
├── Knowledge Capital
│   ├── Knowledge Capital.md  ←─────---[[Knowledge Capital]]
│   └── Governance
│       ├── Governance.md  ←────────────────── [[Knowledge Capital/Governance]]
│       ├── Home.md
│       ├── Activities
│       │   └── Activities ←────────────── [[Knowledge Capital/Governance/Activities]]
│       ├── Agents
│       ├── Pillars ←──────────────    [[Governance/Pillars]]
│       └── Tools
└── Knowledge Islands
    └── Governance ←────────────────── [[Knowledge Islands/Governance]]
        ├── Activities ←────────────── [[Knowledge Islands/Governance/Activities]]
        ├── Agents
        └── Tools
            └── Linear ←────────────── [[Tools/Linear]]  (unique at one level up)
```

### Disambiguation algorithm

Given the target leaf name and the intended path:

1. Look up the leaf name in the registry. If not found → `[[Leaf]]`.
2. If found, walk the path arrays from right (leaf) to left (root) in parallel. Find the first position where the target path diverges from all other registered paths. Use that prefix as the link. Example for `Governance` → Knowledge Islands:
   - `Governance` — shared with KC entry → go left
   - `Knowledge Islands` vs `Knowledge Capital` — diverge → stop
   - Result: `[[Knowledge Islands/Governance]]`

3. For `Activities` → Knowledge Islands: `Activities` shared → `Governance` shared → `Knowledge Islands` vs `Knowledge Capital` → stop → `[[Knowledge Islands/Governance/Activities]]`.

4. For `Linear` → Knowledge Islands Tools: `Linear` shared → `Tools` vs `Activities` → diverge → `[[Tools/Linear]]`.

### Implementation notes

The registry is a map keyed by filename. In a compiled TypeScript context an ES `Map` (O(1) lookup) suffices; a red-black tree would give O(log n) ordered traversal if prefix-range queries ever become useful. The JSON form (collision-only, path-as-array) is compact: the full Arcadia collision set is likely under 2 KB and can be embedded directly in a session prompt or maintenance activity.

Rebuilding: a tending activity traverses the vault, groups filenames with 2+ occurrences, and rewrites the registry file. Any agent writing a new note that would introduce a collision should also trigger a registry rebuild.

---

## Decision

**Option B — Shortest Path (Obsidian algorithm).** Adopted April 2026.

Body links use the bare filename when unique across the vault, and the minimum disambiguating prefix when not. Footer links (`## Related Topics`, `## Contents`) retain the full absolute path with alias — they are navigation-critical and the explicitness is worth the verbosity. Agents must check for filename collisions before writing a bare link. Pipe aliases are omitted in body links unless the display text genuinely differs from the filename.

---

## Intended Destinations

- [x] Update `CLAUDE.md` - replace full-path wikilink instruction with shortest-path rule, document the Obsidian resolution algorithm
- [x] Update `Pillars/Knowledge Islands/Governance/Conventions/Notes/Format/Format.md` - sharpen Wikilinks and Images section with explicit algorithm and collision-checking rule
- [x] Update agent memory files - reflect new link format rule
- [ ] Review and approve Collision Registry proposal — decide structure, implementation language, and where the registry file lives
- [ ] Build collision registry — initial generation script + registry file
- [ ] Wire registry into maintenance/tending activity for rebuild
- [ ] Decide migration approach for existing full-path body links (all at once, opportunistic, or leave as-is)
- [ ] Run migration pass (if decided)

---

## Related Topics

- [[Streams/Active/Active|Active]] - parent stream index
- [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Notes|Notes]] - conventions for note content and formatting
- [[Pillars/Knowledge Islands/Governance/Conventions/Structure/Structure|Structure]] - library structure conventions
- [[Streams/Active/Boundary Rules/Boundary Rules|Boundary Rules]] - related stream on content boundary rules
