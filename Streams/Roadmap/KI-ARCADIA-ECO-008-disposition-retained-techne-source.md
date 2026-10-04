---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-008
area: ECO
title: Retire the Techne source and disposition its work
theme: ecosystem-coordination
horizon: now
status: awaiting-review
blocks: []
blocked_by: []
baseline_ref: e06d1d902f892c7bac37f1a4ebf61201378b0f6d
created_at: 2026-10-04T11:03:22Z
updated_at: 2026-10-04T17:55:00Z
---

# Retire the Techne Source and Disposition Its Work

## Goal

Agree the long-term disposition of the retained `ki-techne-principal` repository and its existing work without losing evidence, creating a second engineering-knowledge authority, or treating knowledge consolidation as permission to retire the source.

---

## Context

The accepted [[KI-ARCADIA-ECO-007-consolidate-techne-knowledge|Techné knowledge consolidation]] made Arcadia the canonical engineering-knowledge owner while preserving the Techné harness and operator CLI as separate products. The [[techne-consolidation-manifest|consolidation manifest]] records the bounded migration and retained evidence.

That delivery deliberately left source retirement, held-work transfer, foreign work-identifier policy and the missing source reference to `TECHNE-GOV-005` unresolved. The review retained `TECHNE-OPS-002`, `TECHNE-OPS-004` and `TECHNE-OPS-005`, the issue ledger, candidate commits and worktrees in the source repository. These are evidence to re-ground before proposing a disposition, not a claim that their present state is unchanged.

The current [[Techne Programme Hold]] restricts remote agent execution and remote-environment management. Local tool-building remains subject to each repository's ordinary authority; this item neither broadens that authority nor reinstates the earlier blanket hold.

---

## Boundary

If adopted, prepare a decision-useful census and explicit owner choices:

- Whether to retain the source as a clearly noncanonical evidence and work location, or propose a separately approved retirement after all required evidence has another durable home.
- Which repository should own each surviving work outcome, distinguishing knowledge work from harness and CLI implementation. Any transfer must preserve originating identity, provenance, dependencies and review evidence; decide the foreign-work-identifier policy before moving or reissuing records.
- How to resolve the missing `TECHNE-GOV-005` reference from surviving evidence, without inventing a missing record or reusing an issued identifier.
- What candidate commits, branches, worktrees and historical knowledge must remain recoverable, and what verification would make any later cleanup safe.

Arcadia owns this coordination proposal, not unilateral mutation of the source or products. Derive receiver-owned work records for approved changes that need their own delivery and acceptance. This is a non-blocking follow-up to the completed consolidation, not a reopening of its acceptance.

Capture authorises no source disposal or archival action, work transfer, identifier rewrite, candidate acceptance or integration, branch or worktree deletion, remote-operation resumption, company or registry mutation, Agora change, or trade-route change. Preserve the current hold and independent product ownership. Wider consumer-navigation drift and inter-territory exchange remain separately scoped concerns.

On 2026-10-04 the owner instructed "get ki-techne-principal retired", adopting this record and approving the retirement sequence in the Steps below: candidate preservation without acceptance, draft disposition, source archival, Arcadia governance change, Agora and registry removal, and estate reference cleanup. That approval still grants no candidate acceptance or integration, no Paperclip company or issue mutation, no remote-operation resumption and no deletion of the local checkout.

---

## Current state

Adopted into Now and shaped to Ready on 2026-10-04 on the owner's explicit instruction to retire `ki-techne-principal`. Re-grounded census at Arcadia `e06d1d902f892c7bac37f1a4ebf61201378b0f6d` and source `ee5e84806eb0b250b316d3db57748a4d907cba0b`:

