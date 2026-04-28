---
tags:
  - card/note
  - topic/productivity
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
author: Written with Claude
---

# Email

## Overview

Inbox management as a scheduled, repeatable process. The goal is inbox zero across each working day, with each message triaged to a clear outcome. See [[Pillars/Knowledge Islands/Governance/Activities/Email/Approach|Approach]] for the shared concepts, definitions, and data model.

---

## Scheduled Activities

The two scheduled automations run without human prompting, driven by the cron parameters in [[Schedule|Schedule]].

### Route Drift

[[Pillars/Knowledge Islands/Governance/Activities/Email/Route Drift|Route Drift]] runs each working day at 08:00. It reads `tracking.json5` - the record of emails that were triaged to specific destinations - and compares each entry against where that email currently sits. Entries that have since been re-routed by the user, or that are older than 21 days, are pruned from the tracking file. Its purpose is to keep the tracking record clean so Route Triage is not confused by stale or redundant entries. Trigger phrase: _"email route drift"_.

### Route Triage

[[Pillars/Knowledge Islands/Governance/Activities/Email/Route Triage|Route Triage]] runs each working day at 09:00, 12:00, and 18:00. It combines two previously separate activities - aged archival and inbound routing - into a single pass: first it applies aged rules to emails that have been sitting in triage, then it classifies new inbound using the routing taxonomy with an inline aged bypass. This single-pass design reduces redundant reads and means that by end of day, every email that arrived has been assessed. Trigger phrase: _"email route triage"_.

---

## Conversational Activities

The four conversational activities are triggered by phrase during a session and do not run on a schedule.

### Route Review

[[Pillars/Knowledge Islands/Governance/Activities/Email/Route Review|Route Review]] runs a health check across the routing system: it validates the taxonomy for consistency and collision, applies any pending agreed or disagreed suggestions from the suggestion queue, and re-evaluates the `_TRIAGE/000 Unknown` folder against the current ruleset. It is the maintenance activity for the routing rules themselves rather than for individual emails. Trigger phrase: _"email route review"_.

### Re-route Triaged

[[Pillars/Knowledge Islands/Governance/Activities/Email/Re-route Triaged|Re-route Triaged]] steps through `_TRIAGE/000 Unknown` one email at a time, prompting for a routing decision on each. Rules confirmed during the session are written immediately, so later emails in the same pass can benefit from freshly created rules. It is the mechanism for clearing the Unknown folder when automatic classification has not been able to resolve an email. Trigger phrase: _"email re-route triaged"_.

### Recap

[[Pillars/Knowledge Islands/Governance/Activities/Email/Recap|Recap]] produces a read-only summary of the current triage state: folder counts, the timestamp of the last scheduled run, and any pending suggestions awaiting decision. It makes no changes to the inbox or tracking file. Use it to get a quick picture of where things stand before deciding whether to run a full triage pass. Trigger phrase: _"email recap"_.

### Email Test

[[Pillars/Knowledge Islands/Governance/Activities/Email/Email Test|Email Test]] dry-runs both scheduled activities in sequence - Route Drift then Route Triage - and reports what each would do without making any actual changes. Use it after structural changes to the routing taxonomy, or to verify that a scheduled run will behave as expected before committing. Trigger phrase: _"email test"_.

---

---

## Adoption Requirements

To adopt this activity group, an island must create the following Knowledge Capital notes. A vetoed island must create an index stub at `Knowledge Capital/Governance/Activities/Email/Email` acknowledging the veto, and individual N/A stubs for each note below.

| Note                 | Path                                                                 | Purpose                                                               |
| -------------------- | -------------------------------------------------------------------- | --------------------------------------------------------------------- |
| Email index          | `Knowledge Capital/Governance/Activities/Email/Email`                | Group index; states adoption position and links to config notes       |
| Email Routing Config | `Knowledge Capital/Governance/Activities/Email/Email Routing Config` | Routing taxonomy, rules, and the suggestion queue format              |
| Email Routing Queue  | `Knowledge Capital/Governance/Activities/Email/Email Routing Queue`  | Live queue of pending routing suggestions awaiting review             |
| Email Status         | `Knowledge Capital/Governance/Activities/Email/Email Status`         | Current triage state - folder counts, last run, tracking file summary |

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - parent index
- [[Email Routing Config|Email Routing Config]] - routing rules for the email triage system, filed in Knowledge Capital
