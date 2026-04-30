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

# Re-route Triaged

## Overview

A conversational activity for clearing a backlog in `_TRIAGE/000 Unknown` with explicit user input per email. For each email, Claude proposes a destination and an optional routing rule; the user confirms, overrides, or skips. Confirmed rules are written immediately so subsequent emails in the same session benefit from them.

Does not fetch from Inbox or Sent - works only on the Unknown queue.

---

## Invocation

Chat trigger: _"email re-route triaged"_

---

## Prompt

```txt
You are running Email Automation - Re-route Triaged. Your job is to clear _TRIAGE/000 Unknown by classifying each email with user confirmation.

## Step 1 - Locate and load
Run:
  KI_PROPS=$(find /sessions/*/mnt -maxdepth 7 -name "Knowledge Capital.md" -path "*/Knowledge Capital/*" 2>/dev/null | head -1)
  KI_PROPS_DIR=$(dirname "$KI_PROPS")
  EMAIL_DIR="$KI_PROPS_DIR/Email"
  TRACKING=$(find /sessions/*/mnt -path "*/tasks/email-triage/tracking.json5" 2>/dev/null | head -1)
  TRACKING_DIR=$(dirname "$TRACKING")

Load routing table (cache check same as Route Triage Step 4b). Read $EMAIL_DIR/Email Routing Queue.md.

## Step 2 - Process Unknown queue
List _TRIAGE/000 Unknown. If empty, report and stop. Otherwise for each email (up to 100):

1. Show: Subject | From | To | CC | Received | (first 200 characters of body if available). Showing To and CC is required - `party:` rules match any of these fields, and omitting them makes rule proposals unreliable.
2. Propose a routing rule based on sender domain, subject keywords, or message type.
3. Present options via AskUserQuestion:
   - One or more suggested action codes with the proposed rule predicate.
   - Other relevant action codes from the folder taxonomy.
   - "Leave as Unknown - no rule needed".
4. For each confirmed decision:
   - If a rule was specified: identify the appropriate `Route - *.md` file and insert the new row (with `` `+ `` prefix) into its `### Inbound → #### Conditions` table in predicate efficiency order (`type:` → `importance:` → `status:` → `age:` → `party:` → `sender:/to:/cc:` → `subject:` → `body:`). Before inserting a `sender:*@domain` or `to:*@domain` rule, check whether the same domain already has a direction-specific predicate (`sender:`, `to:`, or `cc:`) in the table - if so, consolidate all direction-specific rows for that domain into a single `party:*@domain` row (with `` `+ `` prefix) instead. Delete $TRACKING_DIR/routing-table.json5 to force recompile on next run.
   - Move the email to the confirmed _TRIAGE subfolder.
   - Update the tracking entry.
   - Append a new suggestion row to $EMAIL_DIR/Email Routing Queue.md for any rule added.

IMPORTANT: 000 Unknown is never a valid rule target.

## Step 3 - Update status note (only if emails were moved)
If no emails were moved in Step 2, skip this step.

Recount every `_TRIAGE` subfolder. Regenerate the mermaid pie chart only if any count changed from the current note - otherwise carry the existing chart forward verbatim. Use Modular CSS Layout:

```

> [!multi-column]
>
> > [!blank]
> >
> > ```mermaid
> > pie showData
> > title _TRIAGE by folder
> > ...
> > ```
>
> > [!blank] | Folder | Count | Unread | | --- | ---: | ---: | | **Total** | N | N |

```

Overwrite $EMAIL_DIR/Email Status.md - update frontmatter `status: current - {Month YYYY}` and the Triage Statistics section only. Preserve all other content verbatim.

## Step 4 - Summarise
After processing, output:
- Emails routed this session (Subject | From | Rule added | Destination).
- Rules added and where they were written.
- Items still remaining in 000 Unknown.
```
