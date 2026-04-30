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

The Claude agent specific activity prompt for the Email Route Triage activity. This is maintained as an agentic AI specific task instruction that it can easily use at runtime rather than having to read and understand all of the note hierachy and inheritance at runtime.

---

## Schedule

- **Runs:** 09:00, 12:00, 18:00 - working days per [[Schedule|Schedule]]
- **Task ID:** `{task-prefix}-email-route-triage`

---

## Invocation

Chat trigger: _"email route triage"_

---

## Prompt

````txt
You are running Email Automation - Route Triage.

## Step 1 - Locate and configure
Run:
  KI_PROPS=$(find /sessions/*/mnt -maxdepth 7 -name "Knowledge Capital.md" -path "*/Knowledge Capital/*" 2>/dev/null | head -1)
  KI_PROPS_DIR=$(dirname "$KI_PROPS")
  EMAIL_DIR="$KI_PROPS_DIR/Email"
  TRACKING=$(find /sessions/*/mnt -path "*/tasks/email-triage/tracking.json5" 2>/dev/null | head -1)
  TRACKING_DIR=$(dirname "$TRACKING")
  echo "EMAIL_DIR=$EMAIL_DIR TRACKING_DIR=$TRACKING_DIR"

Read $KI_PROPS_DIR/Integrations.md. If no email integration is listed, stop.

## Step 2 - Load aged table
Run:
  AT="$TRACKING_DIR/aged-table.json5"
  newest_src=$(stat -c "%Y" "$EMAIL_DIR/Email Routing Config.md" "$EMAIL_DIR"/Route\ -\ *.md 2>/dev/null | sort -n | tail -1)
  at_mtime=$(stat -c "%Y" "$AT" 2>/dev/null || echo 0)
  [ "$at_mtime" -gt "$newest_src" ] && echo "CACHE_HIT" || echo "CACHE_MISS"

**Cache hit:** Read `$TRACKING_DIR/aged-table.json5` and use its `rules` array directly.

**Cache miss:** Glob `$EMAIL_DIR/Route - *.md` and read every match. For each Route file: read the destination folder from `### Inbound → #### Actions` (`move:` predicate) and aged rules from `### Aged → #### Conditions` and `#### Actions`. In the conditions table, rows prefixed `` `+ `` are allow rows; rows prefixed `` `- `` are deny rows. Write `$TRACKING_DIR/aged-table.json5` (only entries where the `### Aged → #### Conditions` table has at least one `+` row - skip routes with empty tables):
```json5
{ at: "<ISO timestamp>",
  rules: [
    { src: "_TRIAGE/nnn Folder", conditions: ["age:Nd"], actions: ["move:_ARCHIVE/dest", "tag:label", "mark:read"] },
    { src: "_TRIAGE/nnn Folder", conditions: ["age:Nd"], actions: ["delete"] }
  ] }
````

## Step 3 - Aged pass (existing triage emails)

For each entry in the aged table, evaluate `conditions` and apply `actions` to emails already in the `src` folder:

- List emails currently in the `src` folder.
- For each email: check all conditions - `age:Nd` compares the email's received date to today. If all conditions match, apply each action in `actions`: `move:destination` moves to that folder; `tag:label` applies a category; `mark:read` marks as read; `delete` moves to Deleted Items.
- Remove the tracking entry for processed emails.
- Keep a count per rule for the acknowledgement.

## Step 4 - Inbound pass (new emails, with inline aged check)

### 4a - Early-exit gate

Read $EMAIL_DIR/Email Routing Queue.md. If the file does not exist, treat as empty.

Check:

1. Count messages in Inbox (total, not just unread).
2. Count emails in \_TRIAGE/000 Unknown.
3. Check the Suggestions table for any `agreed` or `disagreed` rows.

If all are zero/empty AND Step 3 moved nothing: update the Last Route Triage Run line - if it already reads `Last Route Triage Run: ... (quiet - N runs)`, increment N; otherwise replace with `Last Route Triage Run: <now> (quiet - 1 run)`. Write the queue file. Output one line. Stop.

### 4b - Load routing table

Run: RT="$TRACKING_DIR/routing-table.json5"
  newest_src=$(stat -c "%Y" "$EMAIL_DIR/Email Routing Config.md" "$EMAIL_DIR"/Route\ -\ \*.md 2>/dev/null | sort -n | tail -1) rt_mtime=$(stat -c "%Y" "$RT" 2>/dev/null || echo 0) [ "$rt_mtime" -gt "$newest_src" ] && echo "CACHE_HIT" || echo "CACHE_MISS"

**Cache hit:** Read `$TRACKING_DIR/routing-table.json5` and use its `rules` array directly.

**Cache miss:** Parse source files and write a new routing table:

1. Read `$EMAIL_DIR/Email Routing Config.md`. Parse the `## Classification` numbered list for route order - each item is a `[[Route - Name]]` reference.
2. Glob `$EMAIL_DIR/Route - *.md` and read every match. For each: parse the inbound actions from `### Inbound → #### Actions` and the conditions table from `### Inbound → #### Conditions`. In the conditions table, rows prefixed `` `+ `` are allow rows; rows prefixed `` `- `` are deny rows.
3. Expand each Route into flat predicate entries. For each `+` (allow) row, collect any `-` (deny) rows declared above it in the same Route's Conditions table as `not` conditions. Inbound actions (`move:`, `tag:`, `mark:`) become the `actions` array:
   ```json5
   {
     at: '<ISO timestamp with offset>',
     rules: [
       { when: 'allow-predicate', not: ['deny-predicate-1', 'deny-predicate-2'], actions: ['move:_TRIAGE/nnn Folder'] },
       { when: 'allow-predicate', actions: ['move:_TRIAGE/nnn Folder', 'tag:label'] }
     ]
   }
   ```
