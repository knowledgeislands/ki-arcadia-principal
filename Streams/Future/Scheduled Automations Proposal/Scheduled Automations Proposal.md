---
type: stream-proposal
tags:
  - topic/knowledge-islands
  - topic/automation
status: draft
priority: low
dependencies: []
author: Written with Claude
---

# Scheduled Automations Proposal

## Overview

Ideas for new scheduled tasks and improvements to the existing automation suite. Most of these extend coverage into areas the current task set does not reach, or add efficiency gates to reduce token usage on quiet days.

---

## Governance

This stream follows the [[Knowledge Islands/Model/Processes/Enactment Process|Enactment Process]].

---

## Checklist

- [ ] **Proactive meeting prep heartbeat** - A frequent check (every 15-30 minutes during working hours, e.g. `*/15 9-18 * * 1-5`) that detects an imminent meeting and automatically sends a prep brief pulling from prior meeting notes and Calendar context. Only fires when a meeting is found.
- [ ] **Email intelligence in morning briefing** - Extend the morning briefing task to include a nightly scan of the email inbox. Distil active threads into a 3-5 line awareness layer: what is live, what needs attention, what can wait.
- [ ] **Nightly repository organiser** - A post-hoc pass (1-2am) that reviews notes written that day: adds missing wikilinks, fills in omitted YAML tags, and flags `draft` notes for follow-up.
- [ ] **Decay-aware draft review** - Surface `draft` notes not touched in 30+ days as candidates for archiving, deletion, or promotion to `current`. A 60-day threshold would surface long-stale content more urgently. Could be a step in the existing Health Check or a standalone task.
- [ ] **Pre-invocation check for scheduled tasks** - Before committing full LLM inference in a cron task, run a cheap pre-check: is there anything to act on? A lightweight gate returns early on quiet days, saving significant tokens. Design pattern to apply across all applicable tasks.

## Governance

This stream adheres to the [[Enactment Process]]. Content reaches `Pillars/` or `Resources/` only on user approval of a `ready` proposal.
