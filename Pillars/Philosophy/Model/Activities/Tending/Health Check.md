---
tags:
  - card/note
  - topic/productivity
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
author: Written with Claude
---

# Health Check

## Overview

A weekly scheduled task that reviews the island for structural drift, CLAUDE.md vs skill alignment, and content health, then proposes any revisions for confirmation. Runs Monday mornings to set up the week with a clean, up-to-date island.

---

## What It Does

Reviews the island for structural or content issues and proposes revisions. Specifically checks:

- **CLAUDE.md vs Island Skill alignment** - reads `CLAUDE.md` and `Pillars/Philosophy/Model/Agents/Claude/Island Skill.md`, identifies any gaps or drift between the two, and proposes updates to the skill where needed
- **ADR drift review** - checks each ADR in the island against the architecture and domain notes it underpins; flags any ADRs where the decision appears to have been superseded or where the related notes have diverged from the recorded decision; also flags areas where a new architectural decision appears to have been made but not yet captured as an ADR
- General island health - orphaned notes, broken wikilinks, routing anomalies, or stale content worth archiving

All proposed changes are surfaced for confirmation before anything is written.