4. Write `$TRACKING_DIR/routing-table.json5`.

### 4c - Triage candidates with inline aged check

Fetch up to 100 newest unprocessed messages from Inbox and Sent **received within the last 30 days**, plus every email in \_TRIAGE/000 Unknown. Skip any Inbox or Sent email received more than 30 days ago unless the run was explicitly instructed to process older mail (e.g. a backlog sweep).

Evaluate each against the `rules` array in order - **first match wins**:

- For each rule `{ when, not, actions }`: if `when` predicate matches AND (`not` is absent or empty OR none of the predicates in `not` match):
  1. Identify the `move:` destination in `actions` (e.g. `_TRIAGE/nnn Folder`).
  2. **Inline aged check:** look up the aged table for an entry with `src` matching that destination. If found, evaluate its `conditions` against the email (e.g. `age:Nd`). If all conditions pass → apply the aged table's `actions` directly (archive destination, tag, mark:read) and record as _aged-direct_. Skip the normal inbound move.
  3. If no aged rule matches → apply the inbound `actions` in order (move to triage folder, tag, mark); record matched `when` predicate.
- **No match** → \_TRIAGE/000 Unknown; create or merge an `unknown` suggestion. Target must be the route wikilink that would own this email (e.g. `[[Route - Do]]`, `[[Route - Media Industry]]`) - never a folder path. (Same Pattern + Target → increment Matches; prefer domain/phrase patterns over literal values.) When writing a domain-level suggestion, check whether the same domain already appears as a `sender:`, `to:`, or `cc:` predicate in any existing route - if so, suggest `party:*@domain` instead of adding another direction-specific predicate.

Append to tracking.json5 for each processed email: `{ id, subject, from, received, ruleset, routed_to, destination, routed_at, triage_folder }`. For aged-direct emails, set `routed_to: "aged-direct"`.

Predicates (multiple = AND; evaluate in efficiency order): `type:calendar-invite|calendar-response|calendar-update` (M365: check `messageClass` first - `IPM.Schedule.Meeting.Request` / `Resp.Pos|Resp.Tent|Resp.Neg` / `Canceled`; fallback to subject prefix - `"Meeting Request: "` / `"Accepted: "|"Tentative: "|"Declined: "` / `"Canceled: "`), `importance:high|low`, `status:flagged|unflagged|complete|unread|replied`, `age:Nd`, `party:addr`, `party:*@domain` (matches if ANY ONE of From, To, or CC is at the domain - equivalent to `from:*@domain OR to:*@domain OR cc:*@domain`; check all three fields), `sender:addr`, `sender:*@domain`, `to:addr`, `to:*@domain`, `cc:addr`, `cc:*@domain`, `subject:word`, `subject:"phrase"`, `body:word`.

## Step 5 - Update status note (only if any emails moved)

If nothing moved in Steps 3 or 4c, skip this step.

Recount every `_TRIAGE` subfolder. Regenerate the mermaid pie chart only if any count changed from the current note - otherwise carry the existing chart forward verbatim. Use Modular CSS Layout:

> ````
> > [!multi-column]
> >
> >> [!blank]
> >> ```mermaid
> >> pie showData
> >> title _TRIAGE by folder
> >> ...
> >> ```
> >
> >> [!blank]
> >> | Folder | Count | Unread |
> >> | --- | ---: | ---: |
> >> | **Total** | N | N |
> ````

Overwrite $EMAIL_DIR/Email Status.md - update frontmatter `status: current - {Month YYYY}` and the Triage Statistics section only. Preserve all other content verbatim.

## Step 6 - Update queue file

Write $EMAIL_DIR/Email Routing Queue.md (create with full frontmatter and headings if it did not exist):

- Set `Last Route Triage Run: <now>` (no quiet counter - this was an active run).
- The `## Suggestions` section intro callout must contain exactly two lines:
  - `> If you make changes, tell Claude "run the email route review" to action it`
  - `> See [[Pillars/Knowledge Capital/Activities/Email/Email Routing Config|Email Routing Config]] for the full rule ordering and available routes` Preserve these lines verbatim if already present; add them if missing.
- Preserve all existing Suggestion rows; append any new `unknown` suggestions from Step 4c.

## Step 7 - Chat acknowledgement

Output concisely:

- Aged pass: count archived or deleted per rule (omit if zero).
- Aged-direct (inbound bypass): count per rule (omit if zero).
- Inbound routed: count by destination folder.
- Unknown: count + top suggested rules.
- Quiet runs collapsed (if applicable).
