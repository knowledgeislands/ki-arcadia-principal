---
tags:
  - card/note
  - topic/ai
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
author: Written with Claude
---

# Activities (Claude Prompts)

## Overview

The prompt library for activities that Claude executes. Each subfolder maps to an activity group and holds the executable prompts - the Layer 5 content in the [[Authoring Guidelines|five-layer model]]. Prompts in this library are Claude-specific and island-specific: they reference island configuration from [[Knowledge Capital]] and agentic patterns from [[Agentic AI]].

What an activity does and why it exists is documented at Layer 1 under [[Knowledge Islands/Model/Activities/Activities]]. This layer holds only the executable "how".

---

## Constitutional

[[Claude/Activities/Constitutional/Constitutional]] holds the prompt for the Conformance Check - the sole constitutional activity, required of any island running Knowledge Islands. The prompt reads the Charter and the Activities index to verify constitutional baseline, adoption completeness, and adoption consistency. It is read-only and produces a structured conformance report.

---

## Email

[[Claude/Activities/Email/Email]] holds the prompts for the email triage and routing activities - Route Drift, Route Triage, Route Review, Re-route Triaged, Recap, and Email Test. These prompts are tightly coupled to the routing configuration in Knowledge Capital and should not be run independently of it.

---

## Tending

[[Claude/Activities/Tending/Tending]] holds the prompts for island tending activities: the Scheduled Task Audit, Health Check, Knowledge Rebuild, and Convergence Check automations, plus the conversational activities (Inbox Review, Asset Audit, Status Review, Structural Audit, Wikilink Review). Several of these prompts read or write the auto-memory layer directly.

---

## Briefings

[[Claude/Activities/Briefings/Briefings]] holds the prompts for the daily Morning Briefing automation - the activity that constructs the day's daily note, creates any missing calendar infrastructure, and surfaces agenda and inbox context.

---

## Linear

[[Claude/Activities/Linear/Linear]] holds the prompts for the Linear Sync activity - the daily automation that compares live Linear state against island stream notes and surfaces drift for human review.
