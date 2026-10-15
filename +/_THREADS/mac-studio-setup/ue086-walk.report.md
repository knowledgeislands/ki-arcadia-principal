# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › ue086-walk

**Run report at 22:22 BST · last mark 17:47 BST**

---

## Done

- **This was a read-only check on `sol`, from 22:09 to 22:21 BST.** Nothing was changed, installed, removed, applied or committed. None of the steps in scope (C1, C4, C7a to C7i and C9) in [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) is fully done, so the record is unchanged.
- **State of each step:**

| Step | State on `sol` now | Evidence |
| --- | --- | --- |
| C1 | **Mostly overtaken; two items left** | The chezmoi checkout is clean and level with its last-fetched `origin/main` (`5eb9309`, 0 ahead and 0 behind; this run did not fetch). The `Host sol` and `Host terra` aliases are already applied: `~/.ssh/config` was written at 22:03, and `~/.ssh/config.pre-ue088` is an identical leftover backup. `chezmoi status` lists two items. The first is `~/.claude/settings.json`; its rendered and live versions have the same keys and values, so only the formatting differs. The second is the key-only sshd script, which has not run: `/etc/ssh/sshd_config.d/` holds only `100-macos.conf`. |
| C4 | Not done | Homebrew `uv` and `python@3.10` are installed and nothing depends on them. `python@3.13` is needed by `memo`. `python@3.14` is needed by `gitup`, `hermes-agent`, `nmap`, `openai-whisper`, `platformio` and `yt-dlp`. All four are marked installed on request. `uv` and `python3` already resolve to the mise shims, at 0.13.0 and 3.15.0. |
| C7a | **Partly done** | PhotoSweeper and Blackmagic Disk Speed Test are gone. Clockology and Prime Video were never installed. **PTGui Pro is still there.** |
| C7b | Not done | Still present: ScanSnap Home, the `ScanSnap Online Update` folder with its three helpers and `Sub/AOUUninstaller.app`, the `ABBYY FineReader for ScanSnap` folder, and two launch agents in `/Library/LaunchAgents` (`com.fujitsu.pfu.ScanSnap.AOUMonitor` and `com.ricoh.pfu.SshAutoLaunch`). |
| C7c | Not done | Synology Drive Client, Dropbox, Microsoft OneNote and iTerm are all present. Dropbox and Synology are running, with four launch agents between them. |
| C7d | Not done | The `actual`, `moom` and `jordanbaird-ice@beta` casks are installed. |
| C7e | Not done | `~/Applications/Chrome Apps.localized/Clicker Writer.app` is present. |
| C7f | Not done | `hermes-agent` is installed and nothing depends on it. `ai.hermes.gateway` is loaded and failing with exit 78; its plist is in `~/Library/LaunchAgents`. |
| C7g | Not done | Homebrew's npm still has `@earendil-works/pi-coding-agent@0.80.10`. |
| C7h | Not done | `libtiff` has 21 dependants. `node` has 4: `hermes-agent`, `git-almanac`, `mcporter` and `summarize`. Both are marked installed on request. |
| C7i | Handled by the `adobe-script` run | Lightroom Classic, Photoshop 2023 to 2026 and Creative Cloud are all still in `/Applications`. The `adobe-script` run started at 22:08 and is writing `adobe-remove.sh` and its report. |
| C9 | Not done | `rig doctor`: 2 findings, `port.headroom` (known) and `utm: drifted via mas` (the existing UTM-SOL query). `rig status --unmanaged`: 29 items. |

- **Two steps outside this run's list are done:** C5 and C6. The `google-drive` cask is installed, and Home Assistant 1099568401 is installed from the App Store, with Rig reporting both present. See C56-TICK.
- **C8 is partly done.** DaVinci Resolve is present through `mas`, with no route variant. Keynote, Numbers and Pages show catalogue-only, which A8 deliberately chose, but C8 still says "present". See C8-WORDING.

### Walk-through at `sol`'s screen

Do the steps in this order. `hermes-agent` comes first because Homebrew Python, `libtiff` and `node` all list it as a dependant. Each code block can be pasted into Terminal as it is. If a result differs from **You should see**, stop and tell the thread.

#### Step 0 - Before you start

**Why:** two Rig runs at once can fight over Homebrew, and the App Store has to be signed in for `mas`.

```sh
pgrep -fl 'rig (apply|upgrade)' || echo "no rig run going"
sudo -v
```

**You should see:** `no rig run going`, then a password prompt. `sudo -v` keeps your password cached for a few minutes, which the later steps need.

**If it differs:** if a Rig run is listed, wait for it to finish.

