---
tags:
  - card/note
  - topic/productivity
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Index of email management activities
author: Written with Claude
---

# Email

## Overview

Inbox management as a scheduled, repeatable process. The goal is inbox zero across each working day, with each message triaged to a clear outcome. See [[Pillars/Knowledge Islands/Governance/Activities/Email/Approach|Approach]] for the shared concepts, definitions, and data model.

---

## Activities

The six email activities divide into two scheduled automations that run without human prompting and four conversational activities triggered by phrase. See [[Pillars/Knowledge Islands/Governance/Activities/Email/Approach|Approach]] for the shared concepts, data model, and the routing taxonomy that all activities operate against.

| Activity | Type | Schedule | Trigger | Summary |
| --- | --- | --- | --- | --- |
| [[Route Drift]] | Scheduled | Each working day at 08:00 | _"email route drift"_ | Reads tracking.json5; compares each recorded destination against the email's current folder; prunes re-routed entries and those older than 21 days |
| [[Route Triage]] | Scheduled | Each working day at 09:00, 12:00, 18:00 | _"email route triage"_ | Combined aged archival + inbound routing in a single pass; applies aged rules to existing triage emails, then classifies new inbound with inline aged bypass; replaces Route Aged and Route Inbound |
| [[Route Review]] | Conversational | - | _"email route review"_ | Runs taxonomy and collision checks; applies agreed/disagreed suggestions from the queue; re-evaluates `_TRIAGE/000 Unknown` against fresh rules |
| [[Re-route Triaged]] | Conversational | - | _"email re-route triaged"_ | Steps through `_TRIAGE/000 Unknown` one email at a time; confirmed rules are written immediately so subsequent emails in the session benefit |
| [[Recap]] | Conversational | - | _"email recap"_ | Summarises current triage state - folder counts, last run, pending suggestions - without running any processing |
| [[Email Test]] | Conversational | - | _"email test"_ | Dry-runs both scheduled activities in order; reports what each would do without making any changes; use after structural changes or to verify a run |

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - parent index
- [[Pillars/Knowledge Capital/Email/Email Routing Config|Email Routing Config]] - routing rules for the email triage system, filed in Knowledge Capital
