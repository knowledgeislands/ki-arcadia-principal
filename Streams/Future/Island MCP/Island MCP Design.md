---
type: stream-note
tags:
  - topic/knowledge-islands
  - topic/tools
status: draft
priority: low
dependencies: []
author: Mixed
---

# Island MCP Design

## Overview

Each Knowledge Island is fronted by its own MCP server. Agents read from and write to the island only through the MCP - never via direct
file access. The MCP becomes the canonical interface to the island; the file system becomes an implementation detail.

This inverts the current model. Today, tools connect to the island - Claude reads files, automations run scripts against the file tree, and
conventions like [[Notes]] and [[Admin/Governance/Conventions/Routing Rules|Routing Rules]] are honoured by convention rather than by
enforcement. With the proposal, agents connect to the island's MCP, and the MCP mediates and enforces all access. The file tree continues to
exist - Obsidian and humans still touch it directly - but agent traffic is routed through the gateway.

---

## Why

Three benefits, in order of priority.

**Enforced construction.** The MCP can validate at write time that any new or modified note conforms to the island's conventions -
frontmatter, naming, routing, link integrity. An agent cannot create a malformed note because the tool surface refuses to accept one. This
makes [[Notes]], [[Admin/Governance/Conventions/Routing Rules|Routing Rules]], and [[Tags]] executable contracts rather than aspirational
documents.

**Permissioning.** The MCP exposes explicit read and write operations per agent class. A Visitor agent might be granted `read_note` and
`search` only; a Citizen agent gets writes; a Council Member gets governance operations. Today everything is implicit - any agent with file
system access can do anything.

**Encapsulation.** The internal layout becomes an implementation detail. The MCP exposes a stable tool surface (`get_note(path)`,
`search(query)`, etc.); the underlying file structure can change without breaking agents that consume the island. The same tool surface
could be backed by Obsidian today and a graph database tomorrow.

---

## What it Enables

Multi-agent access with role-scoped permissions, audited centrally. Auditability of writes - the MCP logs every mutation with agent,
timestamp, and diff. Portability - swap the storage backend without touching agent code. Cross-island federation - a single agent can hold
MCP connections to several islands and move knowledge between them under controlled rules. Tooling separation - authoring tools (Obsidian,
manual edits) remain unmediated for humans; consumption and automation go through the gateway.

---

## Tool Surface (Sketch)

| Tool               | Purpose                                             |
| ------------------ | --------------------------------------------------- |
| `read_note`        | Fetch a note by path or wikilink resolution         |
| `search`           | Search by content, frontmatter, or tag              |
| `list_folder`      | Enumerate a folder's children with metadata         |
| `write_note`       | Create or update a note with convention validation  |
| `validate_routing` | Dry-run a proposed note against routing rules       |
| `link_check`       | Resolve and validate wikilinks for a note or folder |
| `get_metadata`     | Charter, Admin/Governance, agent registry           |

This is a sketch, not a specification. The actual surface is part of the design work tracked in the [[Island MCP Proposal|stream]].

---

## Open Questions

1. **One server per island or one server many islands?** Cleanest isolation versus operational simplicity.
2. **Write-time vs read-time enforcement?** Strict (reject non-conforming writes) versus forgiving (flag drift on read).
3. **How does the MCP coexist with Obsidian's direct file access?** Likely: humans bypass, agents do not.
4. **What's the bootstrapping path?** Build the MCP against the existing file tree and onboard agents incrementally, or wait for a full
   design before any migration.
5. **Relationship to [[Cowork Configuration Layers]]?** The Cowork plugin already exposes some KI operations via skills and prompts. An
   Island MCP would either subsume or complement that surface.

---

## Related

- [[Island MCP Proposal|Stream tracking]] - sibling stream note
- [[How Tools Connect]] - the current model the proposal extends
- [[Who Acts on the Island]] - the agent classes that would receive distinct permissions
- [[Admin/Governance/Tools/Integrations|Integrations]] - where the MCP connection details would live once adopted
- [[Notes]], [[Admin/Governance/Conventions/Routing Rules|Routing Rules]], [[Tags]] - the conventions the MCP would enforce at write time
