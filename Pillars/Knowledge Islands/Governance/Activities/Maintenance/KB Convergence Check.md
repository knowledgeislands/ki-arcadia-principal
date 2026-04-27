---
tags:
  - card/note
  - topic/productivity
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Adhoc activity to ensure generic Knowledge Management notes remain identical across islands and cross-pollinate improvements
author: Written with Claude
---

# KB Convergence Check

## Overview

An adhoc activity that compares the generic Knowledge Management notes across all islands, surfaces any drift that has accumulated, and propagates improvements from one KB to the others. Ensures the portability model stays intact: KB-specific content stays in [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]], everything else stays identical.

Run this when changes have been made to shared notes in one KB, when a new KB is being onboarded, or as a quarterly health check on the portability structure.

---

## When

Adhoc - _"kb convergence check"_.

---

## What It Does

1. Identifies all islands with the generic Knowledge Management structure
2. Compares each shared note across KBs, flagging any divergence
3. Checks Knowledge Capital files for new parameters that should be standardised
4. Checks Tags for any tags in use that are not yet in the superset
5. Merges and cross-pollinates confirmed improvements back to all KBs
6. Reports what was synced, deferred, or intentionally kept different

---

## Shared notes (must be identical across all KBs)

These notes must remain byte-for-byte identical. Any difference is drift to be resolved.

- `Conventions/Conventions.md`
- `Conventions/Notes/Frontmatter/Tags.md`
- `Conventions/Notes.md`
- `Integrations/ChatGPT/ChatGPT.md`
- `Integrations/Claude/Claude.md`
- `Integrations/Claude/Island Skill.md`
- `Integrations/Integrations.md`
- `Integrations/Linear/Linear.md`
- `Knowledge Management.md`
- `Methodology/Future Improvements.md`
- `Methodology/Methodology.md`
- `Regular Activities/Maintenance/Asset Audit.md`
- `Regular Activities/Maintenance/Health Check.md`
- `Regular Activities/Maintenance/Inbox Review.md`
- `Regular Activities/Maintenance/KB Convergence Check.md`
- `Regular Activities/Maintenance/Knowledge Rebuild.md`
- `Regular Activities/Briefings/Morning Briefing.md`
- `Regular Activities/Maintenance/Status Review.md`
- `Regular Activities/Maintenance/Structural Audit.md`
- `Regular Activities/Maintenance/Wikilink Review.md`

---

## Legitimately KB-specific notes (expected to differ)

These notes are intentionally different between KBs. Do not flag differences here as drift - verify only that the correct version is internally consistent.

| Note | Why it differs |
| --- | --- |
| `Knowledge Capital/` (entire folder) | Identity, skill name, task prefix, integrations, routing rules, and canonical notes list - by design |
| `Conventions/Structure/Structure.md` | Pillars/Resources boundary semantics, Calendar folder naming, and routing rules are specific to each KB |
| `Integrations/Claude/Mistakes and Lessons.md` | Logs KB-specific incidents - accumulates independently in each KB |
| `Regular Activities/Regular Activities.md` | Activity listings vary - each KB includes only the automations it actively runs (e.g. Linear Sync is HNR-only) |
| `Integrations/Claude/Cowork Configuration Layers.md` | The "Recommended Content for the Instructions Box" section contains KB-specific recommendations - organisation description, role, and codebase stack context |

---

## Prompt

```txt
You are running the KB Convergence Check. Your job is to compare the shared Knowledge Management notes across all mounted islands, surface any drift, and propose cross-pollination of improvements.

## Step 0 - Discover all islands
Run this bash command to find all mounted Knowledge Capital folders:
  find /sessions/*/mnt -maxdepth 7 -name "Knowledge Capital.md" -path "*/Knowledge Capital/*" 2>/dev/null

Store the list as KB_PROPS_LIST. For each, derive its REPOSITORY root by stripping "/Pillars/Knowledge Capital/Knowledge Capital.md" and its KB_PROPS_DIR via dirname.
List the KBs found and their names (from KB Identity.md → KB name field in each KB's properties folder).

If fewer than two KBs are found, report this and stop - convergence checking requires at least two KBs.

## Step 1 - Load Knowledge Capital
Read all files in each KB's Knowledge Capital folder. Note any parameters that differ between KBs - these are expected differences (skill name, task prefix, integrations, canonical notes). Note any property files that are unexpectedly absent from one KB.

## Step 2 - Compare shared notes
For each note in the Shared Notes list, read all versions across all KBs. For each note:
- If all versions are identical: mark as ✓ Converged
- If versions differ: identify the specific lines that differ, and determine whether:
  a. The difference is legitimate KB-specific content that slipped into a shared note - flag for extraction to Knowledge Capital
  b. One KB has a genuine improvement or fix the others are missing - flag for cross-pollination
  c. The versions have diverged arbitrarily - flag for reconciliation (pick the best version)

List all findings before proposing any changes.

## Step 3 - Check Tags superset
For each KB, scan for any `topic/*`, `card/*`, `date/*`, or `source/*` tags in use across notes that are not in the shared Tags. Any such tags are candidates for addition to the superset.

List candidates with their meaning inferred from context.

## Step 4 - Propose changes
Present a clear summary of:
- Notes with drift and the proposed resolution for each
- New tags to add to Tags
- Any Knowledge Capital parameters that should be added or standardised

Group by type. Wait for confirmation before making any writes.

## Step 5 - Apply confirmed changes
For each confirmed change:
- If updating a shared note: write the same content to all KBs simultaneously
- If adding tags to Tags: update all KBs simultaneously
- If updating a Knowledge Capital file: update only the relevant KB

## Step 6 - Report
State which files were updated and summarise what was synced, deferred, or intentionally kept different.
```

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Regular Activities/Maintenance/Maintenance|Maintenance]] - parent index
- [[Pillars/Knowledge Islands/Governance/Regular Activities/Regular Activities|Regular Activities]] - grandparent index
- [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] - KB-specific parameters folder that makes portability possible
