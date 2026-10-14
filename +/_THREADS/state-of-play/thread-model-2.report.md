# thread-model-2 report

Commit `b03a5d55` feat(ki-delegation): add owner reporting practices and guidance refresh — pushed fast-forward to origin/main (rebased over adopt-harness's a47f1cc5); primary checkout fast-forwarded to it.

Checks: `bun run test` 1062 pass / 0 fail; `bunx tsc --noEmit` clean; `ki dev skill rubric ki-delegation` in sync (on primary after ff); `ki repo audit --skill ki-delegation` PASS (JUDGMENT=5); `ki repo audit --skill ki-skills` WARN=1 FAIL=0 — the warning is the pre-existing ki-skills LONG-3 sources refresh cadence, same as on main.

## Done

- Reporting section of `standards-background-runs.md` now carries the coordinating-thread practices: mnemonic-tagged needs items with cold context, recommendation and links; structured-question tool for clear-option decisions; consolidated Done / in progress / outstanding summary on request; plain wording, "background agents", copyable code blocks; log each decision before launching its work.
- New "Refreshing this guidance" thread working rule: re-read at bootstrap, before each checkpoint update, and whenever `git log -1 -- skills/governance/ki-delegation` differs from the revision noted in the checkpoint's Current state as `ki-delegation read at <revision>`; tell the owner briefly what changed.
- RUN-5 judgment criterion added (rubric, catalogue test, remediation inventory counts); SKILL.md summary and ki-checkpoint record-form pointer updated.

## Needs the owner

- None.
