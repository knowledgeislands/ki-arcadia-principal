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

# Route Drift

## Overview

Runs once daily before the first Route Triage of the day. Reads the tracking file and compares each recorded destination against the email's
actual current folder. Emails the user has moved to a different `_TRIAGE` subfolder become `moved` suggestions in the queue. Emails that
have left `_TRIAGE` entirely are pruned from tracking. Entries older than 21 days are also pruned.

This activity makes no mailbox API calls beyond listing folder contents - it is lightweight and safe to run regardless of inbox activity.
