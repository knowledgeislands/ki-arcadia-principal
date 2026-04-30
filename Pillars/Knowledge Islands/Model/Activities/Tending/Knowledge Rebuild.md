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

# Knowledge Rebuild

## Overview

A weekly scheduled task that reads all canonical meta notes from the island and rewrites the auto-memory files that Claude uses as working context across sessions. Ensures that any changes to structure, conventions, routing rules, or operational lessons are reflected in Claude's memory without requiring manual intervention.

---

## What It Does

1. Locates the island repository via [[Knowledge Capital]]
2. Reads all canonical meta notes (as listed in [[Canonical Meta Notes]])
3. Reads the existing canonical auto-memory files and compares them against the canonical notes - surfacing gaps, stale content, and anything worth adding before overwriting
4. Verifies cross-references in both directions: KI notes with `memory_file:` frontmatter have a corresponding auto-memory file; auto-memory files with `## KI Sources` reference KI notes that still exist at those paths
5. Prompts for confirmation or additions before proceeding
6. Rewrites the five canonical auto-memory files at `/sessions/*/mnt/.auto-memory/` to reflect the current state of the island. Any auxiliary memory files that have accumulated via ad-hoc session saves (for example domain acronyms, operational lessons, deep memory stores) are left untouched
7. Rewrites `MEMORY.md` to index both the canonical files and any auxiliary files that exist
8. Reports what changed

---

## Gap Analysis Checklist

Run before overwriting any canonical file. The goal is to surface drift between the island and memory, and flag auxiliary files that have become redundant, before committing the rebuild.

**Canonical memory vs KI**

- [ ] List all files in `$MEMORY_DIR` - identify which are canonical (the five managed files) and which are auxiliary (everything else)
- [ ] Read each of the five canonical memory files
- [ ] Compare each against the canonical meta notes - for each file note: gaps (knowledge in KI but absent or thin in memory), stale entries (memory that contradicts the current KI), and candidate additions (KI content not yet captured anywhere in memory)

**Auxiliary memory triage**

- [ ] Scan each auxiliary file for content that duplicates, contradicts, or has been superseded by the canonical notes
- [ ] Flag any auxiliary file whose content is now fully covered by canonical memory - these are candidates for deletion after rebuild
- [ ] Do not rewrite auxiliary files - surface findings for the user to triage manually

**Mapping table check** (requires `Memory Architecture.md` in canonical notes)

- [ ] For every non-deleted row in the KI↔memory mapping table: confirm the listed memory file exists in `$MEMORY_DIR`
- [ ] For every file in `$MEMORY_DIR` (excluding `MEMORY.md`): confirm it has a row in the mapping table
- [ ] Flag missing files and undocumented files as drift between the documented architecture and actual `.auto-memory/` state

**Cross-reference integrity**

- [ ] For every island note with a `memory_file:` frontmatter property: expand `{ki_prefix}` → `$MEMORY_PREFIX` and `{user_prefix}` → `$USER_PREFIX`, then confirm the resolved filename exists in `$MEMORY_DIR`. Flag missing files.
- [ ] For every auto-memory file with a `## KI Sources` section: confirm each listed KI path still exists in the repository. Flag broken paths.

**Before proceeding**

- [ ] Present a concise summary of findings to the user
- [ ] If running attended: wait for confirmation or additions before writing
- [ ] If running unattended: proceed automatically and include findings in the Step 5 report
