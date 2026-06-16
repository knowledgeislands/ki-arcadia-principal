---
tags:
  - card/note
  - topic/ai
  - topic/automation
  - source/claude
status: draft - April 2026
author: Written with Claude
---

# Linear (Claude Prompts)

## Overview

Prompts for the Linear sync activity - the executable, Claude-specific and island-specific prompts that drive the daily Linear Sync
automation. These prompts reference Linear workspace configuration from [[Knowledge Capital]] and use the Linear MCP connection documented
in [[Tools/Linear/Linear|Tools/Linear]] to compare live Linear state against island stream notes.

What the Linear Sync does and why is documented in the Definition layer at
[[Knowledge Islands/Model/Activities/Linear/Linear|Activities/Linear]]. This folder holds only the executable prompts - one note per
activity once migrated from the scheduled task definitions.

---

## Prompts

- [[Knowledge Islands/Model/Tools/Claude/Activities/Linear/Linear Sync|Linear Sync]] - daily reconciliation of Linear initiatives and
  projects against island stream notes
