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

# Email Test

## Overview

A read-only health check for the Email Automation system. Dry-runs both scheduled activities in order - Route Drift, Route Triage - and
reports what each would do without making any moves, writes, or tracking changes. Route Triage covers both the aged archival pass and the
inbound routing pass (including the inline aged check). Use after structural changes (Route file renames, cache invalidation, scheduling
changes) or when a scheduled run seems to have misbehaved.

---

## What this covers

| Scheduled activity          | What is tested                                                                                                         |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| Route Drift                 | Tracking integrity - prune candidates, re-routes, ID-change artefacts                                                  |
| Route Triage - aged pass    | Aged cache freshness, Route file format (### Aged sections), emails past threshold                                     |
| Route Triage - inbound pass | Routing cache freshness, routing table compilation, inbox + unknown classification accuracy, inline aged-direct bypass |
