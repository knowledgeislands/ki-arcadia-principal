---
tags:
  - card/note
  - topic/ai
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - June 2026
author: Written with Claude
---

# Activities (Claude Prompts)

## Overview

The prompt library for activities that Claude executes. Each subfolder maps to an activity group and holds the executable prompts - the Prompt layer in the [[Authoring Guidelines|content layers]]. Prompts in this library are Claude-specific and island-specific: they reference island configuration from [[Admin/Governance/Conventions/Admin Conventions/Integrations|Integrations]] and agentic patterns from [[Agentic AI]].

What an activity does and why it exists is documented in the Definition layer under [[Philosophy/Model/Activities/Activities]]. This layer holds only the executable "how".

Activity groups that are vetoed on this island do not have a prompts folder here. The adoption position is recorded in [[Admin/Governance/Charter|Charter]].

---

## Constitutional

[[Claude/Activities/Constitutional/Constitutional]] holds the prompt for the Conformance Check - the sole constitutional activity, required of any island running Knowledge Islands. The prompt reads the Charter and the Activities index to verify constitutional baseline, adoption completeness, and adoption consistency. It is read-only and produces a structured conformance report.

---

## Tending

[[Claude/Activities/Tending/Tending]] holds the prompts for island tending activities: the Scheduled Task Audit, Health Check, Knowledge Rebuild, and Convergence Check automations, plus the conversational activities (Inbox Review, Asset Audit, Status Review, Structural Audit, Wikilink Review). Several of these prompts read or write the auto-memory layer directly.
