# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) › sol-remove

**Run report at 02:39 BST · last mark 17:47 BST**

---

## Done

- **MAS-UNDECLARED: the two App Store apps could not be removed without Kris's password.** On sol, `mas uninstall 463362050` (PhotoSweeper 5.5.5) and `mas uninstall 425264550` (Blackmagic Disk Speed Test 3.4.3) both stopped because `mas` calls `sudo`, which needs a password. `sudo -n mas uninstall` failed the same way for both. Nothing was removed, and no password was asked for. `mas list` and `/Applications` still show both apps on sol. Kris's command is SOL-MAS-REMOVE below. Authority: Kris, 2026-10-15, MAS-UNDECLARED ("can you do that now, not wait").
- **terra has neither app.** `mas list` on terra shows neither ID, and `/Applications` holds neither app. This was checked read-only over SSH.
- **Adobe inventory, read-only on both Macs.** Nothing was uninstalled, stopped or moved.

| Item | sol | terra |
| --- | --- | --- |
| Photoshop | 2023 (24.7.5), 2024 (25.12.4), 2025 (26.11.4), 2026 (27.11.0), each in `/Applications/Adobe Photoshop <year>/` | none |
| Other Creative Cloud apps | **Lightroom Classic** (`/Applications/Adobe Lightroom Classic`, uninstall record LTRM 15.6) | none |
| Creative Cloud desktop | `/Applications/Adobe Creative Cloud`, `/Applications/Utilities/Adobe Creative Cloud` (holds `Utils/Creative Cloud Uninstaller.app`), running at login | same paths and uninstaller; its context-menu and Finder extensions are running |
| Other Adobe utilities | `Utilities/`: Adobe Application Manager, Creative Cloud Experience, Genuine Service, Installers, Sync | `Utilities/`: Adobe Application Manager, Creative Cloud Experience, Installers, Sync (no Genuine Service) |
| Launch agents, system (`/Library/LaunchAgents`) | `com.adobe.AdobeCreativeCloud`, `com.adobe.AdobeDesktopService`, `com.adobe.GC.Invoker-1.0`, `com.adobe.ccxprocess` | none |
| Launch daemons | `com.adobe.acc.installer.v2`, `com.adobe.agsservice` | `com.adobe.acc.installer.v2` |
| User launch agents (`~/Library/LaunchAgents`) | `com.adobe.GC.Invoker-1.0`, `com.adobe.ccxprocess` | `com.adobe.ccxprocess` |
| Privileged helper | `/Library/PrivilegedHelperTools/com.adobe.acc.installer.v2` | same |
| Shared support | `/Library/Application Support/Adobe` (Photoshop 2023 to 2026, Lightroom Classic NGL, Camera Raw, CEP, UXP, Plug-Ins and others) | `/Library/Application Support/Adobe` (1.6 GB, with no app folders) |
| User data | Photoshop 2023 to 2026 settings (about 24 MB each); `~/Library/Caches/Adobe Camera Raw 2` **19 GB**; `~/Library/Caches/Adobe` 639 MB; `~/Library/Logs/CreativeCloud` 958 MB; Containers and Group Containers for Adobe | `~/Library/Application Support/Adobe` 49 MB; logs 254 MB; Containers and Group Containers for Adobe |
| Homebrew or pkgutil records | none | none |

- **This supersedes KB-DOTFILES-UE-086 step C7i.** C7i in [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) removed only Photoshop 2023 to 2025 and kept Photoshop 2026 and Creative Cloud. Kris now wants every Photoshop and Creative Cloud off both Macs (KEYNOTE-ROUTE, 2026-10-15). The steps below replace C7i, and C8 no longer expects Photoshop or Creative Cloud. **For rig-apps:** retire `tool.adobe-photoshop` and `tool.adobe-creative-cloud` and reword C7i and C8 to point at this report. Rig also declares `tool.adobe-lightroom-classic` (`studio`), and its rationale says Creative Cloud installs and updates it. Lightroom Classic also sits in the `sol` Dock (`dock-item.lightroom-classic`) and in KB-DOTFILES-UE-091's Dock plan. Retiring Creative Cloud without settling LIGHTROOM-CC leaves that rationale wrong. `tests/rig-catalogue.test.mjs` line 373 asserts all three Adobe tools in `studio`.
- No commits. No repository files were changed apart from this report. The only temporary files were `/tmp/adobe-inv.sh` and `/tmp/terra-adobe.txt`, both deleted.

## In Progress

Nothing is running from this run.

## Queries

### SOL-MAS-REMOVE - Remove PhotoSweeper and Disk Speed Test on sol

**Context.** `mas uninstall` needs `sudo`, and sol's `sudo` asks for a password, so no agent can run it.

**Query.** Will Kris run the removal at sol's screen?

**Options.** a) (recommended) In Terminal on sol:

1. Run `sudo mas uninstall 463362050; sudo mas uninstall 425264550`. Enter the password when asked.
   Expect: no error. Each app is moved to the Bin.
2. Run `mas list | grep -E '463362050|425264550'; ls -d /Applications/PhotoSweeper.app "/Applications/Blackmagic Disk Speed Test.app"`.
   Expect: no `mas` lines, and `No such file or directory` for both paths.

b) Drag both apps from `/Applications` to the Bin in Finder, then do step 2.

### LIGHTROOM-CC - Lightroom Classic needs Creative Cloud on sol

