# sol readiness to host the mac-studio-bootstrap coordinating thread - read-only check, 2026-10-14

## What has been done

I compared sol (the Mac Studio) with terra (this laptop) over SSH, read-only. I installed, applied, signed in, changed and committed nothing. No secret was read or printed: for credentials I only checked whether they exist.

**The short answer:** sol is close. Claude Code, Codex, Zed, `ki`, Rig and the MCP servers are installed and mostly working. Five gaps block it from hosting the thread:

1. The Command Line Tools on sol are out of date, so Homebrew fails.
2. sol's chezmoi source is 18 commits behind, so the ki-coordinator output style and the newest settings aren't on sol.
3. sol's `ki-agentic-harness` and `ki-principal` checkouts are behind terra.
4. On sol itself, GitHub CLI and 1Password CLI are not signed in, and GitHub access over SSH works only through the laptop's forwarded key.
5. sol has no `ki agent` state folder yet.

### 1. Rig

- sol runs macOS 27.0.1 but its Command Line Tools are still the 26.6 version. Because of that, every Homebrew install or upgrade fails, as the [rig-upgrade-failures report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-bootstrap/rig-upgrade-failures.report.md) explains.
- sol uses the checkout build, Rig 0.6.3, with profile `studio` and 175 tools. `rig doctor` says `unhealthy`: 229 checks passed, 1 failed and 19 were skipped. The one failure is Telegram, which you deleted by hand; Rig suggests `rig apply` to put it back. Whether Telegram belongs on sol is still open from the rig-upgrade-failures report. Nothing else declared is missing.
- **For you, at the screen:** update the Command Line Tools (step A1 below).
- **For an agent afterwards:** run `brew reinstall pkgconf`, `rig upgrade` and `rig doctor`.

### 2. Claude Code and Codex

| Item | sol | terra | chezmoi owns it? |
| --- | --- | --- | --- |
| Claude Code | 2.1.287, the Homebrew cask `claude-code` | 2.1.287 | Rig declares it (`tool.claude-code`, Homebrew cask, `core` profile) |
| Claude sign-in | a Keychain item and an `oauthAccount` entry are both present | signed in | no; this is a credential |
| `~/.claude/CLAUDE.md` and its imports | present (`@communication.md @delegation.md @memory-scope.md @markdown.md`), last applied 13 Oct | present | yes |
| `~/.claude/settings.json` | present; both `coordinator-reminder.sh` hooks are wired (SessionStart, UserPromptSubmit); chezmoi shows it differing from the source | present | yes, as a modify template |
| `coordinator-reminder.sh` | present in sol's harness checkout | present | the harness owns it |
| ki-coordinator output style | **missing.** `~/.claude/output-styles/` doesn't exist, and the target file isn't in sol's harness checkout (`6d3e2f34`) | present | yes: a symlink since chezmoi `319f6ae`, which sol hasn't pulled |
| Skills | 14 linked; `ki-design-loop` is a dead link (renamed to `ki-pmo-design`) | 22 | partly. The ki-bootstrap links come from ki; the Cloudflare skills on terra aren't on sol |
| Codex | 0.162.1, Homebrew cask | present | Rig declares it (`tool.codex`); `~/.codex/AGENTS.md` and `hooks.json` were applied 13 Oct |
| Codex sign-in | `auth.json` present with a token, last refreshed 30 Jul | signed in | no |

A small oddity: an old `mise` shim for `claude` comes first on sol's PATH. It falls through to the Homebrew binary, so `claude` works, but it's leftover clutter.

### 3. Zed

- Zed 1.23.3 is installed on sol through Homebrew.
- The chezmoi source does manage `~/.config/zed/settings.json`, and it declares both agents under `agent_servers`: `claude-acp` (default mode `bypassPermissions`) and `codex-acp` (registry, high reasoning effort).
- sol's live file already contains both agent entries. `chezmoi status` shows it as `MM`: both the source and the file on sol have changed since the last apply, so an apply needs a diff review first.

### 4. Thread host prerequisites on sol

