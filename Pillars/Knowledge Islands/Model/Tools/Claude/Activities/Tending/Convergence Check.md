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

# Convergence Check

## Overview

The Claude agent specific activity prompt for the Convergence Check activity. This is maintained as an agentic AI specific task instruction
that it can easily use at runtime rather than having to read and understand all of the note hierachy and inheritance at runtime.

---

## Prompt

```txt
You are running the Convergence Check. Your job is to compare the shared Knowledge Management notes across all mounted islands, surface any drift, and propose cross-pollination of improvements.

## Step 0 - Discover all islands
Run this bash command to find all mounted Knowledge Capital folders:
  find /sessions/*/mnt -maxdepth 7 -name "Knowledge Capital.md" -path "*/Knowledge Capital/*" 2>/dev/null

Store the list as KI_PROPS_LIST. For each, derive its REPOSITORY root by stripping "/Pillars/Knowledge Capital/Knowledge Capital.md" and its KI_PROPS_DIR via dirname.
List the KIs found and their names (from KI Identity.md → KI name field in each KI's properties folder).

If fewer than two KIs are found, report this and stop - convergence checking requires at least two KIs.

## Step 1 - Load Knowledge Capital
Read all files in each KI's Knowledge Capital folder. Note any parameters that differ between KIs - these are expected differences (skill name, task prefix, integrations, canonical notes). Note any property files that are unexpectedly absent from one KI.

## Step 2 - Compare shared notes
For each note in the Shared Notes list, read all versions across all KIs. For each note:
- If all versions are identical: mark as ✓ Converged
- If versions differ: identify the specific lines that differ, and determine whether:
  a. The difference is legitimate KI-specific content that slipped into a shared note - flag for extraction to Knowledge Capital
  b. One KI has a genuine improvement or fix the others are missing - flag for cross-pollination
  c. The versions have diverged arbitrarily - flag for reconciliation (pick the best version)

List all findings before proposing any changes.

## Step 3 - Check Tags superset
For each KI, scan for any `topic/*`, `card/*`, `date/*`, or `source/*` tags in use across notes that are not in the shared Tags. Any such tags are candidates for addition to the superset.

List candidates with their meaning inferred from context.

## Step 4 - Propose changes
Present a clear summary of:
- Notes with drift and the proposed resolution for each
- New tags to add to Tags
- Any Knowledge Capital parameters that should be added or standardised

Group by type. Wait for confirmation before making any writes.

## Step 5 - Apply confirmed changes
For each confirmed change:
- If updating a shared note: write the same content to all KIs simultaneously
- If adding tags to Tags: update all KIs simultaneously
- If updating a Knowledge Capital file: update only the relevant KI

## Step 6 - Report
State which files were updated and summarise what was synced, deferred, or intentionally kept different.
```
