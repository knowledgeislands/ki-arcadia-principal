# Harness fixes — report

**Done**

- Pruned TECHNE-TOOLS-OPS-014 in a prune-only commit: `5592aa4` chore(roadmap): prune 1 done work record.
- Raised the ki pin from 0.9.0 to 0.10.0 for both the Linux and macOS variants in `recipes/direct-host/rig.toml`: `10ea36b`. Release check, done offline: v0.10.0 is the newest tools-ki tag, its release workflow builds `linux-x64`, the tap formula points at the `ki-v0.10.0-linux-x64.tar.gz` asset, and `install.sh` (the installer converge.sh fetches) is unchanged from v0.9.0. The offline check's ki stub now reports 0.10.0.
- Added the --pull hint: `2e6308f`. When `ki repo --estate repair` fails, converge.sh now prints "a checkout may be behind origin; rerun setup with --pull". The operator guide's setup command now uses `--pull` and recommends it on every rerun. The offline workspace check also simulates a failed repair and asserts the hint appears.
- Checks: `bun run test` passed (2/2 tasks, all offline checks passed). `ki repo audit --repo .` reported PASS=16 WARN=2 FAIL=0. Both warnings were already there and concern files this work did not touch (an inline KI_VERSION in ci.yml, CI-1; no committed .githooks/pre-commit, HOOK-1).

**Failed**

- Nothing failed, but the host rerun did not happen. After `git fetch`, origin/main is 3 commits behind local main, so the host checkout cannot pick up the new pin. As the brief instructs, I stopped before `setup.sh --pull`, `status.sh` and the SSH checks. The host's ki version and drift are therefore not observed.

**Needs the owner**

- Push `5592aa4`, `10ea36b` and `2e6308f` to origin, then rerun this step: `bash operations/aws/agent-host/setup.sh --pull`, `status.sh` (text and `--json`), and `rig status --profile direct-host` plus `ki --version` over SSH. The brief's footer says pushing is authorised, but its body says "Do not push" and that pushing is Kris's call. I followed the body.
