# tools-sweep: roadmap triage of the remaining KI tools repositories

Read-only sweep of `origin/main`, run 2026-10-11 under state-of-play Decision 37. No edits, commits or pushes. No fetch either: the run rules forbid remote calls, so this reads the local `origin/main` refs. Every primary checkout is level with its ref (0 ahead, 0 behind), and the refs are 1 to 3 days old.

## Coverage

These 15 repositories come from `ki registry list` and are outside `roadmap-triage`'s scope:

| Repository | Open records |
| --- | --- |
| apps-observatory, homebrew-tap, ki-specifications, mcp-acquire-whatsapp, mcp-git-audit, mcp-gsuite, mcp-housekeeping-chatgpt, mcp-housekeeping-claude, mcp-housekeeping-codex, mcp-ki-kb-fs, mcp-ki-kb-notion-mirror, mcp-m365, tools-git-almanac, tools-mgit | 0 each. Only `docs/roadmap/_ISSUES.md` is present. |
| infoschematics | 8 |
| kit-acquire | 0 (no roadmap directory) |

`ki-arcadia-links` and `ki-arcadia-principal-chatgpt-trim` are worktrees of `ki-arcadia-principal`, which `roadmap-triage` already covered. Repositories in other territories (5g-emerge, equalremedy, hnr, vallearmonia, personal kit-*) were not in scope.

## infoschematics

I checked every defect record against the code on `origin/main`. All are still present.

| Tag | Record | Lifecycle | Disposition | Reason |
| --- | --- | --- | --- | --- |
| INFO-1 | [INFOSCHEMATICS-TOOL-150](/Users/krisbrown/workspaces/kit/infoschematics/infoschematics/docs/roadmap/INFOSCHEMATICS-TOOL-150-seconds-read-as-milliseconds.md) | triage, draft | KEEP: promote to Now | This is a real, user-visible bug and still present. `runtime.ts:434` copies `scene.duration` (authored in seconds) straight into a millisecond `hold`, so every timed Story spins about 15 Scenes a second. It is the highest-value record here. It needs a unit fix, a test and a browser look, so it takes more than 30 minutes. |
| INFO-2 | [INFOSCHEMATICS-TOOL-147](/Users/krisbrown/workspaces/kit/infoschematics/infoschematics/docs/roadmap/INFOSCHEMATICS-TOOL-147-a-filter-design-no-longer-ignores.md) | triage, draft | DO-NOW | Documentation only. Rewrite `EDIT-014` in `docs/specs/design-editing.md` (requirement, `_Verify:_` at line 157, `_Evidence:_`) to agree with `DESIGN-005` and the code, then grep `APPEAR`, `PRESENT` and `CHANGE` for the same "ignores it" phrase. Takes about 20 minutes. |
| INFO-3 | [INFOSCHEMATICS-TOOL-148](/Users/krisbrown/workspaces/kit/infoschematics/infoschematics/docs/roadmap/INFOSCHEMATICS-TOOL-148-an-emphasis-that-draws-nothing.md) | triage, draft | KEEP | This is a real renderer defect. Canvas emphasis geometry still has no Overlay Graphic entry, which breaches the `ADR-INFOSCHEMATICS-027` fallback. It is small but needs code, a test and a browser look. |
| INFO-4 | [INFOSCHEMATICS-TOOL-149](/Users/krisbrown/workspaces/kit/infoschematics/infoschematics/docs/roadmap/INFOSCHEMATICS-TOOL-149-an-arrival-that-outlives-its-address.md) | triage, draft | KEEP | This is a real reader-facing defect: a stale arrival stays painted after a failed address. It is bounded, but it needs a behaviour change and a browser look. |
| INFO-5 | [INFOSCHEMATICS-TOOL-135](/Users/krisbrown/workspaces/kit/infoschematics/infoschematics/docs/roadmap/INFOSCHEMATICS-TOOL-135-where-a-claim-lives.md) | now, in-progress | KEEP | It has been idle since 2026-10-04 (`updated_at` is still 2026-10-04). Its blocker, `INFOSCHEMATICS-TOOL-129`, is now done and was pruned on 2026-10-09. That unblocks the deferred drift read of `design-visual-language.md` and of `design-architecture.md` items A8 to A10. The glossary destination still needs an owner decision (see Needs Kris). |
| INFO-6 | [INFOSCHEMATICS-SITE-032](/Users/krisbrown/workspaces/kit/infoschematics/infoschematics/docs/roadmap/INFOSCHEMATICS-SITE-032-first-document-from-prose.md) | triage, draft | KEEP | Concrete consumer prose about the delivered authoring skill. `apps/site/content/` still does not mention the skill. It was held only because TOOL-129 was editing `authoring.md`, and TOOL-129 is now done, so this is ready to plan. It needs a browser look, so it takes more than 30 minutes. |
| INFO-7 | [INFOSCHEMATICS-TOOL-041](/Users/krisbrown/workspaces/kit/infoschematics/infoschematics/docs/roadmap/INFOSCHEMATICS-TOOL-041-initial-package-publication.md) | waiting-for, draft | KEEP | It is correctly parked. The waiting condition is owner-side: npm scope ownership, trusted publishing, a named version set and explicit authorisation. Publishing to npm is irreversible and needs your explicit request. |
| INFO-8 | [INFOSCHEMATICS-TOOL-143](/Users/krisbrown/workspaces/kit/infoschematics/infoschematics/docs/roadmap/INFOSCHEMATICS-TOOL-143-one-word-for-mode.md) | triage, draft | IDEA → infoschematics vocabulary note (new) | A rename sweep of about 30 files with no behaviour change, idle since 2026-09-25. Two of its points need a decision rather than a sweep: the host-observable `data-infoschematic-scheme` and `infoschematics.colour-scheme` keys. Worth doing eventually, but speculative cleanup. infoschematics has no Project note, so this needs a home (see Needs Kris). |

