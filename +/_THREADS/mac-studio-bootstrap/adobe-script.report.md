# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) › adobe-script

**Run report at 22:16 BST · last mark 17:47 BST**

---

## Done

- **[adobe-remove.sh](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-bootstrap/adobe-remove.sh) is written and committed** as `a91113d` (local only, not pushed). It replaces the Creative Cloud app steps in ADOBE-SOL and ADOBE-TERRA from the adobe-sweep report. Without `--apply` it is a dry run and changes nothing. `--apply` needs sudo, and it refuses to run if you are logged in as root. It works in this order:
  1. It finds what is installed by reading Adobe's install database (`/Library/Application Support/Adobe/Caps/hdpim.db`). That gives each app's SAP code, base version, platform and folder, so nothing is assumed. Base versions are not always the major version: Lightroom Classic 15.6 has base `8.3`.
  2. If Lightroom Classic or a Photoshop is open, it stops and asks you to quit them. This keeps the catalogue safe and loses no unsaved work. It then quits the Adobe background processes. A process counts as Adobe's only when its program file is in an Adobe folder, so an agent whose text just mentions Adobe is never stopped.
  3. It uninstalls each app with `HDBox/Setup --uninstall=1 --sapCode --baseVersion --platform --deleteUserPreferences=false`. After that it uninstalls any add-on the apps pulled in that is still there, such as Camera Raw, the colour profiles or the Substance viewer.
  4. Last, it runs `Creative Cloud Uninstaller -u`.
  5. Where Adobe's tools leave something behind, it unloads each launch daemon and agent with `launchctl bootout`, using the label inside the plist, then deletes the plist. It also deletes Adobe's privileged helper, the Creative Cloud folders and each app's folder. It can only delete under `/Applications/Adobe *`, `/Applications/Utilities/Adobe *` and the `com.adobe.*` launchd and helper paths. Any other Adobe item in Applications is listed and left alone.
  6. It prints what is left, the folder sizes (the same `find`/`du` command as adobe-sweep step 7) and any Lightroom catalogues. It writes a log beside itself, named `adobe-remove.<host>.<time>.<dry-run|apply>.log`. Git ignores `*.log`, so the logs are never committed.
- **User data is kept.** The script never touches anything in `~/Library`, `~/Pictures` or `/Library/Application Support` except the launch agents. Preferences, presets, caches, catalogues and photos stay for ADOBE-DATA.
- **Checks.** `shellcheck` passes with no findings. A wrong argument exits with code 2, and `--apply` without sudo exits with code 1 having changed nothing. I ran the dry run twice on sol. Both exited 0 in about 17 seconds and changed nothing. What it found on sol:
  - 5 apps: Lightroom Classic 15.6, and Photoshop 27.11, 26.11.4, 25.12.4 and 24.7.5.
  - 8 add-ons.
  - 7 Creative Cloud folders.
  - 8 launch daemons and agents, and 1 helper.
  - What stays: 7.0 GB in `/Library/Application Support/Adobe`, 6.2 GB in `~/Library/Application Support/Adobe`, and the catalogue `~/Pictures/Lightroom/Lightroom Catalog.lrcat`.

  The latest log is `adobe-remove.sol.20261015-221323.dry-run.log`. An earlier log from the first test, `…221245…`, is also there and Git ignores it.
- **Not tested.** I did not run the script on terra, because this run had no remote access. I did not run `--apply`, did not use sudo and deleted nothing.

## In Progress

Nothing is running from this run. The removal itself waits for Kris at each Mac's screen.

Outstanding - no action requested now:

- ADOBE-DATA, from the adobe-sweep report, stays open. Answer it once both Macs have sent back what is left.
- `+/_THREADS/state-of-play/decisions.md` has uncommitted changes from another session. I did not touch it.

## Queries

### ADOBE-RUN-SOL - Run the removal script at sol

**Context:** The script replaces the Creative Cloud app steps in ADOBE-SOL. A rerun is safe, because the script checks what is installed again each time.

These are the steps at sol:

1. Save your work, then quit Lightroom Classic and every Photoshop. In Terminal, run: `cd ~/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-bootstrap && ./adobe-remove.sh`
   Expect, under `1.`: Lightroom Classic 15.6 and the four Photoshops, 8 add-ons, 7 Creative Cloud folders, 8 launchd plists and 1 helper. The last line should read `Dry run finished. Nothing was changed.` If a `Still open` section appears, quit those apps.
2. Run: `sudo ./adobe-remove.sh --apply`, and give sol's password when asked.
   Expect: this takes a few minutes. Steps `3.` and `4.` print each Adobe command with no `exit N` line after it. Step `5.` should have little or nothing to do. Under `What is left`, there should be no `/Applications/Adobe` line, no plist, no helper and no process. Then comes the list of folder sizes, and the catalogue under `Lightroom catalogues kept`. The last line reads `Done with 0 step(s) that failed or fell back`.
   If a line says `Operation not permitted`, open System Settings › Privacy & Security › App Management, turn Terminal on, then run step 2 again.
