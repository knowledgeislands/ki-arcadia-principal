---
type: handoff
status: active
date: 2026-06-27
---

# Handoff: "Capital" as Seat of Governance — Terminology Cleanup

## What happened

Two sessions completed a conceptual overhaul of how "capital" is used in the KI model.

**Session 1 (archipelago/territory separation, commit `16376d9`):**

Separated the conflation of "archipelago" (geographic grouping) from "territory" (governance jurisdiction) across SDR-KI-ARCADIA-005,
`Territories and Archipelagos.md`, `Glossary.md`, and the website. The word "Capital" was already used in these notes but never defined.

**Session 2 (this session, capital-as-governance-seat):**

Retired "Knowledge Capital" as a concept name for an island's realisation layer. "Capital" now means the governance-seat role held by a
territory's principal island. Changes made:

| File                                        | Change                                                                                                                                                      |
| ------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SDR-KI-ARCADIA-005`                        | Added "The Capital" subsection; fixed Charter reference to `Admin/`                                                                                         |
| `SDR-KI-ARCADIA-003`                        | Retired "Knowledge Capital" concept; Charter + Council now described as living in `Admin/`; added SDR-005 forward ref; removed `Knowledge Capitals.md` link |
| `Territories and Archipelagos.md`           | Added "The Capital" paragraph; fixed Charter reference to `Admin/`                                                                                          |
| `Glossary.md`                               | Replaced "Knowledge Capital" row with "Capital" (governance seat); fixed "Governance Infrastructure" (archipelago → territory); fixed "Contribution" row    |
| `Knowledge Capitals.md`                     | Marked superseded; added forward links                                                                                                                      |
| `How an Island Takes Shape.md`              | "Knowledge Capital" → `Admin/`                                                                                                                              |
| `Jurisdiction.md`                           | `[[Knowledge Capital]]` → `[[Admin/Governance]]`                                                                                                            |
| `Charter.md`                                | "Knowledge Capital" → `Admin/`                                                                                                                              |
| `Admin/Governance/Conventions/Authoring.md` | Path `Knowledge Capital/Activities/` → `Admin/Activities/`                                                                                                  |
| `arcadia-website/get-started/index.njk`     | Card heading "Knowledge Capital" → "The Council"; prose updated in 3 places                                                                                 |

## What remains

**~150 references in Streams proposals** — these are working documents (Active, Background, Future) that still say "Knowledge Capital"
meaning the old realisation-layer concept. They were intentionally left as-is; they use pre-transition terminology. Update each proposal as
it is enacted, not in bulk.

**Key proposals with the most references:**

- `Streams/Active/Knowledge Capital Extraction Proposal/` — the proposal itself; its scope was about extracting Arcadia-specific config from
  shared model notes into the old KC folder. With `Admin/` now the canonical home, this proposal may be completable or closeable depending
  on whether the extraction work is done.
- `Streams/Background/Page Registry Proposal/` — references KC paths in tree diagrams
- `Streams/Background/Kit Principal Inception Proposal/` — KC paths for kit-principal setup
- `Streams/Future/Island MCP/` — MCP integration points reference KC structure

**Files NOT updated (intentional):**

- `Admin/Admin.md`, `Admin/Operations/Operations.md`, `Admin/Governance/Governance.md` — migration notes referencing the old KC path; these
  are the formal record of the migration per GDR-KI-ARCADIA-003 and should stay as-is.
- `Admin/Governance/Decisions/GDR-KI-ARCADIA-003-*` — the formal retirement record of "Knowledge Capital" as a zone name.
- `SDR-KI-ARCADIA-002-the-home-of-knowledge.md` — older SDR, still uses "Knowledge Capital" in passing; not updated this pass.
- `Pillars/Philosophy/Realisation/Knowledge Capitals/` folder — Charter.md, Council.md, Integrations.md inside the superseded folder. The
  folder is marked superseded at the top level; individual notes can be cleaned up or deleted when the extraction proposal is resolved.

## Current authoritative definition

> The **Capital** is the seat of governance for a jurisdiction — not a folder or zone, but a role held by the principal island of a
> territory. At the territory level, the principal island is the Capital. For structures spanning multiple territories, each territory has
> its own Capital; if the overarching structure carries governance authority, there is also a meta-Capital — the principal island of the
> governing territory.
>
> Arcadia is the meta-Capital of the Knowledge Islands model.

Source: SDR-KI-ARCADIA-005, "The Capital" section (also mirrored in `Territories and Archipelagos.md`).

## Suggested next step

Assess the **Knowledge Capital Extraction Proposal** in this folder. With `Admin/` now the canonical home for all island-specific
realisation, most of the extraction it proposed has already happened (per GDR-KI-ARCADIA-003). The proposal may be ready to settle as
"complete" or to close with a note that the work was absorbed into GDR-KI-ARCADIA-003 and the terminology work above.