| Item | State |
| --- | --- |
| `ki` 0.10.2 from the checkout, `ki agent` commands | present |
| `ki agent` state folder `~/.local/state/ki/agents/` | **missing.** Nothing has run there yet; the folder would be created on first use, but this thread's run history and decisions log live only on terra |
| Git identity | present (Kris Brown, `kris@kris.me.uk`) |
| GitHub over SSH, from sol on its own | **broken over SSH, should work at the screen.** It worked in this session only through terra's forwarded key. sol has its own key file, but its passphrase is kept in the login Keychain, which is locked over SSH |
| `gh` sign-in | **broken.** It reports "Failed to log in to github.com account krisb". The token is probably in the locked Keychain or has expired; check at the screen |
| 1Password CLI 2.38.1 | installed, **not signed in** ("no account found") |
| Checkouts level with GitHub | **behind.** Every checkout says it is level, but that is only against its last fetch (11:18 to 11:21 today). Compared with terra: `ki-principal` is at `136282d0` against `e2a5a67b`, `ki-agentic-harness` at `6d3e2f34` against `8cd1a56d`, `tools-ki` at `86c56b34` against `a3b9f50f` and `tools-rig` at `847f0eac` against `c650bfe6`. `tools-mgit` is level |
| mcporter servers | 9 of 12 healthy. `linear` needs sign-in, `project-rend` is offline and WhatsApp fails (that is the open SOL-WHATSAPP question; terra has the same `linear` and `project-rend` state) |

### 5. chezmoi on sol

- **Last apply:** 14 Oct 00:35 BST, judged from the state file's timestamp.
- **Source:** at `d7b4b5b`, 18 commits behind GitHub; terra is at `4d07f9c`.
- **Differences now** (names only): `.claude/settings.json`, `.config/ki/config.toml` and `.config/zed/settings.json`, all `MM`.
- **Would an apply at sol's own screen set up what's missing?** Mostly yes:
  - `chezmoi update` would pull the 18 commits and create the output-style link. The link points into the harness checkout, so `ki-agentic-harness` must be pulled first, or it stays a dead link.
  - **Caveat:** `.config/ki/config.toml` differs because `ki dev local on` rewrote it (the open SOL-KI-CONFIG-DRIFT question). A plain apply would undo local mode, so skip that file until the source catches up.

### Gaps in the declarations

These need a record:

- Nothing creates the Claude Code and Codex sign-ins or the `gh` sign-in. That is by design, but there is no written bootstrap step for them.
- The output-style link relies on the harness checkout being current, and nothing enforces that order.
- The skill links on sol and terra differ, including the dead `ki-design-loop` link.
- No host bootstrap step says where `~/.local/state/ki/agents/<run>/` comes from when a thread moves.

## What is in progress

- Nothing of mine is running.
- The `sol-dock-zed` run had not finished when I started, so I haven't used its results.

**Outstanding - no action requested now:** SOL-HNR-HARNESS, SOL-WHATSAPP and SOL-KI-CONFIG-DRIFT are still open from the sol-build report, and so is RIG-UPDATE-SOURCE. The coordinator already holds them.

## Checklist

### (a) At sol's screen, by Kris

1. **Command Line Tools.** Open System Settings > General > Software Update and install "Command Line Tools for Xcode 27.0". If it isn't offered, run `sudo rm -rf /Library/Developer/CommandLineTools`, then `sudo xcode-select --install`.
2. **Unlock the Keychain by logging in at the screen,** then open Terminal. Every step from here runs in that local session.
3. **GitHub on its own:** `ssh -T git@github.com` should greet `krisb` with no laptop forwarding. Then run `gh auth status`; if it fails, run `gh auth login` (GitHub.com, SSH, browser).
4. **1Password CLI:** open the 1Password app, turn on Settings > Developer > Integrate with 1Password CLI, then run `op whoami` to confirm.
5. **Pull the harness first:** `git -C ~/workspaces/knowledge-islands/ki-agentic-harness pull --ff-only`.
6. **chezmoi:** `chezmoi git pull -- --ff-only`, then `chezmoi diff`. If the diff looks right, apply everything except the ki config by naming the targets: `chezmoi apply ~/.claude ~/.config/zed ~/.codex`, then `chezmoi status` to confirm only `.config/ki/config.toml` is left.
7. **Claude Code:** run `claude` once in `~/workspaces/knowledge-islands/ki-principal`. Confirm it's signed in (`/status`) and that the ki-coordinator output style appears under `/output-style`. Only if it isn't signed in, run `/login`.
8. **Codex:** run `codex` once and confirm it's signed in. The token was last refreshed 30 Jul.
9. **Zed:** open Zed and open the Agent panel. Check that Claude Code and Codex both start; the first start may download the ACP adapters.

