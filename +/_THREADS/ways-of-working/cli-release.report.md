# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › cli-release

**Run report at 22:39 BST · last mark 16:09 BST**

---

## Done

- **The four dev-tool updates are adopted in their own commit.** This was done under Kris's [DEPS-HOLD decision](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md) of 15 October: "Authorise a run to adopt the four patch-level dev-tool updates (@biomejs/biome 2.5.15, @vitest/coverage-v8 5.0.3, knip 6.39.0, vitest 5.0.3) in tools-ki in its own chore(deps) commit, re-run every gate, move [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) to awaiting review, cut the patch release carrying it and [KI-TOOL-KI-CLI-132](https://github.com/knowledgeislands/tools-ki/blob/9fe5811469cda1464e9ed43585374bbc8a14f0d8/docs/roadmap/KI-TOOL-KI-CLI-132-launcher-only-thread-writer.md), bump ki-principal's .github/ki-version and watch CI to the audit step".
  - Commit `7eb3000` in tools-ki. The ranges plainly resolved `vitest` and `@vitest/coverage-v8` to 5.0.5, so I pinned the lockfile to exactly the named 5.0.3. That kept the update inside the waiver.
- **Every gate passes at `86adda0`:**
  - both frozen installs;
  - `bun run test:coverage`: 1189 tests at the 100% thresholds;
  - `bunx tsc --noEmit`, `bunx biome check .` (warnings and infos only), `bunx knip` and `mandoc -T lint man/ki.1` are clean;
  - `ki repo audit --repo .` shows FAIL=0. Its two warnings, `ki-engineering` `CI-1` and `ki-repo` `HOOK-1`, are unrelated. The `DEPS-1` failure is gone.
- **[KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) is at `awaiting-review` under `ki-implement`.** It has its full review packet, and Verify 4 is left for acceptance after the release. Commit `86adda0`.
- **tools-ki is pushed fast-forward (`585321f..86adda0`).** This was done under PUSH-BENEATH, Kris's words of 14 October: "If it's only their commits, then them committing and pushing is absolutely fine though." Every gate above passed with these two commits from another session stacked beneath mine:
  - `4b99032c` docs(roadmap): reserve [KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md)
  - `9eb3b0a4` docs(roadmap): capture [KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md) errors suggest fixes
- **[KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md) stays at `triage`, untouched.**
- **The release has not been cut.** No tag was pushed, no workflow dispatched and ki-principal is untouched; see HARNESS-PIN.

## In Progress

Nothing is running in this run. It stopped before the release on HARNESS-PIN.

Outstanding - no action requested now:

- **Agent work:** v0.10.5 would carry [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) and [KI-TOOL-KI-CLI-132 (pruned)](https://github.com/knowledgeislands/tools-ki/blob/9fe5811469cda1464e9ed43585374bbc8a14f0d8/docs/roadmap/KI-TOOL-KI-CLI-132-launcher-only-thread-writer.md). It would also carry `ki dev skill generate` (`9c4c0c0`), a feature already on `main`. After that come the ki-principal `.github/ki-version` bump and the CI watch.
- **Verification limitation:** `knip` 6.39.0 prints four configuration hints saying some `knip.json` ignore entries are unnecessary. It still exits 0.
- **Retained material:** this report overwrites the tracked `cli-release.report.md` in the thread folder, uncommitted, for the thread to commit.

## Queries

### HARNESS-PIN - move the Harness pin before releasing v0.10.5?

**Context:** The repository's [release guide](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/guides/developer/releasing.md) says: "Before releasing, bump the Harness pin in its own `fix(bootstrap)` commit if the Harness has moved since the last release."

- The pin in [registry.ts](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/core/storage/registry.ts) is `b4e2c5cd`. The Harness `origin/main` is now 26 commits ahead at `0df81f40`. Those commits include `8a453bcd` "raise PMO-7 record linking failure level" and the ki-pmo drain and DRAINED-frame work.
- Bumping the pin needs the codeload archive download for its digest, which the brief does not name. It also changes which Harness ki-principal's CI audits against, so the audit could fail on new findings once it is reached.
- Skipping the step would depart from the release process the brief names.

Everything else is ready: tools-ki `main` is pushed at `86adda0` with all gates green.

**Query:** Should v0.10.5 first move the Harness pin to the current Harness `main`, or ship on the existing pin?

**Options:**

a) (recommended) authorise the Harness archive download for `0df81f40`, a `fix(bootstrap)` pin commit with its gates, then v0.10.5, the ki-principal `.github/ki-version` bump and the CI watch to the audit step

b) cut v0.10.5 on the existing pin `b4e2c5cd`, skipping the pin step for this release only, then the ki-principal bump and CI watch

c) hold the release

```text
HARNESS-PIN

authorise the cli-release run to download the ki-agentic-harness archive for 0df81f40, commit the Harness pin as fix(bootstrap) in tools-ki after every gate passes, then cut v0.10.5 carrying KI-TOOL-KI-CLI-126 and KI-TOOL-KI-CLI-132 by the release process, bump ki-principal's .github/ki-version, push fast-forward and watch ki-principal CI to the audit step
```

```text
╭─ run report · 2026-10-15T21:39:20Z ──────────────╮
│                                                  │
│  █▀▀▄ █  █ █▀▀▀ █  █   · thread busy             │
│  █▀▀▄ █  █ ▀▀▀█  ▀█▀   · running or queued work  │
│  █▄▄▀ █▄▄█ ▄▄▄█   █    · lines below say which   │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [running] registry-model - idea-stage and unknown-field checks in the Streams checker
- [queued] threads-records, streams-index, thread-model-review, messenger
- [waiting] HARNESS-PIN
- [uncommitted] cli-release.report.md in the thread folder
