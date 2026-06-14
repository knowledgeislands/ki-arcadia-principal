---
type: stream-proposal
tags:
  - topic/knowledge-islands
  - topic/conventions
status: draft
priority: medium
dependencies: []
author: Written with Claude
---

# Page Registry Proposal

## Overview

The page registry is a pre-built index that maps every leaf filename to its location(s) in the repository. It exists to support shortest-path wikilink resolution: rather than scanning the filesystem on every link read or write, agents load the registry once and perform O(1) lookups. Every page is stored - not just collisions - because if only collisions were stored, adding a second page with a previously unique name would silently break existing bare links with no way to detect it.

---

## Structure

```json
{
  "Home": {
    "/": [],
    "Governance": ["Knowledge Capital", "Pillars"]
  },
  "Activities": {
    "Governance": "*"
  },
  "Agents": {
    "Governance": "*"
  },
  "Governance": {
    "Knowledge Capital": ["Pillars"],
    "Knowledge Islands": ["Pillars"]
  },
  "Pillars": {
    "Governance": "*",
    "Pillars": []
  },
  "Knowledge Capital": ["Pillars"],
  "Knowledge Islands": ["Pillars"],
  "Linear": ["Tools", "Governance", "Knowledge Islands", "Pillars"],
  "Tools": {
    "Governance": "*"
  }
}
```

---

## Serialisation conventions

Two sentinel values appear in the JSON:

- **Array** (e.g. `["Pillars"]`) - this entry is unique; the array is the parent path from immediate parent to repository root.
- **`"*"`** - this node appears under every instance of its parent. Rather than enumerating all parent instances (which would duplicate the parent's own disambiguation logic and break if a new instance is added), the serialiser records only the parent name and defers resolution to the parent's entry at deserialisation time. A `"*"` value is never resolved directly - the deserialiser walks up to the parent key and resolves from there.

---

## Tree diagram

The example below shows how `Knowledge Capital` and `Knowledge Islands` share a `Governance` folder with the same set of child names, causing almost every index note in the subtree to collide.

```
Home.md ←──────────────────────────────── [[Home]]
Pillars
|── Pillars.md ←───────────────────────── [[Pillars/Pillars]]
├── Knowledge Capital
│   ├── Knowledge Capital.md ←─────────── [[Knowledge Capital]]
│   └── Governance
│       ├── Governance.md ←────────────── [[Knowledge Capital/Governance]]
│       ├── Home.md ←──────────────────── [[Governance/Home]]
│       ├── Activities
│       │   └── Activities.md ←────────── [[Knowledge Capital/Activities]]
│       ├── Agents
│       │   └── Agents.md ←────────────── [[Knowledge Capital/Agents]]
│       ├── Pillars
│       │   └── Pillars.md ←───────────── [[Knowledge Capital/Pillars]]
│       └── Tools
│           └── Tools.md ←─────────────── [[Knowledge Capital/Tools]]
└── Knowledge Islands
    ├── Knowledge Islands.md ←─────────── [[Knowledge Islands]]
    └── Governance
        ├── Governance.md ←────────────── [[Knowledge Islands/Governance]]
        ├── Activities
        │   └── Activities.md ←────────── [[Knowledge Islands/Activities]]
        ├── Agents
        │   └── Agents.md ←────────────── [[Knowledge Islands/Agents]]
        ├── Pillars
        │   └── Pillars.md ←───────────── [[Knowledge Islands/Pillars]]
        └── Tools
            └── Tools.md ←─────────────── [[Knowledge Islands/Tools]]
            └── Linear.md ←────────────── [[Linear]]  (unique)
```

---

## Algorithm - mapping

Given a full path, find the shortest unambiguous link. This is a straightforward registry lookup:

1. Look up the leaf name in the registry.
2. If the entry is an **array** (unique) → use `[[Leaf]]`.
3. If the entry is an **object** (collision) → read off the minimum prefix that uniquely identifies this instance among all entries. Use `[[Prefix/Leaf]]`.

Examples:

- `Linear` → array entry → `[[Linear]]`.
- `Governance` at `Pillars/Knowledge Islands/Governance` → object entry, key `Knowledge Islands` → `[[Knowledge Islands/Governance]]`.
- `Activities` at KI/Governance → object entry `*` → inherit Governance's prefix → `[[Knowledge Islands/Activities]]`.

---

## Algorithm - mutating

When a new page is created, the registry must be updated. This is where the structural complexity lives:

1. Look up the leaf name in the registry.
2. **Not found** - globally unique. Insert as a top-level array entry: `"Leaf": [immediate_parent, grandparent, …, vault_root]`. Use `[[Leaf]]`.
3. **Found as array** (currently unique) - a collision is being introduced. Convert to an object: the existing entry becomes one keyed entry, the new page becomes another. Any existing `[[Leaf]]` links are now ambiguous - trigger a wikilink review to update them to their disambiguated prefix. Use the disambiguated form for the new page.
4. **Found as object** (already a collision) - add the new page as a further keyed entry. Use the minimum disambiguating prefix.

---

## Implementation notes

The registry is a map keyed by filename. In a compiled TypeScript context an ES `Map` (O(1) lookup) suffices; a red-black tree would give O(log n) ordered traversal if prefix-range queries ever become useful. The JSON form is compact: unique entries are a single path array, collision entries are an object. The full Arcadia registry is likely under 4 KB and can be embedded directly in a session prompt or maintenance activity.

Rebuilding: a tending activity traverses the full repository, builds the complete registry from scratch, and overwrites the registry file. A full rebuild is the source of truth - run it after any bulk file operation or rename. Incremental mutation (algorithm above) keeps the registry current between rebuilds.

---

## Checklist

- [ ] Decide implementation language and where the registry file lives in the repository
- [ ] Build initial generation script
- [ ] Generate and commit the initial registry file
- [ ] Wire registry into maintenance/tending activity for rebuild
- [ ] Wire mutation step into the note-creation workflow

## Governance

This stream adheres to the [[Enactment Process]]. Content reaches `Pillars/` or `Resources/` only on user approval of a `ready` proposal.