- Source `main` is clean and level with `origin/main`; `pilot/isolated-agent-execution` is already pushed; no tags exist.
- Three local Paperclip branches are unpushed: KIS-10 at `0f77071`, KIS-44 at `c99592a` (equal to the source base, no commit beyond `main`'s ancestry) and KIS-7 at `eb7292a`. Each has a clean registered worktree under the Paperclip instance.
- `TECHNE-OPS-002` (Waiting-for), `TECHNE-OPS-004` and `TECHNE-OPS-005` (Parked) remain draft; `_ISSUES.md` records high-water marks GOV 13 and OPS 9. `TECHNE-OPS-002` cites `TECHNE-GOV-005`, for which no record exists on `main`.
- Live references remain in Arcadia governance and navigation, the `kis` Agora, the `ki` registry, trade routes in five estate repositories, the website catalogue, the harness README, and chezmoi-managed repository, trust and workspace lists.

## Steps

- [x] Push the three Paperclip candidate branches unchanged to `knowledgeislands/ki-techne-principal`, verify each remote tip equals its local commit, record each as preserved unaccepted in the archived source, then `git worktree remove` each worktree. Do not accept, integrate or delete the branches, and do not mutate Paperclip companies or issues.
- [x] Obtain an independent judgement on each open draft and the issue ledger; transfer a surviving outcome as a new receiver-owned Triage record citing its originating identifier as provenance, or close it in the source with a terminal note. Never reuse a foreign identifier. Resolve the `TECHNE-GOV-005` reference from evidence without inventing a record.
- [x] Commit a final source change marking the repository retired and archived in `README.md` and `AGENTS.md`, pointing to Arcadia Engineering Practice; push it, confirm every branch and tag is on the remote, then run `gh repo archive knowledgeislands/ki-techne-principal --yes`.
- [x] Enact the Arcadia governance change: Charter, Known Lands, Techne Programme Hold, `AGENTS.md`, `README.md`, the Tool Ecosystem Map and any other note describing the source as live or retained; remove the source from `[skills.ki-agora.kis].members` and its trade route in `.ki.toml`. Decision Records stay historical unless their own convention requires an amendment.
- [x] Run `ki registry remove ki-techne-principal`.
- [x] Remove live references in their owning repositories: trade routes in `ki-techne-harness`, `tools-techne`, `ki-agentic-harness` and `ki-website`; the harness README; the website README and project catalogue; and chezmoi repository, trusted-folder, `ki` config and workspace entries, followed by a reviewed `chezmoi diff` and `chezmoi apply` and removal of trusted-folder entries from runtime configuration. Leave historical records unchanged.
- [x] Verify and report whether the local source checkout is clean and fully pushed; do not delete it.

## Files touched

- Arcadia: this record; `.ki.toml`; `AGENTS.md`; `README.md`; `Admin/Governance/Charter.md`; `Admin/Governance/Known Lands.md`; `Admin/Governance/Policies/Techne Programme Hold.md`; `Pillars/Technē/Tool Ecosystem Map.md`; any new receiver-owned Triage records the draft judgement requires.
- Source `ki-techne-principal`: `README.md`; `AGENTS.md`; the three open draft records with terminal or transfer notes; remote branches only for candidates.
- `ki-techne-harness`, `tools-techne`: `.ki.toml` trade route; any receiver Triage record the judgement assigns.
- `ki-agentic-harness`: `.ki.toml` trade route; `README.md`.
- `ki-website`: `.ki.toml`; `README.md`; `apps/site/src/_data/projects.json5`; `apps/site/src/projects/index.njk`.
- chezmoi: `workspaces/kit/knowledgeislands/dot_mgit.toml`; `dot_config/ki/config.toml`; `.chezmoidata/trusted-folders.yaml`; `workspaces/vscode/kis-ki-techne-principal.code-workspace`.

## Verify

- `git ls-remote origin` in the source lists every local branch at its local tip, and `git tag` is empty or fully mirrored; `git status` is clean and `main` equals `origin/main` before archiving.
- `gh repo view knowledgeislands/ki-techne-principal --json isArchived` reports `true`.
- `git worktree list` in the source shows only the primary checkout.
- `ki registry list` no longer lists the source; no live estate file outside historical records references it.
- `ki repo audit` passes in every touched repository, plus the touched website verification scripts.

## Dependencies / blocks

Owner approval for retirement, archive, branch preservation, governance change and deregistration was given explicitly on 2026-10-04. The [[Techne Programme Hold]] continues to restrict remote agent execution and remote-environment management; repository archival is not a remote operation under that policy. No local roadmap dependency.

## Delegation

One independent judgement on draft disposition and one independent final review; the coordinator performs all writes and commits.

---

## Review

### Delivered

The approved retirement sequence, from Arcadia baseline `e06d1d902f892c7bac37f1a4ebf61201378b0f6d` (Ready at `099d2e4`) and source baseline `ee5e84806eb0b250b316d3db57748a4d907cba0b`. Candidates were preserved, never accepted or integrated; no Paperclip company or issue, remote environment, Decision Record or local checkout was changed or deleted.

### Change Summary

- **Source** `knowledgeislands/ki-techne-principal`: three `paperclip/aligned-20260926/` branches pushed unchanged and their worktrees removed; final commit `c6f190a` marks `README.md` and `AGENTS.md` retired and archived with an Arcadia pointer, closes `TECHNE-OPS-002`, `-004` and `-005` in place and resolves the `TECHNE-GOV-005` reference; the GitHub repository is archived.
- **Arcadia** `6336c6b`: Charter, Known Lands (inventory now 22 identities), Techne Programme Hold, Policies index, `AGENTS.md`, `README.md`, `Admin/MEMORY.md` and the Tool Ecosystem Map describe the source as retired; `.ki.toml` drops it from the `kis` Agora and removes its trade route. Dispositions and the foreign-work-identifier policy are recorded in Discussion.
- **Registry**: `ki registry remove ki-techne-principal`.
- **Estate**: trade route removed in `ki-techne-harness` `23a320c` and `tools-techne` `cfa84d8`; `ki-agentic-harness` `.ki.toml` route and README authority pointer; `ki-website` `f4417d5` removes the project entry and route, redirects `/projects/ki-techne-principal` to Arcadia and credits Engineering Practice; chezmoi `162a635` drops trusted-folder, `ki` repository-path, mgit and VS Code workspace entries, then `chezmoi apply`; trusted-folder entries removed from Claude Code settings, Claude Desktop configuration and Codex configuration.
- **Deviation**: none of the drafts was transferred, on independent judgement; see Discussion.

### Verification

- `git ls-remote origin` equals every local branch tip in the source; no tags or stashes; `main` level with `origin/main`; `git worktree list` shows only the primary checkout.
- `gh repo view knowledgeislands/ki-techne-principal --json isArchived` returned `true`.
- `ki registry list` no longer lists the source; `chezmoi diff` is empty after apply.
- `ki repo audit` PASS in Arcadia, the source before archival, `ki-techne-harness`, `tools-techne`, `ki-website` and chezmoi; `ki-agentic-harness` PASS with one pre-existing housekeeping WARN (SELECT-2 auto-memory) unrelated to this change.
- Website `verify:projects`, `verify:routes`, `verify:docs`, `verify:provenance`, `verify:prose`, `bun test scripts` and a clean `build` including `verify:reachable` pass.
- An estate grep outside historical records leaves only pinned provenance links in Arcadia, Arcadia `+/` captures, the harness `+/` prior-art note, the website redirect and the `tools-ki` and `tools-mgit` references below.

### Outstanding concerns

- `tools-ki` (`.ki.toml` route, `README.md`) and `tools-mgit` (`.ki.toml` route) are owned by a concurrent agent; a handoff was sent rather than editing them.
- The local checkout is clean and fully pushed, holding only regenerable ignored caches; the owner may delete it.
- Paperclip's own records of KIS-7, KIS-10 and KIS-44 still name the removed worktree paths; they were deliberately not mutated.

### Post-change review

The goal is met: the source is retired and archived with every branch recoverable, Arcadia is the sole live engineering-knowledge authority, and no live estate surface treats the source as a member or work location. Scope held to the approved sequence, with the drafts closed rather than transferred on recorded rationale. Regression risk is low; archival is reversible and the hold is neither lifted nor broadened.

### Mini recap

Retired `ki-techne-principal` end to end: candidates preserved unaccepted, drafts closed in place, `TECHNE-GOV-005` explained, governance, Agora, registry and estate references updated, repository archived. Learning route: the foreign-work-identifier policy recorded here may warrant promotion into the shared work-roadmap standard through `ki-agentic-harness`.

---

## Discussion

Captured on 2026-10-04 with the owner's permission to reserve and commit a Triage item. Before adoption, re-read the retained source state, the accepted consolidation evidence and the live hold policy, then present bounded alternatives and their evidence-retention consequences. No implementation choice is made by this record.

On 2026-10-04 the owner stated a preference for retiring `ki-techne-principal` and asked for this record to carry the retirement path. A point-in-time census taken that day, to be re-grounded on adoption:

- Candidate work in three Paperclip worktrees under `~/.paperclip/instances/default/worktrees/`: `0f77071` (KIS-10 write-root enforcement), `c99592a` (KIS-44 landing `0f77071` onto source `main`) and `eb7292a` (KIS-7 AWS cluster proof for `TECHNE-OPS-002`). The [[Techne Programme Hold]] keeps these reviewable, neither accepted nor discarded.
- Three open drafts: `TECHNE-OPS-002`, `TECHNE-OPS-004` and `TECHNE-OPS-005`, plus the source `_ISSUES.md` ledger.
- Live references: Arcadia `AGENTS.md`, the Charter, Known Lands, the Techne Programme Hold and five Decision Records; membership of the `kis` Agora in `.ki.toml`; a `ki` registry entry.

The retirement sequence the owner asked to be shaped, each step subject to its own approval:

1. Disposition each candidate: accept into its owning repository, transfer with provenance, or record it as discarded; then remove its Paperclip worktree and branch.
2. Transfer or close the three open drafts under the foreign-work-identifier policy decided above.
3. Update Arcadia governance to describe the source as retired, remove it from the `kis` Agora, and deregister it.
4. Archive the GitHub repository rather than delete it, so the evidence stays readable, then remove the local checkout.

### Retirement dispositions - 2026-10-04

Recorded during delivery from the re-grounded census and an independent judgement on the open drafts.

- **Candidates.** `0f77071572aa649a936be3069f635ab8ea721858` (KIS-10), `c99592a2a2e2872a95fe4c4f44506291a0b825c8` (KIS-44) and `eb7292a1f1bd515fcb7c44715caac48bfe5770ad` (KIS-7): preserved unaccepted in archived source. Each branch was pushed unchanged to `knowledgeislands/ki-techne-principal` under its `paperclip/aligned-20260926/` name and its remote tip verified equal to the local commit before its Paperclip worktree was removed with `git worktree remove`. None was accepted or integrated, and no Paperclip company or issue was changed.
- **`TECHNE-OPS-002`.** Closed in source, not transferred. Its knowledge outcome was enacted by `TECHNE-GOV-005` through `ADR-TECHNE-001` and the Arcadia Operating Model, AI Execution Fabric and Engineering Estate notes. Its remaining proof steps are remote-environment work under the [[Techne Programme Hold]], and the supervised-host decision is already carried by `TECHNE-TOOLS-OPS-008` in `ki-techne-harness`; transferring it would create a live record whose only steps are held remote operations.
- **`TECHNE-OPS-004` and `TECHNE-OPS-005`.** Closed in source, not transferred. Both were parked with nothing executed. If their reconsideration triggers are met - a real workflow needing durable pause, retry or approval, or an approved Fabric contract exposing a framework-sized gap - Arcadia may capture a fresh record citing the originating identifier as provenance.
- **`_ISSUES.md`.** Left untouched as a frozen ledger at GOV 13 and OPS 9. The `TECHNE-` namespace issues and reuses nothing further, and the ledger is not copied into any receiver.
- **`TECHNE-GOV-005`.** Not a missing record: "Govern isolated agent execution" was accepted at `aab2376` and pruned at `d381648` on 2026-09-15 under the source's prune-after-done convention, and is recoverable from `aab2376`. Its outcome is `ADR-TECHNE-001`. The source's `TECHNE-OPS-002` now says so; no replacement record was created and the identifier was not reissued.
- **Foreign work identifiers.** Arcadia neither issues, reuses nor adopts another repository's work identifiers. Work received from another repository takes a fresh identifier from the receiver's own ledger, records its origin in `transferred_from` with a canonical source URL at a pinned revision, and cites the source identifier only as provenance, never in `blocks` or `blocked_by`. A transfer carries no authority the receiver did not already hold, including any remote-operation authority under the hold.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
