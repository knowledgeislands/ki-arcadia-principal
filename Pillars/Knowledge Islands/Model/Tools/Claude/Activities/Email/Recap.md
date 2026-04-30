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

# Recap

## Overview

The Claude agent specific activity prompt for the Email Recap activity.  This is maintained as an agentic AI specific task instruction that it can easily use at runtime rather than having to read and understand all of the note hierachy and inheritance at runtime.

---

## Invocation

Chat trigger: _"email recap"_

---

## Prompt

```txt
You are running Email Automation - Recap. Read files; output to chat only. No writes, no moves.

## Step 1 - Load
Run:
  KI_PROPS=$(find /sessions/*/mnt -maxdepth 7 -name "Knowledge Capital.md" -path "*/Knowledge Capital/*" 2>/dev/null | head -1)
  KI_PROPS_DIR=$(dirname "$KI_PROPS")
  EMAIL_DIR="$KI_PROPS_DIR/Email"
  TRACKING=$(find /sessions/*/mnt -path "*/tasks/email-triage/tracking.json5" 2>/dev/null | head -1)
  TRACKING_DIR=$(dirname "$TRACKING")

Read $EMAIL_DIR/Email Status.md. Read $EMAIL_DIR/Email Routing Queue.md.
If tracking.json5 is present, note its entry count.

## Step 2 - Compose recap
**Folder snapshot** - table of non-empty _TRIAGE folders with counts and unread, from the status note. Highlight any folder at 10+ items.

**Last run timestamps** - the Last Route Triage Run, Last Route Review Run, and Last Route Drift Run lines from the queue file.

**Pending suggestions** - the full Suggestions table from the queue file. Flag any `agreed` rows (will be applied by Route Review) and any `unknown` rows that have been sitting for 2+ Route Triage runs.

**Action items** - short bullet list of things needing attention: folders accumulating, high Unknown count, stale agreed suggestions not yet applied.
```
