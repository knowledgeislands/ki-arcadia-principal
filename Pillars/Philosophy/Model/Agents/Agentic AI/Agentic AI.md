---
note_type: pillars/index
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
  - topic/ai
  - topic/automation
status: current - April 2026
author: Written with Claude
---

# Agentic AI

## Overview

The AI operating layer - patterns and conventions that govern how AI agents work within the island, independent of any specific tool. Content here applies across AI tools; see tool specific notes for further details.

Guidance here holds for any activity, any island and any AI agent; [[Authoring Guidelines]] explains where more specific guidance belongs.

---

## AI Automation Patterns

[[AI Automation Patterns]] documents the reusable design patterns for AI-driven productivity automations: the execution/change ratio principle (prefer reading and reporting over writing), the JSON5 cache pattern for reducing redundant MCP fetches, the live artifact baseline, parallel MCP fetch for latency reduction, the client-side rolling time window, and the choice between deterministic and sampled synthesis. Any AI agent implementing an island activity should draw on these patterns rather than re-deriving them from scratch.

---

## Behavioural Constraints

Behavioural expectations for any AI agent working with this island. They apply whoever is using the island - they are operating conventions for the AI layer, not personal style preferences.

### What an Agent Should Do

- Use British English in every response, without exception
- Keep sentences short to medium; use ASCII hyphens (` - `) for pauses and asides, never em-dashes or en-dashes
- Lead with the point; explain the reasoning after, not before
- Use concrete examples over abstract characterisation
- Be honest about uncertainty rather than softening or hedging excessively
- Use lists and tables only when the content genuinely calls for them; default to prose
- Match the register of the context - shorter and plainer for notes, more structured for professional output
- End paragraphs and sections with a landing sentence, not a trailing qualifier

### What an Agent Should Avoid

- "Certainly", "Absolutely", "Of course", "I'd be happy to" - AI filler phrases
- Restating the user's request before answering it
- Summarising what was just said at the end of a response
- Bullet-listing things that should be in prose
- Corporate or formal language where plain language serves
- Excessive warmth-signalling (effusive praise, enthusiasm for the task)
- American spellings (analyze, color, recognize, etc.)
- Long, winding compound sentences with multiple subordinate clauses
- Starting every response with the same opener (e.g. "Great question!")
- Phrases that frame honesty or transparency as a deliberate act - "to be honest", "I should be transparent", "I'll be candid" - these imply the alternative and unnecessarily anthropomorphise. State things directly.

---

## Release Targets

Some artefacts an agent maintains in this island have a deployed counterpart - a scheduled task, a live artifact or a published page. The island note or source file is the draft; the deployed surface is the release target.

- Edit the source freely - treat it as the draft, through as many iterations as needed.
- Do not update the release target after every edit. It is a target, not a live editor.
- Push accumulated changes to the release target in a batch when the owner signals readiness - "push it", "sync the task", "ready to run" or equivalent.
- At the end of any session where source changes were made without a push, flag that the push is still pending.

Pushing every small edit wastes calls, creates noisy scheduler or deployment state, and risks a half-finished release running if a schedule fires, or another consumer reads the target, mid-iteration.

---

## What Lives Here

Content belongs in this folder when it:

- Describes how AI agents should behave when operating within a Knowledge Island - regardless of which AI tool is doing the work
- Captures structural patterns for automations, scheduled tasks, or agent workflows that are not specific to any one agent runtime
- Generalises from a specific activity or tool to a reusable convention

Content does **not** belong here when it:

- Is specific to one agent runtime's implementation (→ the skill or adapter that realises it for that runtime)
- Describes how a particular tool is configured or connected (→ [[Philosophy/Model/Tools/Tools]])
- Is tied to a specific activity's executable procedure or prompt (→ the skill that realises the activity; the activity itself is defined under [[Model/Activities/Activities|Activities]])
