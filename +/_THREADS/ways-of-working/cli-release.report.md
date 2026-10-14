# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › cli-release

**Run report at 23:41 BST · last mark 23:26 BST**

---

## Done

- **KI-TOOL-KI-CLI-132 is accepted and pruned.** This was done under Kris's KI-RELEASE decision: "accept KI-TOOL-KI-CLI-132 through ki-accept now, and release it in the same tools-ki release CLI126-DELIVER makes". Its review packet was complete. Its governing gates passed at `9717954`: `bun run test:coverage` ran 1185 tests at 100%, and `bunx tsc --noEmit`, `bunx biome check .`, `bunx knip`, `mandoc -T lint man/ki.1` and the `ki-work-roadmap` audit were clean. The record is now [KI-TOOL-KI-CLI-132 (pruned)](https://github.com/knowledgeislands/tools-ki/blob/9fe5811469cda1464e9ed43585374bbc8a14f0d8/docs/roadmap/KI-TOOL-KI-CLI-132-launcher-only-thread-writer.md).
  - The reference preflight found two links to it in [KI-TOOL-KI-CLI-133](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md). Before the prune, I pinned both to the accepted copy on GitHub.
  - The other hits were in ki-principal: KI-PRINCIPAL-ECO-014, which mentions it only as a bare identifier, plus thread files and the checkpoint, which I did not touch.
  - Commits in tools-ki: `c57d01e` (accept), `9fe5811` (link pin) and `5658f87` (prune). All three are pushed.
- **KI-TOOL-KI-CLI-126 is implemented but held at `in-progress`, not awaiting review.** This was done under Kris's CLI126-DELIVER decision: "implement KI-TOOL-KI-CLI-126 to awaiting review, release tools-ki, bump ki-principal's .github/ki-version, and confirm ki-principal CI reaches the audit step". The record is [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md).
  - What changed: `ki repo repair` now registers a Knowledge Base that declares a store, the same way it registers any other repository. It reports each unbound or missing store as a `! Store:` warning, still projects the skills, and passes when nothing else is wrong. An invalid registry still fails.
  - New contract tests cover the unbound, missing-path, unregistered, dry-run and bound cases. One more test replays the CI sequence (`bootstrap`, `registry add`, `repair`, `audit`) and confirms the audit reaches its own verdict.
  - The changelog has a new entry. `man/ki.1` and the README are unchanged because they never described repair's store handling.
  - Checks: `bun run test:coverage` ran 1189 tests at 100%. `bunx tsc --noEmit`, `bunx biome check .` (pre-existing warnings only), `bunx knip` and `mandoc -T lint man/ki.1` are clean, and the `ki-work-roadmap` audit passes.
  - Local CI reproduction: I ran the built `ki` against ki-principal in a throwaway home and XDG sandbox. Repair exited 0 with the `sources` warning and 44 skill links, and `ki diag` showed "Registry: valid". `ki repo audit` ran to its own verdict, failing only on ki-authoring and ki-checkpoint findings, not on any store error.
  - Commit `726243d` in tools-ki is pushed.
- **Why the record is held:** Verify step 2, `ki repo audit --repo .` on tools-ki, fails one check: `ki-engineering` `DEPS-1`.
  - Four dev tools have now been out of date for longer than the 14-day adoption window: `@biomejs/biome` 2.5.15, `@vitest/coverage-v8` 5.0.3, `knip` 6.39.0 and `vitest` 5.0.3.
  - This has nothing to do with the repair change. It also blocks the release, because the release checklist requires the audit's mechanical findings to be resolved.
  - Adopting the updates is a package install, which the brief forbids. Recording a hold is an owner decision. See DEPS-HOLD.
- **CLI131-SPLIT is respected.** As Kris decided, "keep the split and leave KI-TOOL-KI-CLI-131 at triage until the repair fix lands". [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md) is untouched.

## In Progress

Nothing is running.

- **Not done:**
  - No tools-ki release has been cut, so ki-principal's `.github/ki-version` is still `v0.10.4` and the harness pin is unchanged.
  - KI-TOOL-KI-CLI-132 ships with that release.
- **ki-principal CI, read-only:** the latest run on `main`, 38648879408 at 22:37 UTC, still fails in "Install released KI" with v0.10.4. The error is "declared sources store is not bound", so the run never reaches the audit step. A run on a release containing `726243d` should get past it, as the local reproduction did.
- **Not pushed (ki-principal):** this report's own commit, `docs(threads): add the cli-release run report`, sits on six unpushed commits I did not make: `924a89e5`, `19eef4a6`, `187e6fd1`, `143513b4`, `9cb75acb` and `707d4276`, from the report-repair and principal-links runs. A fast-forward push would carry them, so I held it. Their own PUSH-CARRY query covers the same push.
- **Dirty from other sessions, left alone in ki-principal:**
  - `+/_THREADS/baseline-rollout/decisions.md`
  - `+/_THREADS/mac-studio-bootstrap/chezmoi-fix.report.md`
  - `Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md`
  - several untracked reports in `+/_THREADS/tools-burndown/` and `+/_THREADS/knowledge-acquisition/`

## Queries

### DEPS-HOLD - unblock the tools-ki audit so the release can go

**Context:** The DEPS-1 failure described under Done is the only thing stopping KI-TOOL-KI-CLI-126 from reaching awaiting review, and stopping the release that carries it and KI-TOOL-KI-CLI-132. All four updates are patch-level dev tools that do not reach the compiled `ki`.

**Query:** Should the four updates be adopted, or held for this release?

**Options:** a) (recommended) Authorise a run to adopt the four updates in its own `chore(deps)` commit with `bun update` and re-run every gate. The same run then moves KI-TOOL-KI-CLI-126 to awaiting review, cuts the tools-ki patch release, bumps ki-principal's `.github/ki-version` and watches its CI to the audit step. b) Record `dependency_holds` for the four packages in tools-ki's `.ki.toml`, with the release as the reason, release now, and adopt the updates afterwards.

```text
DEPS-HOLD

Authorise a run to adopt @biomejs/biome 2.5.15, @vitest/coverage-v8 5.0.3, knip 6.39.0 and vitest 5.0.3 in tools-ki with bun update in its own chore(deps) commit and re-run every gate; the same run then moves KI-TOOL-KI-CLI-126 to awaiting review, cuts the tools-ki patch release carrying it and KI-TOOL-KI-CLI-132, bumps ki-principal's .github/ki-version and the harness ki pin if one exists, and watches ki-principal CI to the audit step.
```

```text
╭─ run report · 2026-10-14T22:41:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued from this run
- [waiting] DEPS-HOLD
- [unpushed] ki-principal cli-release report commit, held behind other runs' unpushed commits
- [held] tools-ki release, ki-principal `.github/ki-version` bump and the CI audit check, pending DEPS-HOLD

```text
Resume ways-of-working under current ki-pmo and ki-delegation since 23:26 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
