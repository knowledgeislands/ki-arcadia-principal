---
tags:
  - card/note
  - topic/productivity
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Daily automation that reconciles Linear initiatives and projects against KB stream notes and mapping table
author: Written with Claude
memory_file: feedback_{kb_prefix}_operations.md
---

# Linear Sync

## Overview

A daily scheduled task that reconciles Linear's initiative and project state against the island. Catches naming drift, missing projects in stream notes, and initiatives that have concluded and need their stream notes archived.

The authoritative rules for naming conventions, lifecycle management, project labels, and the Initiative → KB Mapping table are in [[Pillars/Knowledge Capital/Linear Workspace|Linear Workspace]]. Generic MCP query patterns and browser-based interaction rules are in [[Pillars/Knowledge Islands/Governance/Tools/Linear/Linear|Linear]].

---

## Schedule

- **Task ID:** `{task-prefix}-linear-sync` - prefix defined in [[Pillars/Knowledge Capital/Identity|Identity]]
- **Runs:** Working days at ~09:00 AM (with a small jitter) - working days defined in [[Schedule]]
- **Cron:** See [[Pillars/Knowledge Capital/Schedule|Schedule]] → Linear Sync cron

---

## What It Does

Using the Linear MCP, fetches all active and planned initiatives and their projects, then compares them against the Initiative → KB Mapping table in [[Pillars/Knowledge Capital/Linear Workspace|Linear Workspace]]. Specifically checks:

- **New or removed initiatives** - creates or archives stream notes, Pillars notes, and Resources company profiles as needed, and updates the mapping table
- **Initiative name drift** - names changed in Linear but not reflected in the KB
- **Project naming conventions** - enforces bracket spacing and hyphenation rules per [[Pillars/Knowledge Capital/Linear Workspace|Linear Workspace]]
- **Stream note project coverage** - ensures every uncompleted project under an initiative appears in the corresponding stream note's projects table

All fixes are applied directly - project renames in Linear via `save_project`, KB note updates via file writes.

---

## Prompt

```txt
You are running the Linear Sync. Your job is to reconcile Linear's initiative and project state against the island.

## Step 0 - Locate the repository and load Knowledge Capital
Run this bash command to find the Knowledge Capital folder and derive the repository root:
  KB_PROPS=$(find /sessions/*/mnt -maxdepth 7 -name "Knowledge Capital.md" -path "*/Knowledge Capital/*" 2>/dev/null | head -1)
  REPOSITORY=$(echo "$KB_PROPS" | sed 's|||')
  KB_PROPS_DIR=$(dirname "$KB_PROPS")
  echo "Repository: $REPOSITORY"

Read $KB_PROPS_DIR/Identity.md.
All file paths below are relative to $REPOSITORY.

## Step 1 - Load context
Read $REPOSITORY/CLAUDE.md and $REPOSITORY/Pillars/Knowledge Islands/Governance/Tools/Claude/Mistakes and Lessons.md (pre-flight check).
Read $REPOSITORY/Pillars/Knowledge Capital/Linear Workspace.md - this contains the Initiative → KB Mapping table, naming conventions, and project labels.
Read $REPOSITORY/Pillars/Knowledge Islands/Governance/Tools/Linear/Linear.md - this contains the generic MCP connection details and browser-based interaction patterns.

## Step 2 - Fetch current initiatives
Use list_initiatives (Linear MCP) to retrieve all active and planned initiatives. Compare against the Initiative → KB Mapping table in Linear Workspace.md.

Check for:
- New initiatives not yet in the mapping table → create a stream note (in Streams/Active/), a Pillars note, and for CS engagements a Resources company profile, then add a row to the mapping table.
- Completed or canceled initiatives → remove from the mapping table and move the KB stream note from Streams/Active/ to Streams/Settled/. Extract any durable knowledge to Pillars before archiving.
- Initiative name drift - renamed in Linear but not reflected in the KB → update KB references.

## Step 3 - Check project naming conventions
For each active initiative, review project names against the naming conventions defined in the Linear Workspace note loaded in Step 1.

Rename non-conforming projects in Linear directly using save_project.

## Step 4 - Verify stream note project coverage
For each active initiative with a stream note, use list_projects filtered by initiative (NEVER call list_projects without an initiative filter - this exceeds Linear's complexity limit of ~10,000). Exclude Completed and Canceled projects.

Note: list_projects with an initiative filter still exceeds the complexity limit at limit: 100. Use get_initiative with includeProjects: true instead - it returns project IDs and names without hitting the limit. Then use get_project to check the status of any projects that appear in the initiative but not in the stream note, to confirm whether they are Completed or Canceled before treating them as missing.

Check that the stream note's projects table includes every remaining uncompleted project. Add missing rows; remove rows for projects now completed or canceled.

## Step 5 - Resolve drift
Apply fixes in this order:
1. Rename projects in Linear where naming conventions are violated
2. Update the KB stream note to reflect the corrected names and current project set
3. Update the mapping table in Linear Workspace.md for any initiative-level changes

## Step 6 - Report
Produce a brief summary of what changed (initiatives added/removed/renamed, projects renamed, stream notes updated). If nothing changed, confirm the sync found no drift.

Write a session digest to the KB Calendar at the appropriate path: Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD Session - Linear Sync.md and reference it from the daily note. Use British English throughout.
```

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Linear/Linear|Linear]] - parent index
- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - grandparent index
- [[Pillars/Knowledge Islands/Governance/Tools/Linear/Linear|Linear]] - MCP connection details and browser-based interaction patterns