### (b) An agent can do these over SSH, after your approval

1. `brew reinstall pkgconf`, then `rig upgrade` and `rig doctor`.
2. Fast-forward the clean `main` checkouts on sol, at least `ki-principal`, `tools-ki` and `tools-rig`, then `bun install` and relink, as the sol-build run did. This needs a fetch exception.
3. Remove the dead `ki-design-loop` skill links and the stale `mise` claude shim (`mise reshim`).
4. Re-run the read-only checks: `rig doctor`, `chezmoi status`, `mcporter list` and `ki doctor`.

### (c) Gaps that need a record

1. Write a host bootstrap step for sign-ins: Claude Code, Codex, `gh`, `op` and the GitHub SSH key with an unlocked Keychain (chezmoi repository).
2. Make sure the harness checkout is current before the chezmoi output-style link is applied, or have the apply warn about a dead link (chezmoi repository).
3. Make the skill set on sol match terra, and fix the `ki-pmo-design` rename (fold into SOL-KI-CONFIG-DRIFT).
4. Document thread-state transfer for a host move in `ki-delegation`/`ki-pmo`: what of `~/.local/state/ki/agents/<run>/` travels, and that the decisions log is machine-local (ki-agentic-harness).

### Moving the thread to sol

1. On terra, launch nothing new. Let the agents that are already running finish (drain), and take in their reports.
2. Put every queued item into the thread checkpoint, with its brief, and do not launch it.
3. Commit and push the checkpoint and the thread folder `+/_THREADS/mac-studio-bootstrap/` from terra.
4. Copy the decisions log `~/.local/state/ki/agents/mac-studio-bootstrap/decisions.md` to the same path on sol. It is machine-local and isn't in Git; until record (c)4 exists, a copy run by you or an approved agent is needed.
5. On sol, pull `ki-principal`, open it in Zed, start a Claude Code agent thread with the ki-coordinator output style, and paste the resume line.
6. The new thread re-bootstraps from the checkpoint and re-queues the parked items on sol.

## Outstanding queries

### SOL-SCREEN - Do the at-screen steps on sol

**Summary:** sol can't host the thread until the Command Line Tools are updated and it has signed in to GitHub, 1Password and chezmoi on its own, with the Keychain unlocked. Only you can do these, at sol's screen.

**Need from you:** work through steps (a)1 to (a)9, then tell the coordinator they're done.

**Recommendation:** do them in order in one sitting. Leave `.config/ki/config.toml` unapplied.

### SOL-AGENT-FIX - Let an agent finish sol over SSH

**Summary:** once the screen steps are done, an agent can repair Homebrew, run `rig upgrade`, bring the checkouts up to date, tidy the skill links and re-check everything.

**Need from you:** approval for steps (b)1 to (b)4, including a Git fetch and Homebrew downloads on sol.

**Recommendation:** approve them, to run straight after SOL-SCREEN, with no commits or pushes.

### SOL-RECORDS - Record the gaps in the declarations

**Summary:** four gaps (c)1 to (c)4 leave a host move dependent on manual steps.

**Need from you:** agreement to capture them as triage records.

**Recommendation:** capture (c)1 to (c)3 in the chezmoi repository and (c)4 in ki-agentic-harness, as unadopted triage records.

```text
SOL-SCREEN - done the at-screen steps (a)1-(a)9 on sol, left .config/ki/config.toml unapplied
SOL-AGENT-FIX - approved: run (b)1-(b)4 on sol over SSH after SOL-SCREEN, fetch and Homebrew downloads allowed, no commits or pushes
SOL-RECORDS - capture (c)1-(c)3 as triage records in chezmoi and (c)4 in ki-agentic-harness
```
