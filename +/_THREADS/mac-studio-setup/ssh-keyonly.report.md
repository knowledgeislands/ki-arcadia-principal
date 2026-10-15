# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › ssh-keyonly

**Run report at 10:56 BST · last mark 17:47 BST**

---

## Done

- **Each Mac's SSH server will accept key logins only, once applied.** Committed in chezmoi as `1c74a8f` on top of `ace1863`. It is local only and not pushed. A new macOS-only script, [`run_onchange_after_sshd_key_only.sh.tmpl`](/Users/krisbrown/.local/share/chezmoi/run_onchange_after_sshd_key_only.sh.tmpl), writes `/etc/ssh/sshd_config.d/050-ki-key-only.conf` with `PasswordAuthentication no` and `KbdInteractiveAuthentication no`.
  - It runs `sudo -n sshd -t -f` on a temporary copy of the full configuration that reads the drop-in first. Only after that check passes does it install the drop-in as `root:wheel 0644`.
  - It then checks the live configuration with `sshd -t` and takes the drop-in out again if that fails.
  - `050` sorts before macOS's own `100-macos.conf`, and sshd keeps the first value it reads. launchd starts sshd for each connection, so there is nothing to restart.
  - It only ever calls `sudo -n`. Without cached sudo it changes nothing and prints `sshd key-only: skipped, sudo needs a password; run 'sudo -v' at this Mac's screen, then 'chezmoi apply'`. That means an apply over SSH never sits waiting for a password.
- **One choice beyond the brief (see KEYONLY-SKIP-EXIT).** When the script skips, it exits 1 instead of 0. chezmoi marks a `run_onchange_` script as run once it exits 0. A skip that exited 0 would therefore never be retried, and the setting would quietly never arrive. The script sorts last among the after-scripts, so a skip stops nothing else.
- **The directives are valid; the full root check was not run.** `sshd -G` on sol accepts both directives. The root-only `sshd -t` on the full configuration was not run, because sol had no cached sudo and this run did not ask for a password. The script runs that check itself at apply time, before it installs anything.
- **[KB-DOTFILES-UE-088](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-088-ssh-alias-for-sol.md) is widened.** The record now covers the SSH-TAILNET goal, context and scope. Port 22 stays outside `KI-TOOL-RIG-CORE-047`, as decided. The record also gains the current state, verification steps and a new restore path for the sshd step.
- **New test.** [`tests/sshd-key-only.test.mjs`](/Users/krisbrown/.local/share/chezmoi/tests/sshd-key-only.test.mjs) has 6 cases. They run against a stub `sudo` that executes nothing and check that:
  - the script renders only on macOS;
  - it calls `sudo -n` only;
  - it skips cleanly without sudo;
  - `sshd -t -f` runs before the install;
  - nothing is installed when that check fails;
  - the drop-in is removed when the live check fails.
- **Checks.**
  - `rumdl check .` is clean.
  - `node --test tests/*.test.mjs`: 247 pass, 2 fail. Both failures are the known ones, `ki-self-skill` and the wrapper-reporter exit-40 test.
  - `ki repo audit --repo .` shows its one known failure, the missing `.claude/skills/ki-self` projection.
  - No `rig` declaration changed, so `rig doctor` was not needed.
  - No Git lock files are left and no temporary files remain.
- **Not touched.** Another session has uncommitted changes in chezmoi: the Rig guide, the setup guide, UE-092, UE-093, two `conf.d` files and `tests/rig-catalogue.test.mjs`. This run left them alone.

## In Progress

Nothing is running from this run.

## Queries

**KEYONLY-APPLY**

**Context:** chezmoi `main` on sol is now 6 commits ahead of `origin`, ending `1c74a8f`. HOSTKEY-APPLY is still open, and a full `chezmoi apply` also brings in that change's `~/.ssh/config`. The drop-in is connection-critical. Running sessions keep their own sshd, so the screen session and a second SSH login are the way back.

**Query:** Will Kris apply the key-only drop-in at each Mac's screen, sol first and then terra?

**Options:** a) (recommended) yes, at each Mac in turn, after HOSTKEY-APPLY or together with it:

1. From the other Mac, open an SSH login to this Mac and leave it open. Keep this Mac's Terminal open too.
2. At this Mac (at terra, first run `chezmoi git -- pull --ff-only` once sol has pushed), run: `sudo -v && chezmoi diff && chezmoi apply`
   Expect: `sshd key-only: installed /etc/ssh/sshd_config.d/050-ki-key-only.conf`.
3. Run: `sudo sshd -T | grep -iE 'passwordauth|kbdinteractive'`
   Expect: `passwordauthentication no` and `kbdinteractiveauthentication no`.
4. From the other Mac, run `ssh sol true` (or `ssh terra true`).
   Expect: it connects with the key.
5. From the other Mac, run: `ssh -o PubkeyAuthentication=no -o PreferredAuthentications=password,keyboard-interactive krisbrown@100.90.130.74` (terra: `100.96.126.29`)
   Expect: `Permission denied`, with no password prompt.
6. Only if step 3, 4 or 5 goes wrong, run at the screen or in the second login: `sudo rm /etc/ssh/sshd_config.d/050-ki-key-only.conf && sudo sshd -t`
   Expect: password logins work again for new connections. Tell the thread so `1c74a8f` is reverted.

b) Apply on sol only and leave terra until it is next at hand.

**KEYONLY-SKIP-EXIT**

**Context:** The brief said the script "skips with a clear message" when sudo needs a password. It does skip and print a message, but it exits 1, so chezmoi retries it on the next apply. With exit 0, chezmoi would record a skipped run as done, and the drop-in would never be installed unless the script changed. The cost of exit 1 is that an apply over SSH reports a script failure, with that message, until the drop-in is installed at the screen.

**Query:** Keep the non-zero exit on a skip?

**Options:** a) (recommended) keep exit 1, so a skip is visible and retried.
b) Exit 0 on a skip, as the brief literally says. A skipped apply is then never retried until the script changes, unless chezmoi's script state is cleared.

```text
KEYONLY-APPLY - a) at sol, then terra: keep a second SSH login from the other Mac and the Terminal open; sudo -v && chezmoi diff && chezmoi apply (terra pulls first); sudo sshd -T | grep -iE 'passwordauth|kbdinteractive' shows both no; a key login from the other Mac works and a password-only login is refused; if any check fails, sudo rm /etc/ssh/sshd_config.d/050-ki-key-only.conf && sudo sshd -t and tell the thread to revert 1c74a8f
KEYONLY-SKIP-EXIT - a) keep exit 1 on a skip, so a skip is visible and retried
```

```text
╭─ run report · 2026-10-15T09:56:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · 1c74a8f local           │
│  █  █ █▄▄▄ ▄▄▄█   █    · 2 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] ssh-keyonly finished; nothing running from this run
- [waiting on Kris] KEYONLY-APPLY at sol's screen, then terra's, alongside HOSTKEY-APPLY
- [queries] KEYONLY-APPLY, KEYONLY-SKIP-EXIT
- [unpushed] chezmoi `main` on sol is 6 commits ahead, ending `1c74a8f`

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
