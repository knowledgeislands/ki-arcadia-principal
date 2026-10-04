---
note_type: pillars/note
tags: card/note topic/knowledge-islands topic/knowledge-management
status: active 2026
author: Claude
---

# Session Digest

A session digest is a produced artefact that documents an AI-assisted work session. It is **not a Calendar note** - it does not represent a time-stamped record to keep; it is an output to extract from and then discard. It lives in outbound staging under `-/_DIGESTS/`.

## Filing

- Path: `-/_DIGESTS/<UTC timestamp> <Short Topic>.md` (timestamp `YYYY-MM-DDTHHMMSSZ`)
- Frontmatter: `note_type: session-digest`, `retain_until: YYYY-MM-DD` (default 30 days)

Required tags: `topic/` tags covering the session's subject matter.

## Structure

Five sections, all required:

- **Context** - what prompted the session and what was in scope
- **Decisions** - decisions made during the session
- **Facts Learned** - new information captured or confirmed
- **Related Work** - Streams, Pillars, or `-/_TRADES/` records touched
- **Keywords** - searchable terms for future retrieval

## Lifecycle

Session digests are ephemeral by design. Once their content is extracted into Pillars or Streams notes, or passed on as a `-/_TRADES/` record, the digest can be deleted.

Test: if you deleted this note today, would knowledge be lost? If yes, extract first. If no, delete.

## Rationale

- **Why outbound staging.** A digest is raw material for extraction, not knowledge in its own right. Its decisions and facts belong in the Pillars or Streams notes they concern, where readers will look for them. Filing it in [[Outbound]] marks it as something on its way out of the island rather than a durable record, so it never competes with the canonical note it feeds.
- **Why not Calendar.** Calendar holds dated records that are kept, and a daily note links to them as the day's history. A digest that is meant to be deleted would leave broken links and gaps in that history. Keeping digests out of Calendar keeps the Calendar a reliable record and lets a digest be removed without editing anything else.
- **Why a retention date.** `retain_until` gives each digest a visible expiry. A reviewer can then tell overdue extraction apart from a digest that is still in use, and staged material does not pile up unnoticed.
- **Why a fixed type and path.** `note_type: session-digest` and the `-/_DIGESTS/` path together let the repository audit find digests mechanically. The audit fails any `session-digest` filed outside `-/`, so a digest cannot quietly become canonical content. The type sits in the KI-wide note-type taxonomy described in [[Properties]].

[[Structure]] describes the inbound and outbound staging areas and why they sit outside the zones.