## Totals

- infoschematics: 8 open → 6 if approved (1 DO-NOW, 1 IDEA).
- Other 14 repositories: 0 open → 0.
- Whole sweep: **8 open → 6 if approved**.

## Cross-repository dependencies

- No record here blocks, or is blocked by, a repository outside infoschematics.
- Within infoschematics, `INFOSCHEMATICS-TOOL-129` (done, pruned) was holding INFO-5 and INFO-6. Both are now free.
- INFO-7 depends on external registry configuration (npm), not on another repository.

## Done

- Swept 15 repositories plus kit-acquire. Only infoschematics has open records (8). Each defect was checked against the code on `origin/main`.

## Failed

- None. No fetch was run: the run rules forbid remote calls, which overrides the brief's "git fetch is fine". The local refs are 1 to 3 days old.

## Needs Kris

- Approve the dispositions above. The DO-NOW for INFO-2 is ready to delegate.
- INFO-8 IDEA: say where the idea should live. infoschematics has no Project note, and none of the Arcadia `Streams/Projects/` notes fits.
- INFO-5: pick the glossary destination for [INFOSCHEMATICS-TOOL-135](/Users/krisbrown/workspaces/kit/infoschematics/infoschematics/docs/roadmap/INFOSCHEMATICS-TOOL-135-where-a-claim-lives.md). The options are to stay in `docs/reference/`, move to `docs/decisions/references/`, or fold into `KDR-INFOSCHEMATICS-001`. Each one changes a published site address.
- INFO-7: whether and when to confirm npm scope and trusted publishing for [INFOSCHEMATICS-TOOL-041](/Users/krisbrown/workspaces/kit/infoschematics/infoschematics/docs/roadmap/INFOSCHEMATICS-TOOL-041-initial-package-publication.md).
- Consider promoting INFO-1 (`INFOSCHEMATICS-TOOL-150`) to Now. Every timed Story is broken today.
