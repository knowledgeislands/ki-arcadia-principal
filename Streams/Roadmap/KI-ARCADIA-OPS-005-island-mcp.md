---
note_type: stream-roadmap
id: KI-ARCADIA-OPS-005
area: OPS
title: Island MCP
theme: operational-tooling
tags:
  - topic/knowledge-islands
  - topic/tools
status: ready
priority: low
horizon: now
candidate: true
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-04-30T07:51:03Z
updated_at: 2026-10-05T08:15:51Z
author: Mixed
---

# Island MCP Proposal

## Goal

Close the Island MCP design question against what `mcp-ki-kb-fs` already ships, so that Arcadia's tool notes describe the real agent gateway to the island and the one remaining gap is named for its owner.

---

## Context

This record set out to design an MCP server fronting each island so that agent reads and writes are controlled: enforced construction, explicit permissions per agent class, audit evidence, and a stable tool surface that hides the storage layout. Humans and Obsidian would keep direct file access; the gateway would govern agent traffic.

Most of that design has since been delivered in a separate product. `mcp-ki-kb-fs` (README at `c3e73e5`, 2026-10-05) provides:

- **One server, many bases** - the environment declares alias-to-path pairs and every tool takes a required `kb` alias, each alias resolving to a closed bundle of root, zone map and root-file allow-list.
- **Zone scoping** - only content under the base's declared zones (Calendar, Pillars, Resources, Streams, Admin) and `+`/`-` staging is reachable; the base root is neither listable nor writable.
- **Access levels** - `read` (default), `write` and `destructive`; tools above the configured level are never registered.
- **Path safety** - lexical normalisation plus a `realpath` check, so a call cannot escape its base or reach a sibling base.
- **Audit** - `write` and `destructive` calls are recorded as local JSONL with content replaced by a byte count.
- **Tool surface** - `kb_config`, `kb_list`, `kb_read`, `kb_rename`, `kb_folder_create`, `kb_write`, `kb_delete`; a search tool is planned on its own roadmap as `MCP-KBFS-TOOL-004`.

What it does not do is validate note conventions (frontmatter, routing, tags, links) at write time. Convention enforcement in the estate happens at audit time through `ki repo audit`.

---

## Boundary

- No code, configuration or roadmap change in `mcp-ki-kb-fs`; no trade route is created and no cross-repository write is made. The residual gap is recorded in this record for the server's owner to capture on their own roadmap.
- No change to MCP bindings, client registrations or `mcp-servers.yaml`.
- No new `Pillars/Philosophy/Model/Tools/Island MCP/` folder: the shipped server is already documented as KB Filesystem.
- No remote operations under the [[Techne Programme Hold]].

---

## Current state

- `Pillars/Philosophy/Model/Tools/KB Filesystem/KB Filesystem.md` describes the tools, alias model, two-layer path validation, zone scoping and the `read` default, but not the nested access levels, the audit log, its role as the agent gateway, or the absence of write-time convention validation.
- `Pillars/Philosophy/Model/Tools/How Tools Connect.md` has no dedicated gateway paragraph: its `## Overview` describes MCP generally and its `## KB Filesystem` section describes the server as "a programmatic interface" with access-gated tools and server-side path safety, without stating the agent-versus-human access model.
- `grep -rn -i "valid\|convention" /Users/krisbrown/workspaces/kit/knowledgeislands/mcp-ki-kb-fs/src` finds no note-convention validation; the only open roadmap item there is `MCP-KBFS-TOOL-004` (search).

---

## Steps

- [ ] Write a `### Disposition of the open questions` section in Discussion giving each of the five original questions a disposition with evidence from the `mcp-ki-kb-fs` README or source at a named revision.
- [ ] Refresh the `## KB Filesystem` section of `Pillars/Philosophy/Model/Tools/How Tools Connect.md` so it states the gateway model: agents reach the island through aliased, zone-scoped, access-levelled and audited tools, while humans and Obsidian edit the files directly.
- [ ] Update `Pillars/Philosophy/Model/Tools/KB Filesystem/KB Filesystem.md`: add the nested `read`/`write`/`destructive` access levels, the JSONL audit of write and destructive calls, and a sentence that note conventions are enforced by `ki repo audit`, not by the server at write time. Keep the README as the authoritative tool catalogue.
- [ ] Record the residual - optional write-time convention validation (frontmatter, routing, tags, links) - in Discussion as a note addressed to the `mcp-ki-kb-fs` owner, and mention it in the review packet for relay; do not write to that repository.
- [ ] Update the `status` month on each edited note per its existing convention.

