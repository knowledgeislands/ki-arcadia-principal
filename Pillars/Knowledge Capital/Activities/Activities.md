---
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
author: Written with Claude
---

# Activities

## Overview

This folder holds the island-specific timing configuration for Arcadia's automated activities. The generic activity patterns - what each automation does and why - are defined in [[Knowledge Islands/Activities/Activities|Activities]] under Knowledge Islands. What lives here is the timing model: the day-type taxonomy that automations read from daily note frontmatter to decide whether and how to run.

The authoritative record of which activities are enabled - the operational roster - lives in the [[Charter]]. This folder is the timing model; the Charter is the activation record.

---

## Schedule

[[Schedule|Schedule]] defines the timing parameters used by all island automations. At its core is the day-type taxonomy - a classification scheme (`work-day`, `bank-holiday`, `annual-leave`, `weekend`) that automations read from each daily note's frontmatter to decide whether to run and how to behave. It also holds cron schedules for each named automation (Morning Briefing, Health Check, Knowledge Rebuild, and so on) as those automations are introduced. Currently no scheduled automations are active for Arcadia; entries are added here as they come online.

---

## Related Topics

- [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] - the island self-knowledge index; Activities is one of its five governance areas
- [[Pillars/Knowledge Islands/Activities/Activities|Activities (KI)]] - the generic activity definitions this folder configures and instances
