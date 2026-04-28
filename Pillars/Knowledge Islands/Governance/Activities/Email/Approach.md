---
tags:
  - card/note
  - topic/productivity
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
author: Mixed
---

# Approach

## Overview

A system for processing the email inbox toward zero using a structured triage folder hierarchy. Emails are classified to `_TRIAGE` subfolders via an ordered set of routing rules and routes. A tracking file records each classification, allowing the user's manual re-routes to be detected and fed back as suggested rule changes.

The system is email-platform agnostic. It operates against whichever email MCP is configured in [[Integrations|Integrations]] (e.g. M365 MCP, Gmail MCP). Two platform constructs are normalised throughout: folder and label constructs are treated interchangeably as "folders"; tag and category constructs are treated interchangeably as "tags". The implementation detail of mapping these to the specific platform operation is handled by the activity prompts, not the route definitions.

Whilst the classification can follow any chosen scheme, this works best following an **Eisenhower Matrix** (urgency vs importance) approach. Sub-folders follow a numeric prefix so folders sort in priority order; first digit is the category (`0` Inbound, `1` Do, `2` Decide, `3` Delegate, `4` Defer, `9` Disposal) with remaining digits identifying the sub-classification.

---

## Activities

The table below outlines the set of activities that comprise the Email Automation.

| Activity | Type | Schedule | Trigger | Summary |
| --- | --- | --- | --- | --- |
| [[Route Triage]] | Scheduled | Each working day at 09:00, 12:00, 18:00 | _"email route triage"_ | Aged archival pass followed by inbound routing with inline aged bypass; archives emails already past threshold directly, skipping the triage stage |
| [[Route Drift]] | Scheduled | Each working day at 08:00 | _"email route drift"_ | Reads tracking.json5; compares each recorded destination against the email's current folder; prunes re-routed entries and those older than 21 days |
| [[Route Review]] | Conversational | - | _"email route review"_ | Runs taxonomy and collision checks; applies agreed/disagreed suggestions from the queue; re-evaluates `_TRIAGE/000 Unknown` against fresh rules |
| [[Re-route Triaged]] | Conversational | - | _"email re-route triaged"_ | Steps through `_TRIAGE/000 Unknown` one email at a time; confirmed rules are written immediately so subsequent emails in the session benefit |
| [[Recap]] | Conversational | - | _"email recap"_ | Summarises current triage state - folder counts, last run, pending suggestions - without running any processing |
| [[Email Test]] | Conversational | - | _"email test"_ | Dry-runs the scheduled activities in order; reports what each would do without making any changes; use after structural changes or to verify a run |

The diagram below shows all six activities, the email stores they operate on, and the state files they read, write, or invalidate. Dashed arrows indicate cache invalidation (delete). Scheduled activities run at fixed times; conversational activities are triggered on demand.

![[email-activity-diagram.svg]]

---

## Definitions

### Rules

Rules are evaluated in order during classification - **first match wins**. The KI-specific rule list lives in [[Email Routing Config|Email Routing Config]].

Each item in the list is a **route reference** (`[[Route - Name]]`). When a route reference is evaluated, its allow/deny rules are checked; a match routes to the route's declared folder. Routes cannot reference other routes - evaluation is always one level deep.

#### Predicates

**Condition predicates** - used in `#### Conditions` tables to match emails. Multiple predicates on the same rule combine with implicit AND.

The predicates below are in an efficiency order - the system evaluates them in this sequence during classification, so more specific predicates that narrow down the candidate set should be listed first in a route's conditions.

| Predicate                | Description                                           | Example                  |
| ------------------------ | ----------------------------------------------------- | ------------------------ |
| `type:calendar-invite`   | Email is a calendar invitation                        | `type:calendar-invite`   |
| `type:calendar-response` | Email is a calendar acceptance, tentative, or decline | `type:calendar-response` |
| `type:calendar-update`   | Email is a calendar update or cancellation            | `type:calendar-update`   |
| `importance:high`        | Sender marked the email as high importance            | `importance:high`        |

