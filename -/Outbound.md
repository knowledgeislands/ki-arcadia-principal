---
note_type: outbound-index
tags: card/note topic/knowledge-islands
status: active 2026
author: Claude
---

# Outbound

The `-/` outbound staging area holds produced artefacts that are leaving the base — session digests, trades, compiled outputs. It is staging, not a zone: it carries no same-name index and is exempt from the zone audit rules.

## Subdirectories

| Path           | Purpose                                                                    |
| -------------- | -------------------------------------------------------------------------- |
| `-/_DIGESTS/`  | Session digests (`type: session-digest`) — ephemeral session records       |
| `-/_TRADES/`  | Cross-repository trades directed at a receiving repository                  |

Files carrying `type: session-digest` or `type: handoff` that are found outside `-/` (e.g. in `Calendar/` or `Streams/`) are a ZONE-5 audit FAIL.

See [[Admin]] for move governance and [[CLAUDE]] for base-level configuration.
