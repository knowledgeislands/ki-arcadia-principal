---
tags:
  - card/note
  - topic/productivity
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Manual activity - taxonomy check, collision check, apply agreed rules, and re-evaluate Unknown queue
author: Written with Claude
---

# Route Review

## Overview

The single human-touchpoint activity for the rule system. Triggered explicitly in a chat session after the user has reviewed the queue file and marked suggestions `agreed` or `disagreed`.

Runs in four phases: a **taxonomy check** surfaces structural issues in the folder/route configuration; a **collision check** identifies rule conflicts and offers disambiguation; the **rule application** phase writes agreed rules and clears processed rows; and a final **Unknown re-evaluation** applies the freshly compiled rules to `_TRIAGE/000 Unknown` to clear any newly resolvable emails.

No changes are made automatically - all writes require the taxonomy and collision phases to complete first.

---

## Invocation

Chat trigger: _"email route review"_. Typically invoked after reviewing the [[Email Routing Queue|Email Routing Queue]] in Obsidian and setting suggestion statuses.

---

## Taxonomy Check

Checks structural consistency of the route configuration against the actual mailbox.

| Check                | Description                                                                      |
| -------------------- | -------------------------------------------------------------------------------- |
| Undeclared folders   | `_TRIAGE` subfolders in the mailbox with no matching route - possible orphans    |
| Declared but missing | Routes targeting a folder that does not exist in the mailbox - prompts to create |
| Unreferenced routes  | `Route - *.md` files not referenced in `Email Routing Config.md`                 |
| Missing route files  | `Email Routing Config.md` entries referencing a route with no matching file      |

---

## Collision Check

Identifies rule interactions that may produce unexpected routing.

| Check                  | Description                                                                                                          |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------- |
| Cross-route collisions | Patterns in different routes that would match the same emails - the first wins, but the conflict indicates ambiguity |
| Allow/deny conflicts   | A deny pattern overlapping with an allow pattern within the same route or across routes                              |
| Shadowed rules         | A broad pattern earlier in the order making a later, more specific pattern unreachable                               |
| Duplicate patterns     | Identical pattern strings appearing more than once, regardless of target                                             |

Where a fix is clear, a suggested change is offered inline for confirmation. Where a collision cannot be resolved or the correct fix is unclear, the affected rule is **disabled** - emails matching it fall through to `000 Unknown` until corrected and Route Review is run again.

---

## Prompt

```txt
You are running Email Automation - Route Review.

## Step 1 - Locate and load
Run:
  KB_PROPS=$(find /sessions/*/mnt -maxdepth 7 -name "Knowledge Capital.md" -path "*/Knowledge Capital/*" 2>/dev/null | head -1)
  KB_PROPS_DIR=$(dirname "$KB_PROPS")
  EMAIL_DIR="$KB_PROPS_DIR/Email"
  TRACKING=$(find /sessions/*/mnt -path "*/tasks/email-triage/tracking.json5" 2>/dev/null | head -1)
  TRACKING_DIR=$(dirname "$TRACKING")

Read $KB_PROPS_DIR/Integrations.md. If no email integration is listed, stop.

Parse all source files: read $EMAIL_DIR/Email Routing Config.md and all $EMAIL_DIR/Route - *.md. For each Route file: parse the destination folder from `### Inbound → #### Actions` (`move:` predicate) and the conditions from `### Inbound → #### Conditions`. In the conditions table, rows prefixed `` `+ `` are allow rows; rows prefixed `` `- `` are deny rows. Build the full ordered rule list and route map in memory. (Do not use cache - full source data is required for taxonomy and collision checks.)

## Step 2 - Taxonomy check
List actual `_TRIAGE` subfolders from the mailbox. Derive the declared folder set from the `move:` actions in all loaded routes.

Report as a chat section **Taxonomy Issues**:
- Folders in mailbox not declared by any route (undeclared - possible orphans).
- Folders declared by a route but absent from the mailbox - offer to create each one.
- `Route - *.md` files present in $EMAIL_DIR but not referenced in Email Routing Config.md.
- Entries in Email Routing Config.md referencing a route file that does not exist.

