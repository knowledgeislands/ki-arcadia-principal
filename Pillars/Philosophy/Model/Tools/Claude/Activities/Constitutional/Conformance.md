---
note_type: pillars/note
tags:
  - card/note
  - topic/ai
  - topic/automation
  - topic/knowledge-islands
status: current - October 2026
author: Written with Claude
---

# Conformance Check

## Overview

This is the executable prompt for the Conformance Check. It is a read-only activity: no files are modified. The output is a structured conformance report surfacing issues for human review.

This prompt runs the activity defined in [[Model/Activities/Constitutional/Conformance|Conformance Check]]. It reads the island's adoption record and activity roster from the island [[Admin/Governance/Charter|Charter]].

---

## Prompt

Read this prompt in full before taking any action.

---

You are running the KI Conformance Check. This is a constitutional activity - it verifies that the island meets its Knowledge Islands baseline and that its adoption record is complete and internally consistent. It is read-only: make no changes to any file.

### Preparation

Read all of the following before proceeding. Do not skip any.

1. `Admin/Governance/Charter.md` - the island's charter: identity parameters, adoption record, and activity roster
2. `Pillars/Philosophy/Model/Activities/Activities.md` - the framework's activities index; each activity group is a subfolder of `Pillars/Philosophy/Model/Activities/` with a same-name index note. List those subfolders and read each index note (`Pillars/Philosophy/Model/Activities/[Group]/[Group].md`)

### Step 1 - Constitutional baseline

Check each of the two constitutional elements in turn.

**Charter.** The file `Admin/Governance/Charter.md` must exist and contain both parts:

- An `## Identity` section with at minimum: an island name, an island skill identifier (the Skill name row), and a task prefix (the Task ID prefix row). Flag as CRITICAL if any of these fields are missing.
- An `## Activity Groups` table with at least one row carrying a clear `adopted` or `vetoed` position; a `## Scheduled Activities` table; and a `## Tools` section. Flag as CRITICAL if any of these sections are absent or the Activity Groups table is empty.

Flag as CRITICAL if the file is absent or empty.

**Conformance.** Check that the Conformance Check appears in the Charter's Scheduled Activities table with status `enabled`. Flag as CRITICAL if it is absent or carries any other status.

### Step 2 - Adoption completeness

Identify the framework activity groups. A framework group is a subfolder of `Pillars/Philosophy/Model/Activities/` whose same-name index note (`Pillars/Philosophy/Model/Activities/[Group]/[Group].md`) carries an `## Adoption Requirements` section with a Note | Path | Purpose table. Exclude `Constitutional` - it is not subject to the adoption model. A subfolder whose index has no such table (for example one that only documents the table format) is not a group.

For each framework group, check whether the Charter's Activity Groups table contains a row for that group with either `adopted` or `vetoed` in the Position column.

- Present with a clear position → pass
- Present but position is neither `adopted` nor `vetoed` → flag as non-conformant: ambiguous position
- Absent from the Charter entirely → flag as non-conformant: unknown

A Charter row whose group has no framework group index is island-local. List it as informational in the report; it is not non-conformant.

### Step 3 - Adoption consistency

Work through each group in the Charter's Activity Groups table. Resolve the note linked in its Activity Definition column relative to the repository root, appending `.md` where the link omits it.

**For each vetoed group:** Read the linked Activity Definition note. Verify the file exists and explicitly states the veto - a note that is merely empty or a bare title does not count. Flag as non-conformant if the file is absent or does not acknowledge the veto.

**For each adopted group:** Read the linked Activity Definition note and verify it exists and is not a N/A stub (see the stub test below). Flag as non-conformant if it is absent or a stub. If the group has a framework group index, read the `## Adoption Requirements` table in `Pillars/Philosophy/Model/Activities/[Group]/[Group].md` and extract each required note's Path. An island-local group has no Adoption Requirements to check beyond its Activity Definition note.

For each required note:

- Verify the file exists at the stated Path, resolved relative to the repository root with `.md` appended
- Verify it is not a N/A stub (a stub explicitly states "not applicable" or "vetoed" - an adopted group must not have these)
- If missing or is a stub → flag as non-conformant, naming the group and the specific missing note

### Reporting

Produce a conformance report with the following structure.

---

**KI Conformance Report - [Island Name] - [Date]**

**Constitutional Baseline** [Pass - or list each CRITICAL failure with a one-line description]

**Adoption Completeness** [Pass - or list each unknown or ambiguous group; list any island-local groups as informational]

**Adoption Consistency** [Pass - or list each inconsistency, naming the group and the specific required note that is missing or incorrect]

**Overall status: [CONFORMANT / NON-CONFORMANT (CRITICAL) / NON-CONFORMANT]**

- `CONFORMANT` - all three sections pass
- `NON-CONFORMANT (CRITICAL)` - one or more CRITICAL failures in the constitutional baseline
- `NON-CONFORMANT` - no critical failures but standard non-conformances exist in completeness or consistency

---

Present the report, then stop. Do not propose fixes, do not modify files, do not begin any other activity.
