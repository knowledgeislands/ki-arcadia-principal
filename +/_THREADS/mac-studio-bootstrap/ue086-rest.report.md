# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) › ue086-rest

**Run report at 02:06 BST · last mark 17:47 BST**

---

## Done

Read-only run on `sol`. Nothing was changed, installed, removed, applied or committed.

### SOL-TELEGRAM-DIRECTION a) is verified

When this run started, at 01:53 BST, the switch was still under way. The Homebrew cask was gone and `mas get 747648890` was running. Checked again at 01:57 BST:

- `brew list --cask` no longer includes `telegram`.
- `/Applications/Telegram.app` (13.0, installed at 01:56) has an App Store receipt, and `mas list` shows `747648890 Telegram (13.0)`.
- `rig status` shows `telegram homebrew present`. Tools: present 166, missing 0, drifted 0.
- `rig doctor` reports 1 finding (pass 240, fail 1, skipped 20). The finding is `port.headroom` "conflicting (owner Python, expected headroom-ai)". That is the known result of starting Headroom by hand and is outside KB-DOTFILES-UE-086. The eight old cargo apply failures no longer appear.
- `rig apply --dry-run`: planned 232, failed 0, skipped 20 (catalogue-only).

**What still differs from the declaration.** Only the Headroom port. A full `rig apply` should no longer end with status 1 because of Telegram. The checkpoint's SOL-CLT line still describes Telegram the wrong way round (it says to install the Homebrew cask), so the thread should correct it at its next mark.

### Section C on `sol`: what is already done

[KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md), checked at 01:55-02:05 BST:

| Step | State on `sol` | Evidence |
| --- | --- | --- |
| C1 | Not done | The chezmoi checkout is clean and level with its last-fetched `origin/main` (`f2971fc`; no fetch was made). `chezmoi status` shows one pending file, `~/.ssh/config`: the `Host sol` alias from [KB-DOTFILES-UE-088](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-088-ssh-alias-for-sol.md), whose own apply step is Kris's. The `rust-order` run may add a second file (`15-command-line.toml`). |
| C4 | Not done | `uv` and `python@3.10` have no dependants. `python@3.13` is needed by `memo`. `python@3.14` is needed by `gitup`, `hermes-agent`, `nmap`, `openai-whisper`, `platformio` and `yt-dlp`. All four are marked installed on request. `claude-swap` and `headroom-ai` run on `python@3.14`, which is kept. No launch agent uses Homebrew `uv` or `python@3.10`. |
| C5 | **Done** | The `google-drive` cask (132.0.0) is installed and Rig shows `google-drive` present |
| C6 | **Done** | Home Assistant has an App Store receipt, `mas list` shows 1099568401, and Rig shows it present |
| C7a | Partly left | Clockology and Prime Video are not installed. Still present: PhotoSweeper (App Store 463362050), Blackmagic Disk Speed Test (App Store 425264550) and PTGui Pro (installed directly) |
| C7b | Not done | Still present: `ScanSnapHomeMain.app`, the `ScanSnap Online Update` folder (three helpers and `Sub/AOUUninstaller.app`) and the `ABBYY FineReader for ScanSnap` folder. Two launch agents remain: `/Library/LaunchAgents/com.fujitsu.pfu.ScanSnap.AOUMonitor.plist` and `com.ricoh.pfu.SshAutoLaunch.plist` |
| C7c | Not done | Synology Drive Client, Dropbox (running), Microsoft OneNote and iTerm are present. Dropbox and Synology launch agents are in `~/Library/LaunchAgents` |
| C7d | Not done | The `actual`, `moom` and `jordanbaird-ice@beta` casks are installed |
| C7e | Not done | `~/Applications/Chrome Apps.localized/Clicker Writer.app` is present |
| C7f | Not done | The `hermes-agent` formula has no dependants. `ai.hermes.gateway` is loaded from `~/Library/LaunchAgents/ai.hermes.gateway.plist`, failing with exit 78 |
| C7g | Not done | `@earendil-works/pi-coding-agent` 0.80.10 is in **Homebrew** node's global packages (`/opt/homebrew/bin/npm`), not mise's. Plain `npm` on `sol` resolves to mise's node, which does not have it |
| C7h | Not done | `libtiff` has 20 dependants and `node` has 4 (`hermes-agent`, `git-almanac`, `mcporter`, `summarize`), so both are kept as dependencies only, even after C7f |
| C7i | Not done | `Adobe Photoshop 2023`, `2024`, `2025` and `2026` are all in `/Applications` |
| C8 | Blocked | DaVinci Resolve is present. Photoshop and Creative Cloud show as catalogue-only, because they are declared artefact-only. Keynote, Numbers and Pages are also catalogue-only and have no App Store route yet (step A8 is open). See query KEYNOTE-ROUTE |
| C9 | Not done | `rig status --unmanaged` lists 30 items. The ones expected to stay are Safari, Google Docs, Sheets and Slides, and Claude Code URL Handler |