> **M365 / Outlook - evaluating `type:` predicates**
>
> **Primary:** check `messageClass` if the MCP or API exposes it:
>
> | `type:` predicate        | `messageClass` value(s)                                                                            |
> | ------------------------ | -------------------------------------------------------------------------------------------------- |
> | `type:calendar-invite`   | `IPM.Schedule.Meeting.Request`                                                                     |
> | `type:calendar-response` | `IPM.Schedule.Meeting.Resp.Pos`, `IPM.Schedule.Meeting.Resp.Tent`, `IPM.Schedule.Meeting.Resp.Neg` |
> | `type:calendar-update`   | `IPM.Schedule.Meeting.Canceled` (and counter-proposal variants)                                    |
>
> **Fallback** (if `messageClass` is unavailable): Outlook prefixes the original subject with the response type. Match by subject prefix:
>
> | `type:` predicate        | Subject starts with                              |
> | ------------------------ | ------------------------------------------------ |
> | `type:calendar-invite`   | `"Meeting Request: "` (or has `.ics` attachment) |
> | `type:calendar-response` | `"Accepted: "`, `"Tentative: "`, `"Declined: "`  |
> | `type:calendar-update`   | `"Canceled: "`                                   |
>
> Prefer `messageClass` where available - it is locale-independent. Subject-prefix matching is locale-specific (Outlook localises the prefix) and should be treated as best-effort for English locales. | `importance:low` | Sender marked the email as low importance | `importance:low` | | `status:flagged` | Recipient has flagged the email for follow-up | `status:flagged` | | `status:unflagged` | Email has no follow-up flag set | `status:unflagged` | | `status:complete` | Recipient has marked the follow-up flag as complete | `status:complete` | | `status:unread` | Email has not been read | `status:unread` | | `status:replied` | Recipient has replied to the email | `status:replied` | | `age:Nd` | Email is older than N days (sent date to today) | `age:30d` | | `party:addr` | Matches if From, To, OR CC contains the exact address (equivalent to `from:addr OR to:addr OR cc:addr`) | `party:jane@acme.com` | | `party:*@domain` | Matches if From, To, OR CC contains any address at the domain (equivalent to `from:*@domain OR to:*@domain OR cc:*@domain`) | `party:*@acme.com` | | `sender:addr` | Exact sender address | `sender:budgets@costalerts.acme.com` | | `sender:*@domain` | Any address at a domain | `sender:*@acme.com` | | `to:addr` | Exact recipient address | `to:jane@acme.com` | | `to:*@domain` | Any recipient at a domain | `to:*@acme.com` | | `cc:addr` | Exact CC address | `cc:jane@acme.com` | | `cc:*@domain` | Any CC address at a domain | `cc:*@acme.com` | | `subject:word` | Subject contains word (case-insensitive) | `subject:invoice` | | `subject:"phrase"` | Subject contains exact phrase | `subject:"meeting notes"` | | `body:word` | Body contains word (case-insensitive) | `body:unsubscribe` |

**Action predicates** - used in `#### Actions` tables to specify what happens on match. Multiple actions are applied in order.

The predicates below are in an efficiency order - the system evaluates them in this sequence during classification, so more specific predicates that narrow down the candidate set should be listed first in a route's conditions.

| Predicate        | Description                        | Phase     |
| ---------------- | ---------------------------------- | --------- |
| `tag:label`      | Apply tag or category label        | both      |
| `mark:read`      | Mark email as read                 | both      |
| `mark:unread`    | Mark email as unread               | both      |
| `mark:flagged`   | Flag email for follow-up           | both      |
| `mark:unflagged` | Remove follow-up flag              | both      |
| `move:path`      | Move email to the specified folder | both      |
| `delete`         | Delete permanently                 | aged only |

#### Examples

