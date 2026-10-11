---
note_type: pillars/index
updated: 2026-10-11T01:47:00Z
tags:
  - card/note
  - topic/knowledge-islands
  - topic/tools
status: current - October 2026
author: Written with Claude
---

# Configuration

## Overview

Configuration is the set of island-specific values that vary between deployments while the portable activity definitions stay the same. It exists so that one Activity definition can run unchanged on any island: whatever differs - names, timings, connected services, adopted skills - is declared in configuration and read at runtime. Configuration is not one note but a small number of declared homes, each with a single owner. This note describes those homes at model level, with Arcadia's as the worked example.

---

## Identity Parameters

The island's fixed parameters live in the identity section of its [[Realisation/Charter/Charter|Charter]]: its name, its repository, and the prefixes that name its scheduled tasks and other identifiers. In Arcadia the task ID prefix is `arcadia-principal-`, so every scheduled task carries that prefix and can be traced to the island that owns it.

---

## Schedule and Day Types

The Schedule note defines the day-type taxonomy that automations read before acting. Every daily note carries a `day_type` - `work-day`, `bank-holiday`, `annual-leave` or `weekend` - set by a first-match rule from the day of the week and the island's bank-holiday and annual-leave calendars. The Charter's Scheduled Activities table then binds each enabled automation to a day type and a time. Arcadia's model is in [[Schedule]], beside its Activity notes.

---

## Activity Configuration

Some activity groups need configuration of their own, such as the routing rules an email activity applies. Each such group keeps a configuration note beside its Activity Definition, under the naming convention `[Group] [Name] Activity.md`. In Arcadia the Email group is vetoed, so [[Admin/Operations/Activities/Email Activity|Email Activity]] records in one place that no configuration applies, rather than keeping a separate configuration note.

---

## Integrations

Connected services and the identifiers activities use to reach them are declared in the island's integrations record, described in [[Realisation/Integrations/Integrations|Integrations]]. They are configuration in the same sense - island-specific values read at runtime - but large enough in practice to have their own note.

---

## Repository Declaration

An island's repository also carries a machine-readable declaration, `.ki.toml`, which tooling reads directly. It records the repository's identity and code (`KI-ARCADIA` for Arcadia), its Capital, its supported runtimes, and the skills and standards it adopts, each with any skill-specific settings. On a principal island it also carries the territory's name, prefix and ordered member roster, which must agree with [[Known Lands]]. `ki repo audit` checks the repository against these declarations, and [[Admin/Governance/Conformance|Conformance]] lists the standards adopted.

---

## Keeping Configuration Honest

Each value has one home, and every consumer reads it from there. When a value changes, it is changed in its home - through the [[Processes/Enactment Process/Enactment Process|Enactment Process]] where the home is in a canonical zone - and the automations pick it up on their next run. A value copied into a prompt or a second note is drift waiting to happen.