If any folder creation is requested, create it in the mailbox now.

## Step 3 - Collision check
Analyse the rule set for conflicts. Report as a chat section **Collision Issues**:

1. **Cross-route collisions:** identify pairs of routes whose `+` (allow) patterns would match the same email. For each pair, name the conflicting patterns and their routes.
2. **Allow/deny conflicts:** a `-` (deny) pattern in one route that would also fire on emails a `+` (allow) pattern in the same or another route intends to handle.
3. **Shadowed rules:** a broad `+` pattern earlier in the rule order that makes a more specific `+` pattern later unreachable.
4. **Duplicate patterns:** identical predicate strings appearing in more than one rule.

For each collision: if the fix is clear (e.g. narrowing a pattern, adjusting ordering), offer the change inline and ask for confirmation. If the fix is unclear or the user cannot resolve it now, disable the affected rule by commenting it out in its source file - emails matching it will route to 000 Unknown until Route Review is run again after correction.

Apply any confirmed fixes to the source files now.

## Step 4 - Apply agreed rules
Read $EMAIL_DIR/Email Routing Queue.md. For each row with `Status: agreed`:
- The Target column names the route directly (e.g. `[[Route - Media Industry]]`) - open `$EMAIL_DIR/<Target>.md` and insert the new row (with `` `+ `` prefix) into its `### Inbound → #### Conditions` table.
- **Predicate efficiency order:** insert the new row so the table remains sorted `type:` → `importance:` → `status:` → `age:` → `party:` → `sender:/to:/cc:` → `subject:` → `body:`. More specific/cheaper predicates first; `body:` last as it requires full-text search.
- **`party` consolidation:** before inserting a `sender:*@domain` or `to:*@domain` rule, check whether the same domain already appears in the table under any direction-specific predicate (`sender:`, `to:`, or `cc:`). If it does, replace all direction-specific rows for that domain with a single `party:*@domain` row (with `` `+ `` prefix).
- Clear the row from the queue.

For each row with `Status: disagreed`: remove from the queue.

If any source file was modified in Steps 3 or 4: delete $TRACKING_DIR/routing-table.json5 and $TRACKING_DIR/aged-table.json5 (forces recompilation on the next Route Inbound run). Before deleting, call `allow_cowork_file_delete` with one of the file paths to grant deletion permission for the folder - then use `rm` via bash. Do not attempt overwriting as a substitute.

Write the updated queue file.

## Step 5 - Re-evaluate 000 Unknown
Recompile the routing table from the now-updated source files (force full recompile - cache is invalidated). Write the new $TRACKING_DIR/routing-table.json5.

Fetch every email in _TRIAGE/000 Unknown. Evaluate each against the updated `rules` array - first match wins. **`party:` predicates match if ANY ONE of sender (From), To, or CC contains the address - equivalent to `from:x OR to:x OR cc:x`. The listing result typically shows only From. Before declaring no match against any `party:` rule, read each email's full headers to check the To and CC fields.** For each email that now matches: move to the declared folder; update the tracking entry.

## Step 6 - Chat report
Output a structured summary:
- **Taxonomy issues** found and resolved (folders created, orphans flagged).
- **Collisions** found: fixed, disabled, or deferred.
- **Rules applied** from agreed suggestions (Pattern → target file).
- **Unknown resolved** - count moved out of 000 Unknown; count remaining.
```

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Email/Approach|Approach]] - concept reference and shared definitions
- [[Pillars/Knowledge Islands/Governance/Activities/Email/Email|Email]] - parent index
- [[Email Routing Queue|Email Routing Queue]] - the queue file reviewed before invoking this activity
- [[Pillars/Knowledge Islands/Governance/Activities/Email/Re-route Triaged|Re-route Triaged]] - alternative for manually working Unknown one at a time
