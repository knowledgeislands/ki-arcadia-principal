# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) › adobe-sweep

**Run report at 10:48 BST · last mark 17:47 BST**

---

## Done

- **Lightroom Classic is out of Rig, so no Adobe app is declared any more.** Committed in chezmoi as `9f70bea` (local only, not pushed). Lightroom Classic is now a retired declaration beside Photoshop and Creative Cloud, its `sol` Dock item is gone, and `studio` now holds only DaVinci Resolve, with the profile's purpose reworded to "video tools". It had no file-handler reference. The catalogue test now expects only DaVinci Resolve in `studio`. Authority: Kris, ADOBE-OUT ("Lighthouse Classic can go too", read as Lightroom Classic).
- **[KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md)**: C7i now reads "remove all Adobe apps on both Macs, Creative Cloud last" and points at this report. C8 no longer expects any Adobe app. The amendment table and the removal list name Lightroom Classic too.
- **[KB-DOTFILES-UE-091](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-091-shared-dock-tool-links.md)** (draft) planned to add a Lightroom Dock item. That is dropped, so a later run does not put it back.
- **Checks.** `rumdl check .` is clean. `node --test tests/*.test.mjs` gives 239 pass and 2 fail, the two known failures (`ki-self-skill` and `scheduled-emerge-session`). `ki repo audit --repo .` still has its one known failure, the missing `.claude/skills/ki-self` projection. Against config copies, `rig doctor` has 2 findings both before and after this change. Neither is new:
  - `utm: drifted via mas` waits on UTM-SOL from the apps-resume report.
  - `port.headroom` is held by a Python process. I left it alone because the Headroom proxy is connection-critical.
  - Doctor also warns that `tool.actions` uses a deprecated App Store alias. The migrate-mas run covers that.
- `rig apply --dry-run` plans nothing for Adobe or Lightroom. `rig status --retired` lists 3 retired apps (Photoshop, Lightroom Classic and Creative Cloud), all still `matched` on sol.
- **Coordination.** migrate-mas was waiting for this run to finish, so waiting for it as well would have deadlocked both runs. It had not touched chezmoi, so I committed. hostkey-check is still queued and was not running. The working tree is clean and no Git lock files are left. The temporary config copies are deleted.

## In Progress

Nothing is running from this run. migrate-mas can now go ahead.

## Queries

**ADOBE-SOL**

**Context:** sol has Lightroom Classic and Photoshop 2023 to 2026. Creative Cloud's uninstaller refuses to run while any app it installed is still there, so the apps come off first. These steps choose **Keep** for preferences, so no user data is deleted until ADOBE-DATA is answered. Removing the apps does not touch the Lightroom catalogue or the photos.

**Query:** Will Kris remove Adobe from sol at its screen?

**Options:** a) (recommended) yes, in this order:

1. Quit Lightroom Classic and every Photoshop. Open Creative Cloud from its menu-bar icon, then choose **Apps** › **Installed**.
   Expect: Lightroom Classic, and Photoshop with the older versions under its version menu.
2. On Lightroom Classic, open **⋯**, choose **Uninstall**, then **Keep**.
   Expect: Lightroom Classic leaves the list.
3. For each Photoshop, in the order 2026, 2025, 2024, 2023: open **⋯**, choose **Uninstall**, then **Keep**.
   Expect: no Photoshop left, and no installed apps left in the list.
4. In Terminal, run: `ls -d "/Applications/Adobe Lightroom Classic" /Applications/Adobe\ Photoshop* 2>&1`
   Expect: only `No such file or directory` lines (zsh may print `no matches found` instead). If anything is listed, go back to step 2 or 3.
5. Quit Creative Cloud from its menu-bar icon (**⋯** › **Quit**). Open `/Applications/Utilities/Adobe Creative Cloud/Utils/Creative Cloud Uninstaller.app`, choose **Uninstall**, and give the administrator password when asked.
   Expect: "Creative Cloud desktop app uninstalled". If it says apps are still installed, go back to step 1.
6. In Terminal, run: `ls -d /Applications/Adobe* /Applications/Utilities/Adobe* 2>&1; ls /Library/LaunchAgents /Library/LaunchDaemons ~/Library/LaunchAgents /Library/PrivilegedHelperTools | grep -i adobe; launchctl list | grep -i adobe; pgrep -il adobe`
   Expect: no output, or only `No such file or directory` or `no matches found`. Before this run sol had four system launch agents, two launch daemons, two user launch agents and the `com.adobe.acc.installer.v2` helper. Send any line that is still there to the thread, and do not delete it by hand.
7. In Terminal, run: `find /Library ~/Library -maxdepth 3 -iname '*adobe*' -prune -exec du -sh {} + 2>/dev/null; find ~/Pictures -maxdepth 4 -name '*.lrcat' 2>/dev/null`
   Expect: a list of the Adobe folders left with their sizes (for example `~/Library/Caches/Adobe Camera Raw 2`, about 19 GB), then the path of each Lightroom catalogue. Send the list to the thread and delete nothing yet (ADOBE-DATA).
8. Restart sol when convenient, then repeat step 6.
   Expect: still no output.

b) Hold sol and do terra only.

**ADOBE-TERRA**

**Context:** terra has no Adobe apps, only Creative Cloud itself, with one launch daemon, one user launch agent and the installer helper.

**Query:** Will Kris remove Creative Cloud from terra at its screen?

**Options:** a) (recommended) yes, in this order:

1. Quit Creative Cloud from its menu-bar icon (**⋯** › **Quit**) if it is running. Open `/Applications/Utilities/Adobe Creative Cloud/Utils/Creative Cloud Uninstaller.app`, choose **Uninstall**, and give the administrator password when asked.
   Expect: "Creative Cloud desktop app uninstalled".
