---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-004
area: GOV
title: Convention rationale
theme: governance
tags:
  - topic/knowledge-islands
  - topic/knowledge-management
  - topic/conventions
status: awaiting-review
priority: low
horizon: next
blocks: []
blocked_by: []
baseline_ref: 7a9ce716b2816883c947a2ddeb597753b91be82b
created_at: 2026-06-29T17:12:25Z
updated_at: 2026-10-04T20:10:00Z
---

# Conventions: Make Implicit Explicit Proposal

Systematically identify conventions in ki-arcadia-principal that are asserted without documented rationale, and add the _why_ alongside the _what_ for each one.

## Governance

Follows the [[Admin/Operations/Processes/Enactment Process|Enactment Process]].

---

## Problem

Several structural conventions are in active use but have no rationale written down:

- **Digest routing**: digests go to `-/_DIGESTS/` (produced artefacts, not work-in-motion), but this is codified without explanation. The `session-digest` type is not in the frontmatter type taxonomy at all.
- **Staging zone distinctions**: the `+/` and `-/` staging zones have meaning, but the rules for what goes where and why are implicit.
- **Roadmap status lifecycle**: the earlier stream vocabulary (`future`, `background`, `active`, `ratified`) is retired. Roadmap records now move through `draft`, `ready`, `in-progress`, `awaiting-review` and `done` under `ki-repo-kb-streams`; the local Enactment Process names the sequence but not why each gate exists.
- Others may surface as the island is used more systematically by agents.

The risk is that these conventions become load-bearing infrastructure that no one can safely change or explain. Each one that gets an _explicit_ rationale becomes a decision that can be revisited, extended, and correctly applied.

## Scope

For each identified convention:

1. Locate the note (or notes) that assert it
2. Add a rationale section: the _why_ behind the rule, not just the rule itself
3. Where the convention belongs in the type taxonomy but is absent, add it
4. Cross-link related conventions so the picture is navigable

---

## Decisions

- **Bounded scope.** Enumerate first, then add the _why_ at each note that asserts these conventions: digest routing to `-/_DIGESTS/`, the `+/` and `-/` staging distinction, and the roadmap status lifecycle, which replaces the stale "stream status vocabulary" with the current `draft` to `done` lifecycle under `ki-repo-kb-streams`. Add `session-digest` to the note-type taxonomy if it is absent. Treat `blocked_by` KI-ARCADIA-OPS-001 as released, because OPS-001 is `done`, and clear it. Decided by the Fable reviewer under delegated autonomy (2026-10-04), reversible.
- **Routing is not changed here.** This record adds rationale to the conventions as they stand; it does not move existing records or change where a note type is filed.

---

## Current state

Enumerated on 2026-10-04:

- **Digest routing.** [[Session Digest]] asserts `-/_DIGESTS/` without saying why, and uses `type: session-digest` where the KI-wide frontmatter standard uses `note_type`. [[Outbound]] repeats the path in the same `type:` form and still names the retired `handoff` type. The KI-wide taxonomy in the `ki-repo-kb` frontmatter standard already lists `session-digest`. Arcadia's local [[Properties]] note does not mention `note_type` at all, so a reader of the island cannot find the taxonomy.
- **Staging.** [[Structure]] lists `+` as the inbox and `-` as outbound staging in its folder table, with no reason for keeping them apart or outside the zones. [[Outbound]] describes `-/` without a reason either. The `+/README.md` and `-/README.md` files are generic working-area notices and are left as they are.
- **Roadmap lifecycle.** The old `future`/`background`/`active`/`ratified` vocabulary no longer appears in any canonical note. The portable [[Processes/Enactment Process/Enactment Process|Enactment Process]] gives the current sequence but does not explain what each gate protects.
- **Conflict found.** [[Structure]] (Calendar table and routing rule 2) and `AGENTS.md` file session digests as Calendar notes (`YYYY-MM-DD Session - Topic.md`). [[Session Digest]], [[Outbound]] and the `ki-repo-kb` DIGEST mode use `-/_DIGESTS/`.

## Steps

- [x] Add a rationale section to [[Session Digest]], correct its frontmatter field to `note_type: session-digest`, distinguish it from a dated Calendar session note, and link [[Outbound]] and [[Structure]].
- [x] Add a rationale to [[Outbound]] for the outbound staging area, correct `type:` to `note_type:` and drop the retired `handoff` type.
- [x] Add a short rationale to [[Structure]] for keeping inbound `+` and outbound `-` staging apart and outside the zones.
- [x] Add a `note_type` row to [[Properties]] that points at the KI-wide taxonomy and names `session-digest`.
- [x] Add the reason for each lifecycle gate to the portable Enactment Process.
- [x] Record the Calendar versus `-/_DIGESTS/` conflict for the owner without changing routing.

