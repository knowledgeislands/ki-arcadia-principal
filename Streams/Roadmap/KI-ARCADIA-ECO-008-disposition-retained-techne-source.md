---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-008
area: ECO
title: Retire the Techne source and disposition its work
theme: ecosystem-coordination
horizon: now
status: ready
blocks: []
blocked_by: []
baseline_ref: e06d1d902f892c7bac37f1a4ebf61201378b0f6d
created_at: 2026-10-04T11:03:22Z
updated_at: 2026-10-04T16:59:00Z
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

- [ ] Push the three Paperclip candidate branches unchanged to `knowledgeislands/ki-techne-principal`, verify each remote tip equals its local commit, record each as preserved unaccepted in the archived source, then `git worktree remove` each worktree. Do not accept, integrate or delete the branches, and do not mutate Paperclip companies or issues.
- [ ] Obtain an independent judgement on each open draft and the issue ledger; transfer a surviving outcome as a new receiver-owned Triage record citing its originating identifier as provenance, or close it in the source with a terminal note. Never reuse a foreign identifier. Resolve the `TECHNE-GOV-005` reference from evidence without inventing a record.
- [ ] Commit a final source change marking the repository retired and archived in `README.md` and `AGENTS.md`, pointing to Arcadia Engineering Practice; push it, confirm every branch and tag is on the remote, then run `gh repo archive knowledgeislands/ki-techne-principal --yes`.
- [ ] Enact the Arcadia governance change: Charter, Known Lands, Techne Programme Hold, `AGENTS.md`, `README.md`, the Tool Ecosystem Map and any other note describing the source as live or retained; remove the source from `[skills.ki-agora.kis].members` and its trade route in `.ki.toml`. Decision Records stay historical unless their own convention requires an amendment.
- [ ] Run `ki registry remove ki-techne-principal`.
- [ ] Remove live references in their owning repositories: trade routes in `ki-techne-harness`, `tools-techne`, `ki-agentic-harness` and `ki-website`; the harness README; the website README and project catalogue; and chezmoi repository, trusted-folder, `ki` config and workspace entries, followed by a reviewed `chezmoi diff` and `chezmoi apply` and removal of trusted-folder entries from runtime configuration. Leave historical records unchanged.
- [ ] Verify and report whether the local source checkout is clean and fully pushed; do not delete it.

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

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