### Instructions for Kris at `sol`'s screen

These steps cover only what is left. They are in order: `hermes-agent` comes before C4 and C7h because it is a dependant of `python@3.14` and `node`. Each block can be pasted into Terminal as it stands. Lines starting with `#` are notes. Take the steps one at a time, and stop and tell the thread if anything differs from **Expect**.

**Step 0 - Before you start.**

What it does: makes sure no other Rig run is going and that the App Store is signed in.

```sh
pgrep -fl 'rig (apply|upgrade)' || echo "no rig run going"
mas account 2>/dev/null || echo "open the App Store and sign in"
```

Expect: `no rig run going`. If a run is listed, wait for it to finish (the 08:30 `rig-update` job is one example). Leave this Terminal window open for every step below.

**Step 1 (C1) - Bring chezmoi level and apply what is pending.**

What it does: pulls the latest source, shows what would change, and applies it. The `~/.ssh/config` change is the `Host sol` alias. It is connection-critical, so it gets a backup first, following the restore path in KB-DOTFILES-UE-088. Doing this also completes UE-088's apply on `sol`.

```sh
git -C ~/.local/share/chezmoi pull --ff-only
git -C ~/.local/share/chezmoi status --short
rig doctor 2>/dev/null | grep -E '^Summary|^  port\.'
chezmoi status
chezmoi diff
```

Expect:

- The pull ends with "Already up to date" or a fast-forward.
- `status --short` prints nothing, or only ` M dot_gitconfig`. Leave that file alone.
- `rig doctor` prints `Summary: findings=1` and the `port.headroom` line.
- `chezmoi status` lists `~/.ssh/config`. If the `rust-order` run has committed by then, it also lists `~/.config/rig/conf.d/15-command-line.toml`.
- `chezmoi diff` shows only the `Host sol 100.90.130.74` block and, if present, `requires` gaining `"rust"` on the eight cargo tools. If anything else appears, stop.

Then apply the SSH change with a backup:

```sh
cp -p ~/.ssh/config ~/.ssh/config.pre-ue088
chezmoi apply ~/.ssh/config
ssh -G sol | grep -E '^(hostname|user|forwardagent) '
ssh -T git@github.com
```

Expect: `hostname 100.90.130.74`, `user krisbrown`, `forwardagent yes`, then GitHub's "successfully authenticated" message. Undo: `cp -p ~/.ssh/config.pre-ue088 ~/.ssh/config`. Once both checks pass, delete the backup with `rm ~/.ssh/config.pre-ue088`.

If `15-command-line.toml` was listed:

```sh
chezmoi apply ~/.config/rig/conf.d/15-command-line.toml
rig apply --dry-run --scope tools 2>/dev/null | tail -1
```

Expect: `Summary: ... failed=0`. Undo: `git -C ~/.local/share/chezmoi revert <that commit>`, then apply the file again.

**Step 2 (C7f) - Remove `hermes-agent` and its launch agent.**

What it does: stops the failing gateway, removes the formula and moves its launch-agent file to the Bin. Do this before steps 3 and 4.

```sh
brew uses --installed hermes-agent
launchctl bootout gui/$(id -u)/ai.hermes.gateway
mv ~/Library/LaunchAgents/ai.hermes.gateway.plist ~/.Trash/
brew uninstall hermes-agent
launchctl list | grep hermes || echo "hermes gone"
```

Expect: the first command prints nothing; the last prints `hermes gone`. `~/.hermes` (logs and a sign-in file) stays where it is. Delete that folder yourself later if you no longer want it. Undo: `brew install hermes-agent`, put the plist back from the Bin, then `launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/ai.hermes.gateway.plist`.

**Step 3 (C4) - Homebrew `uv` and Python.**

What it does: removes Homebrew `uv` and `python@3.10`, because mise now provides `uv` and `python`. It keeps `python@3.13` and `python@3.14` as dependencies only. `claude-swap` and Headroom run on `python@3.14`, so they are not affected.

```sh
which uv python3
brew uses --installed uv python@3.10
brew uninstall uv python@3.10
brew uses --installed python@3.13
brew uses --installed python@3.14
brew tab --no-installed-on-request python@3.13 python@3.14
uv --version && python3 --version
```

Expect:

- Both `which` paths are under `~/.local/share/mise/shims`.
- The second command prints nothing.
- `python@3.13` lists `memo`, and `python@3.14` lists `gitup`, `nmap`, `openai-whisper`, `platformio` and `yt-dlp`.
- The versions are `uv 0.13.0` and `Python 3.15.0`.

