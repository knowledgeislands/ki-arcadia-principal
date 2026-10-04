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
status: ready
priority: low
horizon: next
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-06-29T17:12:25Z
updated_at: 2026-10-04T19:55:00Z
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

- [ ] Add a rationale section to [[Session Digest]], correct its frontmatter field to `note_type: session-digest`, distinguish it from a dated Calendar session note, and link [[Outbound]] and [[Structure]].
- [ ] Add a rationale to [[Outbound]] for the outbound staging area, correct `type:` to `note_type:` and drop the retired `handoff` type.
- [ ] Add a short rationale to [[Structure]] for keeping inbound `+` and outbound `-` staging apart and outside the zones.
- [ ] Add a `note_type` row to [[Properties]] that points at the KI-wide taxonomy and names `session-digest`.
- [ ] Add the reason for each lifecycle gate to the portable Enactment Process.
- [ ] Record the Calendar versus `-/_DIGESTS/` conflict for the owner without changing routing.

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

## Discussion

The original sequencing waited for the Agentic Tool Documentation stream (KI-ARCADIA-OPS-001), which is now done. Further conventions without rationale may surface as agents use the island more systematically; capture them as new records rather than widening this one.

---

## Adherence

This stream adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Content reaches `Admin/`, `Pillars/` or `Resources/` only on approval of a `ready` proposal.