```text
sender:*@acme.com
sender:*@acme.com subject:agenda
type:calendar-invite
importance:high
status:flagged
```

### Routes

Routes encapsulate a category of email: the match conditions (allow/deny), the inbound actions, and any aged rules - all in one note. Each route lives in its own `Route - *.md` note under [[Pillars/Knowledge Capital/Governance/Activities/Email/Email|Email]].

#### Route structure

Each route note declares:

- **Purpose** (H2) - concise statement of scope, plus any non-obvious exclusions or operational notes.
- **Rules** (H2) - contains all rule phases as sub-sections.
  - **Inbound** (H3)
    - **Conditions** (H4) - intro line: _"Conditions table - evaluated in order; first match wins - `+` routes the email, `-` excludes it."_ Then the conditions table. Columns: `Match | Notes`. Prefix each `Match` value with `` `+ `` for allow or `` `- `` for deny.
    - **Actions** (H4) - intro line: _"If conditions are met, all of the following actions are performed in order"_ Then the actions table. Columns: `Action | Notes`.
  - **Aged** (H3) - always present, even if empty; leave tables with header rows only until aged rules are added.
    - **Conditions** (H4) - same intro line and table format as Inbound Conditions. Columns: `Condition | Notes`. Same `+`/`-` prefix convention.
    - **Actions** (H4) - same intro line and table format as Inbound Actions. Columns: `Action | Notes`.

#### Evaluation

**Inbound phase** - for each route, for each candidate email:

1. Evaluate all condition rows in table order - **first match wins** regardless of whether it is allow (`+`) or deny (`-`). A `+` row routes the email to the declared folder and applies inbound actions. A `-` row excludes the email from this route entirely (falls through to the next route). Rows that do not match are skipped.
2. If no row matches, the email is not handled by this route and falls through.

**Aged phase** - for each email in the route's declared folder:

1. Evaluate all conditions with implicit AND - if every condition matches, the aged actions are applied in order.
2. Conditions are evaluated per email independently. Age is measured as the number of days from the email's sent date to today - not time spent in any folder.

#### Constraints

- Routes cannot reference other routes (no recursion).
- The `status:`, `importance:`, and `type:` predicates are available inside routes.
- A folder can be targeted by more than one route. When multiple routes share a folder, aged rules are defined in the primary owning route and noted in the others.

### Routing Table Cache

The compiled routing table (`routing-table.json5`) is derived from all route files and the routing rules ordering file. It is stored in the tracking directory and invalidated whenever any source file changes (mtime check). On a cache miss it is recompiled; on a cache hit it is read directly, avoiding loading 19+ route files.

Schema - predicate-centric flat array; one entry per allow predicate:

```json5
{
  at: '<ISO timestamp with offset>',
  rules: [
    { when: 'allow-predicate', not: ['deny-predicate-1', 'deny-predicate-2'], actions: ['move:nnn Folder'] },
    { when: 'allow-predicate', actions: ['move:nnn Folder', 'tag:label'] }
  ]
}
```

Field guide: `when` = the allow predicate; `not` = array of deny predicates that exclude this rule - one entry per `-` row declared above this allow row in the source conditions table (omit the field entirely if none); `actions` = ordered list of action predicates to apply.

The aged table (`aged-table.json5`) is a compact cache containing only routes with declared aged rules. Used exclusively by [[Route Triage]] (Steps 2-3).

```json5
{
  at: '<ISO timestamp>',
  rules: [
    { src: 'nnn Folder', conditions: ['age:30d'], actions: ['move:_ARCHIVE/dest', 'tag:label', 'mark:read'] },
    { src: 'nnn Folder', conditions: ['age:7d'], actions: ['delete'] }
  ]
}
```

Field guide: `src` = source folder; `conditions` = list of condition predicates combined with implicit AND (age measured from email sent date to today); `actions` = ordered list of action predicates to apply.

### Dry Run Mode