If the second command lists anything, do not run the uninstall; tell the thread. Undo: `brew install uv python@3.10`, and `brew tab --installed-on-request python@3.13 python@3.14`.

**Step 4 (C7h) - `libtiff` and Homebrew `node`.**

What it does: both still have dependants, so they are marked as dependencies only and nothing is removed.

```sh
brew uses --installed libtiff | wc -l
brew uses --installed node
brew tab --no-installed-on-request libtiff node
```

Expect: about 19 for `libtiff`, and `git-almanac`, `mcporter` and `summarize` for `node`. If either prints nothing, run `brew uninstall <name>` instead. Undo: `brew tab --installed-on-request libtiff node`.

**Step 5 (C7g) - `pi-coding-agent`.**

What it does: removes the npm package from Homebrew node's global packages. It has to be Homebrew's `npm`, not the one plain `npm` finds.

```sh
/opt/homebrew/bin/npm uninstall -g @earendil-works/pi-coding-agent
/opt/homebrew/bin/npm ls -g --depth=0 | grep pi- || echo "pi gone"
```

Expect: `pi gone`. Undo: `/opt/homebrew/bin/npm install -g @earendil-works/pi-coding-agent`.

**Step 6 (C7d) - Actual, Moom and Ice.**

What it does: quits the three apps, then uninstalls their casks.

```sh
osascript -e 'quit app "Moom"' -e 'quit app "Ice"' -e 'quit app "Actual"'
brew uninstall --cask actual moom jordanbaird-ice@beta
```

Expect: three "was successfully uninstalled" lines. Undo: `brew install --cask actual moom jordanbaird-ice@beta`.

**Step 7 (C7a) - PhotoSweeper, Blackmagic Disk Speed Test and PTGui Pro.**

What it does: removes the two App Store apps with `mas` (it asks for your Mac password) and moves PTGui Pro to the Bin.

```sh
sudo mas uninstall 463362050
sudo mas uninstall 425264550
mv "/Applications/PTGui Pro.app" ~/.Trash/
mas list | grep -E '463362050|425264550' || echo "both gone"
```

Expect: `both gone`. Undo: `mas get 463362050` or `mas get 425264550`, or reinstall from the App Store's Purchased list. For PTGui, use Finder's Put Back in the Bin.

**Step 8 (C7b) - ScanSnap Home and ABBYY FineReader.**

What it does: runs ScanSnap's own update-helper uninstaller, then moves the rest to the Bin.

1. Quit ScanSnap Home if it is open: menu bar, ScanSnap icon, Quit.
2. Run the helper uninstaller, then follow its window:

   ```sh
   open "/Applications/ScanSnap Online Update.localized/Sub/AOUUninstaller.app"
   ```

3. When it has finished:

   ```sh
   mv /Applications/ScanSnapHomeMain.app ~/.Trash/
   mv "/Applications/ABBYY FineReader for ScanSnap" ~/.Trash/
   [ -d "/Applications/ScanSnap Online Update.localized" ] && mv "/Applications/ScanSnap Online Update.localized" ~/.Trash/
   ls /Library/LaunchAgents | grep -i pfu
   ```

4. If the last command still lists `com.fujitsu.pfu.ScanSnap.AOUMonitor.plist` or `com.ricoh.pfu.SshAutoLaunch.plist`, move them with your Mac password:

   ```sh
   sudo mv /Library/LaunchAgents/com.fujitsu.pfu.ScanSnap.AOUMonitor.plist /Library/LaunchAgents/com.ricoh.pfu.SshAutoLaunch.plist ~/.Trash/
   ```

Expect: nothing left in `/Applications` or `/Library/LaunchAgents` with ScanSnap, ABBYY or PFU in its name. The two launch agents stop at the next login. Undo: Put Back from the Bin, or reinstall ScanSnap Home from Ricoh/PFU's site.

**Step 9 (C7c) - Synology Drive Client, Dropbox, OneNote and iTerm.**

What it does: quits each app and moves it to the Bin. Your synced folders and data stay where they are. **Check first:** files Dropbox keeps online-only are not on this Mac. If you want any of them locally, make them available offline in Finder before you start.

1. Quit Dropbox and Synology Drive from their menu-bar icons (Quit), and quit OneNote and iTerm.
2. Then:

   ```sh
   mv "/Applications/Synology Drive Client.app" /Applications/Dropbox.app "/Applications/Microsoft OneNote.app" /Applications/iTerm.app ~/.Trash/
   mv ~/Library/LaunchAgents/com.dropbox.DropboxUpdater.wake.plist ~/Library/LaunchAgents/com.dropbox.dropboxmacupdate.agent.plist ~/Library/LaunchAgents/com.dropbox.dropboxmacupdate.xpcservice.plist ~/Library/LaunchAgents/com.synology.SynologyDrive.plist ~/.Trash/
   ```