**Undo:** nothing to undo.

#### Step 1 (C1) - Bring chezmoi level

**Why:** it makes sure `sol` runs exactly what the repository says. The aliases are already applied, so two items are left: a formatting-only rewrite of Claude's settings, and the key-only sshd script.

```sh
git -C ~/.local/share/chezmoi pull --ff-only
git -C ~/.local/share/chezmoi status --short
chezmoi status
chezmoi diff ~/.claude/settings.json
```

**You should see:** `Already up to date` or a fast-forward. `status --short` prints nothing. `chezmoi status` lists `.claude/settings.json` and `sshd_key_only.sh`. The diff should change only line breaks or key order, not settings.

**If it differs:** if the pull brings in new commits, or the diff changes a real value, stop and tell the thread.

Then apply only the settings file:

```sh
chezmoi apply ~/.claude/settings.json
```

**The sshd script:** a full `chezmoi apply` runs it. It is connection-critical, so do **not** run a full apply as part of this step. Follow **KEYONLY-APPLY** in the [`ssh-keyonly` run report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-setup/ssh-keyonly.report.md) instead: keep a second SSH login open from terra, and use its tested restore path.

**Tidy-up:** once you are happy that `ssh sol` and `ssh terra` work from the other Mac, delete the leftover backup with `rm ~/.ssh/config.pre-ue088`. It is identical to the live file.

**Undo:** the old `settings.json` formatting is unimportant, but `git -C ~/.local/share/chezmoi log` shows the source if you need it.

#### Step 2 (C7f) - Remove `hermes-agent` and its failing launch agent

**Why:** you chose to remove it. Its gateway fails at every login, and it holds Python, `libtiff` and `node` in place.

```sh
brew uses --installed hermes-agent
launchctl bootout gui/$(id -u)/ai.hermes.gateway
mv ~/Library/LaunchAgents/ai.hermes.gateway.plist ~/.Trash/
brew uninstall hermes-agent
launchctl list | grep hermes || echo "hermes gone"
```

**You should see:** the first command prints nothing, `brew uninstall` reports `Uninstalling /opt/homebrew/Cellar/hermes-agent/...`, and the last command prints `hermes gone`.

**If it differs:** if the first command lists something, stop. If `bootout` says "No such process", carry on, because it was already unloaded.

**Data kept:** `~/.hermes` (logs and a sign-in file) stays. Delete it yourself later if you no longer want it.

**Undo:** `brew install hermes-agent`, use Put Back in the Bin for the plist, then `launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/ai.hermes.gateway.plist`.

#### Step 3 (C4) - Homebrew `uv` and Python

**Why:** mise now provides `uv` and `python` on both Macs. A second Homebrew copy lets `python3` change silently whenever Homebrew relinks.

```sh
which uv python3
brew uses --installed uv python@3.10
brew uninstall uv python@3.10
brew uses --installed python@3.13
brew uses --installed python@3.14
brew tab --no-installed-on-request python@3.13 python@3.14
uv --version && python3 --version
uv tool list
```

**You should see:**

- both `which` paths under `~/.local/share/mise/shims`;
- nothing from the second command;
- `memo` for `python@3.13`, and `gitup nmap openai-whisper platformio yt-dlp` for `python@3.14`, with `hermes-agent` gone;
- `uv 0.13.0` and `Python 3.15.0`;
- `claude-swap` and `headroom-ai` still listed. Both run on `python@3.14`, which stays.

**If it differs:** if the second command lists anything, skip the uninstall and tell the thread. If `uv tool list` fails, run `uv tool install --reinstall claude-swap` (and the same for `headroom-ai`).

**Undo:** `brew install uv python@3.10`; `brew tab --installed-on-request python@3.13 python@3.14`.

#### Step 4 (C7h) - `libtiff` and Homebrew `node`

**Why:** both are only there because other formulae need them. Marking them as dependencies lets Homebrew remove them automatically once nothing needs them.

```sh
brew uses --installed libtiff | wc -l
brew uses --installed node
brew tab --no-installed-on-request libtiff node
```

**You should see:** about 20 for `libtiff`, and `git-almanac`, `mcporter` and `summarize` for `node`.

**If it differs:** if either prints nothing, run `brew uninstall <name>` for it instead of `tab`.

**Undo:** `brew tab --installed-on-request libtiff node`.

#### Step 5 (C7g) - `pi-coding-agent`

**Why:** you chose to remove it. It lives in Homebrew node's global packages, so use Homebrew's `npm`, not the mise one that plain `npm` finds.

