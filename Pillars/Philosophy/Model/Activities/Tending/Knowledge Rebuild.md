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

# Knowledge Rebuild

## Overview

A weekly scheduled task that reads the canonical meta notes in the island and rewrites the memory files the agent runtime uses as working context across sessions. It ensures that any changes to structure, conventions, routing rules or operational lessons are reflected in the agent's memory without manual intervention.

---

## What It Does

1. Locates the island repository via [[Admin/Governance/Governance|Admin/Governance]]
2. Reads all canonical meta notes (as listed in [[Canonical Meta Notes]])
3. Reads the existing canonical memory files and compares them against the canonical notes - surfacing gaps, stale content, and anything worth adding before overwriting
4. Verifies cross-references in both directions: KI notes with `memory_file:` frontmatter have a corresponding memory file; memory files with `## KI Sources` reference KI notes that still exist at those paths
5. Prompts for confirmation or additions before proceeding
6. Rewrites the five canonical memory files (listed under Canonical Memory Files) in the runtime's memory directory to reflect the current state of the island. Any auxiliary memory files accumulated through ad-hoc session saves (for example domain acronyms, operational lessons or deep memory stores) are left untouched
7. Rewrites the `MEMORY.md` index so that it lists both the canonical files and every auxiliary file that exists
8. Reports what changed
9. Closes with a session digest, filed as a sibling Calendar note and referenced from the daily note

---

## Canonical Memory Files

The rebuild manages exactly five canonical files. `{ki_prefix}` and `{user_prefix}` are the island's prefixes from the [[Admin/Governance/Charter|Charter]].

| File | Contents |
| --- | --- |
| `user_{user_prefix}_profile.md` | The user's role, expertise, language and output-format preferences, and ways of working |
| `project_{ki_prefix}_structure.md` | Folder layout, routing rules, zone boundaries, index-note rules and Calendar path conventions |
| `project_{ki_prefix}_note_format.md` | Note structure, frontmatter fields, tag taxonomy, table formatting and title conventions |
| `feedback_{ki_prefix}_operations.md` | Operational rules and known pitfalls, drawn from [[Mistakes and Lessons]] and the Activities |
| `reference_{ki_prefix}_key_notes.md` | Canonical paths to the meta notes, integrations and the activity schedule |

Every canonical file carries frontmatter with `name`, `description` and `type`, and ends with a mandatory `## KI Sources` section listing the island notes it was distilled from. Island notes declare the reverse link through the `memory_file:` frontmatter convention in [[Residency]].

---

## Gap Analysis Checklist

Run before overwriting any canonical file. The goal is to surface drift between the island and memory, and flag auxiliary files that have become redundant, before committing the rebuild.

**Canonical memory vs KI**

- [ ] List all files in the memory directory - identify which are canonical (the five managed files) and which are auxiliary (everything else)
- [ ] Read each of the five canonical memory files
- [ ] Compare each against the canonical meta notes - for each file note: gaps (knowledge in KI but absent or thin in memory), stale entries (memory that contradicts the current KI), and candidate additions (KI content not yet captured anywhere in memory)

**Auxiliary memory triage**

- [ ] Scan each auxiliary file for content that duplicates, contradicts, or has been superseded by the canonical notes
- [ ] Flag any auxiliary file whose content is now fully covered by canonical memory - these are candidates for deletion after rebuild
- [ ] Do not rewrite auxiliary files - surface findings for the user to triage manually

**Canonical file check** (uses the canonical-file list above and the `memory_file:` convention in [[Residency]])

- [ ] Confirm that each of the five canonical files exists in the memory directory
- [ ] Classify every other file in the memory directory (excluding `MEMORY.md`) as auxiliary, and confirm that `MEMORY.md` lists it
- [ ] Flag missing canonical files and any `memory_file:` declaration that names no file in the memory directory

**Cross-reference integrity**

- [ ] For every island note with a `memory_file:` frontmatter property: expand `{ki_prefix}` → `$MEMORY_PREFIX` and `{user_prefix}` → `$USER_PREFIX`, then confirm the resolved filename exists in the memory directory. Flag missing files.
- [ ] For every memory file with a `## KI Sources` section: confirm each listed KI path still exists in the repository. Flag broken paths.

**Before proceeding**

- [ ] Present a concise summary of findings to the user
- [ ] If running attended: wait for confirmation or additions before writing
- [ ] If running unattended: proceed automatically and include findings in the Step 5 report