Expect: no errors. If macOS asks about removing the Dropbox File Provider, allow it. Undo: Put Back from the Bin, then open the app.

**Step 10 (C7e) - Clicker Writer.**

What it does: removes the Chrome app.

1. In Chrome, open `chrome://apps`.
2. Right-click Clicker Writer and choose Remove from Chrome.

Expect: `~/Applications/Chrome Apps.localized/Clicker Writer.app` disappears. Undo: reinstall it from the Chrome Web Store.

**Step 11 (C7i) - Old Photoshop versions.**

What it does: removes Photoshop 2023, 2024 and 2025 through Creative Cloud, keeping 2026 and Creative Cloud itself.

1. Open Creative Cloud and go to Apps, then Installed.
2. On Photoshop, open the `⋯` menu and choose Other versions or Manage. Uninstall 2023, then 2024, then 2025.
3. Keep preferences if it asks.

Expect: `ls /Applications | grep Photoshop` shows only `Adobe Photoshop 2026`. Undo: install the older version again from the same menu.

**Step 12 (C5, C6) - Nothing to do.** Google Drive and Home Assistant are already on their declared routes.

**Step 13 (C8) - Wait.** This step needs the answer to KEYNOTE-ROUTE below and the A8 source change. For now, DaVinci Resolve is present. Photoshop and Creative Cloud show as catalogue-only, which is how artefact-only entries show.

**Step 14 (C9) - Final check.** You can run this yourself, or tell the thread and an agent will run it.

```sh
rig doctor 2>/dev/null | grep -E '^Summary|^  port\.'
rig status --unmanaged 2>/dev/null | sed -n '/^IDENTITY/,/^Unmanaged:/p'
chezmoi status
```

Expect:

- `rig doctor` reports `findings=1`, the Headroom port.
- `rig status --unmanaged` lists only `python@3.13`, `python@3.14`, `libtiff` and `node` (now dependencies, so they may drop off the list), Safari, Google Docs, Google Sheets, Google Slides and Claude Code URL Handler.
- `chezmoi status` prints nothing.

Then tell the thread "UE-086 C done at sol". An agent will tick the steps in the record.

## In Progress

Nothing from this run. Two other runs were going while it worked: `rust-order` (chezmoi, may add the `15-command-line.toml` change that step 1 applies) and `upgrade-lock` (tools-rig).

## Queries

### KEYNOTE-ROUTE - App Store route for Keynote, Numbers and Pages

**Context.** In the 14 October amendment Kris decided to declare Keynote, Numbers and Pages in `core` from the App Store, as GarageBand and iMovie are. Step A8 found them already in `core` as catalogue-only and left their App Store route open for Kris, so A8 and C8 are open. On `sol` they are App Store installs: Keynote 409183694, Numbers 409203825, Pages 409201541. C8 also expects Photoshop and Creative Cloud to be "present", but artefact-only entries show as catalogue-only.

**Query.** Should the three Apple apps get their App Store route now?

**Options.** a) (recommended) An agent on `sol` gives `tool.keynote`, `tool.numbers` and `tool.pages` in `private_10-applications.toml` the App Store route (`install.provider = "homebrew"`, `install.kind = "mas"`, locators 409183694, 409203825 and 409201541), rewords C8 to expect Photoshop and Creative Cloud as catalogue-only, runs the gate and commits locally; Kris then applies `~/.config/rig/conf.d/10-applications.toml` and an agent checks C8. b) Keep them catalogue-only and close A8 and C8 as they stand. c) Leave A8 and C8 open.

```text
KEYNOTE-ROUTE - a) an agent on sol gives tool.keynote, tool.numbers and tool.pages in private_10-applications.toml the App Store route (install.provider = "homebrew", install.kind = "mas", locators 409183694, 409203825 and 409201541), rewords C8 to expect Photoshop and Creative Cloud as catalogue-only, runs the gate and commits locally; Kris then applies ~/.config/rig/conf.d/10-applications.toml and an agent checks C8
```

```text
╭─ run report · 2026-10-15T01:06:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · Telegram verified       │
│  █  █ █▄▄▄ ▄▄▄█   █    · 1 query                 │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] ue086-rest finished; nothing running from this run
- [waiting on Kris] KB-DOTFILES-UE-086 section C steps 0-11 and 14 at sol's screen
- [queries] KEYNOTE-ROUTE
- [running elsewhere] rust-order, upgrade-lock
- [uncommitted] this report (state folder and thread folder)

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
