---
tags: card/note topic/knowledge-islands topic/knowledge-management
status: active 2026
author: Claude
---

# Session Digest

A session digest is a produced artefact that documents an AI-assisted work session. It is **not a Calendar note** — it does not represent a
time-stamped record to keep; it is an output to extract from and then discard. It lives in outbound staging under `-/_DIGESTS/`.

## Filing

- Path: `-/_DIGESTS/<UTC timestamp> <Short Topic>.md` (timestamp `YYYY-MM-DDTHHMMSSZ`)
- Frontmatter: `type: session-digest`, `retain_until: YYYY-MM-DD` (default 30 days)

Required tags: `topic/` tags covering the session's subject matter.

## Structure

Five sections, all required:

- **Context** — what prompted the session and what was in scope
- **Decisions** — decisions made during the session
- **Facts Learned** — new information captured or confirmed
- **Related Work** — Streams, Pillars, or `-/_HANDOFFS/` notes touched
- **Keywords** — searchable terms for future retrieval

## Lifecycle

Session digests are ephemeral by design. Once their content is extracted into Pillars or Streams notes, or passed on as a `-/_HANDOFFS/`
note, the digest can be deleted.

Test: if you deleted this note today, would knowledge be lost? If yes, extract first. If no, delete.
