# release-0101 report

## Done

- tools-ki Harness pin moved from `7695f997` to `ki-agentic-harness` `bd6e29b5` (origin/main head; includes `f1233757` checkpoint `label`). Archive digest `c3e0d045…467c` was verified from codeload; the old pin's digest reproduced exactly. Commit `cd76a64` `fix(bootstrap): pin the harness carrying checkpoint labels`.
- Release prep commit `95a9369` `chore(release): prepare v0.10.1` (package.json 0.10.1, CHANGELOG baseline and Harness pin line, which was stale at `93b07fb`).
- Checks: 1,104/1,104 tests with coverage, `tsc --noEmit` clean, Biome clean, mandoc lint, rumdl, compiled binary reports `0.10.1`. In the worktree, `ki repo audit` failed only on worktree-only items (REPO-REG-1 registration, RUNTIMES-2 activation).
- Pushed `d802544..95a9369` to tools-ki `main` fast-forward. Tagged and pushed `v0.10.1`. Release workflow run 38105465051 passed: signed, published immutable, Linux clean-install verified, tap notified. <https://github.com/knowledgeislands/tools-ki/releases/tag/v0.10.1>
- Homebrew tap: dispatch run 38105579215 passed; PR #32 "Advance ki to v0.10.1" auto-merged.
- ki-arcadia-principal: `.github/ki-version` → `v0.10.1`, commit `3097ff9` `chore(ci): pin ki v0.10.1`, pushed fast-forward `798a857..3097ff9`. CI run 38105718037: the ki-checkpoint `label` / closed-field-set rejections and the README STRUCTURE-1 failure are gone (14 ki-checkpoint failures down to 3).
- Worktrees `tools-ki-release-0101` and `ki-arcadia-principal-release-0101` and their `release-0101` branches were removed. `worktrees/tools-ki` and `worktrees/ki-arcadia-principal` belonged to other runs (`triage-apply`, `codex-retire`), so I used suffixed paths and did not touch theirs.

## Failed

- Arcadia CI is still red (run 38105718037, `build` job). The only failure is ki-checkpoint RECORD-2 on `+/_CHECKPOINTS/rig.chezmoi.md`: the headings are not the exact H1 plus six ordered sections, and "Current state" and "Decisions made" lack substantive content. These belong to the Rig: chezmoi thread, so I reported them and did not fix them.

## Needs Kris

- Run `brew upgrade ki`. This machine still runs 0.10.0 (`brew list` shows ki 0.10.0; note that `which ki` resolves to `~/.local/bin/ki`, so check which install wins on PATH).
- Hand the `rig.chezmoi.md` RECORD-2 fix to the Rig: chezmoi thread.
- Note: v0.10.1 is a patch number but includes `feat(acquire)` central Granola routing since v0.10.0, released as v0.10.1 per Decision 38.
- Primary checkouts of tools-ki and ki-arcadia-principal are now behind origin/main. I left them unpulled.
