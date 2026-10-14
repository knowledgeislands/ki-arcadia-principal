# CodexBar CLI change — report

**Done**

- The change was already committed when this run started: `2f445ef feat(rig): declare CodexBar CLI ownership` (authored as Kris Brown, 2026-10-08 20:17 +0100). It holds exactly the described edit to `dot_config/rig/conf.d/private_10-applications.toml` and nothing else. I made no new commit, and the working tree is clean.
- The `cli.<name>.*` keys are valid. tools-rig `src/rig/24-app-clis.bash` accepts `source`, `destination` and `owner`, with `owner` set to `provider` or `link`.
- Checks: `ki repo audit --repo .` passed (PASS=19 WARN=2 FAIL=0; both warnings concern ki-agentic-harness, not this change). `node --test tests/*.test.mjs` passed 174, skipped 2, failed 0. `rumdl check .` found no issues. `rig doctor` reported 0 findings (pass=211 warn=0 fail=0).
- Nothing was pushed or applied. `main` is 4 commits ahead of `origin/main`, and no `.git` lock files are left behind.

**Needs Kris**

- Nothing for this change. The commit has no Claude co-author trailer, so it was probably made by hand or by another session.
