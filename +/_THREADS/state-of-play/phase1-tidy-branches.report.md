# Phase 1b - tidy merged branches, PRs and remote branches

Run 2026-10-12/13 under Decision 64. Scope: 47 checkouts (46 under `~/workspaces` excluding non-adopted orgs, plus chezmoi). `git fetch --prune origin` ran in all 47 without error. Full after-state: `phase1-branches-after.txt`. No commits were made, so there are no commit identifiers or checks to report.

## Done

- **Local branches deleted (`git branch -d`): 8**
  - hnr-backend (6): `feat/gardener-upsert-support`, `feat/planting-migration-validation`, `feat/planting-once-migrations`, `feat/planting-seed-and-cleanup-migrations`, `feat/planting-upsert-operations`, `refactor/gardener-remove-items-alias`
  - kit-techmedix (1): `tmx-8-roadmap-preparation`
  - vallearmonia-website (1): `VA-10-finding-website-repo-audit-has-3-pre-existing-failures-1-real-2-likely-environment`
- **Remote branches deleted (`git push origin --delete`): 3**
  - 5g-emerge-demos: `feat/esa-workshop-presentation`
  - hnr-backend: `feature/cs-333-hnr-to-start-new-relic-integration`
  - mark-markhowarth.com: `design/identity-mocks`
- Kept merged local branches that are checked out in worktrees: 5 in kit-hnr (`paperclip/aligned-20260926/HNR-18`, `-39`, `-40`, `-45`, `-49`).

## Failed

- hnr-frontend `feature/FE-206` (merged, no PR) was **not deleted**. The repository's husky `pre-push` hook runs `branch-name-lint` against the current branch and refuses every push from `main`, deletes included. Getting past it would need `--no-verify`, which is forbidden, so I left the branch.

## Squash-merged candidates (left in place)

Remote: 57 unmerged branches whose PR is merged:

| Repository | Branch | Merged PR |
| --- | --- | --- |
| hnr-backend | `feat/gardener-ordered-migrations` | #2654 |
| ki-agentic-harness | `automation/ki-v0.10.0` | #25 |
| vallearmonia-website | `seed/kris-brown-01983d08` | #129 |
| vallearmonia-website | `seed/kris-brown-13c0eadf` | #125 |
| vallearmonia-website | `seed/kris-brown-61b3b590` | #130 |
| vallearmonia-website | `seed/kris-brown-aa8a07cd` | #175 |
| vallearmonia-website | `seed/kris-brown-ca768982` | #123 |
| vallearmonia-website | `seed/kris-brown-ceaf68a3` | #128 |
| vallearmonia-website | `seed/kris-brown-fe6578b8` | #124 |
| vallearmonia-website | `seed/mark-howarth-09eb5f8a` | #127 |
| vallearmonia-website | `seed/mark-howarth-0e58c669` | #156 |
| vallearmonia-website | `seed/mark-howarth-1ed5fb8f` | #176 |
| vallearmonia-website | `seed/mark-howarth-21468b12` | #140 |
| vallearmonia-website | `seed/mark-howarth-29a66903` | #138 |
| vallearmonia-website | `seed/mark-howarth-32ad5e1a` | #164 |
| vallearmonia-website | `seed/mark-howarth-4d12d94f` | #172 |
| vallearmonia-website | `seed/mark-howarth-543dbc6e` | #142 |
| vallearmonia-website | `seed/mark-howarth-547207c1` | #160 |
| vallearmonia-website | `seed/mark-howarth-58089d6c` | #157 |
| vallearmonia-website | `seed/mark-howarth-5bc82761` | #144 |
| vallearmonia-website | `seed/mark-howarth-5d8f9825` | #162 |
| vallearmonia-website | `seed/mark-howarth-5eea22b9` | #173 |
| vallearmonia-website | `seed/mark-howarth-65dce3a6` | #126 |
| vallearmonia-website | `seed/mark-howarth-78fd0079` | #133 |
| vallearmonia-website | `seed/mark-howarth-7957c512` | #121 |
| vallearmonia-website | `seed/mark-howarth-81af565a` | #136 |
| vallearmonia-website | `seed/mark-howarth-81db7d8c` | #155 |
| vallearmonia-website | `seed/mark-howarth-87c23443` | #151 |
| vallearmonia-website | `seed/mark-howarth-8b955c1f` | #177 |
| vallearmonia-website | `seed/mark-howarth-9aaca713` | #152 |
| vallearmonia-website | `seed/mark-howarth-a1b10786` | #153 |
| vallearmonia-website | `seed/mark-howarth-a46b81f8` | #131 |
| vallearmonia-website | `seed/mark-howarth-a69b41fd` | #179 |
| vallearmonia-website | `seed/mark-howarth-a6f2881c` | #118 |
| vallearmonia-website | `seed/mark-howarth-a70a8d66` | #132 |
| vallearmonia-website | `seed/mark-howarth-a8a9e743` | #139 |
| vallearmonia-website | `seed/mark-howarth-ae6f681f` | #135 |
| vallearmonia-website | `seed/mark-howarth-b18662c4` | #174 |
| vallearmonia-website | `seed/mark-howarth-b487cf06` | #171 |
| vallearmonia-website | `seed/mark-howarth-b94d8da2` | #163 |
| vallearmonia-website | `seed/mark-howarth-c1f7ef99` | #180 |
| vallearmonia-website | `seed/mark-howarth-c28f38bf` | #168 |
| vallearmonia-website | `seed/mark-howarth-c4f89ef9` | #119 |
| vallearmonia-website | `seed/mark-howarth-c8c2a7f9` | #148 |
| vallearmonia-website | `seed/mark-howarth-cc4d8de7` | #120 |
| vallearmonia-website | `seed/mark-howarth-cd6016a6` | #159 |
| vallearmonia-website | `seed/mark-howarth-ce7fb044` | #166 |
| vallearmonia-website | `seed/mark-howarth-cf88c280` | #170 |
| vallearmonia-website | `seed/mark-howarth-db512be5` | #169 |
| vallearmonia-website | `seed/mark-howarth-de27897e` | #158 |
| vallearmonia-website | `seed/mark-howarth-df3729ee` | #117 |
| vallearmonia-website | `seed/mark-howarth-f737f8fe` | #178 |
| vallearmonia-website | `seed/mark-howarth-fa3f9b79` | #150 |
| vallearmonia-website | `seed/mark-howarth-faf1e9fd` | #165 |
| vallearmonia-website | `seed/mark-howarth-fd1cc81f` | #122 |
| vallearmonia-website | `pr145` | #145 (head agent/recover-missed-seeds) |
| vallearmonia-website | `pr146` | #146 (head seed/mark-howarth-26733744) |

