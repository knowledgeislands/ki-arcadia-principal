---
tags:
  - card/note
  - topic/productivity
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Weekly automation that rebuilds Claude's memory of the island from canonical meta notes
author: Written with Claude
---

# Knowledge Rebuild

## Overview

A weekly scheduled task that reads all canonical meta notes from the island and rewrites the auto-memory files that Claude uses as working context across sessions. Ensures that any changes to structure, conventions, routing rules, or operational lessons are reflected in Claude's memory without requiring manual intervention.

---

## Schedule

- **Task ID:** `{task-prefix}-knowledge-rebuild` - prefix defined in [[Pillars/Knowledge Capital/Identity|Identity]]
- **Runs:** Wednesdays at ~07:00 - working days defined in [[Pillars/Knowledge Capital/Schedule|Schedule]]
- **Cron:** See [[Pillars/Knowledge Capital/Schedule|Schedule]] → Knowledge Rebuild cron

---

## What It Does

1. Locates the island repository via [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]]
2. Reads all canonical meta notes (as listed in [[Canonical Meta Notes]])
3. Reads the existing canonical auto-memory files and compares them against the canonical notes - surfacing gaps, stale content, and anything worth adding before overwriting
4. Verifies cross-references in both directions: KB notes with `memory_file:` frontmatter have a corresponding auto-memory file; auto-memory files with `## KB Sources` reference KB notes that still exist at those paths
5. Prompts for confirmation or additions before proceeding
6. Rewrites the five canonical auto-memory files at `/sessions/*/mnt/.auto-memory/` to reflect the current state of the island. Any auxiliary memory files that have accumulated via ad-hoc session saves (for example domain acronyms, operational lessons, deep memory stores) are left untouched
7. Rewrites `MEMORY.md` to index both the canonical files and any auxiliary files that exist
8. Reports what changed

---

## Gap Analysis Checklist

Run before overwriting any canonical file. The goal is to surface drift between the KB and memory, and flag auxiliary files that have become redundant, before committing the rebuild.

**Canonical memory vs KB**

- [ ] List all files in `$MEMORY_DIR` - identify which are canonical (the five managed files) and which are auxiliary (everything else)
- [ ] Read each of the five canonical memory files
- [ ] Compare each against the canonical meta notes - for each file note: gaps (knowledge in KB but absent or thin in memory), stale entries (memory that contradicts the current KB), and candidate additions (KB content not yet captured anywhere in memory)

**Auxiliary memory triage**

- [ ] Scan each auxiliary file for content that duplicates, contradicts, or has been superseded by the canonical notes
- [ ] Flag any auxiliary file whose content is now fully covered by canonical memory - these are candidates for deletion after rebuild
- [ ] Do not rewrite auxiliary files - surface findings for the user to triage manually

**Mapping table check** (requires `Memory Architecture.md` in canonical notes)

- [ ] For every non-deleted row in the KB↔memory mapping table: confirm the listed memory file exists in `$MEMORY_DIR`
- [ ] For every file in `$MEMORY_DIR` (excluding `MEMORY.md`): confirm it has a row in the mapping table
- [ ] Flag missing files and undocumented files as drift between the documented architecture and actual `.auto-memory/` state

**Cross-reference integrity**

- [ ] For every KB note with a `memory_file:` frontmatter property: expand `{kb_prefix}` → `$MEMORY_PREFIX` and `{user_prefix}` → `$USER_PREFIX`, then confirm the resolved filename exists in `$MEMORY_DIR`. Flag missing files.
- [ ] For every auto-memory file with a `## KB Sources` section: confirm each listed KB path still exists in the repository. Flag broken paths.

**Before proceeding**

- [ ] Present a concise summary of findings to the user
- [ ] If running attended: wait for confirmation or additions before writing
- [ ] If running unattended: proceed automatically and include findings in the Step 5 report

---

## Prompt

