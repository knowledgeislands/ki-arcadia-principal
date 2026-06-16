---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/automation
status: current - April 2026
author: Written with Claude
---

# What Keeps an Island Alive

## Overview

Routine maintenance keeps the island accurate, well-structured, and free of stale content. Activities are either scheduled (time-driven,
autonomous) or conversational (chat-triggered, human-in-the-loop). Together they implement the maintenance cycle that prevents the island
from drifting from the world it reflects.

Activities divide into two categories. **Constitutional** activities are required of any island adopting Knowledge Islands and cannot be
vetoed - they define the baseline that makes an island valid. All other groups are **adoptable**: each territory must take an explicit
position on each group (adopted or vetoed), with no unknowns permitted. The island's [[Knowledge Capital/Charter|Charter]] is the
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

| Activity                                      | Type          | When      | Summary                 |
| --------------------------------------------- | ------------- | --------- | ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| [[Model/Activities/Constitutional/Conformance | Conformance]] | Scheduled | Island-specific cadence | Verifies constitutional baseline and that all non-constitutional activity groups have an explicit adopted or vetoed position in the Charter |

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

---

## Briefings

Daily automations that prime the island at the start of each day - creating missing calendar infrastructure and surfacing agenda, task, and
inbox context.

| Activity             | Type      | When                      | Summary                                                                                                                                                                                 |
| -------------------- | --------- | ------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [[Morning Briefing]] | Scheduled | Each working day at 06:00 | Prepares today's daily note with calendar events, due and overdue tasks, upcoming tasks for the next 5 working days, and inbox items; creates missing weekly or monthly notes as needed |

---

## Email

Inbox management as a scheduled, repeatable process. The goal is inbox zero across each working day, with each message triaged to a clear
outcome. See [[Approach]] for the shared concepts, definitions, and data model.

| Activity             | Type           | When                                                             | Summary                                                                                                                                                                                             |
| -------------------- | -------------- | ---------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [[Route Drift]]      | Scheduled      | Each working day at 08:00 - _"email route drift"_                | Reads tracking.json5; compares each recorded destination against the email's current folder; prunes re-routed entries and those older than 21 days                                                  |
| [[Route Triage]]     | Scheduled      | Each working day at 09:00, 12:00, 18:00 - _"email route triage"_ | Combined aged archival + inbound routing in a single pass; applies aged rules to existing triage emails, then classifies new inbound with inline aged bypass; replaces Route Aged and Route Inbound |
| [[Route Review]]     | Conversational | _"email route review"_                                           | Runs taxonomy and collision checks; applies agreed/disagreed suggestions from the queue; re-evaluates `_TRIAGE/000 Unknown` against fresh rules                                                     |
| [[Re-route Triaged]] | Conversational | _"email re-route triaged"_                                       | Steps through `_TRIAGE/000 Unknown` one email at a time; confirmed rules are written immediately so subsequent emails in the session benefit                                                        |
| [[Recap]]            | Conversational | _"email recap"_                                                  | Summarises current triage state - folder counts, last run, pending suggestions - without running any processing                                                                                     |
| [[Email Test]]       | Conversational | _"email test"_                                                   | Dry-runs both scheduled activities in order; reports what each would do without making any changes; use after structural changes or to verify a run                                                 |

---

## Linear

Daily automation that keeps the island aligned with the Linear project management workspace, detecting and surfacing drift between stream
notes and the live Linear state.

| Activity        | Type      | When                      | Summary                                                                                                                                                       |
| --------------- | --------- | ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [[Linear Sync]] | Scheduled | Each working day at 09:00 | Compares Linear initiatives and projects against island stream notes and the mapping table; surfaces misalignment; flags candidates for new notes or archival |
