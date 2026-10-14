# Observatory bounded correction

## Done

Corrected [KI-OBS-APP-041](/Users/krisbrown/workspaces/kit/knowledgeislands/apps-observatory/docs/roadmap/KI-OBS-APP-041-adopt-territory-selection.md) under tools-burndown Decisions 3 and 4 and the explicit OBS-CORRECT instruction. The existing record remains Awaiting review. Identity, creation instant, classification, completed Steps and immutable Ready baseline `8879fdfbbaaac880ba49383f0aa2e32dfdfbe142` are preserved. The independent finding and correction evidence are in its existing Review/Discussion.

Reproduced the independent finding against committed delivery `980871d588399833771ba638106716ccb63aff16` using the reviewer's existing `delivery-review-runtime/check-territory.ts`: parenthesised and colon-adjacent private POSIX labels were returned with empty problems, while a standalone path label was rejected. The new parser and catalogue regressions failed against the original source before correction.

The display-only parser now rejects filesystem separators anywhere in listing entries. This prevents paths embedded in labels/handles (and Capital text) from entering a successful catalogue, while preserving whole-list fail-closed behaviour and path-free diagnostics. Direct selection grammar and authoritative roots resolution are unchanged. A 30-case matrix covers embedded POSIX/private, home-relative, Windows drive paths using both separators and UNC paths, with otherwise valid entries present. Positive assertions preserve path-free Unicode, punctuation and counts. Catalogue assertions prove discovery failure emits no private path or membership read, while direct selection still requests the exact territory and returns complete identities.

Fresh validation passed:

- `bun run test`: 1,124 tests, zero failures; 366 contracts, 318 evidence, 253 instruments, 187 site, plus the repository boundary gate. All eight test/build prerequisite tasks ran uncached.
- `bun run self:typecheck`, `bun run build`, and `bun run build --force`: exit 0; forced build freshly executed all four build tasks.
- `bun run self:test:browser`: exit 0 using its local fixture server.
- Work, roadmap and authoring audits passed before editing, after correction and after normal hooks. Engineering audit: exit 0, FAIL=0, WARN=1 for the existing unrelated CI-1 inline KI_VERSION pin. Git audit rendered its checklist; actual Git judgment review covered primary main, ownership, diff, hooks, outgoing history and publication.
- Focused Biome and rumdl checks and `git diff --check` passed. Biome retained only pre-existing non-null-assertion warnings and template-style advice. Exact predicates verified record identity, immutable baseline, monotonic timestamp, six Review headings, retained completed Steps and the four owned paths.
- Committed source was byte-compared to the tested pre-hook source diff. An immutable `git show` copy of the correction parser rejected all three reviewer examples with no path in results. Historical delivery/diagram evidence is explicitly distinguished from fresh correction evidence; no new diagram result is claimed.

Published only this run's own verified Conventional Commit `0d0b2b9259afd65148c3f840547468bb228b0ecb` (`fix(scope): reject paths embedded in territory picker entries`), ending with `Co-authored-by: Codex <codex@openai.com>`. Normal lint-staged, Syncpack and Commitlint hooks ran. `git show --name-status HEAD` and the actual committed diff were inspected: only `packages/contracts/src/territory.ts`, `packages/contracts/src/territory.test.ts`, `packages/evidence/src/scope.test.ts` and the existing record changed.

Pre-push fetch confirmed origin/main at parent `980871d588399833771ba638106716ccb63aff16` and exactly one own outgoing commit. Non-force `git push origin HEAD:main` succeeded. Final fetch at 2026-10-11T09:26:25Z confirmed local main and origin/main both at `0d0b2b9259afd65148c3f840547468bb228b0ecb`, ahead/behind 0/0 and a clean primary checkout. Repository: apps-observatory; machine: terra; branch: main. No pending unpushed handoff remains.

No acceptance, closure, new record, Arcadia checkpoint edit, worktree, subagent, hook bypass, force-push, release, live-service access/restart, machine configuration, secret access, scheduler/credential change, package acquisition or non-Git remote operation occurred.

## Failed

None outstanding. Red-phase failures were intentional defect assertions and passed after correction. The existing CI-1 audit warning remains outside this bounded task and is not claimed resolved.

## Needs Kris

Review the bounded correction in [KI-OBS-APP-041](/Users/krisbrown/workspaces/kit/knowledgeislands/apps-observatory/docs/roadmap/KI-OBS-APP-041-adopt-territory-selection.md); acceptance remains a separate owner decision. This run leaves Awaiting review and performs no closure or live-service operation. The earlier delivery's service restart remains outside this run's authority.
