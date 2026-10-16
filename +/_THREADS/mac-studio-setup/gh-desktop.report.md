# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › gh-desktop

**Run report at 00:06 BST · last mark 17:47 BST**

---

Run on sol, locally, 2026-10-14 23:58 to 2026-10-15 00:06 BST, under decision 75 (Kris, 2026-10-14: "fix github desktop by cleaning out the repositories it has and then registering all of the ones from the 8 territories in it"). I changed no repository and made no commit. This report is not committed; the coordinator commits it with the thread folder.

## Done

- **Territories and checkouts.** `~/workspaces/.mgit.toml` names eight territories. Their manifests list 56 Git checkouts, and all 56 are on disk: equal-remedy 3, humans-not-robots 12, knowledge-islands 22, legal 2, personal 7, sacred-inquiry 2, techmedix 4 and valle-armonia 4. That is the ki registry's 50 territory entries plus the six without `.ki.toml`: `hnr-backend`, `hnr-benchmarks`, `hnr-frontend`, `hnr-shared`, `kw-website` and `paperclip`. The registry's 51st entry, the chezmoi source, belongs to no territory, so it is not in the list. No territory contains a checkout that its manifest leaves out. `~/workspaces/_old` does not exist on sol, so there was nothing to exclude.
- **Backup.** GitHub Desktop 3.6.7 quit cleanly when asked. I copied the whole data folder to `~/Library/Application Support/GitHub Desktop.bak-2026-10-14` and confirmed that the copy is identical to the original.
- **Old list cleared.** The repository list lives in GitHub Desktop's IndexedDB database (`IndexedDB/file__0.indexeddb.leveldb`), together with cached GitHub metadata that the app rebuilds. I removed only that database. Removing entries one by one is possible only in the app's interface. Local Storage, which holds the account list, preferences, cookies and the Keychain were not touched. The old list held stale paths under `~/.homesick`, `~/dev/hnr`, `~/dev/techmedix`, `~/obsidian/vaults` and the chezmoi source.
- **New list added.** I opened each checkout through the app's `github <path>` command-line shim, which only adds and selects repositories. On the first pass the app silently dropped eight of the opens because an Add Repository dialog was already open. A slower second pass added six of them, and a third pass added `tools-rig` and `tools-ki`.
- **Verified.** The app's stored data holds all 56 territory paths. No stale paths remain: there is nothing under `.homesick`, `/dev/`, `obsidian`, `_old`, `kit`, `hnr`, `kis` or chezmoi. The app's own log reported 54 repositories at its last launch, and the two later additions bring that to 56. The app is running. Because Kris was using it at the screen, I did not quit it again for a final relaunch count.
- **Rig or chezmoi declaration (Rig-differences remit).** chezmoi cannot declare this list, because it lives in an app database rather than a file. Rig could declare it the way `ki vscode` reconciles VS Code from the registry. It would read the eight mgit manifests and add each checkout through the `github` shim, which is add-only and idempotent, with a pause between opens. This is raised as GHD-DECLARE.

## In Progress

Nothing from this run is still running.

- `tools-ki` on sol is still stuck in the rebase that push-check left behind (TOOLS-KI-CLASH). GitHub Desktop lists it with no branch checked out until that query is settled.

## Queries

### MIDNIGHT-PUSH-SEEN

**Context:** GitHub Desktop's log shows `git push origin main:main` for `personal/apps-rig.midnight.ninja` at 00:03:23 BST. That was 11 seconds after my add had selected the repository in the app. `origin/main` moved to `189928e` ([KB-MIDNIGHT-RIG-SITE-001](/Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja/docs/roadmap/KB-MIDNIGHT-RIG-SITE-001-show-hosts-per-tool.md)), and its reflog records the change as "update by push". Seconds later someone relaunched the app and signed in to `krisb` through the browser. Before this run started, the log also shows an earlier push at 23:56 BST. GitHub Desktop never pushes on its own, and my run issued no push, so this looks like a click at sol's screen. Decision 73 still held MIDNIGHT-PUSH until terra's checkout was confirmed level.

**Query:** Did you push apps-rig.midnight.ninja from GitHub Desktop, and how should MIDNIGHT-PUSH be recorded?

**Options:**

a) (recommended) Yes, I pushed it. Record MIDNIGHT-PUSH as done at 189928e, and have TERRA-READ check that terra's checkout fast-forwards to it.

b) No, I didn't push it. An agent on sol investigates the app log and the reflogs read-only and reports.

### GHD-DECLARE

**Context:** chezmoi cannot hold GitHub Desktop's list, because it is in an app database. Each new rig therefore needs this manual reset. The `github` shim gives a supported, add-only and idempotent way to reconcile the list from the mgit manifests.

**Query:** Should Rig declare GitHub Desktop's repository list?

**Options:**

a) (recommended) Capture a tools-rig triage record for a step that adds every mgit territory checkout to GitHub Desktop through the `github` shim. The step is add-only, never removes anything and pauses between opens. List it as a Rig difference in the Project note.

b) Note it only as a manual step in the Rig onboarding guide.

c) Leave it undeclared.

### GHD-BACKUP

**Context:** `~/Library/Application Support/GitHub Desktop.bak-2026-10-14` (23 MB) holds the old profile, including cookies. It is the only way to restore the old list.

**Query:** What should happen to the backup?

**Options:**

a) (recommended) Once you have looked at the new list in GitHub Desktop, an agent on sol deletes the backup folder.

b) Keep it indefinitely.

```text
MIDNIGHT-PUSH-SEEN - a) yes, I pushed apps-rig.midnight.ninja from GitHub Desktop; record MIDNIGHT-PUSH as done at 189928e and have TERRA-READ check that terra's checkout fast-forwards to it
GHD-DECLARE - a) capture a tools-rig triage record for a Rig step that adds every mgit territory checkout to GitHub Desktop through the github shim (add-only, never removes, pauses between opens), and list it as a Rig difference in the mac-studio-bootstrap Project note
GHD-BACKUP - a) I have looked at the new list; an agent on sol deletes ~/Library/Application Support/GitHub Desktop.bak-2026-10-14
```

```text
╭─ run report · 2026-10-14T23:06:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · 3 queries waiting       │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] gh-desktop finished, nothing running from this run
- [waiting] MIDNIGHT-PUSH-SEEN, GHD-DECLARE, GHD-BACKUP, TOOLS-KI-CLASH
- [uncommitted] this report
- [unpushed] thread folder

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
