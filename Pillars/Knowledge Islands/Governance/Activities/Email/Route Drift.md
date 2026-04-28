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

Runs once daily before the first Route Triage of the day. Reads the tracking file and compares each recorded destination against the email's actual current folder. Emails the user has moved to a different `_TRIAGE` subfolder become `moved` suggestions in the queue. Emails that have left `_TRIAGE` entirely are pruned from tracking. Entries older than 21 days are also pruned.

This activity makes no mailbox API calls beyond listing folder contents - it is lightweight and safe to run regardless of inbox activity.

---

## Schedule

- **Runs:** 08:00 daily - working days per [[Schedule|Schedule]]
- **Alongside:** [[Route Triage]] (runs at 09:00, after this; Route Drift prunes tracking before Route Triage applies its aged and inbound passes)
- **Task ID:** `{task-prefix}-email-route-drift` - prefix defined in [[Pillars/Knowledge Capital/Charter|Charter]]

---

## Invocation

Chat trigger: _"email route drift"_

---

## Prompt

```txt
You are running Email Automation - Route Drift.

## Step 1 - Locate
Run:
  KI_PROPS=$(find /sessions/*/mnt -maxdepth 7 -name "Knowledge Capital.md" -path "*/Knowledge Capital/*" 2>/dev/null | head -1)
  KI_PROPS_DIR=$(dirname "$KI_PROPS")
  EMAIL_DIR="$KI_PROPS_DIR/Email"
  TRACKING=$(find /sessions/*/mnt -path "*/tasks/email-triage/tracking.json5" 2>/dev/null | head -1)
  TRACKING_DIR=$(dirname "$TRACKING")

Read $KI_PROPS_DIR/Integrations.md. If no email integration is listed, stop.

## Step 2 - Load tracking
Read $TRACKING_DIR/tracking.json5. If missing or empty, output one line ("No tracking data - nothing to scan.") and stop.

## Step 3 - Build current-folder map
List all `_TRIAGE` subfolders from the mailbox. For each subfolder, fetch the list of email IDs currently in it. Build a lookup map: `{ email_id → current_folder }`.

## Step 4 - Scan entries
For each entry in tracking.json5:

1. **Older than 21 days** (`routed_at` > 21 days ago): remove entry. Do not check folder - it has aged out.
2. **Email not in map** (not found in any `_TRIAGE` subfolder): the user has actioned and removed it - remove tracking entry.
3. **Email in same folder as recorded** (`triage_folder` matches `current_folder`): no change - skip.
4. **Email in a different `_TRIAGE` subfolder**: the user re-routed it - create or merge a `moved` suggestion (same Pattern + Target → increment Matches; prefer domain/phrase patterns over literal values). Update the tracking entry's `triage_folder` to the current folder so the same re-route is not re-detected next run.

## Step 5 - Write outputs
Write the updated tracking.json5 (pruned entries removed, re-route entries updated).

Read $EMAIL_DIR/Email Routing Queue.md. Update the `Last Route Drift Run` timestamp to now. If any `moved` suggestions were created, append the new suggestion rows to the Suggestions table. Write the file (always - even if no suggestions were added, the timestamp must be updated).

## Step 6 - Chat acknowledgement
Output concisely:
- Re-routes detected: count + list (Subject | From | Original → New).
- Entries pruned: count (gone from _TRIAGE) + count (aged out >21 days).
- Suggestions added to queue: count.
```

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Email/Approach|Approach]] - concept reference and shared definitions
- [[Pillars/Knowledge Islands/Governance/Activities/Email/Email|Email]] - parent index
- [[Pillars/Knowledge Islands/Governance/Activities/Email/Route Triage|Route Triage]] - sibling scheduled activity (runs at 09:00, after this scan)
