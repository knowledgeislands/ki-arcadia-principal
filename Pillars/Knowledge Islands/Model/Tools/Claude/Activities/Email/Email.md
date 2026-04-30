---
tags:
  - card/note
  - topic/ai
  - topic/automation
  - source/claude
status: draft - April 2026
author: Written with Claude
---

# Email (Claude Prompts)

## Overview

Prompts for the email triage and routing activities - the executable, Claude-specific and island-specific prompts that drive Route Drift, Route Triage, Route Review, Re-route Triaged, Recap, and Email Test. These prompts are tightly coupled to the routing configuration in [[Email Routing Config|Email Routing Config]] and the route definitions in [[Knowledge Capital/Activities/Email/Email|Knowledge Capital/Email]]; they should not be run without first reading those configuration notes.

What each activity does and why is documented in the Definition layer at [[Knowledge Islands/Model/Activities/Email/Email|Activities/Email]]. This folder holds only the executable prompts - one note per activity once migrated from the scheduled task definitions.

---

## Prompts

- [[Knowledge Islands/Model/Tools/Claude/Activities/Email/Email Test|Email Test]] - dry-run health check for Route Drift and Route Triage
- [[Knowledge Islands/Model/Tools/Claude/Activities/Email/Re-route Triaged|Re-route Triaged]] - clear `_TRIAGE/000 Unknown` with per-email confirmation
- [[Knowledge Islands/Model/Tools/Claude/Activities/Email/Recap|Recap]] - read-only summary of current triage state
- [[Knowledge Islands/Model/Tools/Claude/Activities/Email/Route Drift|Route Drift]] - daily reconciliation of tracking against actual mailbox state
- [[Knowledge Islands/Model/Tools/Claude/Activities/Email/Route Review|Route Review]] - apply queued rule suggestions and re-evaluate Unknown
- [[Knowledge Islands/Model/Tools/Claude/Activities/Email/Route Triage|Route Triage]] - aged archival pass plus inbound routing
