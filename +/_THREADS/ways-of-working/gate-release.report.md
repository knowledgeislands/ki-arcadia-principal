# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › gate-release

**Run report at 21:37 BST · last mark 21:19 BST**

---

## Done

- **Earlier run's partial work kept.** The run that hit the usage limit had already accepted [KI-TOOL-KI-CLI-129](https://github.com/knowledgeislands/tools-ki/blob/f718dad967b93fef7d6173d5d707f28d03cc5f13/docs/roadmap/KI-TOOL-KI-CLI-129-staged-audit-verdict.md) (pruned), re-running its Verify gate (1164 tests at 100% coverage, `tsc`, Biome and the roadmap audit), in `f718dad`, and pruned it in `19f3e60`. Both were already pushed. Nothing else was done in either repository, so I did not repeat those steps. The acceptance quotes Kris's GATE-RELEASE decision: "accept KI-TOOL-KI-CLI-129; release tools-ki as next 0.x carrying --staged and --paths, bump ki-principal's .github/ki-version to it, then add --staged pre-commit audit line and update Conformance.md sentence under GATE-SCOPE; CI stays whole-tree".
- **tools-ki v0.10.4 released** through `docs/guides/developer/releasing.md`. The harness had moved since v0.10.3, so I first pinned harness `b4e2c5cd` in `4d13038`. That pin carries the GATE-1 sentence for [KI-HARNESS-GOV-192](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-192-scoped-gate-verdict.md), and its archive digest gave the same result over two downloads. The release was then prepared in `3a88731`. Checks: 1164 tests pass at full coverage, and `tsc`, Biome, the man-page lint and `git diff --check` are clean. `ki repo audit --repo .` fails only on DEPS-1, the existing finding Kris chose to release over. Only those two commits were pushed to `main`, followed by tag `v0.10.4`. The Release workflow succeeded in every job: validate, three builds, sign and publish, a clean Linux install, and the notice to the Homebrew tap. The release is published and immutable, with three archives and a signed checksum file.
- **ki-principal switched to the scoped gate** in `b73e7e4`, under Kris's GATE-SCOPE decision: "switch ki-principal's hook once released ki carries option; CI stays whole-tree". `.github/ki-version` now reads `v0.10.4`. The `.githooks/pre-commit` audit line now passes `--staged`. `Admin/Governance/Conformance.md` now says CI keeps the whole-tree verdict and the hook scopes the verdict to staged paths. `.github/workflows/ci.yml` is unchanged. I committed through a private index, and the other sessions' 34 staged entries are untouched. The commit went through the new hook itself and passed, with STREAM-9 on the mac-studio-bootstrap note marked "outside scope". It was pushed fast-forward as the only commit ahead of `origin/main`.
- **Installed `ki` carries `--staged`.** The hook resolves `ki` to `~/.local/bin/ki`. That is the local runner on tools-ki's `main` source, and its `ki repo audit --help` lists `--staged` and `--paths`.
- **Gate demonstrated without committing.** I ran the hook's audit line under throwaway private indexes, without changing the working tree.
  - Staging a probe edit of the clean `Admin/Governance/Governance.md` passes: the verdict is "PASS · SCOPE: 1 path FAIL=0" and the exit status is 0, while STREAM-9 still fails on `Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md` but is marked "outside scope".
  - Staging that note fails: "FAIL · SCOPE: 1 path FAIL=1", exit status 1.
- **[KI-HARNESS-GOV-192](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-192-scoped-gate-verdict.md) remains at awaiting-review.** I did not accept it.

## In Progress

- **Homebrew formula.** The tap received its release notice. I did not check whether its formula pull request merged, because this run was allowed no further remote calls. `/opt/homebrew/bin/ki` still reports 0.10.3, but `~/.local/bin/ki` comes first on PATH here.
- **ki-principal CI is red, and this predates my change.** The run on `b73e7e4` installed v0.10.4 correctly but stopped at `ki repo repair` with "declared sources store is not bound". The two runs before it failed the same way under v0.10.1, and none of the last 30 runs passed. So CI never reaches the whole-tree audit. See CI-STORE.

## Queries

### CI-STORE - CI never reaches the whole-tree audit

**Context:** Under GATE-SCOPE, CI's whole-tree `ki repo audit` was meant to catch what the scoped hook lets through. ki-principal's CI fails before that step: `ki repo repair` stops on the unbound sources store on the runner. That is the defect in [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md), still at triage. Until it is fixed, nothing runs the whole-tree verdict, and the STREAM-9 failure on the mac-studio-bootstrap note stays unreported.

**Query:** How should the whole-tree verdict be restored?

**Options:** a) (recommended) Adopt KI-TOOL-KI-CLI-126 into Now and plan it, so that `ki repo repair` reports an unbound store without failing, the audit step runs again, and CI goes red only on real findings. b) Change ki-principal's `ci.yml` to skip or tolerate the repair step and run the audit directly, as an interim owner instruction. c) Leave CI as it is and rely on the Tending Health Check or manual whole-tree audits.

### GOV-192 - accept the GATE-1 sentence now that it is in use

**Context:** [KI-HARNESS-GOV-192](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-192-scoped-gate-verdict.md) added the GATE-1 sentence that lets a Knowledge Base hook pass `--staged`. That sentence is now pinned in tools-ki v0.10.4, and ki-principal's hook relies on it. The record is still at awaiting-review, because this run was told not to accept it.

**Query:** Do you accept KI-HARNESS-GOV-192?

**Options:** a) (recommended) Accept KI-HARNESS-GOV-192 as delivered, since v0.10.4 pins it and ki-principal's hook uses it, and prune it. b) Hold it in awaiting-review until CI-STORE is resolved and the whole-tree verdict is proven again. c) Ask for changes to the sentence first.

```text
CI-STORE
a) Adopt KI-TOOL-KI-CLI-126 into Now and plan it, so that ki repo repair reports an unbound store without failing, the audit step runs again, and CI goes red only on real findings.

GOV-192
a) Accept KI-HARNESS-GOV-192 as delivered, since v0.10.4 pins it and ki-principal's hook uses it, and prune it.
```

```text
╭─ run report · 2026-10-14T20:37:36Z ──────────────╮
│                                                  │
│  █▀▀▄ █  █ █▀▀▀ █  █   · thread busy             │
│  █▀▀▄ █  █ ▀▀▀█  ▀█▀   · running or queued work  │
│  █▄▄▀ █▄▄█ ▄▄▄█   █    · lines below say which   │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [running] area-diagrams - eight area diagrams, thread-model diagram, committed HTML
- [running] pmo-simplify - REPORT-SOURCE, HOOK-BINDING, RECAP-OWNER in ki-pmo
- [queued] log-writer - after pmo-simplify
- [queued] heartbeat - after pmo-simplify
- [committed] gate-release - tools-ki v0.10.4 released; ki-principal on the staged gate, pushed
- [waiting] CI-STORE, GOV-192
