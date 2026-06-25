---
tags:
  - card/note
  - topic/productivity
  - topic/knowledge-management
  - source/claude
status: current - April 2026
author: Written with Claude
---

# Structural Audit

## Overview

A comprehensive, hands-on review of the island's structure, note quality, and conformance to Knowledge Management conventions. Unlike the
lighter weekly checks, a structural audit is a focused session (or series of sessions) that systematically examines a scope of the
repository and brings it into full alignment.

Structural audits are run adhoc - when the Knowledge Management approach has meaningfully evolved, when a section of the repository has
grown without oversight, or after a period of heavy note-taking that has outpaced curation.

---

## When

Adhoc - _"ki structural audit"_.

---

## Scope and Coverage

A full structural audit typically covers one or more of the following:

### Index Note Audit

Ensure every folder has a same-named index note. For each folder:

1. Run `os.walk` (or equivalent) against the repository
2. Identify any folder whose name does not have a corresponding `.md` file
3. Create the missing index note using [[Note - Folder]] template
4. Populate with wikilinks to all depth-1 sub-notes with descriptions

### Note Format Compliance

Check all notes (or a target section - e.g. `Resources/`, `Streams/`) against [[Notes]]:

- **Missing frontmatter fields**: `status`, `purpose`, `author` must always be present
- **Bad status values**: must match `draft - Month YYYY`, `current - Month YYYY`, `outdated - Month YYYY`, or `archive - Month YYYY`
- **Bad `author` values**: must be `Manual`, `Written with Claude`, or `Mixed`; external work authors go in `creator:` field
- **H1 missing or mismatched**: H1 should match the filename (accounting for the colon/dash substitution convention)
- **Tables without padding**: columns should be padded for plain-text readability

### Boundary Enforcement

Check that the Pillars/Resources boundary is respected:

- No personal content (opinions, memories, lived experience) in `Resources/`
- No backlinks from `Resources/` to `Pillars/`
- Move any violations: extract personal content to a new or existing `Pillars/` note

### Creator Field Convention

Check notes where `author:` incorrectly stores an external creator (e.g. `author: "[[Creator Name]]"`):

- `author:` must always describe who wrote the _note_ (`Manual`, `Written with Claude`, `Mixed`)
- External work authors belong in an optional `creator:` field
- Fix all instances found

### Template Coverage

Ensure every `card/*` tag type has a corresponding template in `Pillars/Philosophy/Model/Tools/Obsidian/Templates/`:

1. Survey all `card/*` tags in use across the repository
2. Check which have a template file
3. Create missing templates following the patterns in existing ones
4. Update [[Templates]] index

---

## Audit Log

Session digests are recorded in the **daily note** for the session date, under `## Personal Assistant Sessions`. Each session heading
describes what was done - not a session number. Decisions extracted from each session are propagated to [[Notes]], [[Structure]], and
[[Tags]] as standing rules.

**Section title format:** `### island Structural Audit - [scope of work]` Example:
`### island Structural Audit - Boundary Fixes, Pillars Frontmatter, Status Review`

| Date | Scope | Calendar Note |
| ---- | ----- | ------------- |

---

## Notes

- A full audit is a multi-session effort - scope it by folder or concern rather than attempting the whole repository in one pass
- The `outdated` status is a useful signal: notes flagged during a bulk audit are queued for individual review via [[Status Review]]
- Document decisions made during the audit - they feed into [[Notes]], [[Structure]], and [[Tags]]
- Log significant errors or surprises in [[Mistakes and Lessons]]
