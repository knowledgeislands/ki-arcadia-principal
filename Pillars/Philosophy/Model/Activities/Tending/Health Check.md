---
note_type: pillars/note
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

A weekly scheduled task that reviews the island for structural drift, alignment between the root agent instructions and the island's skills, and content health, then proposes any revisions for confirmation. Runs Monday mornings to set up the week with a clean, up-to-date island.

---

## What It Does

Reviews the island for structural or content issues and proposes revisions. It first loads [[Mistakes and Lessons]], so that known pitfalls inform the review. Specifically checks:

- **Instructions and skill alignment** - reads the root `AGENTS.md` and the island's installed skills, identifies any gaps or drift between the two, and proposes updates to whichever side has drifted; also flags island content that contradicts the root agent instructions
- **ADR drift review** - checks each ADR in the island against the architecture and domain notes it underpins; flags any ADRs where the decision appears to have been superseded or where the related notes have diverged from the recorded decision; also flags areas where a new architectural decision appears to have been made but not yet captured as an ADR
- General island health - orphaned notes, broken wikilinks, routing anomalies, or stale content worth archiving; inbox items in `+/` older than a week are flagged for routing
- **Index note audit** - checks that every folder outside the `+` and `-` staging areas has a same-name index note with an `## Overview` and one substantive H2 per direct child, flags children with no section and sections whose child no longer exists, and confirms that [[Streams]], [[Roadmap]] and the roadmap allocation ledger still agree with the flat roadmap records

All proposed changes are surfaced for confirmation before anything is written.
