---
note_type: outbound-index
tags: card/note topic/knowledge-islands
status: active 2026
author: Claude
---

# Outbound

The `-/` outbound staging area holds produced artefacts that are leaving the base - session digests, trades, compiled outputs. It is staging, not a zone: it carries no same-name index and is exempt from the zone audit rules.

## Subdirectories

| Path           | Purpose                                                                    |
| -------------- | -------------------------------------------------------------------------- |
| `-/_DIGESTS/`  | Session digests (`note_type: session-digest`) - ephemeral session records  |
| `-/_TRADES/`   | Cross-repository trades directed at a receiving repository                 |

Files carrying `note_type: session-digest` that are found outside `-/` (e.g. in `Calendar/` or `Streams/`) are a ZONE-5 audit FAIL. The former `handoff` type is retired; cross-repository records are trades.

## Rationale

- **Why a separate outbound area.** Produced artefacts are on their way somewhere else: to extraction into Pillars or Streams, to another repository, or to deletion. Keeping them in `-/` stops them being mistaken for canonical knowledge and lets the island audit check that nothing ephemeral has settled in a zone.
- **Why apart from the inbox.** `+/` holds material arriving for triage and `-/` holds material leaving. The two flows have opposite owners and end states: inbound items are filed into a zone or discarded, outbound items are delivered or deleted. Keeping them apart means neither queue hides the other.
- **Why not a zone.** Zones hold content the island keeps and governs. Staging content is transient by definition, so `-/` carries no same-name index and is exempt from the zone rules rather than pretending to be a durable home.

[[Session Digest]] explains the digest convention and [[Structure]] places both staging areas in the island layout.

See [[Admin]] for move governance and [[CLAUDE]] for base-level configuration.
