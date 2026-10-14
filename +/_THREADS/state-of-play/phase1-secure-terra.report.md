# Phase 1 - secure every branch on terra: report

Estate reshape, Decision 62 (approved 2026-10-12). Work began by re-running the inventory with `git fetch --prune`. Its counts matched the snapshot: 5 AHEAD, 1 DIRTY, 7 GONE, 43 NOUPSTREAM and 20 WORKTREE. Nothing was committed, force-pushed or deleted, and no remote branch was deleted.

## Done

- **11 unmerged branches pushed under their own names** with `git push -u`; none was rejected and none collided with an existing remote name:
  - hnr-agentic-harness `paperclip/aligned-20260926/HUM-21-a-paperclip-200-is-not-proof-an-agent-config-write-applied-read-it-back`
  - hnr-shared `paperclip/aligned-20260926/HNR-38-record-the-bioweave-hnr-to-zero-naming-rule-in-hnr-shared-pillars-product`
  - kit-hnr `paperclip/aligned-20260926/HNR-15-give-the-outward-sharing-check-a-home-in-kit-hnr-admin`
  - hnr-backend `feat/gardener-ordered-migrations`, `feat/gardener-upsert-and-track`, `feat/planting-upsert-and-track`
  - infoschematics `worktree-agent-abd13720a30e3e0ad`
  - ki-agentic-harness `automation/ki-v0.10.0` (its upstream had gone)
  - tools-ki `paperclip/aligned-20260926/KIS-46-ki-dev-skill-rubric-resolves-the-dev-linked-primary-checkout-never-the-cwd-worktree-si`
  - vallearmonia-website `pr145`, `pr146`
- **1 fast-forward push:** vallearmonia-principal `main` was 2 ahead and 0 behind `origin/main`, so it was a pure fast-forward and was pushed.
- **4 rescue pushes.** Each branch was both ahead of and behind its upstream, so it was pushed to `rescue/<branch>` with no merge or rebase. Each rescue name was confirmed absent on the remote first.
  - hnr-backend `refactor/planting-remove-unmanaged` (ahead 1, behind 39) → `rescue/refactor/planting-remove-unmanaged`
  - vallearmonia-principal `va-principal-gov-003-company-operations-va-6` (ahead 2, behind 35) → `rescue/va-principal-gov-003-company-operations-va-6`
  - vallearmonia-website `VA-9-review-shilpin-s-gov-003-reconciliation-candidate-commit-d12e045` (ahead 1, behind 84) → `rescue/VA-9-…-d12e045`
  - vallearmonia-website `va-web-gov-003-reconcile-va-7` (ahead 8, behind 84) → `rescue/va-web-gov-003-reconcile-va-7`
- **8 worktrees removed** with `git worktree remove` (no `--force`), then `git worktree prune` was run in each affected repository. Each tree was clean and its HEAD was confirmed to be on origin first.
  - hnr-agentic-harness: 2 paperclip worktrees
  - tools-ki: 1 paperclip worktree (KIS-46)
  - kit-techmedix: `tmx-8-roadmap-preparation`
  - vallearmonia-principal: `va-principal-gov-003-company-operations-va-6`
  - vallearmonia-website: `VA-10-finding-website-repo-…`, `VA-9-review-shilpin-s-…` and `va-web-gov-003-reconcile-va-7`

## Left, and why

- **28 vallearmonia-website `prNNN` branches were not pushed** (`pr131`–`pr160` except `pr145` and `pr146`). This departs from the literal brief. Each tip is already wholly contained in an existing `origin/seed/mark-howarth-*` branch, so the work is already on origin. Pushing them would have added 28 redundant branch names to the vallearmonia org remote. They still show as NOUPSTREAM unmerged in the after-inventory. Like merged branches, they are safe to delete locally. The owner can still have them pushed by name if wanted.
- **8 worktrees were left because they are dirty.** Each branch's HEAD is on origin, but the trees have uncommitted changes. These are presumed to be paperclip or agent work in progress, so nothing was committed.
  - hnr-shared: `worktrees/1a8a0b9d-5a73-44ad-ae9b-e56f9980fdbf/hnr-shared/…/HNR-38-…` (1 file)
  - kit-hnr: paperclip HNR-15 (1 file), HNR-18 (1), HNR-39 (1), HNR-40 (1), HNR-45 (1) and HNR-49 (3)
  - infoschematics: `.claude/worktrees/agent-abd13720a30e3e0ad` (3 files)
