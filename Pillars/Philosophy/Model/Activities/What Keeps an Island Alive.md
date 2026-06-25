---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/automation
status: current - June 2026
author: Written with Claude
---

# What Keeps an Island Alive

## Overview

Routine maintenance keeps the island accurate, well-structured, and free of stale content. Activities are either scheduled (time-driven,
autonomous) or conversational (chat-triggered, human-in-the-loop). Together they implement the maintenance cycle that prevents the island
from drifting from the world it reflects.

Activities divide into two categories. **Constitutional** activities are required of any island adopting Knowledge Islands and cannot be
vetoed - they define the baseline that makes an island valid. All other groups are **adoptable**: each territory must take an explicit
position on each group (adopted or vetoed), with no unknowns permitted. The island's [[Admin/Governance/Charter|Charter]] is the
authoritative record of adoption decisions.

The content here covers what each activity does and why. The prompts that drive them - Claude-specific and island-specific - live in
[[Claude/Activities/Activities|Tools/Claude/Activities]]. For the content layers and prompt authoring conventions, see
[[Authoring Guidelines]].

---

## Authoring Guidelines

Authoring Guidelines documents the content layers for activity prompts and the conventions for writing, updating, and layering them. It is
the prerequisite for anyone working with the Prompt notes in Tools/Claude/Activities, and the reference for understanding how a generic
activity note and an island-specific prompt relate to each other.

## Constitutional

The constitutional baseline required of any Knowledge Island. Not subject to the adoption framework - these activities define what it means
to be a Knowledge Island at all.

| Activity                                                     | Type      | When                    | Summary                                                                                                                                     |
| ------------------------------------------------------------ | --------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| [[Model/Activities/Constitutional/Conformance\|Conformance]] | Scheduled | Island-specific cadence | Verifies constitutional baseline and that all non-constitutional activity groups have an explicit adopted or vetoed position in the Charter |

---

## Tending

Activities that keep the island structurally sound, content-healthy, and free of stale or orphaned material - spanning daily automations
through to weekly reviews and deeper adhoc audits.

| Activity                 | Type           | When                      | Summary                                                                                                              |
| ------------------------ | -------------- | ------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| [[Scheduled Task Audit]] | Scheduled      | Each working day at 05:00 | Compares live scheduled task prompts against island notes; reconciles any drift; runs first before other automations |
| [[Health Check]]         | Scheduled      | Mondays at 08:00          | Reviews structural drift, skill alignment, and content health across the repository                                  |
| [[Knowledge Rebuild]]    | Scheduled      | Wednesdays at 07:00       | Reconstructs Claude's auto-memory from canonical meta notes; keeps the memory layer accurate as the island evolves   |
| [[Inbox Review]]         | Conversational | _"ki inbox review"_       | Weekly - processes notes held in the `+/` inbox and files them to the correct Pillar or Stream                       |
| [[Asset Audit]]          | Conversational | _"ki asset audit"_        | Weekly - surfaces unlinked repository assets and removes redundant ones                                              |
| [[Status Review]]        | Conversational | _"ki status review"_      | Weekly - updates `status` frontmatter fields when a note's standing has changed                                      |
| [[Structural Audit]]     | Conversational | _"ki structural audit"_   | Adhoc - comprehensive structural review of an island section or the whole repository                                 |
| [[Wikilink Review]]      | Conversational | _"ki wikilink review"_    | Adhoc - surfaces broken wikilinks and orphan notes across the repository                                             |
| [[Convergence Check]]    | Conversational | _"ki convergence check"_  | Adhoc - compares shared notes across all islands; surfaces drift; cross-pollinates improvements                      |
