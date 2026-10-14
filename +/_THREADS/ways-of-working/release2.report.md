# release2 — tools-ki v0.10.2 released

Authority: Kris's owner answer in this thread, "RUMDL - a", choosing option (a) of the previous release agent's query: update rumdl 0.2.77 → 0.2.78 as its own `chore(deps)` commit, then complete the single approved v0.10.2 patch release (the skill-rename bootstrap fix plus the `KI_AGENT_RUN` marker).

## What has been done

- **rumdl adopted.** Commit `a86a63a chore(deps): adopt rumdl 0.2.78` moves the Markdown linter to `^0.2.78` in `package.json` and `bun.lock` (the only install, authorised by the decision). `ki repo audit --repo .` now reports FAIL=0; the two remaining findings (CI-1, HOOK-1) are pre-existing warnings.
- **Release prep committed.** The previous agent's saved 0.10.2 patch was applied unchanged (version 0.10.1 → 0.10.2, changelog baseline line, one sentence on the `KI_AGENT_RUN` marker). I added one further changelog edit the patch had missed: the "canonical Harness pin" line now names `86744bf` and the Wave E skill renames it carries, matching how the v0.10.1 prep updated that line when the pin moved. Commit `18a872e chore(release): prepare v0.10.2`.
- **Checks on the candidate, all passing:** `bun install --frozen-lockfile` (root and `tooling/boundaries`), `bun run test` and `bun run test:coverage` (69 files, 1144 tests), `bunx tsc --noEmit`, `bunx biome check` (pre-existing warnings only), `bunx knip` (exit 0, pre-existing configuration hints only), `bun run ki:tools:lint-man`, `rumdl check` on the Markdown, `bun run build` with both the source launcher and `dist/ki` reporting 0.10.2, and `ki repo audit --repo .` with FAIL=0.
- **Pushed and released through the documented procedure.** Both commits pushed fast-forward to `origin/main` of tools-ki. CI on main for `18a872e` passed (run 38544839611; main had been red since the marker commit). Tag `v0.10.2` created on `18a872e` and pushed. Release workflow dispatched from `main` (run 38545104828): validate, three target builds, sign and publish, notify tap, and clean Linux install verification all succeeded. GitHub release <https://github.com/knowledgeislands/tools-ki/releases/tag/v0.10.2> is published, not draft, with the three archives, `ki-checksums.txt` and its signature.
- **Homebrew tap updated automatically.** The notify job's dispatch opened <https://github.com/knowledgeislands/homebrew-tap/pull/37> "Advance ki to v0.10.2"; its CI passed and it auto-merged at 09:54 UTC as `2213d04`. The local `homebrew-tap` checkout was brought level with `git pull --ff-only`; no local commit was needed there.
- **Local `ki` reports 0.10.2.** The `ki` on PATH is the development link to this checkout and reports 0.10.2 (`ki doctor` agrees). The procedure includes no local upgrade step; the Homebrew-installed `ki` remains 0.10.1 and would need `brew upgrade ki`, which is a package install and so not done.
- **No npm or other registry publication.** No configuration, scheduler or credential change. No secrets read.

Related records: [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) (marker), [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md), [KI-TOOL-KI-CLI-125](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md), [KI-HARNESS-GOV-182](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-182-wave-e-skill-renames.md) (the skill renames the pin carries).

## What is in progress

Nothing. The tools-ki checkout is clean and level with `origin/main`, which has since gained `86c56b3 docs(roadmap): describe cited owner decisions in the owner's words` from another session; I did not touch it.

### Notes, no action requested now

- rumdl 0.2.79 was published on 9 October, so DEPS-1 will flag 0.2.78 → 0.2.79 from about 23 October. I took the owner's words literally and stopped at 0.2.78.
- Downstream, each repository's `.github/ki-version` (or inline `KI_VERSION`) pin still names v0.10.1 until the Release Cascade moves it; the `update-ki-pin` receivers propose that bump where enrolled.

## Outstanding queries

None.

```text
(no reply needed)
```
