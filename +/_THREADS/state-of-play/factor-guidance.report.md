# factor-guidance report

## Done

- Harness `750ed32f` (pushed): rules moved into their owning skills. Brief-writing rules went to `ki-delegation`, typed TypeScript configuration and runtime-name verification to `ki-engineering`, and index-note shape to `ki-repo-kb`. Gate: `bun run test` 1072 pass / 0 fail, `tsc` clean, `ki-skills` audit FAIL=0 (1 existing refresh-cadence WARN).
- ki-principal `903be22` (local only): `AGENTS.md` cut from 1921 to 743 words. Every authority statement and strictly enforced section stays, trimmed to its rule plus a pointer. Method now points to `ki-repo-kb`, `ki-git`, `ki-work-roadmap` and `ki-decision-records`. The pre-commit KB audit had FAIL=0, plus 2 existing STREAM-10 WARNs.
- chezmoi `31aa259` (pushed, applied to `~/.claude/*.md` only; the `chezmoi diff` covered only those targets). Gate: rumdl clean, `node --test` 215 pass / 0 fail, `ki repo audit` FAIL=0.
- Word counts for `~/.claude` (before = applied file; the cf5c1e9 render, with the unapplied lines, is in brackets):
  - `CLAUDE.md`: 349 [571] → 463
  - `communication.md`: 402 → 326
  - `delegation.md`: 89 [191] → 92
  - `memory-scope.md`: 82 → 82 (unchanged)
  - `markdown.md`: 41 → 41 (unchanged)
  - Total: 963 [1287] → 1004. `CLAUDE.md` grows against the applied file because cf5c1e9's runtime lines are now applied.
- Classification:
  - Kept as personal preference: communication levels, vocabulary, keybindings, publishing, OneDrive store, design sanity check, GitHub handle, Bash working directory, re-reading after a stale edit.
  - Moved to skills: TypeScript configuration and name verification (`ki-engineering`), concurrent-session safety (`ki-git`, already there), brief rules (`ki-delegation`).

## Failed

- The ki-principal push was not made. Local `main` carries 5 unpushed `docs(checkpoint)` commits from another thread ahead of `903be22`. A fast-forward push would publish them too, which the run rules forbid without asking.

## Needs the owner

- Approve pushing ki-principal `main`, which includes the other thread's 5 checkpoint commits, or have that thread push first.
- Two behaviour changes in ki-principal `AGENTS.md`:
  - Session digests now follow the declared `ki-repo-kb` contract (`-/_DIGESTS/`), replacing the old Calendar-sibling rule that contradicted it.
  - The pre-flight claim that lessons live in auto-memory is dropped, because `.ki.toml` sets `auto_memory = "disabled"`. Logging in Mistakes and Lessons stays.
- Not changed: the territorial-authority text still names "Arcadia", despite the recent Arcadia → Knowledge Islands Principal rename.
