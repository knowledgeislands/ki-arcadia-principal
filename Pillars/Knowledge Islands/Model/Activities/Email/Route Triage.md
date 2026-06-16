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

# Route Triage

## Overview

Combines the aged archival pass and inbound routing into a single execution. Each run does two things in sequence:

1. **Aged pass** - applies age-based archival rules to emails already sitting in `_TRIAGE` subfolders. Emails that have passed their
   threshold are moved directly to their archive destination.
2. **Inbound pass** - fetches new messages from Inbox and Sent and evaluates them against the routing table. The key improvement over Route
   Inbound: before routing a matched email to its `_TRIAGE` subfolder, the aged criteria for that folder are checked inline. If the email
   already meets them (e.g. it arrived late, or inbound processing was delayed), it is routed straight to the archive destination, bypassing
   the triage folder entirely.
