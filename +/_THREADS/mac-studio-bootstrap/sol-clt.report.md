# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) › sol-clt

**Run report at 01:31 BST · last mark 17:47 BST**

---

## Done

- **SOL-CLT verified.** The Command Line Tools for Xcode 27.0 (`27.0.0.0.1788430756`) were installed at 15:20 BST on 14 October, and `xcode-select -p` points to `/Library/Developer/CommandLineTools`. `pkgconf` 3.0.8 had already been reinstalled at 16:04 BST, after the new tools, so this run did not reinstall it again.
- **`rig upgrade --unattended`.** 107 completed, 0 failed, 48 skipped (self-updating apps) and 12 unavailable. Eleven of the unavailable items are App Store apps, which unattended mode skips: Actions, Kindle, Amphetamine, Apple Configurator, DaisyDisk, GarageBand, GoodNotes, Home Assistant, HP, iMovie and WhatsApp. The twelfth is Telegram (source mismatch, see SOL-TELEGRAM). The command still exited 1. The earlier 82-83 failures caused by the old tools have gone. Along the way the upgrade installed `rust` 1.96.0 and all eight cargo tools through mise. On the first attempt `cargo-binstall` found no prebuilt binaries, so it built them from source. That is why `rig doctor` lists eight historical apply failures, timed 00:20Z, which are already out of date. Headroom stayed at `headroom-ai` 0.41.0 and the proxy kept listening on 8787 the whole time. Log: `~/.local/state/ki/agents/mac-studio-bootstrap/sol-clt.rig-upgrade.log`.
- **KB-DOTFILES-UE-086 section C.**
  - C2 is done. `mise install` had nothing left to install. `mise ls --global --missing` is empty, `uv` and `python3` resolve to the mise shims, and `uv` is 0.13.0.
  - **mise prune** (approved) removed only `bun` 1.3.14. Four `node` versions stay because repository `mise.toml` files pin them: 22.16.0, 22.23.3, 24.19.0 and 24.22.0. 24.18.0 stays because two running `mcp-housekeeping-chatgpt` processes use it. The record had expected 22.23.3, 24.18.0 and 24.19.0 to be pruned as unpinned.
  - C3 is checked. On `sol`, `claude-swap` and `headroom-ai` both run on Homebrew `python@3.14`, not on uv's own CPython as the record's Context says. C4 keeps `python@3.14` because it has dependants, so neither tool needs reinstalling.
  - Read-only checks for Kris's steps:
    - C4: `uv` and `python@3.10` have no dependants, so they would be uninstalled. `python@3.13` (used by `memo`) and `python@3.14` (used by `gitup`, `hermes-agent`, `nmap`, `openai-whisper`, `platformio` and `yt-dlp`) would be kept as dependencies only.
    - C7h: `libtiff` and `node` both have dependants, so both would be kept. `hermes-agent` is one of those dependants. After C7f removes it, `node` is still needed by `git-almanac`, `mcporter` and `summarize`.
    - C7f: `hermes-agent` has no dependants.
  - Recorded C2 and C3 in the record and committed locally in chezmoi as `be8e318` (not pushed). Gate:
    - `rumdl check .` is clean (88 files).
    - `node --test` passed 239 of 243. The 2 failures (`tests/ki-self-skill.test.mjs` and "the real source's isolated exit 40…") are the same ones local-push saw on origin/main.
    - `ki repo audit` had 1 FAIL, RUNTIMES-3. That is the same missing `ki-self` projection, which existed before this run, plus the HOOK-1 warning.
  - `dot_gitconfig` is still uncommitted and untouched.
- **Doctors after.** `rig doctor` went from 12 findings to 10 (pass 228 → 239, present 155 → 165). The nine missing mise tools and the SVG handler finding have cleared. Two live findings remain: Telegram's source mismatch, and `port.headroom` "conflicting (owner Python, expected headroom-ai)". The second is how a hand-started Headroom shows up; it was already reported. The other eight findings are the out-of-date apply-history entries above. `brew doctor` has one warning: `python@3.10` is deprecated, and C4 removes it.
- **Seen, not done by this run.** While the run was going, `~/.config/rig/conf.d/10-applications.toml` went from pending to applied, the SVG handler finding cleared, and someone committed `67f8b4b` in chezmoi. This looks like SOL-APPLY done at the screen.

## In Progress

Nothing running. These section C steps still need Kris at `sol`: C1 (the `chezmoi diff` review; the pins and `conf.d` already look applied), C4 uninstalls, C5 Google Drive, C6 Home Assistant, C7a-C7i removals (several use `sudo`), C8 and C9. This run did no apply, uninstall or `sudo` step. SOL-TELEGRAM is **not done**: `/Applications/Telegram.app` is the Homebrew cask copy (`telegram` 13.0, no App Store receipt).

## Queries

### SOL-TELEGRAM-DIRECTION

**Context.** The checkpoint's SOL-CLT line says: approve removal of the App Store copy, then `rig apply` to install the Homebrew cask. On `sol` it is the other way round. Rig declares Telegram as App Store 747648890 ("both machines use the App Store app, not the Homebrew cask"), the installed copy is the Homebrew cask, and Decision 61 recorded the advice to remove the cask and install from the App Store.

**Query.** Which direction should SOL-TELEGRAM go at the screen?

**Options.** a) (recommended) Follow the declaration: quit Telegram, `brew uninstall --cask telegram`, sign in to the App Store, `rig apply --target telegram` to install App Store 747648890, then sign in to Telegram; correct the checkpoint wording. b) Keep the Homebrew cask and change the Rig declaration to the cask on both Macs. c) Leave it for now.

### UE086-SOL-REST

**Context.** Agent-safe section C work is done (C2, C3, mise prune). Everything left is Kris-attended: uninstalls, App Store removals with `sudo`, app quits and sign-ins.

**Query.** When do you want to do the rest of section C at `sol`?

**Options.** a) (recommended) In one session at `sol`, with SOL-TELEGRAM: C1 diff review, C4, C5, C6, C7a-C7i, then C8 and C9, with an agent alongside for the checks and record update. b) Split it: C4 and C7d-C7h (Homebrew and npm, no GUI) now from a terminal, and the rest later. c) Hold.

```text
SOL-TELEGRAM-DIRECTION - a) follow the declaration: quit Telegram, brew uninstall --cask telegram, sign in to the App Store, rig apply --target telegram to install App Store 747648890, sign in to Telegram; correct the checkpoint wording
UE086-SOL-REST - a) one session at sol with SOL-TELEGRAM: C1 diff review, C4, C5, C6, C7a-C7i, then C8 and C9, with an agent alongside for checks and the record update
```

```text
╭─ run report · 2026-10-15T00:31:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · 2 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] sol-clt finished, nothing running from this run
- [queries] SOL-TELEGRAM-DIRECTION, UE086-SOL-REST
- [uncommitted] this report; `dot_gitconfig` in chezmoi (not this run's)
- [unpushed] chezmoi `be8e318` on sol; thread folder

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
