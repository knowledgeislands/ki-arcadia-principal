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

# Morning Briefing

## Overview

A daily scheduled task that runs each morning to prepare today's daily note, pre-populated with calendar events, meetings, tasks, and inbox items - so the note is ready before the day begins. If no weekly or monthly note exists for the current period, it will create those as well using the appropriate templates.

---

## Schedule

- **Task ID:** `{task-prefix}-morning-briefing` - prefix defined in [[Charter]]
- **Runs:** Working days at ~06:00 AM (with a small jitter) - working days and cron defined in [[Schedule]]
- **Cron:** See [[Schedule]] → Morning Briefing cron

---

## What It Does

Using the integrations configured in [[Integrations|Integrations]], fetches today's calendar events, meetings, tasks (due and overdue), and outstanding inbox items, then creates the daily note pre-populated with that content.

---

## Prompt

The prompt below is the canonical version. It must match the prompt stored in the `{task-prefix}-morning-briefing` scheduled task - see [[Authoring Activities]] § Prompt Editing Discipline.

```txt
You are running the Morning Briefing. Your job is to prepare today's daily note so it is ready before the day begins.

## Step 0 - Locate the repository and load configuration
Run this bash command to find the Knowledge Capital folder and derive the repository root:
  KI_PROPS=$(find /sessions/*/mnt -maxdepth 7 -name "Knowledge Capital.md" -path "*/Knowledge Capital/*" 2>/dev/null | head -1)
  REPOSITORY=$(echo "$KI_PROPS" | sed 's|||')
  KI_PROPS_DIR=$(dirname "$KI_PROPS")
  echo "Repository: $REPOSITORY"

Then read these files:
1. $REPOSITORY/CLAUDE.md - KI operating instructions
2. $REPOSITORY/Pillars/Knowledge Islands/Governance/Tools/Claude/Mistakes and Lessons.md - pre-flight check
3. $KI_PROPS_DIR/Integrations.md - integration configuration (tools, calendar source, inbox path)

The Integrations note is the single source of truth for which MCP tools to use, which TickTick lists to query, and which calendar source to read from. Do NOT hardcode these values - read them from the note.

## Step 1 - Establish today's date and paths
Use bash to get today's date. Calculate:
- Daily note path:   $REPOSITORY/Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD DayName.md  (e.g. Calendar/2026/2026-03 March/2026-03-15 Sunday.md)
- Weekly note path:  $REPOSITORY/Calendar/YYYY/YYYY By Week/YYYY WXX.md  - all weeks for a year are filed in the year's sibling By Week folder  (e.g. Calendar/2026/2026 By Week/2026 W14.md)
- Monthly note path: $REPOSITORY/Calendar/YYYY/YYYY-MM MonthName/YYYY-MM MonthName.md  (e.g. Calendar/2026/2026-03 March/2026-03 March.md)

## Step 2 - Fetch data from integrations
Using the Integrations note loaded in Step 0, gather today's data:

- **Calendar:** If a Calendar MCP integration is listed, fetch all events for today. Format chronologically under ### Tasks, grouped into **Today**.
- **Tasks:** If a Tasks MCP integration is listed:
  - Fetch tasks due today and overdue tasks. Format under ### Tasks, grouped into **Today** and **Overdue**.
  - Also fetch tasks due in the next 5 working days (Mon-Fri only - use bash to calculate the date 5 working days from today, skipping Saturdays and Sundays). Format as a separate **Upcoming** group, with entries in the format `YYYY-MM-DD - task title`. If none, write "Nothing upcoming."
- **Meetings:** If a Meetings MCP integration is listed, check for today's meetings. Add placeholder wikilinks under ### Tasks, grouped into **Today** in the format [[YYYY-MM-DD Meeting Name]] - brief description.
- **Issues:** If an Issues MCP integration is listed, fetch issues assigned to you that are in progress or started, plus any with a due date of today or overdue. Format under ### Tasks, grouped into **Today** (in progress / due today) and **Overdue** (past due date). Include the issue identifier and title.
- **Inbox:** If an Inbox path is listed, check $REPOSITORY/<inbox-path>/ for any files not in _Voice Notes/. List under ### Tasks, grouped into **Future**. If none, write "Inbox clear."
- If none of the above, omit the ### Tasks subsection.

## Step 3 - Create or update today's daily note
If the daily note doesn't exist, create it using the template at $REPOSITORY/Pillars/Knowledge Islands/Governance/Tools/Obsidian/Templates/Calendar - Daily.md.
Populate the briefing content from Step 2 into the appropriate sections of the template.
Leave any sections unrelated to briefing content as empty placeholders - do not remove or alter them.

Set the `day_type` frontmatter property on the daily note (first match wins):
1. Day of week is Saturday or Sunday → `weekend`
2. Date appears in $REPOSITORY/Calendar/YYYY/YYYY UK Bank Holidays.md for the current year → `bank-holiday`
3. Date appears in $REPOSITORY/Calendar/YYYY/YYYY Annual Leave.md → `annual-leave`
4. Otherwise → `work-day`

## Step 4 - Periodic notes
Check whether this week's weekly note exists at the path from Step 1. If not, create it from $REPOSITORY/Pillars/Knowledge Islands/Governance/Tools/Obsidian/Templates/Calendar - Weekly.md.
Check whether this month's monthly note exists at the path from Step 1. If not, create it from $REPOSITORY/Pillars/Knowledge Islands/Governance/Tools/Obsidian/Templates/Calendar - Monthly.md.

Do not ask for confirmation - create the notes and report what was done.
```

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Briefings/Briefings|Briefings]] - parent index
- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - grandparent index