Local:

- hnr-backend `feat/gardener-ordered-migrations` (PR #2654) and `refactor/planting-remove-unmanaged` (PR #2651; it also has `rescue/refactor/planting-remove-unmanaged` on origin)
- ki-agentic-harness `automation/ki-v0.10.0` (PR #25)
- vallearmonia-website local `pr131`-`pr160`: 23 point to merged PRs; 7 point to closed, unmerged PRs (`pr134`, `pr137`, `pr141`, `pr143`, `pr147`, `pr149`, `pr154`).

## Unmerged remote branches without an open or merged PR

| Repository | Branch | Commits ahead | Last commit |
| --- | --- | --- | --- |
| 5g-emerge-phase3 | `site-foundation` | 2 | 2026-10-04 |
| hnr-agentic-harness | `paperclip/aligned-20260926/HNR-30-record-that-hnr-operates-no-formal-ki-exchange-route-supersede-gdr-hnr-harness-002` | 2 | 2026-09-27 |
| hnr-agentic-harness | `paperclip/aligned-20260926/HUM-21-a-paperclip-200-is-not-proof-an-agent-config-write-applied-read-it-back` | 2 | 2026-09-26 |
| hnr-shared | `DoR` | 8 | 2026-05-14 |
| hnr-shared | `paperclip/aligned-20260926/HNR-38-record-the-bioweave-hnr-to-zero-naming-rule-in-hnr-shared-pillars-product` | 1 | 2026-09-27 |
| kit-hnr | `paperclip/aligned-20260926/HNR-15-give-the-outward-sharing-check-a-home-in-kit-hnr-admin` | 3 | 2026-09-27 |
| hnr-backend | `catalog-distribution-service-filter` | 2 | 2026-08-18 |
| hnr-backend | `feat/gardener-upsert-and-track` | 7 | 2026-10-09 |
| hnr-backend | `feat/planting-upsert-and-track` | 8 | 2026-10-09 |
| hnr-backend | `feature/scal-api-gw` | 8 | 2026-10-09 |
| hnr-backend | `media-streaming-ready-to-merge` | 229 | 2026-07-20 |
| hnr-backend | `rescue/refactor/planting-remove-unmanaged` | 1 | 2026-10-09 |
| hnr-backend | `satcast-dev-archive` | 100 | 2026-06-23 |
| hnr-frontend | `benchmarks` | 145 | 2026-05-22 |
| hnr-frontend | `chore/view-and-view-model-lint-rules` | 1 | 2026-02-10 |
| hnr-frontend | `feature/dashboards-caching` | 2 | 2026-02-09 |
| hnr-frontend | `feature/ecodiagnose-content-steering` | 19 | 2026-07-08 |
| hnr-frontend | `feature/fe-314-enable-peach-tracking-in-ecodiagnose-and-move-the-site-key` | 11 | 2026-07-29 |
| hnr-frontend | `feature/fe-318-otel-cmcd-spans` | 14 | 2026-08-13 |
| hnr-frontend | `feature/rename-used-to-use-ecodiagnose` | 1 | 2026-06-22 |
| infoschematics | `worktree-agent-abd13720a30e3e0ad` | 2 | 2026-09-16 |
| homebrew-tap | `automation/formula-ki-v0.8.0` | 1 | 2026-10-07 |
| tools-ki | `paperclip/aligned-20260926/KIS-46-ki-dev-skill-rubric-resolves-the-dev-linked-primary-checkout-never-the-cwd-worktree-si` | 1 | 2026-09-27 |
| kit-legal | `command-center-v1` | 21 | 2026-07-21 |
| kit-legal | `rescue/cc-001-exec` | 12 | 2026-07-21 |
| vallearmonia-principal | `rescue/va-principal-gov-003-company-operations-va-6` | 2 | 2026-10-01 |
| vallearmonia-principal | `task/va-6-company-operations` | 1 | 2026-10-04 |
| vallearmonia-website | `rescue/VA-9-review-shilpin-s-gov-003-reconciliation-candidate-commit-d12e045` | 1 | 2026-10-01 |
| vallearmonia-website | `rescue/va-web-gov-003-reconcile-va-7` | 8 | 2026-10-01 |
| vallearmonia-website | `seed/kris-brown-4f6315e9` | 2 | 2026-08-09 |
| vallearmonia-website | `seed/mark-howarth-2bee96f2` | 1 | 2026-08-03 |
| vallearmonia-website | `seed/mark-howarth-50174d54` | 1 | 2026-08-07 |
| vallearmonia-website | `seed/mark-howarth-a46cab48` | 2 | 2026-08-07 |
| vallearmonia-website | `seed/mark-howarth-b70f3919` | 1 | 2026-08-03 |
| vallearmonia-website | `seed/mark-howarth-ba29cc9b` | 1 | 2026-08-03 |
| vallearmonia-website | `seed/mark-howarth-d7174747` | 2 | 2026-08-05 |
| vallearmonia-website | `seed/mark-howarth-e8d54c8e` | 2 | 2026-08-03 |

`rescue/*` branches are kept by rule. The seed branches here mostly match closed, unmerged PRs.

## Paperclip fork (not touched)

`knowledgeislands/paperclip` is a fork of `paperclipai/paperclip`. Its GitHub default is `ki/stable`, but the local `origin/HEAD` still points to `master`. Origin carries 1,026 non-default branches, mostly upstream mirrors: 128 are fully merged into `ki/stable` and 898 are not. There are no open PRs and no protected branches. Deleting upstream mirrors in a fork is outside a plain tidy, so I deleted nothing there.

## Open PRs (21)

Mergeability `UNKNOWN` means GitHub had not yet computed it. Nothing was merged, closed or commented on.

| Repository | # | Title | Branch | Age | Draft | Mergeable |
| --- | --- | --- | --- | --- | --- | --- |
| humansnotrobots/hnr-backend | 2663 | Year-earlier trends on the Bubo Actuals dashboards | `feature/bubo-actuals-year-earlier-trends` | 1d | ready | MERGEABLE |
| humansnotrobots/hnr-backend | 2662 | build(deps-dev): bump the development-dependencies group across 1 directory with 3 updates | `dependabot/npm_and_yarn/development-dependencies-afd71e21e5` | 1d | ready | MERGEABLE |
| humansnotrobots/hnr-frontend | 2501 | build(deps): bump uuid from 11.1.0 to 14.0.2 | `dependabot/npm_and_yarn/uuid-14.0.2` | 12d | ready | UNKNOWN |
| humansnotrobots/hnr-frontend | 2500 | build(deps): bump @uppy/react from 5.1.0 to 6.0.0 | `dependabot/npm_and_yarn/uppy/react-6.0.0` | 12d | ready | UNKNOWN |
| humansnotrobots/hnr-frontend | 2493 | fix(content-steering): point upload script at the existing origin bucket | `bugfix/content-steering-upload-bucket` | 18d | ready | UNKNOWN |
| humansnotrobots/hnr-frontend | 2491 | feat(FE-378): PageScreen template | `feature/fe-378-pagescreen-template` | 19d | ready | UNKNOWN |
| humansnotrobots/hnr-frontend | 2461 | build(deps-dev): bump @commitlint/config-conventional from 19.8.0 to 21.2.2 | `dependabot/npm_and_yarn/commitlint/config-conventional-21.2.2` | 45d | ready | UNKNOWN |
| humansnotrobots/hnr-frontend | 2460 | build(deps): bump @mui/material from 7.1.2 to 9.4.0 | `dependabot/npm_and_yarn/mui/material-9.3.1` | 45d | ready | UNKNOWN |
| humansnotrobots/hnr-frontend | 2415 | build(deps-dev): bump syncpack from 13.0.4 to 15.3.2 | `dependabot/npm_and_yarn/syncpack-15.3.2` | 71d | ready | UNKNOWN |
| humansnotrobots/hnr-frontend | 2411 | build(deps): bump the npm_and_yarn group across 1 directory with 2 updates | `dependabot/npm_and_yarn/apps/console/npm_and_yarn-8c4fc8fee2` | 72d | ready | UNKNOWN |
| humansnotrobots/hnr-frontend | 2321 | build(deps): bump the npm_and_yarn group across 7 directories with 3 updates | `dependabot/npm_and_yarn/apps/console/npm_and_yarn-0d39f0e20c` | 111d | ready | UNKNOWN |
| knowledgeislands/ki-website | 29 | chore(tooling): advertise ki v0.10.0 | `automation/tool-release-ki-v0.10.0` | 3d | ready | UNKNOWN |
| knowledgeislands/ki-website | 23 | chore(tooling): advertise ki v0.8.1 | `automation/tool-release-ki-v0.8.1` | 4d | ready | UNKNOWN |
| krisb/kit-legal | 10 | chore(deps): bump sharp and wrangler | `dependabot/npm_and_yarn/multi-52d952c776` | 0d | ready | UNKNOWN |
| krisb/kit-legal | 9 | chore(deps-dev): bump source-map-js from 1.2.1 to 1.2.2 | `dependabot/npm_and_yarn/source-map-js-1.2.2` | 0d | ready | UNKNOWN |
| krisb/kit-legal | 8 | chore(deps-dev): bump brace-expansion from 1.1.18 to 1.1.21 | `dependabot/npm_and_yarn/brace-expansion-1.1.21` | 0d | ready | UNKNOWN |
| krisb/kit-legal | 7 | chore(deps): bump shell-quote and concurrently | `dependabot/npm_and_yarn/multi-ccb330a867` | 0d | ready | UNKNOWN |
| krisb/kit-legal | 6 | chore(deps-dev): bump markdown-it from 14.3.0 to 14.3.2 | `dependabot/npm_and_yarn/markdown-it-14.3.2` | 8d | ready | UNKNOWN |
| krisb/kit-legal | 5 | chore(deps): bump undici and wrangler | `dependabot/npm_and_yarn/multi-e9c2dce3b7` | 9d | ready | UNKNOWN |
| krisb/kit-legal | 4 | chore(deps): bump js-yaml | `dependabot/npm_and_yarn/multi-c5ebbb4833` | 28d | ready | UNKNOWN |
| vallearmonia/vallearmonia-website | 167 | Seed 56c1c3b2 from Mark Howarth | `seed/mark-howarth-56c1c3b2` | 62d | ready | UNKNOWN |

## Needs the owner

1. **hnr-frontend `feature/FE-206`**: delete it in the GitHub UI, or allow a push from a non-`main` branch. The pre-push hook blocks deletes from `main`.
2. **Squash-merged candidates**: approve deleting the 57 remote and 26 local branches above. Most are vallearmonia-website `seed/*` and `prNNN`.
3. **Unmerged branches without a PR** (37): decide on each. Old ones include hnr-backend `media-streaming-ready-to-merge` (229 ahead) and `satcast-dev-archive`, hnr-frontend `benchmarks` (145 ahead), hnr-shared `DoR`, and kit-legal `command-center-v1`.
4. **Paperclip fork**: decide whether to prune the 128 upstream-mirror branches already merged into `ki/stable`, and whether to run `git remote set-head origin -a` so the local default matches GitHub (`ki/stable`).
5. **Open PRs**: there are 8 dependabot PRs on hnr-frontend (the oldest is about 3+ months) and 7 on kit-legal, plus two stale ki-website release PRs (v0.8.1, v0.10.0) that may be superseded.
