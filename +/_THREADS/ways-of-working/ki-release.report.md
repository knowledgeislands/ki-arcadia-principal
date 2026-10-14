# ki-release — tools-ki v0.10.2 release: held at the tag on one audit failure

Authority: Kris approved the release in this thread ("KI-RELEASE - yes, release tools-ki right after the harness push.") and, relayed by Master: state-of-play Decision 175, the marker release ("do it and get it released"). The brief also says: "Run all checks and tests first; stop and report if any fail." One check fails, so the tag is held.

## What has been done

- **Harness renames confirmed on origin.** `ki-agentic-harness` origin/main (86744bfd) carries `ki-pmo-design` and `ki-work-recurring`; [KI-HARNESS-GOV-182](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-182-wave-e-skill-renames.md) is accepted there.
- **Harness pin bumped, as the releasing guide requires.** The pinned harness (bd6e29b5) still had the old skill names, so `ki bootstrap` would have required `ki-pmo-design` and installed a harness without it. Commit `9e48b16 fix(bootstrap): pin the harness carrying the skill renames` moves the pin to 86744bfd with its verified archive digest and updates the bootstrap test fixtures. The digest was computed from the codeload archive (one read-only download, needed by the procedure).
- **Knip failure fixed.** CI on tools-ki main has been red since the marker commit (bd8563a) because `agentRunMarker` was exported but used only in its own module. Commit `b5a669d fix(agent): keep the run marker name internal` makes it module-local; no behaviour change. Related record: [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md).
- **Both commits pushed fast-forward** to `origin/main` of tools-ki (7e3c05f..b5a669d). Working tree is clean.
- **Checks run on the candidate:** `bun install --frozen-lockfile` (root and `tooling/boundaries`), `bun run test` and `bun run test:coverage` (69 files, 1144 tests, pass), `bunx tsc --noEmit` (pass), `bunx biome check` (pass; pre-existing warnings only), `bunx knip` (clean after the fix), `bun run ki:tools:lint-man` (pass), `rumdl` on the changelog (pass), `bun run build` with `dist/ki --version` reporting the candidate version. GitHub release immutability is enabled; `gh` is logged in; the `KI_TOOLS_RELEASE_BOT_APP_ID` variable exists, so the tap notify job will run.
- **Release-prep diff prepared but not committed:** `package.json` 0.10.1 → 0.10.2, changelog baseline line → `v0.10.2`, plus one sentence in the `ki agent` behaviour paragraph describing the `KI_AGENT_RUN` marker. Saved as `/Users/krisbrown/.local/state/ki/agents/ways-of-working/ki-release.prepare-v0.10.2.patch` (apply with `git apply`), then reverted so the shared tree stays clean.
- **Not done:** no tag, no workflow dispatch, no GitHub release, no tap change, no npm. Nothing on this machine's configuration was changed. The locally installed `ki` is a development link to the checkout, so it will report 0.10.2 once the release-prep commit lands; the Homebrew `ki` stays at 0.10.1 until the tap formula merges.

## What is in progress

Nothing is running. The release is held one step before `git tag v0.10.2`.

### Outstanding — no action requested now

- CI on tools-ki main will still fail on DEPS-1 after this push (see the query below); every other audit finding is a warning.
- The releasing guide has the tap update automatic: the release workflow's notify job dispatches to `homebrew-tap`, which opens and squash-merges the formula PR behind its checks. The local `homebrew-tap` checkout is two commits behind origin and untouched; it only needs `git pull --ff-only` after the formula lands.

## Outstanding queries

### RUMDL - repository audit fails on dependency currency

**Summary.** `ki repo audit --repo .` (the definition-of-done governance gate, also CI's audit step) fails one criterion: DEPS-1, "beyond the 14-day adoption window: rumdl 0.2.77 → 0.2.78 (available 14 days) — adopt the update or record a dependency hold". It pre-dates this release and is unrelated to what it carries. The ki-engineering standard's default is to adopt the update, which means `bun update rumdl` and a lockfile change; the brief forbids package installs. The alternative is a `dependency_holds` entry under `[skills.ki-engineering]` in `.ki.toml` with a reason, which is a policy choice.

**Need from you.** Choose one: (a) authorise the rumdl update as its own `chore(deps)` commit before the release, (b) record a hold with a reason you give, or (c) release with the audit red on this one criterion.

**Recommendation.** (a): adopt rumdl 0.2.78, re-run the gate, then apply the saved patch as `chore(release): prepare v0.10.2`, tag, dispatch the release workflow from main, and confirm the tap PR merged. It keeps the release fully verified and clears CI on main.

```text
RUMDL - a (update rumdl, then release v0.10.2) | b: hold, reason: <reason> | c: release with DEPS-1 red
```