3. Restart sol, then run `./adobe-remove.sh` again from the same folder.
   Expect: `none` for apps and add-ons, no Creative Cloud folder, no launchd item, and nothing under `What is left` before the sizes.
4. Tell the thread "sol done". An agent then reads the `*.apply.log` and the second `*.dry-run.log` beside the script. If a step fell back or failed, paste the `Result` line as well.

**Query:** Will Kris run the script at sol's screen as set out above?

**Options:**
a) (recommended) yes, steps 1 to 4 above
b) run only the dry run (step 1) and send its output before deciding

### ADOBE-SCRIPT-TERRA - Get the script onto terra

**Context:** The script is committed only on sol (`a91113d`, ki-principal `main`, not pushed). terra gets it only after a push, and this run may not push.

**Query:** May the thread push ki-principal from sol so that terra can pull the script?

**Options:**
a) (recommended) yes: the thread pushes ki-principal `main` from sol. At terra, Kris then runs `git -C ~/workspaces/knowledge-islands/ki-principal pull --ff-only`
b) copy the script to terra by hand, for example with AirDrop, into `~/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-bootstrap/`

### ADOBE-RUN-TERRA - Run the removal script at terra

**Context:** This replaces the steps in ADOBE-TERRA. terra has only Creative Cloud: one launch daemon (`com.adobe.acc.installer.v2`), one user launch agent (`com.adobe.ccxprocess`) and the installer helper. The script has not been run on terra, so step 1 is its first test there.

These are the steps at terra, once ADOBE-SCRIPT-TERRA is done:

1. In Terminal, run: `cd ~/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-bootstrap && ./adobe-remove.sh`
   Expect: `none` under installed apps and add-ons. Then the Creative Cloud folders, those two plists and the helper, and `Dry run finished. Nothing was changed.` If an app or add-on is listed, send the output to the thread before going on.
2. Run: `sudo ./adobe-remove.sh --apply`, and give terra's password when asked.
   Expect: the `Creative Cloud Uninstaller -u` line with no `exit N` after it. Under `What is left`, there should be no `/Applications/Adobe` line, no plist, no helper and no process. The sizes list should show about 1.6 GB in `/Library/Application Support/Adobe`. The last line reads `Done with 0 step(s) that failed or fell back`.
   If a line says `Operation not permitted`, turn Terminal on under System Settings › Privacy & Security › App Management and run step 2 again.
3. Restart terra, then run `./adobe-remove.sh` again.
   Expect: nothing under `What is left` before the sizes.
4. Send the thread the `Result` line, everything from `== What is left` to the end of the step 2 output, and the output of step 3. The log is beside the script on terra, and an agent can read it there.

**Query:** Will Kris run the script at terra's screen as set out above?

**Options:**
a) (recommended) yes, steps 1 to 4 above, after ADOBE-SCRIPT-TERRA
b) leave terra until it is next at hand

```text
ADOBE-RUN-SOL

At sol: quit Lightroom Classic and every Photoshop; cd ~/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-bootstrap && ./adobe-remove.sh (dry run, expect 5 apps and "Nothing was changed"); sudo ./adobe-remove.sh --apply (expect nothing left under "What is left" and "Done with 0 step(s)"; if "Operation not permitted", turn Terminal on under App Management and rerun); restart and run ./adobe-remove.sh again; tell the thread "sol done" so an agent reads the logs beside the script; delete no data (ADOBE-DATA stays open)

---

ADOBE-SCRIPT-TERRA

Yes: the thread pushes ki-principal main from sol (a91113d), then at terra Kris runs git -C ~/workspaces/knowledge-islands/ki-principal pull --ff-only

---

ADOBE-RUN-TERRA

At terra, after the pull: cd ~/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-bootstrap && ./adobe-remove.sh (dry run, expect no apps, Creative Cloud only); sudo ./adobe-remove.sh --apply (expect nothing left under "What is left" and "Done with 0 step(s)"); restart and run ./adobe-remove.sh again; send the thread the Result line, the "What is left" output and the post-restart output; delete no data
```

```text
╭─ run report · 2026-10-15T21:16:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · a91113d local           │
│  █  █ █▄▄▄ ▄▄▄█   █    · 3 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] adobe-script finished; nothing running from this run
- [waiting] ADOBE-RUN-SOL
- [waiting] ADOBE-SCRIPT-TERRA
- [waiting] ADOBE-RUN-TERRA
- [unpushed] ki-principal `main` on sol has `a91113d` and this report's commit

```text
Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
