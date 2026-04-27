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

Maintenance activities keep the island structurally sound, content-healthy, and aligned with the world it reflects. Without them, drift accumulates silently: notes go stale, wikilinks break as notes move, auto-memory diverges from the KB, scheduled task prompts fall out of sync with their KB notes, and the inbox fills with uncaptured material. Maintenance is the mechanism that prevents that entropy — running on a regular cadence, lightweight enough to be sustainable, thorough enough to catch what matters.

Activities divide by cadence and initiation. Three are scheduled automations that run without human prompting: the Scheduled Task Audit (daily, runs first), the Health Check (weekly), and the Knowledge Rebuild (midweek). Six are conversational: triggered by phrase, human-in-the-loop, run when the maintenance window arrives or when a specific need arises.

---

## Scheduled Task Audit

[[Scheduled Task Audit]] runs each working day at 05:00, before any other automations. It compares the live scheduled task prompts in Cowork against their corresponding KB notes in this folder, reconciling any drift between the two. If a prompt has changed since the KB note was last updated, or if a scheduled task exists without a KB note (or vice versa), the audit surfaces the discrepancy for resolution. It is the quality gate that ensures the five-layer model stays coherent at the boundary between Layers 1 and 5.

---

## Health Check

[[Health Check]] runs each Monday at 08:00. It reviews the island for structural drift — index notes without their folders, notes without correct frontmatter, orphaned content, skills that no longer align with activities — and produces a report of issues requiring attention. It operates at a higher level than the Wikilink Review, covering the health of the KB as a system rather than individual broken references.

---

## Knowledge Rebuild

[[Knowledge Rebuild]] runs each Wednesday at 07:00. It reconstructs Claude's canonical auto-memory from the KB's meta notes, ensuring that the memory layer stays accurate as the KB evolves. Notes with a `memory_file:` frontmatter property are the sources; the rebuild reads them, distils their content, and writes or updates the corresponding canonical memory files. Auxiliary memory files that are fully covered by the rebuilt canonical layer are deleted. This is the mechanism that keeps the KB as the source of truth for memory, rather than letting memory drift into its own independent state.

---

## Inbox Review

[[Inbox Review]] is triggered conversationally with _"kb inbox review"_, typically weekly. It processes notes held in the `+/` inbox — voice note transcripts, quick captures, and other unsorted material — routing each to its correct permanent home in `Pillars`, `Resources`, or `Streams`, and creating any necessary index notes. Items that cannot be placed are flagged for human decision. The inbox should not be the permanent home for any note; this review keeps it clear.

---

## Asset Audit

[[Asset Audit]] is triggered with _"kb asset audit"_, typically weekly. It surfaces binary assets (images, PDFs, attachments) that are not linked from any note, redundant duplicates, and assets stored in wrong locations (e.g. in `+/` rather than alongside the note they support). Unlinked assets are candidates for deletion; misplaced assets are moved. Keeps the binary store clean and co-located with the text store.

---

## Status Review

[[Status Review]] is triggered with _"kb status review"_, typically weekly. It sweeps the vault for notes whose `status` frontmatter field no longer reflects their actual standing — notes marked `current` that contain stale content, or `draft` notes that have matured to current. Updated status fields keep Obsidian filters and dataview queries accurate. A note with an outdated status is effectively invisible to queries that rely on it.

---

## Structural Audit

[[Structural Audit]] is triggered with _"kb structural audit"_ and run adhoc — typically when a significant restructure has been completed, or when the overall KB health is uncertain. It performs a comprehensive review of an island section or the whole repository: folder structure against conventions, index notes against their folders, wikilink validity, routing compliance, and boundary enforcement between Pillars and Resources. More thorough than the Health Check; intended for periodic deep review rather than regular cadence.

---

## Wikilink Review

[[Wikilink Review]] is triggered with _"kb wikilink review"_ and run adhoc. It surfaces broken wikilinks — references to notes that have moved, been renamed, or deleted — and orphan notes that are not referenced from anywhere. Broken links are repaired or removed; orphans are either linked in or assessed for deletion. Should be run after any significant file movement or rename operation.

---

## KB Convergence Check

[[KB Convergence Check]] is triggered with _"kb convergence check"_ and run adhoc. It compares notes shared across multiple KBs in the same archipelago, surfaces drift between versions, and identifies improvements in one KB that should be cross-pollinated to others. Relevant for islands that maintain parallel notes (e.g. shared governance notes in both Arcadia and a satellite island). Not relevant for standalone islands.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - parent index
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Activities/Maintenance/Maintenance|Tools/Claude/Activities/Maintenance]] - Layer 5 prompts that drive these activities