```txt
You are running Knowledge Rebuild. Your job is to read all canonical meta notes from the island and rewrite the auto-memory files so that future Claude sessions have an accurate, up-to-date working context.

## Step 0 - Locate paths and load Knowledge Capital
Run this bash command to find the Knowledge Capital folder and derive the repository root:
  KB_PROPS=$(find /sessions/*/mnt -maxdepth 7 -name "Knowledge Capital.md" -path "*/Knowledge Capital/*" 2>/dev/null | head -1)
  REPOSITORY=$(echo "$KB_PROPS" | sed 's|/Pillars/Knowledge Capital/Knowledge Capital.md||')
  KB_PROPS_DIR=$(dirname "$KB_PROPS")
  echo "Repository: $REPOSITORY"

Run this bash command to find the auto-memory directory:
  ls -d /sessions/*/mnt/.auto-memory 2>/dev/null | head -1
Store the result as MEMORY_DIR.

Read $KB_PROPS_DIR/Identity.md and $KB_PROPS_DIR/Canonical Meta Notes.md.
Extract and store:
- MEMORY_PREFIX (KB Identity → Auto-memory prefix)
- USER_PREFIX (KB Identity → User prefix)
- CANONICAL_NOTES (Canonical Meta Notes → the ordered list of file paths)

## Step 1 - Read all canonical meta notes
Read each file listed in the Canonical Meta Notes note (substituting $REPOSITORY for the root).

## Step 2 - Gap analysis (before overwriting)
List every file in $MEMORY_DIR/ so you can distinguish the five canonical files managed by this rebuild from any auxiliary memory files that have accumulated via ad-hoc session saves. The five canonical filenames are enumerated in Step 3 below; everything else in the directory is auxiliary and must be preserved untouched.

Read each of the five canonical auto-memory files (they may or may not exist). Compare their content against what you just read from the canonical meta notes. For each file, identify:

- **Gaps** - knowledge present in the canonical notes but missing or thin in memory
- **Stale content** - memory entries that contradict or no longer match the canonical notes
- **Candidate additions** - facts, rules, or conventions that appear in the island but are not yet captured anywhere in auto-memory

Also scan the auxiliary memory files for anything that duplicates, contradicts, or has become superseded by content in the canonical notes. Do not rewrite them - surface findings for the user to triage manually.

**Mapping table check:** If `Memory Architecture.md` was read in Step 1, use its KB↔memory mapping table to:
- Confirm every non-deleted row has a corresponding file in `$MEMORY_DIR`. Flag any that are missing.
- Confirm every file in `$MEMORY_DIR` (excluding `MEMORY.md`) has a row in the table. Flag any undocumented files.
This catches drift between the documented architecture and the actual state of `.auto-memory/`.

**Cross-reference check:** Verify bidirectional links between KB notes and auto-memory files:
- For every auto-memory file that has a `## KB Sources` section: confirm each listed KB path still exists in the repository. Flag any broken paths.
- For every KB note that has a `memory_file:` frontmatter property: before resolving, expand any placeholders in the value - substitute `{kb_prefix}` with $MEMORY_PREFIX and `{user_prefix}` with $USER_PREFIX. Then confirm the resolved filename(s) exist in $MEMORY_DIR. Flag any missing files.
Surface broken cross-references alongside the gap analysis findings.

Present a concise summary of your findings to the user. For each candidate addition, describe what it is and which canonical note it comes from. Ask whether anything should be added, adjusted, or left out before the rebuild proceeds.

**Wait for the user's response before continuing to Step 3.** If the task is running unattended (no user present), proceed automatically and note the candidates in the Step 5 report.

---

## Step 3 - Rewrite canonical auto-memory files
Using the content read above (and any additions confirmed by the user), rewrite the five canonical files listed below at $MEMORY_DIR/. Read each file first (it may or may not exist), then write the updated version. Do not touch any auxiliary memory files in this directory - they are preserved between rebuilds.

Use $MEMORY_PREFIX (from KB Identity) as the prefix for KB-specific filenames, and $USER_PREFIX as the prefix for the user profile filename:

**user_{USER_PREFIX}_profile.md** - The user's profile, preferences, and ways of working. Include their role, technical expertise, language preferences, and output format preferences - extract from KB Identity and the operating environment.

**project_{MEMORY_PREFIX}_structure.md** - Full folder layout, routing rules, Pillars/Resources/Streams boundaries, index note rules, Calendar path conventions. Extract from Island Structure and CLAUDE.md.

**project_{MEMORY_PREFIX}_note_format.md** - Note structure, frontmatter fields, tag taxonomy, table formatting rules, H1/filename conventions, footer description requirements. Extract from Notes (Format, Frontmatter).

