# Owner report: KI-TOOL-KI-CLI-124 thread-home fix, acceptance and release 0.10.3

Run `ways-of-working`, agent `cli124-fix`, in `tools-ki`. Authority, in Kris's words: "CLI124-ACCEPT - accept with change; CLI124-RELEASE - release after change", recorded in the thread log as "accept KI-TOOL-KI-CLI-124 with the change (thread home from the launch's working directory) then release tools-ki 0.10.3 (no npm)" and "approve the surfaces rule and the ki agent status follow-on".

## Done

- **The change.** `ki agent` once fixed a run's thread home from the shell's current directory, which wrote a report into `~/.local/share/chezmoi`. Now, once `thread.json` records a home, every later command uses it whatever the current directory. A command that would fix a new home (`launch`, `queue`, `new`, `decide`) compares the current directory's Git root with the launch's working directory: the `<workdir>` operand for `launch` and `queue`, or the `workdir` each `*.launch.json` now records for later commands. It refuses with exit 2 when they differ, when launches ran in different roots, or when a launch has no recorded working directory, unless `--repo <dir>` is given. Tests cover both cases: a second checkout still uses the recorded home for `decide`, `new` and `launch`; and each refusal and its `--repo` escape. Full suite 1154 tests at 100% coverage on every metric; `tsc`, biome, dependency-cruiser and mandoc clean. A read-only `ki agent close ways-of-working` from `~/.local/share/chezmoi` gated on the ki-principal folder and wrote nothing there.
- **Acceptance.** [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md) is `done` through ki-accept, with the fix folded into its Delivered, Change Summary, Verification and review packet sections and the acceptance authority quoted in its Discussion. `ki repo audit --skill ki-work-roadmap` and `--skill ki-authoring` pass.
- **Release.** tools-ki `v0.10.3` is tagged on `main` and published as an immutable GitHub release by the repository's Release workflow (run 38576681845: validate, three builds, sign and publish, notify tap, clean Linux install proof all green). Assets: `ki-v0.10.3-darwin-arm64.tar.gz`, `ki-v0.10.3-darwin-x64.tar.gz`, `ki-v0.10.3-linux-x64.tar.gz`, `ki-checksums.txt` and its signature. Nothing was published to npm or any other registry. The release also carries the Harness pin advanced to `dd5761c6`, the Harness commit holding `ki-pmo` and the tracked thread home, with its tarball digest verified locally.
- **Homebrew tap.** The release bot opened and auto-merged `knowledgeislands/homebrew-tap` PR #39 "Advance ki to v0.10.3" (commit `80487c5`, KI governance and Homebrew formula gates green). The local tap checkout is pulled level. `brew update && brew upgrade ki` installed 0.10.3; `brew list --versions ki` and the Homebrew binary itself both report 0.10.3. Note that `ki` on PATH resolves to `~/.local/bin/ki`, the `ki dev local` runner symlink, which also reports 0.10.3.
- **Follow-on record.** [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) "Agent status live threads" is captured as `draft`, `horizon: next`, Project `ways-of-working`, quoting Kris's "approve the surfaces rule and the ki agent status follow-on". Not built.
- **Commits**, all on tools-ki `main`, pushed fast-forward to `origin/main` (now `2c6af46`), each with the Co-Authored-By trailer:
  - `bd5e09b fix(agent): take the thread home from the launch's working directory`
  - `1f6284b docs(roadmap): accept KI-TOOL-KI-CLI-124`
  - `e2e3eae docs(roadmap): reserve KI-TOOL-KI-CLI-127`
  - `00acbda docs(roadmap): capture KI-TOOL-KI-CLI-127 agent status live threads`
  - `57952de fix(bootstrap): pin the harness carrying ki-pmo and the tracked thread home`
  - `2c6af46 chore(release): prepare v0.10.3`
- Docs updated with the change: `docs/guides/user/background-agents.md` (thread-home rule and a "No thread home yet" recovery entry) and the CHANGELOG, whose baseline now describes `v0.10.3`.

## In progress

Nothing.

## Outstanding queries

- **Needs: nothing.** All four parts are complete.
- **Noted, no reply needed.** `ki repo audit --repo .` on tools-ki reports the pre-existing DEPS-1 failure (`@vitest/coverage-v8` and `vitest` 5.0.2 → 5.0.3, `knip` 6.38.0 → 6.39.0, beyond the 14-day window) and the CI-1 warning (inline `KI_VERSION` pin). Both predate this run; package installs were not allowed, so they stand.
- **Noted, no reply needed.** Legacy runs on this machine without a `thread.json` (for example `legal-state-of-play`, `personal-tower`) now refuse a new home unless run from their launch's working directory or given `--repo`; the recovery entry in the background-agents guide covers it.
- **Noted, no reply needed.** Dirty files from other sessions, left untouched: chezmoi `dot_config/rig/conf.d/private_40-macos.toml`; in ki-agentic-harness, 32 modified files including `docs/specs/harness.md`, the ki-pmo skill files, the coordinator hook files and roadmap records GOV-168, GOV-170, GOV-171, GOV-185 and OPS-005.

```text
cli124-fix: acknowledged
```
