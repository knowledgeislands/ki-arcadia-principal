---
tags:
  - card/note
  - topic/ai
  - topic/automation
  - source/claude
status: draft - April 2026
author: Written with Claude
---

# Tending (Claude Prompts)

## Overview

Prompts for the island activities - the executable, Claude-specific and island-specific prompts that drive the Scheduled Task Audit, Health Check, Knowledge Rebuild, and Convergence Check automations, plus the conversational activities (Inbox Review, Asset Audit, Status Review, Structural Audit, Wikilink Review). These prompts reference island configuration and memory file paths from [[Knowledge Capital]], and several of them read or write the auto-memory layer directly.

What each tending activity does and why is documented in the Definition layer at [[Knowledge Islands/Model/Activities/Tending/Tending|Activities/Tending]]. This folder holds only the executable prompts - one note per activity once migrated from the scheduled task definitions.

---

## Prompts

- [[Knowledge Islands/Model/Tools/Claude/Activities/Tending/Convergence Check|Convergence Check]] - cross-island shared-notes drift detection
- [[Knowledge Islands/Model/Tools/Claude/Activities/Tending/Health Check|Health Check]] - weekly structural and content review
- [[Knowledge Islands/Model/Tools/Claude/Activities/Tending/Knowledge Rebuild|Knowledge Rebuild]] - weekly rewrite of canonical auto-memory files
- [[Knowledge Islands/Model/Tools/Claude/Activities/Tending/Scheduled Task Audit|Scheduled Task Audit]] - daily verification that scheduled tasks match their Prompt notes