```sh
/opt/homebrew/bin/npm uninstall -g @earendil-works/pi-coding-agent
/opt/homebrew/bin/npm ls -g --depth=0 | grep pi- || echo "pi gone"
```

**You should see:** `removed N packages`, then `pi gone`.

**Undo:** `/opt/homebrew/bin/npm install -g @earendil-works/pi-coding-agent`.

#### Step 6 (C7d) - Actual, Moom and Ice

**Why:** you chose to remove them. Moom and Ice change window and menu-bar behaviour, so quitting them first avoids a half-removed app still running.

```sh
osascript -e 'quit app "Moom"' -e 'quit app "Ice"' -e 'quit app "Actual"'
brew uninstall --cask actual moom jordanbaird-ice@beta
```

**You should see:** three `was successfully uninstalled` lines. Menu-bar icons hidden by Ice reappear.

**If it differs:** if `osascript` says an app is not running, carry on.

**Undo:** `brew install --cask actual moom jordanbaird-ice@beta`. Their settings stay in `~/Library`, so they come back as they were.

#### Step 7 (C7a) - PTGui Pro

**Why:** you chose to remove it. It is the only C7a app left.

1. Quit PTGui Pro if it is open.
2. Run:

   ```sh
   mv "/Applications/PTGui Pro.app" ~/.Trash/
   mas list | grep -E '463362050|425264550' || echo "App Store apps already gone"
   ```

**You should see:** no error, then `App Store apps already gone`.

**Undo:** Put Back in the Bin.

#### Step 8 (C7b) - ScanSnap Home and ABBYY FineReader

**Why:** you chose to remove them. Their two system launch agents start at every login.

1. Quit ScanSnap Home if it is open: click the ScanSnap icon in the menu bar, then Quit.
2. Run the vendor's update-helper uninstaller and follow its window:

   ```sh
   open "/Applications/ScanSnap Online Update.localized/Sub/AOUUninstaller.app"
   ```

3. When it has finished:

   ```sh
   mv /Applications/ScanSnapHomeMain.app ~/.Trash/
   mv "/Applications/ABBYY FineReader for ScanSnap" ~/.Trash/
   [ -d "/Applications/ScanSnap Online Update.localized" ] && mv "/Applications/ScanSnap Online Update.localized" ~/.Trash/
   ls /Library/LaunchAgents | grep -iE 'pfu|fujitsu|ricoh' || echo "no ScanSnap agents"
   ```

4. If the last command lists anything, move those agents with your password:

   ```sh
   sudo mv /Library/LaunchAgents/com.fujitsu.pfu.ScanSnap.AOUMonitor.plist /Library/LaunchAgents/com.ricoh.pfu.SshAutoLaunch.plist ~/.Trash/
   ```

**You should see:** no errors. Nothing named ScanSnap, ABBYY or PFU is left in `/Applications` or `/Library/LaunchAgents`.

**If it differs:** if the uninstaller window asks to remove ScanSnap Home too, let it, then skip that `mv` line. If `mv` says "No such file", it is already gone.

**Undo:** Put Back in the Bin (the launch agents go back to `/Library/LaunchAgents` with `sudo mv`), or reinstall ScanSnap Home from Ricoh/PFU's site.

#### Step 9 (C7c) - Synology Drive Client, Dropbox, OneNote and iTerm

**Why:** you chose to remove them. Dropbox and Synology run in the background and sync all the time.

**Check first:** Dropbox files that are online-only are not on this Mac. If you want any of them kept locally, make them available offline in Finder before you start. Synced folders and data stay where they are.

1. Quit Dropbox and Synology Drive from their menu-bar icons, then quit OneNote and iTerm.
2. Run:

   ```sh
   mv "/Applications/Synology Drive Client.app" /Applications/Dropbox.app "/Applications/Microsoft OneNote.app" /Applications/iTerm.app ~/.Trash/
   for p in com.dropbox.DropboxUpdater.wake com.dropbox.dropboxmacupdate.agent com.dropbox.dropboxmacupdate.xpcservice com.synology.SynologyDrive; do
     launchctl bootout gui/$(id -u)/$p 2>/dev/null
     mv ~/Library/LaunchAgents/$p.plist ~/.Trash/
   done
   launchctl list | grep -iE 'dropbox|synology' || echo "sync agents gone"
   ```

**You should see:** `sync agents gone`. If macOS asks about removing the Dropbox File Provider, allow it.

**If it differs:** if a Dropbox line remains, log out and back in, then check again.

**Undo:** Put Back in the Bin, then open the app; it reinstalls its own agents.

#### Step 10 (C7e) - Clicker Writer

