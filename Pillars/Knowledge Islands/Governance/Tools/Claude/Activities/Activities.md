---
tags:
  - card/note
  - topic/ai
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Index of the Claude activity prompt library — the actual prompts that drive scheduled and conversational activities
author: Written with Claude
---

# Activities (Claude Prompts)

## Overview

The prompt library for activities that Claude executes. Each subfolder maps to an activity group and holds the executable prompts — the Layer 5 content in the [[Pillars/Knowledge Islands/Governance/Activities/Authoring Activities|five-layer model]]. Prompts in this library are Claude-specific and island-specific: they reference island configuration from [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] and agentic patterns from [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/Agentic AI|Agentic AI]].

What an activity does and why it exists is documented at Layer 1 under [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]]. This layer holds only the executable "how".

---

## Constitutional

[[Pillars/Knowledge Islands/Governance/Tools/Claude/Activities/Constitutional/Constitutional|Constitutional]] holds the prompt for the Conformance Check — the sole constitutional activity, required of any island running Knowledge Islands. The prompt reads the Manifest and the Activities index to verify constitutional baseline, adoption completeness, and adoption consistency. It is read-only and produces a structured conformance report.

---

## Email

[[Pillars/Knowledge Islands/Governance/Tools/Claude/Activities/Email/Email|Email]] holds the prompts for the email triage and routing activities — Route Drift, Route Triage, Route Review, Re-route Triaged, Recap, and Email Test. These prompts are tightly coupled to the routing configuration in Knowledge Capital and should not be run independently of it.

---

## Maintenance

[[Pillars/Knowledge Islands/Governance/Tools/Claude/Activities/Maintenance/Maintenance|Maintenance]] holds the prompts for island maintenance activities: the Scheduled Task Audit, Health Check, Knowledge Rebuild, and KB Convergence Check automations, plus the conversational activities (Inbox Review, Asset Audit, Status Review, Structural Audit, Wikilink Review). Several of these prompts read or write the auto-memory layer directly.

---

## Briefings

[[Pillars/Knowledge Islands/Governance/Tools/Claude/Activities/Briefings/Briefings|Briefings]] holds the prompts for the daily Morning Briefing automation — the activity that constructs the day's daily note, creates any missing calendar infrastructure, and surfaces agenda and inbox context.

---

## Linear

[[Pillars/Knowledge Islands/Governance/Tools/Claude/Activities/Linear/Linear|Linear]] holds the prompts for the Linear Sync activity — the daily automation that compares live Linear state against KB stream notes and surfaces drift for human review.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Claude|Claude]] - parent index
- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - Layer 1: what each activity does and why
- [[Pillars/Knowledge Islands/Governance/Activities/Authoring Activities|Authoring Activities]] - how to write and maintain activity prompts
- [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] - island configuration referenced by prompts
- [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/Agentic AI|Agentic AI]] - general patterns that prompts build on