**feedback_{MEMORY_PREFIX}_operations.md** - All operational rules and known pitfalls: pre-flight check requirement, read-before-write, deletion tool, folder rename rule, voice notes exclusion, merge-not-replace policy, session digest protocol. Extract from Mistakes and Lessons and CLAUDE.md.

**reference_{MEMORY_PREFIX}_key_notes.md** - Canonical paths for all meta notes (use the paths from CLAUDE.md Key Meta Notes table). Include MCP integrations and regular activities schedule. Extract from CLAUDE.md and Regular Activities.

Each file must use this frontmatter format and structure:
---
name: <descriptive name>
description: <one-line description used to decide relevance in future conversations>
type: <user | project | feedback | reference>
---

<memory content>

---

## KB Sources

- `<relative path to KB note>` - <what it contributes to this memory file>
- ...

The `## KB Sources` section is mandatory for all canonical memory files. It lists every KB note that was read to produce this memory file, with a brief note on what each contributes. This enables bidirectional reconciliation: future rebuilds can verify that source notes still exist and haven't drifted.

## Step 4 - Rewrite MEMORY.md index
Read $MEMORY_DIR/MEMORY.md (it may already exist), then rewrite it as a concise index with one line per memory file - covering both the five canonical files and every auxiliary file present in the directory. Format:
- [Title](filename.md) - one-line hook under ~150 characters

## Step 5 - Report
State which files were updated and summarise any meaningful changes from the previous versions. Note any candidate additions that were surfaced in Step 2, and whether they were included or deferred. If nothing changed, say so.

---

## Step 6 - Session Digest

Write a session digest to the Calendar so this run can be reviewed, actioned, and deleted later.

### 6a - Determine the calendar path

Run:
  TODAY=$(date +"%Y-%m-%d")
  DAY_NAME=$(date +"%A")
  YEAR=$(date +"%Y")
  MONTH_FOLDER=$(date +"%Y-%m %B")
  DIGEST_PATH="$REPOSITORY/Calendar/$YEAR/$MONTH_FOLDER/${TODAY} Session - Knowledge Rebuild.md"
  DAILY_NOTE="$REPOSITORY/Calendar/$YEAR/$MONTH_FOLDER/${TODAY} ${DAY_NAME}.md"
  echo "Digest: $DIGEST_PATH"
  echo "Daily note: $DAILY_NOTE"

### 6b - Write the session digest

Write the session digest at $DIGEST_PATH. The note structure:

Frontmatter: tags [calendar/session, source/claude, topic/knowledge-management], status [current - Month YYYY], purpose [Session digest for the Knowledge Rebuild run on YYYY-MM-DD], author [Written with Claude].

H1: "YYYY-MM-DD Session - Knowledge Rebuild"

Sections (separated by --- horizontal rules):
- ## Context - "Weekly Knowledge Rebuild automation. Reads all canonical meta notes from the island and rewrites the five auto-memory files that prime Claude's working context at session start."
- ## Decisions - list which canonical files were rewritten and any fixes applied (from the Step 5 report); if nothing changed materially, state that
- ## Facts Learned - gaps, stale content, or undocumented auxiliary files surfaced during the gap analysis; candidates for deletion or promotion; if nothing notable, state that
- ## Related Projects - bullet: Knowledge Management
- ## Keywords - knowledge rebuild, auto-memory, memory architecture, canonical meta notes

### 6c - Reference from today's daily note

Check whether $DAILY_NOTE exists. If it does:
- Read it
- Locate the `### Sessions` section; if absent, add it before the `## Related Topics` footer (or at the end of the main content if no footer exists)
- Add: `- [[<YYYY-MM-DD> Session - Knowledge Rebuild]] - weekly auto-memory rebuild`
- Write the updated daily note

If the daily note does not exist, skip this step silently.
```

---

## Useful Commands

### Find the auto-memory directory on the Mac filesystem

The auto-memory files are mounted into the Cowork session at `/sessions/*/mnt/.auto-memory/`. To find their actual location on the Mac:

```bash
find ~/Library -name "MEMORY.md" 2>/dev/null
```

Run this in Terminal on the Mac. The result will be the path to `MEMORY.md`; the other auto-memory files sit alongside it in the same directory.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Regular Activities/Maintenance/Maintenance|Maintenance]] - parent index
- [[Pillars/Knowledge Islands/Governance/Regular Activities/Regular Activities|Regular Activities]] - grandparent index
