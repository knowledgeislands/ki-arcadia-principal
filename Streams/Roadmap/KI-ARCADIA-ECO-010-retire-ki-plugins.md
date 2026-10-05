---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-010
area: ECO
title: Retire the ki-plugins projection from Arcadia governance
theme: ecosystem-coordination
horizon: now
status: done
blocks: []
blocked_by: []
baseline_ref: e5b61cc7b94c179b8bfe873e419536d43e50fa57
created_at: 2026-10-05T10:41:06Z
updated_at: 2026-10-05T11:20:00Z
---

# Retire the Ki-Plugins Projection From Arcadia Governance

## Goal

Remove `ki-plugins` from Arcadia's territorial inventory and working set now that the owner has retired it, so that Known Lands, the Agora declaration and the shared ecosystem fundamentals no longer describe a live plugin-packaging member.

---

## Context

`knowledgeislands/ki-plugins` was a generated Claude plugin marketplace projecting the `ki-agentic-harness` skills and governance agents onto Claude Cowork. Its projection had been paused since 2026-09-20 with no drift check, and its revival was tracked in the harness as `KI-HARNESS-GOV-093`.

On 2026-10-05 the owner decided to retire it ("lets just get rid of it, its 1 less thing to think about"). The `ki` CLI is the main installer and `npx skills add knowledgeislands/ki-agentic-harness -s <skill> -a <agent>` is the quick skills-only route for people outside Knowledge Islands. The harness records the architectural change as `ADR-KI-HARNESS-015` and delivers its side under `KI-HARNESS-RTP-016`, which closes `KI-HARNESS-GOV-093` as superseded and parks `KI-HARNESS-RTP-002`.

The retirement follows the [[KI-ARCADIA-ECO-008-disposition-retained-techne-source|ECO-008]] precedent: archive the source read-only, remove it from Arcadia governance and the Agora, deregister it, and remove live references in owning repositories while leaving historical records untouched.

---

## Boundary

- Arcadia owns its Known Lands inventory, its Agora declaration and its copy of the shared `GDR-KI-FUNDAMENTALS-001`. Peer repositories own their own copies, catalogues and trade routes.
- Retirement archives the repository and keeps its history. It authorises no repository deletion and no deletion of the local checkout.
- Done roadmap records, Calendar notes and `+/` captures stay as historical evidence.
- Publishing to any package registry, remote agent execution and remote-environment management are out of scope under the [[Techne Programme Hold]].

---

## Current state

Implemented on 2026-10-05 against Arcadia `e5b61cc7b94c179b8bfe873e419536d43e50fa57`. `ki-plugins` carries its retirement notice at `09fc984f4a7b701f8108829c57e9de8548616cb7`, is archived on GitHub, and is removed from the local KI registry. The governance edits below are complete and awaiting review.

---

## Steps

- [x] Replace the `ki-plugins` README, `AGENTS.md` and `CLAUDE.md` with a retirement notice pointing to the `ki` CLI and `npx skills add`; commit, push and run `gh repo archive knowledgeislands/ki-plugins --yes`.
- [x] Run `ki registry remove` for `ki-plugins`.
- [x] Remove `ki-plugins` from [[Known Lands]]: drop its inventory row, restate the count as 21 identities (Arcadia and 20 member islands), and record the retirement beside the `ki-techne-principal` note. Keep the link definition for the retirement sentence.
- [x] Remove `https://github.com/knowledgeislands/ki-plugins` from `[skills.ki-agora.kis].members` in `.ki.toml`.
- [x] Drop the "`ki-plugins` owns generated plugin packaging" clause from the shared `GDR-KI-FUNDAMENTALS-001`, identically in the Arcadia, harness, `ki-specifications`, `ki-website` and `tools-ki` copies.
- [x] Remove live references in owning repositories (harness under `KI-HARNESS-RTP-016`, `ki-website` project catalogue, trade routes) and hand off chezmoi-managed entries to their owner.

---

## Files touched

- `Admin/Governance/Known Lands.md`
- `Admin/Governance/Decisions/GDR-KI-FUNDAMENTALS-001-knowledge-islands-ecosystem-fundamentals.md`
- `.ki.toml`
- `Streams/Roadmap/_ISSUES.md`
- `Streams/Roadmap/KI-ARCADIA-ECO-010-retire-ki-plugins.md`

---

## Verify

- `grep -rn ki-plugins` across Arcadia finds no live reference outside this record, the Known Lands retirement sentence, Calendar notes, done records and `+/` captures.
- The shared `GDR-KI-FUNDAMENTALS-001` projection is identical across the harness, `ki-specifications`, `ki-website` and `tools-ki` copies; the Arcadia copy differs only by `note_type`.
- `ki repo audit --progress never` passes in Arcadia and in each peer repository touched.

---

## Dependencies / blocks

Owner approval for retirement, archival and deregistration was given explicitly on 2026-10-05. The harness side is `KI-HARNESS-RTP-016` (non-blocking, delivered alongside). No local roadmap dependency.

---

## Review

### Delivered

`ki-plugins` is retired, archived read-only and deregistered. Arcadia no longer lists it as a member island or Agora member, and the shared ecosystem fundamentals no longer assign plugin packaging to a live repository.

### Change Summary

- [[Known Lands]]: inventory row removed; count restated as 21 identities (Arcadia and 20 member islands); retirement sentence added citing this record and `ADR-KI-HARNESS-015`.
- `.ki.toml`: `ki-plugins` removed from `[skills.ki-agora.kis].members`.
- `GDR-KI-FUNDAMENTALS-001`: plugin-packaging clause removed in all five copies.
- `Streams/Roadmap/_ISSUES.md`: ECO high-water mark advanced to 010.

### Verification

- Five-copy `md5` check of `GDR-KI-FUNDAMENTALS-001`: four identical projections; the Arcadia copy differs only by `note_type`.
- Arcadia `grep` for `ki-plugins` finds only Known Lands, Calendar, done records, `+/` captures and this record.
- `ki repo audit --progress never` passes in Arcadia, `ki-specifications`, `ki-website` and `tools-ki`. The harness audit shows no finding from this change.

### Outstanding concerns

- The five Claude governance agents in the harness `subagents/governance/` reached Claude only through the plugin. Until `tools-ki` projects `subagents/` into `.claude/agents`, they are available only by explicit copy or link; this is handed to `tools-ki`.
- Chezmoi-managed entries (`dot_mgit.toml`, `ki` config, trusted folders, VS Code workspace) still name `ki-plugins` and are handed to their owner.
- The local `ki-plugins` checkout remains for the owner to delete.

### Post-change review

The change mirrors ECO-008: a retirement sentence keeps the inventory honest about the former member without listing it as live, and the shared record stays one projection.

### Mini recap

One repository fewer to think about: `ki-plugins` is archived and out of Arcadia's inventory and Agora, with installation routed through the `ki` CLI and `npx skills add`.

---

## Done

Accepted 2026-10-05 by Fable (independent reviewer) on the review packet above, left at `done` for Kris Brown's review.

---

## Discussion

### Shaping - 2026-10-05

Adopted into Now, shaped and implemented in one session on the owner's explicit retirement instruction, under the lifecycle skills with an independent Fable review before closure. Fable judged the harness `ki-repo-plugins` shape safe to retire (reversible, low audit risk).

### Review - 2026-10-05

Fable accepted the record: Known Lands lists 21 identities matching the 20 Agora members, the shared record projection is identical across copies, and the format matches ECO-008. Its one nit, an unreported estate audit claim in Verify, was resolved by narrowing Verify to the per-repository audits.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