**Context.** Lightroom Classic is installed on sol and declared in Rig's `studio` profile as the app for the photography library. It is licensed, installed and updated only through Creative Cloud. Adobe's Creative Cloud Uninstaller will not remove Creative Cloud while any Creative Cloud app is still installed. So Creative Cloud can only come off sol if Lightroom Classic comes off too. Removing the app does not delete the Lightroom catalogue or the photos.

**Query.** On sol, does Lightroom Classic stay (which keeps Creative Cloud), or go?

**Options.** a) (recommended) Keep Lightroom Classic and Creative Cloud on sol, and remove every Photoshop. Remove all of Creative Cloud on terra. Rig keeps `tool.adobe-lightroom-classic` and keeps `tool.adobe-creative-cloud` in `studio` only, with Creative Cloud's purpose reworded to "keep Lightroom Classic licensed and updated". Only `tool.adobe-photoshop` is retired. Use the sol steps (part A) and terra steps below.
b) Remove Lightroom Classic as well, so Creative Cloud goes from both Macs. Rig retires all three Adobe tools and the Lightroom Dock item. Use the sol steps (parts A and B) and terra steps below.
c) Hold sol and do only terra now.

#### At-screen steps, sol

Part A, Photoshop (needed with every option):

1. Quit Photoshop if it is open. Open the Creative Cloud app from the menu-bar icon, then choose **Apps** › **Installed**.
   Expect: Photoshop (2026), and older versions under the version menu, plus Lightroom Classic.
2. For each Photoshop entry (2026, then 2025, 2024 and 2023), open the **⋯** menu, choose **Uninstall**, then choose **Remove** to delete its preferences too.
   Expect: each version leaves the list. No Photoshop remains.
3. In Terminal: `ls -d /Applications/Adobe\ Photoshop* 2>&1; ls "/Library/Application Support/Adobe/Uninstall" | grep PHSP`
   Expect: `No such file or directory`, and no `PHSP` lines.

Part B, Lightroom Classic and Creative Cloud (option b only):

4. In Creative Cloud › **Apps** › **Installed**, open Lightroom Classic's **⋯** menu, choose **Uninstall**, then choose **Keep** so its preferences stay. The catalogue and photos are not touched either way.
   Expect: no installed apps are left in the list.
5. Quit Creative Cloud from its menu-bar icon (**⋯** › **Quit**). Open `/Applications/Utilities/Adobe Creative Cloud/Utils/Creative Cloud Uninstaller.app`, choose **Uninstall** and give the administrator password when asked.
   Expect: "Creative Cloud desktop app uninstalled". If it says apps are still installed, go back to step 4.
6. In Terminal: `ls -d /Applications/Adobe* /Applications/Utilities/Adobe* 2>&1; ls /Library/LaunchAgents /Library/LaunchDaemons ~/Library/LaunchAgents /Library/PrivilegedHelperTools | grep -i adobe; launchctl list | grep -i adobe; pgrep -il adobe`
   Expect: no output, or only `No such file or directory`. Report any leftover to the thread rather than deleting it by hand.
7. Optional, to reclaim space: in Finder, move `~/Library/Caches/Adobe Camera Raw 2` (19 GB) and `~/Library/Caches/Adobe` to the Bin.
   Expect: both folders gone. They are caches only.
8. Restart sol at a convenient time (Kris's call), then repeat step 6.
   Expect: still no output.

#### At-screen steps, terra

terra has no Creative Cloud apps, so it goes straight to the uninstaller:

1. Quit Creative Cloud from its menu-bar icon (**⋯** › **Quit**) if it is running. Open `/Applications/Utilities/Adobe Creative Cloud/Utils/Creative Cloud Uninstaller.app`, choose **Uninstall** and give the administrator password when asked.
   Expect: "Creative Cloud desktop app uninstalled".
2. In Terminal: `ls -d /Applications/Adobe* /Applications/Utilities/Adobe* 2>&1; ls /Library/LaunchAgents /Library/LaunchDaemons ~/Library/LaunchAgents /Library/PrivilegedHelperTools | grep -i adobe; launchctl list | grep -i adobe; pgrep -il adobe`
   Expect: no output, or only `No such file or directory`. Report any leftover to the thread.
3. After terra's next restart, repeat step 2.
   Expect: still no output.

An agent on sol can then re-run this inventory read-only on both Macs to confirm.

```text
SOL-MAS-REMOVE - a) at sol's screen in Terminal: sudo mas uninstall 463362050; sudo mas uninstall 425264550; then mas list | grep -E '463362050|425264550' and ls the two /Applications paths; expect nothing listed and No such file or directory for both
LIGHTROOM-CC - a) keep Lightroom Classic and Creative Cloud on sol and remove every Photoshop there (sol part A); remove all of Creative Cloud on terra (terra steps); Rig retires only tool.adobe-photoshop, keeps tool.adobe-lightroom-classic and keeps tool.adobe-creative-cloud in studio with its purpose reworded to keeping Lightroom Classic licensed and updated
```

```text
╭─ run report · 2026-10-15T01:39:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing removed         │
│  █  █ █▄▄▄ ▄▄▄█   █    · 2 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] sol-remove finished; nothing running from this run
- [waiting on Kris] sol-screen steps: SOL-MAS-REMOVE, Photoshop removal (sol part A); terra-screen steps: Creative Cloud removal
- [queries] SOL-MAS-REMOVE, LIGHTROOM-CC
- [for rig-apps] retiring Creative Cloud depends on LIGHTROOM-CC; under a) retire only tool.adobe-photoshop
- [uncommitted] this report (state folder and thread folder)

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
