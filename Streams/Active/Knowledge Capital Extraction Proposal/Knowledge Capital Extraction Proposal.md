---
type: stream-proposal
tags:
  - topic/knowledge-islands
status: draft
priority: medium
dependencies: []
author: Written with Claude
---

# Knowledge Capital Extraction Proposal

## Overview

A stream to extract Arcadia-specific values currently embedded in `Pillars/Knowledge Islands/Model/` notes and relocate them to `Pillars/Knowledge Capital/`, leaving Model truly abstract. The premise: Model documents the generic Knowledge Islands framework; KC documents what Arcadia specifically is and how it is configured. Where the two are currently entangled - schedule times in activity definitions, install paths in tool overviews, byte counts in design rationale - the value belongs in KC and Model should backref to it.

This stream is the concrete application of the boundary the [[Boundary Rules Proposal]] stream is establishing. Where Boundary Rules defines the gates, this stream walks through them and tidies what is on the wrong side.

---

## Governance

This stream follows the [[Knowledge Islands/Model/Processes/Enactment Process|Enactment Process]].

---

## Outputs

| Type             | Detail                                                                                                                                         |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Model edits      | Strip Arcadia-specific values from 5 Model notes (Activities, Email, Claude tool, Cowork Layers, Microsoft 365); replace with backref to KC    |
| New KC notes     | `KC/Tools/Claude/Token Budget.md`; `KC/Agents/Cowork Project Instructions.md`; `KC/Tools/Microsoft 365.md` (further notes added if discovered) |
| KC index updates | `Knowledge Capital.md`, `Activities/Activities.md`, `Tools/Tools.md`, `Agents/Agents.md` updated to reference new notes and current state      |

---

## Checklist

- [ ] **Activities** - strip schedule times and trigger phrases from `Model/Activities/What Keeps an Island Alive.md`; backref to [[Knowledge Capital/Charter|Charter]]
- [ ] **Email** - strip schedule and triggers from `Model/Activities/Email/Email.md`; preserve the _Adoption Requirements_ table (it is an abstract contract, not specific config)
- [ ] **Claude tool** - extract token-economics measurements (file sizes, Tending threshold) from `Model/Tools/Claude/Claude.md` to a new `KC/Tools/Claude/Token Budget.md`
- [ ] **Cowork Layers** - extract "Recommended Content for the Instructions Box" from `Model/Tools/Claude/Cowork Configuration Layers.md` to a new `KC/Agents/Cowork Project Instructions.md`
- [ ] **Microsoft 365** - split: keep the generic MCP-for-Outlook framing in Model; move setup steps, env vars, tenant lookup, and dotfiles trick to a new `KC/Tools/Microsoft 365.md`
- [ ] **KC index updates** - add references to the new notes in the relevant index notes; update Overviews where needed
- [ ] **Model index updates** - confirm each Model index note still accurately describes what its area now contains
- [ ] **Verification pass** - after edits, scan extracted Model docs for residual Arcadia-specific values; scan new KC notes for content that should have stayed abstract

---

## Open Questions

1. **Tags split.** `Model/Conventions/Notes/Tags.md` declares "Island-specific tag extensions live in Knowledge Capital" but the current list mixes archipelago-universal tags (e.g. `topic/knowledge-management`, `topic/automation`) with Kit-specific domain tags (e.g. `topic/5g`, `topic/wine`, `topic/streaming`, `topic/emissions`). Should the list split into a core superset (Model) plus Arcadia extensions (KC), or remain unified? Defer to a follow-on once the simpler extractions are settled.

2. **Microsoft 365 retention.** Arcadia has not adopted Microsoft 365 connectivity. Preserving Kit's setup detail in `KC/Tools/Microsoft 365.md` documents an inactive integration. Worth keeping in full or trimming to a brief "not connected" note? Working assumption: keep - it is the only documented copy of the install procedure and removing it loses information that would have to be re-derived.

---

## Approach

Four working rules applied to every extraction:

- **Model treatment.** Strip Arcadia-specific values from Model docs; replace with a single sentence pointing to the KC note that holds them.
- **KC scope.** KC notes describe Arcadia's instance only. The contract for what any KC needs (e.g. the Email _Adoption Requirements_ table) stays in Model.
- **Backref direction.** Model points down to KC (`See [[KC note]] for Arcadia's values`). KC points up to Model (`See [[Model note]] for the abstract definition`).
- **No abstract prose loss.** Only specific values get extracted. The reasoning, framing, and abstract description in Model stays.

### Inventory of extractions

| Source (Model)                                | Specific content                                           | Destination (KC)                                       |
| --------------------------------------------- | ---------------------------------------------------------- | ------------------------------------------------------ |
| `Activities/What Keeps an Island Alive.md`    | Schedule times, trigger phrases in activity tables         | Already held in [[Knowledge Capital/Charter\|Charter]] |
| `Activities/Email/Email.md`                   | Schedule times, trigger phrases                            | Already held in [[Knowledge Capital/Charter\|Charter]] |
| `Tools/Claude/Claude.md`                      | Token economics file sizes; Tending threshold values       | New `KC/Tools/Claude/Token Budget.md`                  |
| `Tools/Claude/Cowork Configuration Layers.md` | "Recommended Content for the Instructions Box" section     | New `KC/Agents/Cowork Project Instructions.md`         |
| `Tools/Microsoft 365/Microsoft 365.md`        | Setup steps, Azure tenant lookup, env vars, dotfiles trick | New `KC/Tools/Microsoft 365.md`                        |

### Order of work

The order is smallest to largest, so each step can be reviewed before the next begins:

1. Activities (lowest risk - values already duplicated in Charter)
2. Email (same pattern as Activities)
3. Claude tool (single new KC note; abstract framing stays)
4. Cowork Layers (single new KC note; lift-and-shift of one section)
5. Microsoft 365 (largest split; needs care to keep MCP framing in Model coherent after the lift)
6. KC and Model index updates (last, once the new notes exist)
7. Verification pass

---

## Related Streams

- [[Boundary Rules Proposal]] - establishes the rules this stream is applying. Several rules in its draft table speak directly to the extractions here ("KC operational content in Pillars/Knowledge Islands - Hard"; "Specific tools or integrations in Pillars/Knowledge Islands/Model/Conventions - Hard"). If Boundary Rules ratifies before this stream completes, re-check alignment; if this stream completes first, the extractions become a worked example for the rules.

## Governance

This stream adheres to the [[Enactment Process]]. Content reaches `Pillars/` or `Resources/` only on user approval of a `ready` proposal.