Any change-making activity (Route Triage, Route Review, Re-route Triaged) can be invoked in dry run mode by prefixing the conversational trigger: _"dry run [of] \<trigger\>"_. In dry run mode the activity runs its full logic - reading routes, evaluating emails, identifying moves - but outputs results to chat only. No emails are moved and no files are written.

Dry run is a mode modifier, not a separate activity. There is no standalone "Dry Run" note.

---

### Suggestions

The [[Email Routing Queue|Email Routing Queue]] holds pending routing changes awaiting user decision.

| Column  | Meaning                                                                   |
| ------- | ------------------------------------------------------------------------- |
| Pattern | Proposed rule predicate - e.g. `sender:*@acme.com`, `subject:"NTN Forum"` |
| Target  | Route note - e.g. `[[Route - Do]]`, `[[Route - Media Industry]]`          |
| Status  | One of `moved`, `unknown`, `agreed`, `disagreed`                          |
| Matches | Count of emails this rule would resolve                                   |

Status lifecycle: `moved` - created by Route Drift when a re-route is detected; `unknown` - created by Route Triage when no rule matches; `agreed` / `disagreed` - set by the user; agreed rows are applied by Route Review.

Before writing a new suggestion, check for an existing row with the same `Pattern` + `Target`. If one exists, increment `Matches`. The automation may widen a pattern during merge - e.g. two `sender:alice@acme.com` and `sender:bob@acme.com` unknowns with the same target collapse into `sender:*@acme.com` with `Matches: 2`.

**`party` over direction-specific predicates:** When generating a domain-level suggestion (`sender:*@domain`), check whether the same domain already appears in any existing route as a `sender`, `to`, or `cc` predicate for the same target. If it does, suggest `party:*@domain` instead - a single predicate that matches if any one of sender, to, or cc is at that domain.

---

## Data Files

| File | Written by | Read by | Notes |
| --- | --- | --- | --- |
| `Email Routing Queue.md` | Route Triage, Route Drift, Route Review, Re-route Triaged | All activities | Authoritative for suggestions; Last Route Triage Run line |
| `Email Status.md` | Route Triage (on move), Re-route Triaged | Recap | Folder counts + pie chart only |
| `routing-table.json5` | Route Triage (cache miss); deleted by Route Review | Route Triage, Re-route Triaged, Route Review | Mtime-checked vs source files |
| `aged-table.json5` | Route Triage (cache miss); deleted by Route Review | Route Triage only | Compact: entries with aged rules only |
| `tracking.json5` | Route Triage (new entries), Route Drift (updates moved; removes gone + entries >21 days) | Route Drift, Recap | Route Drift runs daily and covers all entries |
| `Email Routing Config.md` | Route Review | Route Triage (cache miss), Route Review (taxonomy check) | Rule ordering |
| `Route - *.md` | Route Review | Route Triage (cache miss), Route Review (taxonomy check) | Source of truth; compiled tables derived from these |

The KI-specific email files live in `$EMAIL_DIR` (`Knowledge Capital/Governance/Activities/Email/`) in the text store. The remaining files live in `$TRACKING_DIR` (`tasks/email-triage/`) in the temporary store.

`routing-table.json5` and `aged-table.json5` are **session-scoped caches** - derived from source files and safe to delete at any time; they are regenerated on the next cache miss. They must not be committed to the text store. `tracking.json5` is **persistent** and should be retained across sessions as it records classification history used by Route Drift.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Email/Email|Email]] - parent index
- [[Email Routing Config|Email Routing Config]] - ordered route list evaluated by Route Inbound
- [[Email Routing Queue|Email Routing Queue]] - pending suggestions and run state
- [[Pillars/Knowledge Capital/Governance/Activities/Email/Email|Knowledge Capital → Email]] - KI-specific configuration (routing rules, routes, queue, status)
- [[Integrations|Integrations]] - email platform MCP configuration