- **4 kit-legal worktree entries were left unpruned.** Their directories under `/private/tmp/cc001-*` are missing, so git reports them as prunable, but `git worktree prune` was deliberately not run in kit-legal.
  - 3 of the 4 detached HEADs (`9a5a1699`, `6708e0bb` and `0c32afe6`) are contained in `origin/command-center-v1`.
  - `4ff8e2cf` ("cc-001: establish command centre governance sources") is on no local or remote branch. The stale worktree entry is its only reference, so pruning would orphan it.
  - Securing it needs a new branch or a push, such as `rescue/cc-001-exec` from `4ff8e2cf`, which is outside this brief. It needs the owner's call.
- **chezmoi `workspaces/kit/personal/dot_mgit.toml`:** it was modified at the start, then committed locally by its owning thread during this run as `06cabcc` ("chore(mgit): add kit-acquire to the personal workspace manifest"). It is no longer dirty. I did not touch it and did not push it.
- **New dirty file, not ours:** vallearmonia-website `site/src/projects/vision-statement.md` (1 file modified, no line-count change; probably mode or whitespace only). It appeared during the run and belongs to another thread, so it was left alone.

## Merged branches listed for deletion

These are already contained in the default branch and were not deleted.

- kit-hnr, with no upstream: `paperclip/aligned-20260926/HNR-18-…`, `HNR-39-…`, `HNR-40-…`, `HNR-45-…` and `HNR-49-…`. Their dirty worktrees are listed above; delete those first.
- hnr-backend, no upstream: `feat/planting-migration-validation`
- hnr-backend, upstream gone: `feat/gardener-upsert-support`, `feat/planting-once-migrations`, `feat/planting-seed-and-cleanup-migrations`, `feat/planting-upsert-operations` and `refactor/gardener-remove-items-alias`

## After-inventory

The after-inventory is in `phase1-inventory-terra-after.txt` and was taken after a fresh fetch.

| Kind | Before | After | Remaining are |
| --- | --- | --- | --- |
| AHEAD | 5 | 4 | the 4 branches rescued to `rescue/*`; their local upstreams were left unchanged |
| DIRTY | 1 | 1 | vallearmonia-website `vision-statement.md`, which belongs to another thread |
| GONE | 7 | 5 | all merged (hnr-backend) |
| NOUPSTREAM | 43 | 34 | 6 merged and 28 `prNNN` branches already contained in origin |
| WORKTREE | 20 | 12 | 8 dirty worktrees and 4 stale kit-legal entries |

## Failed

None. The first push attempt failed harmlessly and pushed nothing: zsh's `:r` modifier mangled the refspecs. It was re-run under correct quoting.

## Needs the owner

1. kit-legal commit `4ff8e2cf` is referenced only by a stale worktree entry. Approve a `rescue/` push of it, then a `git worktree prune` in kit-legal.
2. 8 dirty worktrees (7 paperclip worktrees in hnr-shared and kit-hnr, and 1 infoschematics agent worktree) need their owning threads to commit or discard before the worktrees can be removed.
3. Confirm that leaving the 28 contained `prNNN` branches unpushed is acceptable.

## Verdict

Phase 1 is clean on terra apart from the recorded exceptions. Every local branch tip is either on origin (under its own name, a `rescue/` name or a containing branch) or contained in the default branch. The only exceptions are the kit-legal detached commit `4ff8e2cf` and the uncommitted changes in the 8 dirty worktrees and 1 dirty file.
