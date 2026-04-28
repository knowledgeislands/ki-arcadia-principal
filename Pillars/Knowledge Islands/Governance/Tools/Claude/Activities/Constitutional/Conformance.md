---
tags:
  - card/prompt
  - topic/ai
  - topic/automation
  - topic/knowledge-islands
status: current - April 2026
purpose: Layer 5 prompt for the Conformance Check - verifies constitutional baseline and adoption completeness and consistency
author: Written with Claude
---

# Conformance Check - Prompt

## Overview

This is the executable prompt for the Conformance Check. It is a read-only activity: no files are modified. The output is a structured conformance report surfacing issues for human review.

Layer 1 specification: [[Pillars/Knowledge Islands/Governance/Activities/Constitutional/Conformance|Conformance]] Island configuration: [[Pillars/Knowledge Capital/Charter|Charter]]

---

## Prompt

Read this prompt in full before taking any action.

---

You are running the KI Conformance Check. This is a constitutional activity - it verifies that the island meets its Knowledge Islands baseline and that its adoption record is complete and internally consistent. It is read-only: make no changes to any file.

### Preparation

Read all of the following before proceeding. Do not skip any.

1. `Pillars/Knowledge Capital/Charter.md` - the island's charter: identity parameters, adoption record, and activity roster
2. `Pillars/Knowledge Islands/Governance/Activities/Activities.md` - the full list of activity groups defined in the framework

### Step 1 - Constitutional baseline

Check each of the two constitutional elements in turn.

**Charter.** The file `Pillars/Knowledge Capital/Charter.md` must exist and contain both parts:

- An Identity section with at minimum: an island name, a KB skill identifier, and a task prefix. Flag as CRITICAL if any of these fields are missing.
- An Activity Groups table with at least one row carrying a clear `adopted` or `vetoed` position; a Scheduled Activities table; and a Tools section. Flag as CRITICAL if any of these sections are absent or the Activity Groups table is empty.

Flag as CRITICAL if the file is absent or empty.

**Conformance.** Check that the Conformance Check appears in the Charter's Scheduled Activities table with status `enabled`. Flag as CRITICAL if it is absent or carries any other status.

### Step 2 - Adoption completeness

From the Activities index you read in preparation, extract all top-level activity groups. Exclude `Constitutional` - it is not subject to the adoption model.

For each remaining group, check whether the Charter's Activity Groups table contains a row for that group with either `adopted` or `vetoed` in the Position column.

- Present with a clear position → pass
- Present but position is neither `adopted` nor `vetoed` → flag as non-conformant: ambiguous position
- Absent from the Charter entirely → flag as non-conformant: unknown

### Step 3 - Adoption consistency

Work through each group in the Charter's Activity Groups table.

**For each vetoed group:** Read the file path given in the Knowledge Capital column. Verify the file exists and explicitly states the veto - a note that is merely empty or a bare title does not count. Flag as non-conformant if the file is absent or does not acknowledge the veto.

**For each adopted group:** Read the file path given in the Knowledge Capital column (the group's KC index note). Then read the corresponding group index note in `Pillars/Knowledge Islands/Governance/Activities/[Group]/[Group].md`. Find the Adoption Requirements section in that note and extract the list of required KC note paths.

For each required KC note:

- Verify the file exists at the stated path
- Verify it is not a N/A stub (a stub explicitly states "not applicable" or "vetoed" - an adopted group must not have these)
- If missing or is a stub → flag as non-conformant, naming the group and the specific missing note

### Reporting

Produce a conformance report with the following structure.

---

**KI Conformance Report - [Island Name] - [Date]**

**Constitutional Baseline** [Pass - or list each CRITICAL failure with a one-line description]

**Adoption Completeness** [Pass - or list each unknown or ambiguous group]

**Adoption Consistency** [Pass - or list each inconsistency, naming the group and the specific KC note that is missing or incorrect]

**Overall status: [CONFORMANT / NON-CONFORMANT (CRITICAL) / NON-CONFORMANT]**

- `CONFORMANT` - all three sections pass
- `NON-CONFORMANT (CRITICAL)` - one or more CRITICAL failures in the constitutional baseline
- `NON-CONFORMANT` - no critical failures but standard non-conformances exist in completeness or consistency

---

Present the report, then stop. Do not propose fixes, do not modify files, do not begin any other activity.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Activities/Constitutional/Constitutional|Constitutional (Claude Prompts)]] - parent index
- [[Pillars/Knowledge Islands/Governance/Activities/Constitutional/Conformance|Conformance]] - Layer 1 specification
- [[Pillars/Knowledge Capital/Charter|Charter]] - primary input
