---
tags:
  - card/note
  - topic/productivity
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Index of island maintenance activities - scheduled and conversational
author: Written with Claude
---

# Maintenance

## Overview

Activities that keep the island structurally sound, content-healthy, and free of stale or orphaned material - spanning daily automations through to weekly reviews and deeper adhoc audits.

---

## Activities

| Activity                 | Type           | When                      | Summary                                                                                                          |
| ------------------------ | -------------- | ------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| [[Scheduled Task Audit]] | Scheduled      | Each working day at 05:00 | Compares live scheduled task prompts against KB notes; reconciles any drift; runs first before other automations |
| [[Health Check]]         | Scheduled      | Mondays at 08:00          | Reviews structural drift, skill alignment, and content health across the repository                              |
| [[Knowledge Rebuild]]    | Scheduled      | Wednesdays at 07:00       | Reconstructs Claude's auto-memory from canonical meta notes; keeps the memory layer accurate as the KB evolves   |
| [[Inbox Review]]         | Conversational | _"kb inbox review"_       | Weekly - processes notes held in the `+/` inbox and files them to the correct Pillar or Stream                   |
| [[Asset Audit]]          | Conversational | _"kb asset audit"_        | Weekly - surfaces unlinked repository assets and removes redundant ones                                          |
| [[Status Review]]        | Conversational | _"kb status review"_      | Weekly - updates `status` frontmatter fields when a note's standing has changed                                  |
| [[Structural Audit]]     | Conversational | _"kb structural audit"_   | Adhoc - comprehensive structural review of an island section or the whole repository                      |
| [[Wikilink Review]]      | Conversational | _"kb wikilink review"_    | Adhoc - surfaces broken wikilinks and orphan notes across the repository                                         |
| [[KB Convergence Check]] | Conversational | _"kb convergence check"_  | Adhoc - compares shared notes across all KBs; surfaces drift; cross-pollinates improvements                      |

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - parent index
- [[Pillars/Knowledge Islands/Governance/Governance|Governance]] - overarching knowledge management index