**Why:** you chose to remove it. It is a Chrome app, so Chrome removes it.

1. In Chrome, go to `chrome://apps`.
2. Right-click Clicker Writer, choose **Remove from Chrome**, then confirm.
3. Check:

   ```sh
   ls ~/Applications/"Chrome Apps.localized" | grep -i clicker || echo "Clicker Writer gone"
   ```

**You should see:** `Clicker Writer gone`.

**If it differs:** if it is not on `chrome://apps`, it belongs to another Chrome profile. Switch profile and repeat, or move the `.app` to the Bin.

**Undo:** reinstall it from the Chrome Web Store.

#### Step 11 (C7i) - Adobe

Follow the `adobe-script` run's report, `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-bootstrap/adobe-script.report.md`, and its script `adobe-remove.sh` beside it. Both are being written now. That report supersedes the Adobe steps in the `adobe-sweep` and `sol-remove` reports.

#### Step 12 (C9) - Final check

**Why:** it confirms `sol` now matches what Rig declares.

```sh
cd /tmp
rig doctor 2>/dev/null | grep -E '^Checks|findings|^  [a-z.]+: (drifted|conflicting|missing)'
rig status --unmanaged 2>/dev/null | sed -n '/^IDENTITY/,/^Unmanaged:/p'
chezmoi status
```

**You should see:**

- `rig doctor`: `fail=2` while UTM-SOL is open (`port.headroom`, then `utm: drifted via mas`), or `fail=1` once UTM-SOL is done. There is no "missing via" route variant.
- `rig status --unmanaged`: Safari; Google Docs, Sheets and Slides; Claude Code URL Handler; and `cask:utm` until UTM-SOL is done. `python@3.13`, `python@3.14`, `libtiff` and `node` should drop off once they are dependencies only.
- `chezmoi status`: nothing, or only `sshd_key_only.sh` if KEYONLY-APPLY is still to come.

**If it differs:** send the output to the thread. Then tell the thread "UE-086 C done at sol" and an agent will tick the steps.

## In Progress

- **Running elsewhere:** the `adobe-script` run, started at 22:08, owns C7i. Nothing from this run is running.
- **Outstanding - no action requested now:**
  - KEYONLY-APPLY (`ssh-keyonly` report) and UTM-SOL (`apps-resume` report) are existing open queries that touch C1 and C9. They are not raised again here.
  - The Verify section's zero-findings goal also needs `port.headroom` settled, and that is outside this record.

## Queries

### C56-TICK - Tick C5 and C6 in the record

**Context:** this run was asked to tick only the steps it walked. C5 (Google Drive through the `google-drive` cask) and C6 (Home Assistant from the App Store, 1099568401) are verified done on `sol`, with Rig reporting both present, but they are still unticked in [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md).

**Query:** may an agent tick them?

**Options:** a) (recommended) an agent ticks C5 and C6 with today's evidence and commits only the record, locally; b) leave them until the full C9 check.

### C8-WORDING - C8 still expects Keynote, Numbers and Pages "present"

**Context:** step A8 deliberately left Keynote, Numbers and Pages catalogue-only, because `mas info` cannot resolve their App Store numbers. Rig therefore shows them as catalogue-only, never as present, so C8 as written can never pass. DaVinci Resolve is present through `mas`, with no route variant.

**Query:** should C8 be reworded to match A8?

**Options:** a) (recommended) an agent rewords C8 to expect Keynote, Numbers and Pages as catalogue-only and DaVinci Resolve as present, keeps the Adobe check that follows C7i, and commits only the record, locally; b) leave C8 as written and judge it by hand at C9.

```text
C56-TICK - a) an agent ticks C5 and C6 in KB-DOTFILES-UE-086 with the 15 October evidence (google-drive cask installed, Home Assistant 1099568401 from the App Store, Rig reports both present) and commits only the record, locally
C8-WORDING - a) an agent rewords C8 in KB-DOTFILES-UE-086 to expect Keynote, Numbers and Pages as catalogue-only and DaVinci Resolve present via mas, keeps the post-C7i Adobe check, and commits only the record, locally
```

```text
╭─ run report · 2026-10-15T21:22:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing changed         │
│  █  █ █▄▄▄ ▄▄▄█   █    · 2 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] ue086-walk finished; nothing running from this run
- [running elsewhere] adobe-script (C7i)
- [waiting on Kris] KB-DOTFILES-UE-086 steps 0 to 12 above, at sol's screen; KEYONLY-APPLY; UTM-SOL
- [queries] C56-TICK, C8-WORDING
- [uncommitted] this report

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
