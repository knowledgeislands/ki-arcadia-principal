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

# Scheduled Task Audit

## Overview

A daily automated task that verifies each live Cowork scheduled task has a corresponding KI note, that schedules and descriptions match, and that this task's own prompt is current. The Conformance Check runs earlier at 04:30; the Scheduled Task Audit runs at 05:00 and is the first maintenance activity of the day.

Full prompt comparison across all tasks is not currently possible - see [[#Known Limitations]] below.

---

## Schedule

- **Task ID:** `{skill-name}-scheduled-task-audit`
- **Runs:** Weekdays at 05:00 - after the Conformance Check (04:30), before all other maintenance and briefing tasks - working days and cron defined in [[Schedule]]
- **Cron:** See [[Schedule]] → Scheduled Task Audit cron

---

## Known Limitations

The Cowork scheduled-tasks MCP has three tools: `create_scheduled_task`, `list_scheduled_tasks`, and `update_scheduled_task`.

`list_scheduled_tasks` returns task metadata only - ID, description, cron expression, enabled state, and run timestamps. **It does not return prompt content.** There is no `get_scheduled_task` tool. Scheduled task SKILL.md files live at `/Users/<user>/Documents/Claude/Scheduled/<taskId>/SKILL.md` on the Mac filesystem and are not mounted into Cowork sessions, so file-based reading is also not possible for tasks other than the currently running one.

The practical effect: this audit can verify schedule/cron/description alignment for all tasks, and can self-verify its own prompt (since the SKILL.md for the running task is mounted in the current session). Prompt comparison for all other tasks is not possible with current tooling.

### Potential future paths

**Option A - Platform feature (preferred):** If `list_scheduled_tasks` is updated to return prompt content, or a `get_scheduled_task` tool is added, prompt comparison can be fully enabled with no changes to this audit's process.

**Option B - Computer-use workaround:** Scheduled task SKILL.md files live at `~/Documents/Claude/Scheduled/<taskId>/SKILL.md` on the Mac filesystem. In principle, computer-use could navigate Finder to that directory and read each file. This would need to be added as an optional step after the main audit, gated on computer-use access being available in the session. It is more fragile than Option A (depends on the path being stable and the user having granted computer-use access) but workable as an interim measure if the platform does not evolve.

---

## Prompt

The prompt below is the canonical version. It must match the prompt stored in the `{skill-name}-scheduled-task-audit` scheduled task - see [[Authoring Guidelines]] § Prompt Editing Discipline.

```txt
You are running the Scheduled Task Audit. Your job is to verify that each live Cowork scheduled task has a corresponding KI note and that schedules match - and to self-verify this task's own prompt. Full prompt comparison across all tasks is not currently possible; see the Known Limitations section in the KI note.

## Step 0 - Locate the repository and load configuration
Run this bash command to find the Knowledge Capital folder and derive the repository root:
  KI_PROPS=$(find /sessions/*/mnt -maxdepth 7 -name "Knowledge Capital.md" -path "*/Knowledge Capital/*" 2>/dev/null | head -1)
  REPOSITORY=$(echo "$KI_PROPS" | sed 's|||')
  ACTIVITIES_DIR="$REPOSITORY/Pillars/Knowledge Islands/Activities"
  echo "Repository: $REPOSITORY"

Then read:
1. $REPOSITORY/CLAUDE.md - KI operating instructions
2. $REPOSITORY/Pillars/Knowledge Islands/Tools/Claude/Mistakes and Lessons.md - pre-flight check
3. $REPOSITORY/Pillars/Knowledge Capital/Charter.md - task ID prefix

## Step 1 - List all scheduled tasks
Call mcp__scheduled-tasks__list_scheduled_tasks to retrieve all scheduled tasks and their metadata.

## Step 2 - Identify the corresponding KI note for each task
For each task whose ID begins with the task prefix from KI Identity, locate the matching activity note in $ACTIVITIES_DIR/. The note filename corresponds to the task name (e.g. {skill-name}-morning-briefing → Morning Briefing.md).

## Step 3 - Verify schedule and description alignment
For each task, read its KI note and check:
- **Cron:** Does the live cron expression match what the KI note documents in its Schedule section?
- **Description:** Does the live task description match the KI note's purpose?
- **No KI note:** Flag any task with no corresponding KI note - do not modify the task.
- **Orphaned notes:** Scan $ACTIVITIES_DIR/ for any note that documents a scheduled task (contains a Task ID field) but has no corresponding live task. Flag these.

## Step 4 - Self-verify this task's prompt
This task's own SKILL.md is mounted at the path returned by:
  find /sessions/*/mnt/uploads -name "SKILL.md" 2>/dev/null | head -1

Read it and compare against the ## Prompt block in $ACTIVITIES_DIR/Tending/Scheduled Task Audit.md. This is the only task whose prompt can be verified with current tooling.

If the KI note is ahead of the live task: call mcp__scheduled-tasks__update_scheduled_task to push the KI version.
If the live task is ahead of the KI note: update the KI note to match, then confirm alignment.

## Step 5 - Report
Output a brief summary:
- Tasks checked: N
- Schedule/description in sync: N / N (list any that differ)
- Prompt verified (this task only): in sync / updated - describe what changed if updated
- Tasks with no KI note: N (list task IDs)
- Orphaned KI notes: N (list)

Write the summary to today's daily note under ## KI, under a ### Scheduled Task Audit heading. If today's daily note does not yet exist (this task runs before the Morning Briefing creates it), skip the daily note write and note it in the output.
```

---

## Procedure

The prompt above runs this automatically. For manual runs, the same steps apply - with the additional ability to do full prompt comparison by reading KI notes and cross-checking against task prompts known from context.

### 1. List all scheduled tasks

Call `mcp__scheduled-tasks__list_scheduled_tasks` to retrieve metadata for all active tasks.

### 2. Identify the corresponding KI note

For each task, locate the matching activity note under `Pillars/Knowledge Islands/Activities/`. The task ID prefix is documented in [[Charter]].

### 3. Verify schedule and description

Compare cron expressions and descriptions against KI note content. Flag mismatches.

### 4. Self-verify prompt (automated runs) / full prompt comparison (manual runs)

Automated: read the mounted SKILL.md and compare against the KI note prompt block. Manual: compare KI note prompt blocks against any known live prompt content.

The KI note is always the canonical source. Push KI → task via `mcp__scheduled-tasks__update_scheduled_task` if the KI is ahead; update the KI note if the live task is ahead.

---

## Sync Protocol

When updating a prompt during an active session: update the KI note first, then push to the scheduled task via `mcp__scheduled-tasks__update_scheduled_task`. Batch edits - do not push after every small change. Push when:

- The user explicitly signals readiness ("push it", "sync the task", "ready to run"), or
- The iteration is confirmed complete, or
- An area has stabilised (no further prompt changes for a few hours within the same conversation) - in this case, proactively suggest syncing before the conversation ends.

## Notes

- Minor whitespace or formatting differences can be ignored if they do not affect execution
- Prompt changes should always originate in the KI note - direct Cowork edits are the primary source of untracked drift
- If a task has no corresponding KI note, create one before the next run
