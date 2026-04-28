---
tags:
  - card/stream
  - topic/ai
  - topic/automation
  - topic/knowledge-management
status: in-progress - April 2026
author: Written with Claude
---
m
# Tooling Prompts

## Overview

Building out Arcadia's operational tooling across three areas. First, the `Tools/Claude/Activities/` prompt library - the Layer 5 content layer in the [[Authoring Activities|five-layer model]] - migrating existing embedded prompts, authoring new ones, and keeping them aligned with their Knowledge Islands activity notes. Second, activity navigation aids: cached or synthesised views of the five-layer stack that reduce the number of notes a human or agent needs to read. Third, Arcadia's operational infrastructure: the Arcadia skill definition and the scheduled task configuration.

The structural scaffolding (folder structure, stub index notes, authoring conventions) was created in the April 2026 governance restructuring session alongside [[Streams/Active/Knowledge Islands Inception/Knowledge Islands Inception|Knowledge Islands Inception]].

---

## Phase Summary

| Phase               | Status         | Description                                                                                                |
| ------------------- | -------------- | ---------------------------------------------------------------------------------------------------------- |
| Scaffolding         | ✅ Complete    | `Tools/Claude/Activities/` folder structure and stub indexes created; `Authoring Activities.md` written    |
| Email prompts       | 🔲 Not started | Migrate Route Triage, Route Drift, Route Review, Re-route Triaged, Recap, Email Test prompts to Layer 5    |
| Tending prompts | 🔲 Not started | Migrate Health Check, Knowledge Rebuild, Scheduled Task Audit, Knowledge Islands Convergence Check prompts |
| Briefings prompts   | 🔲 Not started | Migrate Morning Briefing prompt                                                                            |
| Linear prompts      | 🔲 Not started | Migrate Linear Sync prompt                                                                                 |
| Prompt sync audit   | 🔲 Not started | Verify all Layer 5 prompts are in sync with their Cowork scheduled tasks                                   |
| Activity navigation | 🔲 Not started | Investigate cached/synthesised views of the five-layer stack for human and agent consumers                 |
| Arcadia skill       | 🔲 Not started | Define and configure the Arcadia Knowledge Islands skill                                                   |
| Scheduled tasks     | 🔲 Not started | Configure Arcadia's scheduled tasks in Cowork; verify against Charter                                      |

---

## Design Decisions

| Decision                                                           | Rationale                                                                                                           |
| ------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------- | ---------------------- |
| Layer 5 lives under `Tools/Claude/Activities/`, not `Activities/`  | Prompts are Claude-specific and island-specific; Layer 1 (`Activities/`) stays agent-agnostic                       |
| Stubs first, content second                                        | Scaffolding unblocks the structural work; prompts migrate incrementally                                             |
| Knowledge Islands note is the draft; scheduled task is the release | Maintains the prompt editing discipline from [[Authoring Activities]] |
| Each activity group gets its own subfolder                         | Mirrors the `Activities/` group structure for navigability                                                          |

---

## Open Issues

| Issue | Notes |
| --- | --- |
| Route Triage prompt is ~200 lines - does it live inline or as a linked file? | Probably inline; island format uses H2 sections not separate files |
| Some existing prompts reference `Tools/Claude/Island Skill.md` - needs updating to new path | `Agents/Claude/Island Skill.md` - catch in reference update pass |
| Prompt sync status between Knowledge Islands notes and Cowork scheduler is unknown | Scheduled Task Audit will surface any drift on its next run |
| `Activities/Email/Approach.md` belongs in `Knowledge Capital/Activities/Email/` - it's island-specific system design (Layer 2), not a generic activity doc | Move and update all wikilinks pointing to it; check email prompts that reference it |

---

## Related Topics

- [[Streams/Active/Active|Active]] - parent stream index
- [[Pillars/Knowledge Islands/Tools/Claude/Activities/Activities|Tools/Claude/Activities]] - prompt library
- [[Pillars/Knowledge Islands/Activities/Authoring Activities|Authoring Activities]] - authoring conventions
- [[Pillars/Knowledge Islands/Activities/Activities|Activities]] - Layer 1 activities
- [[Pillars/Knowledge Islands/Governance|Governance]] - parent governance layer
