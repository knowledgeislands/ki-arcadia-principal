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

# Tending

## Overview

Tending activities keep the island structurally sound, content-healthy, and aligned with the world it reflects. Without them, drift accumulates silently: notes go stale, wikilinks break as notes move, auto-memory diverges from the island, scheduled task prompts fall out of sync with their island notes, and the inbox fills with uncaptured material. Tending is the mechanism that prevents that entropy - running on a regular cadence, lightweight enough to be sustainable, thorough enough to catch what matters.

Activities divide by cadence and initiation. Three are scheduled automations that run without human prompting: the Scheduled Task Audit (daily, runs first), the Health Check (weekly), and the Knowledge Rebuild (midweek). Six are conversational: triggered by phrase, human-in-the-loop, run when the maintenance window arrives or when a specific need arises.

---

## Scheduled Task Audit

[[Scheduled Task Audit]] runs each working day at 05:00, before any other automations. It compares the live scheduled task prompts in Cowork against their corresponding island notes in this folder, reconciling any drift between the two. If a prompt has changed since the island note was last updated, or if a scheduled task exists without an island note (or vice versa), the audit surfaces the discrepancy for resolution. It is the quality gate that ensures the content layers stay coherent at the boundary between Definition and Prompt.

---

## Health Check

[[Health Check]] runs each Monday at 08:00. It reviews the island for structural drift - index notes without their folders, notes without correct frontmatter, orphaned content, skills that no longer align with activities - and produces a report of issues requiring attention. It operates at a higher level than the Wikilink Review, covering the health of the island as a system rather than individual broken references.

---

## Knowledge Rebuild

[[Knowledge Rebuild]] runs each Wednesday at 07:00. It reconstructs Claude's canonical auto-memory from the island's meta notes, ensuring that the memory layer stays accurate as the island evolves. Notes with a `memory_file:` frontmatter property are the sources; the rebuild reads them, distils their content, and writes or updates the corresponding canonical memory files. Auxiliary memory files that are fully covered by the rebuilt canonical layer are deleted. This is the mechanism that keeps the island as the source of truth for memory, rather than letting memory drift into its own independent state.

---

## Inbox Review

[[Inbox Review]] is triggered conversationally with _"ki inbox review"_, typically weekly. It processes notes held in the `+/` inbox - voice note transcripts, quick captures, and other unsorted material - routing each to its correct permanent home in `Pillars`, `Resources`, or `Streams`, and creating any necessary index notes. Items that cannot be placed are flagged for human decision. The inbox should not be the permanent home for any note; this review keeps it clear.

---

## Asset Audit

[[Asset Audit]] is triggered with _"ki asset audit"_, typically weekly. It surfaces binary assets (images, PDFs, attachments) that are not linked from any note, redundant duplicates, and assets stored in wrong locations (e.g. in `+/` rather than alongside the note they support). Unlinked assets are candidates for deletion; misplaced assets are moved. Keeps the binary store clean and co-located with the text store.

---

## Status Review

[[Status Review]] is triggered with _"ki status review"_, typically weekly. It sweeps the island for notes whose `status` frontmatter field no longer reflects their actual standing - notes marked `current` that contain stale content, or `draft` notes that have matured to current. Updated status fields keep Obsidian filters and dataview queries accurate. A note with an outdated status is effectively invisible to queries that rely on it.

---

## Structural Audit

[[Structural Audit]] is triggered with _"ki structural audit"_ and run ad hoc - typically when a significant restructure has been completed, or when the overall island health is uncertain. It performs a comprehensive review of an island section or the whole repository: folder structure against conventions, index notes against their folders, wikilink validity, routing compliance, and boundary enforcement between Pillars and Resources. More thorough than the Health Check; intended for periodic deep review rather than regular cadence.

---

## Wikilink Review

[[Wikilink Review]] is triggered with _"ki wikilink review"_ and run ad hoc. It surfaces broken wikilinks - references to notes that have moved, been renamed, or deleted - and orphan notes that are not referenced from anywhere. Broken links are repaired or removed; orphans are either linked in or assessed for deletion. Should be run after any significant file movement or rename operation.

---

## Convergence Check

[[Convergence Check]] is triggered with _"ki convergence check"_ and run ad hoc. It compares notes shared across multiple islands in the same archipelago, surfaces drift between versions, and identifies improvements in one island that should be cross-pollinated to others. Relevant for islands that maintain parallel notes (e.g. shared governance notes in both Arcadia and a satellite island). Not relevant for standalone islands.

---

## Adoption Requirements

To adopt this activity group, an island must create the following Knowledge Capital notes. A vetoed island must create an index stub at `Knowledge Capital/Activities/Tending/Tending` acknowledging the veto.

| Note          | Path                                           | Purpose                                                   |
| ------------- | ---------------------------------------------- | --------------------------------------------------------- |
| Tending index | `Knowledge Capital/Activities/Tending/Tending` | Group index; confirms adoption and links to timing config |
| Schedule      | `Knowledge Capital/Activities/Schedule`        | Day-type taxonomy read by all scheduled automations       |
