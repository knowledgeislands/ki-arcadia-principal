---
type: stream-proposal
tags:
  - topic/knowledge-islands
  - topic/tools
status: draft
priority: low
dependencies: []
author: Mixed
---

# Island MCP Proposal

## Overview

A stream to design and propose an MCP server that fronts each Knowledge Island - all read and write operations go through the MCP rather than direct file access. The stream tracks design questions, dependencies, and the path to a ratified proposal. The full design is in [[Island MCP Design]].

The motivation is encapsulation. An MCP gateway makes interaction with the island controllable: it can enforce structured construction (no bypassing routing rules or note conventions), expose explicit permissions for read and write per agent class, and hide the internal layout behind a stable tool surface. Storage and structure can change without breaking agents that consume the island.

---

## Governance

This stream follows the [[Philosophy/Model/Processes/Enactment Process|Enactment Process]].

---

## Outputs

| Type        | Detail                                                                                              |
| ----------- | --------------------------------------------------------------------------------------------------- |
| Proposal    | [[Island MCP Design]] - the design proposal, refined through this stream and ratified via Enactment |
| Pillar note | On ratification, a tool note under `Pillars/Philosophy/Model/Tools/Island MCP/`                     |
| Convention  | Updates to [[How Tools Connect]] reflecting the gateway model                                       |

---

## Checklist

- [ ] Sketch the tool surface (e.g. `read_note`, `write_note`, `search`, `list_folder`, `validate_routing`)
- [ ] Decide scope - one MCP per island, or one shared MCP scoped by island parameter
- [ ] Map the permissions model - which agent classes (Citizens, Visitors, Council Members) get which operations
- [ ] Define how the MCP enforces conventions ([[Notes]], [[Admin/Governance/Conventions/Routing Rules|Routing Rules]], [[Tags]]) at write time
- [ ] Decide the relationship to [[How Tools Connect]] - currently tools connect to the island; an MCP gateway inverts the model
- [ ] Decide how the MCP coexists with direct file access (Obsidian, manual edits) - likely: humans bypass, agents do not
- [ ] Promote to a formal proposal once the design is sufficiently developed

---

## Open Questions

1. **One server or many?** Each KI running its own MCP server is the cleanest isolation but multiplies operational overhead. A single server scoped by island parameter is lighter but conflates blast radius.

2. **Where does enforcement live?** The MCP can validate at write time (rejecting non-conforming notes) or at read time (flagging drift). Write-time is stricter; read-time is more forgiving for legacy content.

3. **How do existing tools fit?** Obsidian writes directly to the file system, bypassing any MCP layer. The MCP cannot be the only path unless Obsidian is also routed through it - unlikely. The MCP therefore governs agent access, not human access.

4. **Relationship to Admin/Governance?** Identity, charter, and integration values live in `Pillars/Admin/Governance/`. The MCP could expose these as first-class metadata or treat them as ordinary notes.

5. **Relationship to [[Cowork Configuration Layers]]?** The Cowork plugin already exposes some KI operations via skills and prompts. An Island MCP would either subsume or complement that surface - the boundary needs deciding.
