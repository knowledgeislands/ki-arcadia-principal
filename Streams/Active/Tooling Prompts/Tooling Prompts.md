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

Building out Arcadia's operational tooling across three areas. First, the `Tools/Claude/Activities/` prompt library - the Prompt layer in the [[Authoring Guidelines|content layers]] - migrating existing embedded prompts, authoring new ones, and keeping them aligned with their Knowledge Islands activity notes. Second, activity navigation aids: cached or synthesised views of the content layers that reduce the number of notes a human or agent needs to read. Third, Arcadia's operational infrastructure: the Arcadia skill definition and the scheduled task configuration.

The structural scaffolding (folder structure, stub index notes, authoring conventions) was created in the April 2026 governance restructuring session alongside [[Streams/Active/Knowledge Islands Inception/Knowledge Islands Inception|Knowledge Islands Inception]].

---

## Phase Summary

| Phase               | Status         | Description                                                                                                                                            |
| ------------------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Scaffolding         | ✅ Complete    | `Tools/Claude/Activities/` folder structure and stub indexes created; `Authoring Guidelines.md` written                                                |
| Email prompts       | ✅ Complete    | Route Triage, Route Drift, Route Review, Re-route Triaged, Recap, Email Test all migrated to `Tools/Claude/Activities/Email/`                          |
| Tending prompts     | ✅ Complete    | Health Check, Knowledge Rebuild, Convergence Check migrated; Scheduled Task Audit consolidated as a Claude-specific note (Definition deleted)          |
| Briefings prompts   | ✅ Complete    | Morning Briefing migrated to `Tools/Claude/Activities/Briefings/`                                                                                      |
| Linear prompts      | ✅ Complete    | Linear Sync migrated to `Tools/Claude/Activities/Linear/`                                                                                              |
| Prompt sync audit   | 🔲 Not started | Verify all Prompt notes are in sync with their Cowork scheduled tasks                                                                                  |
| Activity navigation | 🔲 Not started | Investigate cached/synthesised views of the content layers for human and agent consumers                                                               |
| Arcadia skill       | 🔲 Not started | Define and configure the Arcadia Knowledge Islands skill                                                                                               |
| Scheduled tasks     | 🔲 Not started | Configure Arcadia's scheduled tasks in Cowork; verify against Charter                                                                                  |

---

## Open Issues

None.
