# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) › apply-check

**Run report at 01:38 BST · last mark 17:47 BST**

---

## Done

- **Found the evidence.** Rig keeps no log of an apply's own output. It keeps a per-item history in `~/.local/state/rig/apply-history/macos.tsv`, which records only the latest attempt for each tool, skill, setting, service and scheduled job. Kris's apply wrote its entries from 01:19:12 to 01:21:39 BST. The only run summary on disk, `~/.local/state/rig/last-upgrade`, belongs to the sol-clt upgrade, which finished at 01:25:11 BST. The history, the Rig source and the counts below together account for all nine failures.
- **The nine failed steps.** None of them came from running alongside `rig upgrade`. Every Homebrew step in the apply exited 0, and nothing hit a lock or a busy Homebrew.

  | Step | Cause | Kind | Now |
  | --- | --- | --- | --- |
  | `cargo-binstall`, `cargo-edit`, `cargo-nextest`, `cargo-outdated`, `cargo-watch`, `cargo-zigbuild`, `git-cliff`, `lychee` (8, mise) | Rig ran them alphabetically at 01:20:03-05 BST. Rust only arrived at 01:20:56 BST, because the eight declarations require `mise` but not `rust`. Without Cargo, mise's `cargo:` backend could not install them. | Real defect, in the chezmoi Rig config `dot_config/rig/conf.d/private_15-command-line.toml` (commit `40b1029`) | All eight are installed now and on `PATH`. Rig still lists them as historical failures until an apply succeeds for them. |
  | SVG handler (`default-application.svg` → Google Chrome) † | Rig's handler step checks the result after setting it. Most likely macOS asked Kris to confirm the change, so the check failed ("handler assignment not effective; native confirmation may be required"). | Needs Kris (GUI approval) | Done. `rig status` shows it as present. |

  † Rig doesn't log handler steps, so the SVG step is worked out from the counts. It is the only step not in the history, and it is the only way the totals add up. Rig did not count Telegram as a failure: it skipped it as a source mismatch, as the counts below show.
- **Why completed (173) is more than planned (165).** In a real run, Rig counts only the tools it will install as "planned". Skills and resources count as "completed" but never as "planned". So the numbers are:
  - Planned 165 = 108 tools completed + 8 tools failed + 49 tools skipped.
  - Completed 173 = 108 tools + 2 skills + 63 resources (55 settings, 4 services, 4 scheduled jobs).
  - Failed 9 = 8 cargo tools + the SVG handler.
  - Skipped 68 = 19 catalogue-only + 48 self-updating apps + Telegram.
- **`10-applications.toml` was not applied first.** The applied file on disk is dated 01:22:58 BST. That is about 80 seconds after the apply's last step. So the apply used the old file, without commit `f8cf28b` (the Adobe entries and DaVinci Resolve's App Store route). It is applied now: `chezmoi status` and `chezmoi diff` show nothing for that file. Nothing failed because of the old file.
- **`rig apply --dry-run` now.** 232 planned (166 tools, 2 skills, 64 resources), 20 skipped (catalogue-only), 0 failed. The dry run doesn't check which items are already up to date, so "planned" here just means "selected". `rig status` shows what still differs: only 2 of 255 entries.
  - Telegram is still `drifted source-mismatch`. The installed copy is the Homebrew cask, but Rig declares the App Store app (747648890). Until that is settled, every full `rig apply` will exit 1.
  - `port.headroom` reports "owner Python, expected headroom-ai". This is the known way a hand-started Headroom shows up.
  - DaVinci Resolve (App Store 21.1.1) and the SVG handler both show as present. The eight cargo failures are listed as history only. The full dry run is in `~/.local/state/ki/agents/mac-studio-bootstrap/apply-check.dry-run.txt`.
- **Seen in the Rig source, not the cause of this failure.** `rig apply` and `rig upgrade` don't share a lock: the reconciliation lock covers only resources. So nothing stops the two from running Homebrew and mise at the same time. Rig's history also skips default-application steps, which is why the SVG failure left no record.
- No apply, chezmoi apply, install, upgrade or commit was made. No secrets were read.

## In Progress

Nothing running. Steps for Kris at sol's screen:

1. **Clear the eight old cargo failures** (optional, a few seconds, nothing gets installed). Open Terminal and run:

   ```sh
   rig apply --scope tools --target cargo-binstall --target cargo-edit --target cargo-nextest --target cargo-outdated --target cargo-watch --target cargo-zigbuild --target git-cliff --target lychee
   ```

   It should end with `failed=0`. Then run `rig status`. The "Historical apply failures" list should be gone.
2. **Telegram.** This waits on SOL-TELEGRAM-DIRECTION from the sol-clt run. Decisions 81 and 82 record the Homebrew cask as installed on purpose. Until the Rig declaration matches, a full `rig apply` will keep ending with status 1 because of this one item. Don't remove the cask before that query is answered.
3. **Later full apply checks.** Run `rig apply` only when `rig upgrade` (or the 08:30 `rig-update` job) isn't running, until Rig has a shared lock. If macOS asks you to confirm a default app, click to use the new app.

## Queries

### APPLY-RUST-ORDER

**Context.** The eight cargo tools declare `requires = ["mise"]` but not `rust`. Rig works alphabetically, so on a machine without Rust they run before Rust and fail. That happened on sol tonight, and it will happen again on any new machine.

**Query.** Should the declarations be fixed?

**Options.** a) (recommended) An agent on sol adds `"rust"` to `requires` for the eight cargo tools in `dot_config/rig/conf.d/private_15-command-line.toml`, runs the chezmoi gate and commits locally. Kris then applies it with `chezmoi apply ~/.config/rig/conf.d/15-command-line.toml`. b) Capture a triage record only. c) Leave it.

### APPLY-UPGRADE-LOCK

**Context.** `rig apply` and `rig upgrade` (also run by the scheduled `rig-update` job) can run at the same time. Only resource reconciliation is locked. Tonight that caused no failures, but two runs of Homebrew or mise side by side are a risk. Separately, Rig doesn't record default-application steps in its history, so a failed handler step leaves no trace.

**Query.** Should these go to tools-rig as forward work?

**Options.** a) (recommended) An agent captures one tools-rig triage record (local commit, not adopted). It covers two things: `apply` and `upgrade` should share one lock and refuse to run concurrently, and default-application outcomes should be recorded in the apply history. b) Two separate records. c) Leave it.

```text
APPLY-RUST-ORDER - a) an agent on sol adds "rust" to requires for the eight cargo tools in dot_config/rig/conf.d/private_15-command-line.toml, runs the chezmoi gate and commits locally; Kris then runs chezmoi apply ~/.config/rig/conf.d/15-command-line.toml
APPLY-UPGRADE-LOCK - a) an agent captures one unadopted tools-rig triage record (local commit): rig apply and rig upgrade share one lock and refuse to run concurrently, and default-application outcomes are recorded in the apply history
```

```text
╭─ run report · 2026-10-15T00:38:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · 2 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] apply-check finished, nothing running from this run
- [queries] APPLY-RUST-ORDER, APPLY-UPGRADE-LOCK; SOL-TELEGRAM-DIRECTION still open from sol-clt
- [uncommitted] this report and `apply-check.dry-run.txt` (state folder, untracked)
- [unpushed] chezmoi `be8e318` on sol (from sol-clt); thread folder

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
