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

The Claude agent specific activity prompt for the Email Test activity. This is maintained as an agentic AI specific task instruction that it
can easily use at runtime rather than having to read and understand all of the note hierachy and inheritance at runtime.

---

## Invocation

Chat trigger: _"email test"_

Dry run is the only mode - this activity never writes or moves anything.

---

## Prompt

```txt
You are running Email Automation - Email Test. Read and report only. No writes, no moves, no tracking changes.

## Step 1 - Locate and configure
Run:
  KI_PROPS=$(find /sessions/*/mnt -maxdepth 7 -name "Knowledge Capital.md" -path "*/Knowledge Capital/*" 2>/dev/null | head -1)
  KI_PROPS_DIR=$(dirname "$KI_PROPS")
  EMAIL_DIR="$KI_PROPS_DIR/Email"
  TRACKING=$(find /sessions/*/mnt -path "*/tasks/email-triage/tracking.json5" 2>/dev/null | head -1)
  TRACKING_DIR=$(dirname "$TRACKING")

Read $KI_PROPS_DIR/Integrations.md. If no email integration is listed, stop.

## Step 2 - Route Drift check
Read $TRACKING_DIR/tracking.json5. Note the entry count and the most recent routed_at timestamp.

Fetch all _TRIAGE subfolders with item counts (use the email MCP list-folders with includeChildren and includeItemCounts).

For each tracking entry, determine its status:
- **Aged out**: routed_at older than 21 days → would be pruned.
- **Folder empty**: the entry's triage_folder shows 0 items in the folder map → email has been actioned; would be pruned.
- **Re-route candidate**: email ID is found in a _TRIAGE subfolder different from triage_folder → would generate a moved suggestion.
- **OK**: email ID is in the expected folder (or folder has items and ID has not been independently verified).

Note: Outlook/Exchange can reassign an email ID when it is moved between folders. An entry whose ID is not found but whose triage_folder has non-zero items is likely an ID-change artefact from a previous move, not a genuine re-route - report it as a note, not an error.

Summarise: entries to prune (broken down by reason), re-routes detected, tracking entries OK.

## Step 3 - Route Triage check

### 3a - Aged pass
Check aged table cache:
  AT="$TRACKING_DIR/aged-table.json5"
  newest_src=$(stat -c "%Y" "$EMAIL_DIR/Email Routing Config.md" "$EMAIL_DIR"/Route\ -\ *.md 2>/dev/null | sort -n | tail -1)
  at_mtime=$(stat -c "%Y" "$AT" 2>/dev/null || echo 0)
  [ "$at_mtime" -gt "$newest_src" ] && echo "CACHE_HIT" || echo "CACHE_MISS"

On cache miss: glob $EMAIL_DIR/Route\ -\ *.md. For each file, verify it has a ### Aged section. Report any Route file missing this section as a format issue.

Compile the aged table in memory only (do not write). List each rule: { src, conditions, actions }.

For each rule with src matching a non-empty _TRIAGE folder (from Step 2), fetch a sample of emails in that folder (up to 10). Report how many meet the age threshold and what action would be taken - without taking it.

Summarise: aged cache state, aged rules loaded, emails that would be actioned per rule.

### 3b - Inbound pass
Check routing table cache:
  RT="$TRACKING_DIR/routing-table.json5"
  newest_src=$(stat -c "%Y" "$EMAIL_DIR/Email Routing Config.md" "$EMAIL_DIR"/Route\ -\ *.md 2>/dev/null | sort -n | tail -1)
  rt_mtime=$(stat -c "%Y" "$RT" 2>/dev/null || echo 0)
  [ "$rt_mtime" -gt "$newest_src" ] && echo "CACHE_HIT" || echo "CACHE_MISS"

Read $EMAIL_DIR/Email Routing Queue.md. Check the early-exit gate: count Inbox messages (total), count emails in _TRIAGE/000 Unknown, check for any `agreed` or `disagreed` suggestion rows. If all are zero/empty and the aged pass (3a) found nothing to act on, note that Route Triage would exit quietly - skip classification.

Otherwise: fetch the first 10 messages from Inbox plus all emails in _TRIAGE/000 Unknown. Compile the routing table in memory (do not write). Evaluate each message against the rules in order:
- Report the predicted destination, matched predicate, and whether the inline aged check would redirect it straight to archive (aged-direct).
- For any message that falls through to 000 Unknown, report a suggested predicate.

Summarise: routing cache state, inbox count + unknown count, predicted routes (including aged-direct), rule gaps.

## Step 4 - Health report
Output a concise structured report:

**Route Drift** - entries to prune: N | re-routes: N | OK: N
**Route Triage (aged pass)** - cache: HIT/MISS | rules: N | emails to action: N
**Route Triage (inbound pass)** - cache: HIT/MISS | inbox: N | unknown: N | predicted routes: breakdown | aged-direct: N | unknowns: N

Flag any issues:
- Route files missing ### Inbound or ### Aged sections
- Both caches missing (post-rollout - confirm caches will regenerate on next scheduled run)
- High unknown count in Inbox sample
- Emails sitting in _TRIAGE/981 Delete or _TRIAGE/991 Junk past their age threshold
- Tracking entries with routed_at approaching 21-day prune threshold
- Agreed/disagreed suggestions sitting unprocessed in the queue

Close with: "What would you like to do next?" followed by a prioritised list of available actions based on the report findings.
```