2. In Terminal, run: `ls -d /Applications/Adobe* /Applications/Utilities/Adobe* 2>&1; ls /Library/LaunchAgents /Library/LaunchDaemons ~/Library/LaunchAgents /Library/PrivilegedHelperTools | grep -i adobe; launchctl list | grep -i adobe; pgrep -il adobe`
   Expect: no output, or only `No such file or directory` or `no matches found`. Send anything still listed to the thread.
3. In Terminal, run: `find /Library ~/Library -maxdepth 3 -iname '*adobe*' -prune -exec du -sh {} + 2>/dev/null`
   Expect: the Adobe folders left with their sizes (before this run, `/Library/Application Support/Adobe` was 1.6 GB and the logs 254 MB). Send the list to the thread and delete nothing yet.
4. Restart terra when convenient, then repeat step 2.
   Expect: still no output.

b) Leave terra until it is next at hand.

**ADOBE-DATA**

**Context:** The uninstallers leave caches, logs, preferences and presets behind. The Lightroom catalogue and photos are Kris's own data. Lightroom presets and Photoshop settings may be worth keeping even with no Adobe app installed.

**Query:** What happens to the Adobe data left after ADOBE-SOL step 7 and ADOBE-TERRA step 3?

**Options:** a) (recommended) once Kris has sent both size lists, an agent proposes a per-folder list for Kris to approve at each screen: delete caches, logs and empty support folders, and keep every Lightroom catalogue, the presets and the Photoshop settings; b) delete nothing now and look again later; c) Kris decides folder by folder from the lists.

**MAS-REMOVE**

**Context:** `mas uninstall` needs `sudo`, which asks for sol's password, so an agent cannot run it. Neither app is on terra.

**Query:** Will Kris remove PhotoSweeper and Blackmagic Disk Speed Test on sol?

**Options:** a) (recommended) yes, in Terminal on sol:

1. Run: `sudo mas uninstall 463362050`
   Expect: a password prompt, then no error. PhotoSweeper goes to the Bin.
2. Run: `sudo mas uninstall 425264550`
   Expect: no error. Blackmagic Disk Speed Test goes to the Bin.
3. Run: `mas list | grep -E '463362050|425264550'`
   Expect: no output.

b) drag both apps from `/Applications` to the Bin in Finder, then do step 3.

**APPLY-STEPS**

**Context:** chezmoi `main` on sol is now 2 commits ahead (`219607f`, `9f70bea`). This replaces the APPLY-STEPS query in the apps-resume report.

**Query:** Apply both commits on both Macs?

**Options:** a) (recommended) yes:

1. At sol, run: `chezmoi diff ~/.config/rig/conf.d/`
   Expect: Photoshop, Lightroom Classic and Creative Cloud become `retired-application` tables, the Lightroom Dock item goes, UTM moves to App Store 1538878817, and the `studio` purpose reads "video tools".
2. At sol, run: `chezmoi apply ~/.config/rig/conf.d/ && rig doctor; rig status --retired`
   Expect: once UTM-SOL is done, the only finding is `port.headroom`. The 3 Adobe entries show `matched` until ADOBE-SOL is done.
3. At sol, run: `git -C ~/.local/share/chezmoi push`
   Expect: `main -> main`.
4. At terra, run: `chezmoi update && rig doctor && rig status --retired`
   Expect: no Adobe or UTM findings. The retired report shows only what Creative Cloud leaves behind, until ADOBE-TERRA is done.

b) Hold until the at-screen removals are done.

```text
ADOBE-SOL - a) at sol: in Creative Cloud › Apps › Installed, uninstall Lightroom Classic then Photoshop 2026, 2025, 2024, 2023, each with Keep; check with ls; quit Creative Cloud and run Utils/Creative Cloud Uninstaller.app; run the leftover check (launch agents, daemons, helper, processes) and the find/du size list plus the .lrcat list; send both to the thread and delete nothing; restart and repeat the leftover check
ADOBE-TERRA - a) at terra: quit Creative Cloud, run Utils/Creative Cloud Uninstaller.app; run the leftover check and the find/du size list; send both to the thread and delete nothing; restart and repeat the leftover check
ADOBE-DATA - a) once both size lists are in, an agent proposes a per-folder list for Kris to approve: delete caches, logs and empty support folders; keep every Lightroom catalogue, the presets and the Photoshop settings
MAS-REMOVE - a) at sol in Terminal: sudo mas uninstall 463362050; sudo mas uninstall 425264550; then mas list | grep -E '463362050|425264550' and expect no output
APPLY-STEPS - a) at sol: chezmoi diff ~/.config/rig/conf.d/; chezmoi apply ~/.config/rig/conf.d/ && rig doctor; rig status --retired; git -C ~/.local/share/chezmoi push; then at terra: chezmoi update && rig doctor && rig status --retired
```

```text
╭─ run report · 2026-10-15T09:48:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · 9f70bea local           │
│  █  █ █▄▄▄ ▄▄▄█   █    · 5 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] adobe-sweep finished; nothing running from this run
- [waiting on Kris] ADOBE-SOL and MAS-REMOVE at sol's screen; ADOBE-TERRA at terra's screen; then ADOBE-DATA
- [queries] ADOBE-SOL, ADOBE-TERRA, ADOBE-DATA, MAS-REMOVE, APPLY-STEPS
- [unblocked] migrate-mas was waiting on this run and can go ahead
- [unpushed] chezmoi `main` on sol is 2 commits ahead (`219607f`, `9f70bea`)

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