## Files touched

- `Pillars/Philosophy/Model/Conventions/Notes/Session Digest.md`; `Pillars/Philosophy/Model/Conventions/Notes/Properties.md`.
- `Pillars/Philosophy/Model/Conventions/Structure/Structure.md`.
- `Pillars/Philosophy/Model/Processes/Enactment Process/Enactment Process.md`.
- `-/Outbound.md`; this record.

## Verify

- Each asserting note states the rule and the reason for it in the same place, and cross-links its related conventions.
- `session-digest` is reachable from the island's [[Properties]] note.
- Every new or changed wikilink resolves to exactly one note; no em or en dashes introduced.
- `ki repo audit`, `--skill ki-repo-kb` and `--skill ki-repo-kb-streams` pass; markdown hooks pass on commit.

## Dependencies / blocks

None. KI-ARCADIA-OPS-001 is `done`, so the earlier `blocked_by` is released.

## Delegation

None; the edits are small and sequential.

---

## Review

### Delivered

The approved boundary: rationale added where each convention is asserted, for digest routing, the `+`/`-` staging split and the roadmap status lifecycle; `session-digest` made reachable from the island's frontmatter notes; the released OPS-001 dependency cleared. Routing was not changed. Baseline `7a9ce71`; the full SHA is in `baseline_ref`.

### Change Summary

- **[[Session Digest]]:** new Rationale section (why outbound staging, why not Calendar, why a retention date, why a fixed type and path); frontmatter field corrected from `type:` to `note_type: session-digest`; links to [[Outbound]], [[Properties]] and [[Structure]]; em dashes replaced.
- **[[Outbound]]:** new Rationale section (why a separate outbound area, why apart from the inbox, why not a zone); `type:` corrected to `note_type:`; the retired `handoff` type is noted as retired rather than enforced.
- **[[Structure]]:** a paragraph after the folder table explains why inbound and outbound staging are kept apart and outside the zones.
- **[[Properties]]:** a `note_type` row and footnote point at the KI-wide taxonomy owned by `ki-repo-kb`, name `session-digest` and separate note kind from subject tags.
- **Enactment Process (portable):** the lifecycle sentence now says what each gate protects and records that it replaces the retired `future`/`background`/`active`/`ratified` vocabulary.
- **Deviation:** the `+/README.md` and `-/README.md` working-area notices were left unchanged, because they are generic and carry no convention of their own.

### Verification

- Each asserting note states the rule and its reason together and cross-links its related conventions.
- The shortest-unique resolver reports `bad 0` across all touched files; no em or en dashes in added lines.
- `ki repo audit`, `--skill ki-repo-kb` and `--skill ki-repo-kb-streams` PASS; rumdl hook passes on commit.

### Outstanding concerns

- **Owner decision needed on digest placement.** [[Structure]] (Calendar table row and routing rule 2) and `AGENTS.md` (Library Structure and Session Digests sections) file session digests as Calendar notes, `YYYY-MM-DD Session - Topic.md`. [[Session Digest]], [[Outbound]], the `ki-repo-kb` DIGEST mode and its ZONE-5 audit use `-/_DIGESTS/`. Practice follows `-/_DIGESTS/`: it holds one digest and Calendar holds none. Once the owner chooses, the losing guidance should be aligned. The likely route is to keep `-/_DIGESTS/` and describe any dated Calendar session note as `calendar/session`.
- [[Properties]] says all fields except `creator` are required, although `memory_file` and `day_type` are optional, and its `status` values differ from the free-form `status: active 2026` used by [[Session Digest]] and [[Outbound]]. This is pre-existing and outside this boundary.

### Post-change review

The three named conventions now carry their reasons at the point of assertion, so a future change can weigh what it would break. The edits are additive prose plus two field-name corrections, so regression risk is low; links and dashes were checked mechanically. The digest placement conflict is surfaced rather than resolved, because resolving it would change routing. Ready for review.

### Mini recap

Rationale was added to five notes, the taxonomy is now reachable, the lifecycle reasons are explained and OPS-001 is released; the audits pass. Learning route: the remaining Calendar versus `-/_DIGESTS/` conflict is an owner routing decision.

---

## Discussion

The original sequencing waited for the Agentic Tool Documentation stream (KI-ARCADIA-OPS-001), which is now done. Further conventions without rationale may surface as agents use the island more systematically; capture them as new records rather than widening this one.

---

## Adherence

This stream adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Content reaches `Admin/`, `Pillars/` or `Resources/` only on approval of a `ready` proposal.
