---
tags:
  - card/note
  - topic/productivity
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Weekly automation that checks island structure, skill alignment, and content health
author: Written with Claude
---

# Health Check

## Overview

A weekly scheduled task that reviews the island for structural drift, CLAUDE.md vs skill alignment, and content health, then proposes any revisions for confirmation. Runs Monday mornings to set up the week with a clean, up-to-date island.

---

## Schedule

- **Task ID:** `{task-prefix}-health-check` - prefix defined in [[Pillars/Knowledge Capital/Charter|Charter]]
- **Runs:** Mondays at ~08:00 AM (with a small jitter) - working days defined in [[Schedule|Schedule]]
- **Cron:** See [[Schedule|Schedule]] → Health Check cron

---

## What It Does

Reviews the island for structural or content issues and proposes revisions. Specifically checks:

- **CLAUDE.md vs Island Skill alignment** - reads `CLAUDE.md` and `Pillars/Knowledge Islands/Governance/Agents/Claude/Island Skill.md`, identifies any gaps or drift between the two, and proposes updates to the skill where needed
- **ADR drift review** - checks each ADR in the island against the architecture and domain notes it underpins; flags any ADRs where the decision appears to have been superseded or where the related notes have diverged from the recorded decision; also flags areas where a new architectural decision appears to have been made but not yet captured as an ADR
- General island health - orphaned notes, broken wikilinks, routing anomalies, or stale content worth archiving

All proposed changes are surfaced for confirmation before anything is written.

---

## Prompt

```txt
You are running the island Health Check. Your job is to check the island for drift, gaps, and structural issues, then propose fixes for confirmation before writing anything.

## Step 0 - Locate the repository and load Knowledge Capital
Run this bash command to find the Knowledge Capital folder and derive the repository root:
  KI_PROPS=$(find /sessions/*/mnt -maxdepth 7 -name "Knowledge Capital.md" -path "*/Knowledge Capital/*" 2>/dev/null | head -1)
  REPOSITORY=$(echo "$KI_PROPS" | sed 's|||')
  KI_PROPS_DIR=$(dirname "$KI_PROPS")
  echo "Repository: $REPOSITORY"

Read $KI_PROPS_DIR/Identity.md.
All file paths below are relative to $REPOSITORY.

## Step 1 - Load context
Read $REPOSITORY/CLAUDE.md and $REPOSITORY/Pillars/Knowledge Islands/Governance/Tools/Claude/Mistakes and Lessons.md.

## Step 2 - CLAUDE.md vs Island Skill alignment
Read $REPOSITORY/Pillars/Knowledge Islands/Governance/Agents/Claude/Island Skill.md.
Compare it against CLAUDE.md. Identify any gaps, contradictions, or outdated references.
List proposed changes - do not apply them yet.

## Step 3 - Knowledge Islands folder review
Read the notes in $REPOSITORY/Pillars/Knowledge Islands/Governance/.
Check for: stale content, broken wikilinks, notes that reference old paths or removed files, and anything that contradicts CLAUDE.md.
List proposed changes - do not apply them yet.

## Step 4 - ADR drift review
Find all ADR notes using a search across the repository. Use `find . -name "*ADR*"` to locate them.
For each ADR found, check:
- Does the decision still match the corresponding architecture or domain notes?
- Does any related note describe a practice or tool that contradicts the ADR decision?
- Are there architecture notes or domain notes that describe a significant decision not yet captured as an ADR?
List proposed changes or new ADRs - do not write them yet.

## Step 5 - island health check
Do a lightweight scan for:
- Notes in $REPOSITORY/+/ inbox that have been there more than a week (suggest routing)
- Any obvious orphaned notes with no wikilinks in or out
- Folders missing an index note per the index note convention in CLAUDE.md

## Step 6 - Report and confirm
Present a summary of all proposed changes grouped by type. Wait for confirmation before making any writes.
```

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Maintenance|Maintenance]] - parent index
- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - grandparent index
