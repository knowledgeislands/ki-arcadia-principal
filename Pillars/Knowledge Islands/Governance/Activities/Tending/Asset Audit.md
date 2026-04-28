---
tags:
  - card/note
  - topic/productivity
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Weekly manual activity - locating and linking unlinked repository assets
author: Written with Claude
---

# Asset Audit

## Overview

A weekly scan for unlinked assets in the island. The repository is primarily Markdown, but images, SVGs, PDFs, and other files accumulate over time. This task surfaces assets that nothing links to and flags them for removal or proper integration.

---

## When

Weekly - _"ki asset audit"_. Typically alongside the [[Health Check]] automation.

---

## What It Does

1. Run a search for all non-`.md` files under the repository root (excluding `.git`)
2. For each file, check whether it is referenced by any note (image embed, wikilink, or URL)
3. Unlinked files are flagged - either delete if clearly redundant, or link from the appropriate note
4. Note any patterns (e.g. a folder accumulating loose images) and address the root cause

---

## Notes

- Expected non-Markdown files: images (`.png`, `.jpg`, `.svg`), PDFs, and the occasional `.canvas`
- Voice note audio files in `+/_Voice Notes/` are managed by plugin - do not audit those
- When in doubt, move the file to `+/` rather than deleting immediately

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Tending/Tending|Tending]] - parent index
- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - grandparent index