---

## Files touched

- `Pillars/Philosophy/Model/Tools/How Tools Connect.md`
- `Pillars/Philosophy/Model/Tools/KB Filesystem/KB Filesystem.md`
- this record

---

## Verify

- Discussion has a disposition and an evidence reference for each of the five original questions.
- `How Tools Connect.md` `## KB Filesystem` names the agent gateway model; `KB Filesystem.md` names access levels, audit and the write-time validation gap.
- `git -C /Users/krisbrown/workspaces/kit/knowledgeislands/mcp-ki-kb-fs status --porcelain` is unchanged by this work.
- `ki repo audit --skill ki-repo-kb --repo . --progress never` PASS.
- `ki repo audit --progress never` PASS.

---

## Dependencies / blocks

No dependency. The design was realised by `mcp-ki-kb-fs`, which owns its own roadmap; the residual is offered to it as a note, not as a blocking handoff.

---

## Documentation impact

### Decision Records

None. The gateway was built as a product decision in `mcp-ki-kb-fs`; Arcadia records the disposition here and in its tool notes.

### Specifications

None. The server's own README and schemas remain the authoritative specification of its tools.

### Guides

`How Tools Connect.md` and `KB Filesystem.md` are refreshed to describe the shipped gateway.

### Roadmap

This record closes the Island MCP design question on delivery. The residual write-time validation idea belongs to the `mcp-ki-kb-fs` roadmap if its owner takes it up.

---

## Discussion

### Decisions under delegated autonomy

- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: treat the Island MCP as largely delivered by `mcp-ki-kb-fs` and scope this record to dispositioning the open questions and refreshing the tool notes, rather than designing a new server.
- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: the residual write-time convention validation is recorded as a note for the `mcp-ki-kb-fs` roadmap, with no trade route and no cross-repository write.

### Planning corrections

- The triage asked to refresh "the gateway paragraph" in How Tools Connect; no such paragraph exists. The refresh lands in that note's `## KB Filesystem` section.
- Open question 4 cited `Pillars/Admin/Governance/`; governance now lives in `Admin/Governance/`.

### Original open questions

1. **One server or many?** Expected disposition: one server, scoped by required `kb` alias, each alias a closed bundle of root, zones and allow-list, with path containment preventing reach into a sibling base.
2. **Where does enforcement live?** Expected disposition: path, zone and access enforcement live in the server at call time; note-convention enforcement lives in `ki repo audit` at audit time. Write-time convention validation is the residual.
3. **How do existing tools fit?** Expected disposition: humans and Obsidian bypass the server by design; the server governs agent access only where an agent is given it rather than raw filesystem tools.
4. **Relationship to Admin/Governance?** Expected disposition: `Admin` is an ordinary declared zone read through `kb_read`; charter and integration values are notes read at runtime, not first-class server metadata. `kb_config` exposes only the zone map, allow-list and base roster.
5. **Relationship to [[Cowork Configuration Layers]]?** Expected disposition: complementary - skills and Cowork configuration carry procedure and context, while the server carries governed file access; neither subsumes the other.

### Permissions model

The original checklist asked for permissions per agent class (Citizens, Visitors, Council Members). The shipped model sets one access level per registration; an agent class is mapped to a level by which registration it is given, not by identity inside the server.

### Original tool-surface sketch

`read_note`, `search`, `list_folder`, `write_note`, `validate_routing`, `link_check` and `get_metadata`. The first four are realised by `kb_read`, the planned search tool, `kb_list` and `kb_write`; `get_metadata` is covered by `kb_read` frontmatter selection; `validate_routing` and `link_check` are the residual write-time validation.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
