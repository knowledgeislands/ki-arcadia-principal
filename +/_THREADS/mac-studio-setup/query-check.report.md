# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › query-check

**Run report at 22:20 BST · last mark 17:47 BST**

---

## Done

- **Checked all 15 queries left open at 13:23 BST, read-only.** No commit, apply, push, restart or sudo; nothing was sent to port 8787. The [decisions log](/Users/krisbrown/.local/state/ki/agents/mac-studio-bootstrap/decisions.md) has no direct answer to any of the 15. Kris's later messages change three of them: the at-screen steps on sol, "I can't do the Adobe uninstall, can you script this instead?" and the request for a walkthrough of key-only SSH (all 2026-10-15).
- **Result:** 10 still open, 4 changed, 1 overtaken, 0 answered.

| Query | Status | Evidence |
| --- | --- | --- |
| TERRA-ORDER | still open | tools-rig on sol is still `ahead 3` (`a9570bb` provider not on origin). terra's chezmoi source has already pulled to `5eb9309`, which includes the `79d667f` migration. terra's applied Rig config is still in the old form (no `requires = ["mas"]`; UTM still a Homebrew locator). terra runs Rig 0.6.3, which has no `mas` provider. The risk is live: a `chezmoi apply` on terra now would break its App Store declarations |
| MAS-PUBLIC | still open | `tool.mas` still has `profiles = ["core", "public"]` in chezmoi `main`. A branch on another session's remote, `origin/rig-public-by-default` (krisb/dotfiles#1), is not merged; once it merges, the query lapses |
| OBS-RESTART | still open | `http://127.0.0.1:1675/favicon.svg` answers `404`; apps-observatory.local is `ahead 1` (`d9c66cd`, unpushed) |
| HEADROOM-ICON | still open | No answer; GitHub was not checked |
| DESK-KIT | still open | No answer |
| RESEARCH-FOOTER | still open | No answer. This run hit the same conflict: the brief asked for `git fetch` and SSH to terra, but the footer forbade every remote call. I followed the task text, read-only |
| SITE-PUSH | **changed** | Another session pushed `550a946` ("follow the public-by-default rig and guard its exceptions") to origin. The local branch is now `ahead 2, behind 1`, so a plain push would be refused |
| CORE-059-ACCEPT | **changed** | The condition for option a) is now met. On sol, `rig doctor` reports `warn=0`, and the App Store rows name `mas` (`daisydisk mas present`, `utm mas drifted`). [KI-TOOL-RIG-CORE-059](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md) is still `awaiting-review` |
| TERRA-HARNESS-AHEAD | **overtaken** | Pushed by then. GitHub's `ki-agentic-harness` `main` contains `8a453bcd` and `d0c94558`, with `0df81f40` on top from another session. terra shows `main...origin/main` at `0df81f40`, level with GitHub. sol's checkout is `behind 13` and has not been pulled, which needs no decision |
| UTM-SOL | still open | sol: `brew list --cask` still has `utm`, `mas list` has no UTM, and the app has no App Store receipt; `rig doctor`: `utm: drifted via mas`. terra is fine (`mas list` has UTM 1538878817 with a receipt), but it keeps an out-of-date Homebrew record for UTM (`Caskroom/utm/4.7.5`) |
| KEYONLY-SKIP-EXIT | still open | `run_onchange_after_sshd_key_only.sh.tmpl` (`03fb48a`) still exits 1 on a skip, in three places. Kris's 2026-10-15 request for a walkthrough of key-only SSH is about applying the drop-in, not about the exit code |
| ADOBE-DATA | **changed** | Per Kris's 2026-10-15 "I can't do the Adobe uninstall, can you script this instead?", a script, not Kris, will produce the leftover lists. sol still has Creative Cloud, Lightroom Classic and Photoshop 2023 to 2026; terra still has Adobe Creative Cloud |
| SITE-ACTUAL | **changed** | Option a)'s check is done. Actual is installed on sol as Homebrew cask `actual`, has no Rig declaration, and is not on terra. The page still lists it, both locally and on origin |
| SITE-SPARK | still open | `software.md:67` still reads "Spark Mail - retained personal mail client that is not currently the active default", both locally and on origin. Both Macs have `Spark.app` and `Spark Desktop.app` |
| SITE-PRIVATE | still open | The software page still names 1Password, its CLI and The Tower, both locally and on origin. Origin's `550a946` now names these as restricted (with Tower Save Nudge and RendApp) and keeps them out of the catalogue, but not out of the guide text |

Other findings:

- **sol `rig doctor`:** `unhealthy`, `pass=239 warn=0 fail=2`. The two findings are `utm: drifted via mas` (UTM-SOL) and `port.headroom: conflicting`, which was already known.
- **sol `rig status`:** `present=165 missing=0 drifted=1` (UTM).
- **Repositories on sol:** chezmoi is level with origin at `5eb9309`; tools-ki is `ahead 2` ([KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md) capture).
- **terra:** tools-rig and chezmoi are level with the origin refs terra last fetched. I did not fetch on terra.
- **MAS-REMOVE looks done:** PhotoSweeper and Blackmagic Disk Speed Test are gone from `mas list` on both Macs.

## In Progress

Nothing is running from this run.

Outstanding - no action requested now:

- tools-ki `ahead 2` and apps-observatory.local `ahead 1` on sol, unpushed.
- sol's ki-agentic-harness is `behind 13`, waiting for a fast-forward pull.
- terra's out-of-date Homebrew record for UTM (`Caskroom/utm/4.7.5`), harmless while terra's Rig config still uses the old Homebrew form.
- The `port.headroom` doctor finding on sol.

## Queries

### TERRA-ORDER - get the provider and migration to terra

**Context:** terra's chezmoi source has already pulled `79d667f`, but terra has not applied it, and its Rig 0.6.3 has no `mas` provider. tools-rig `main` on sol is still three commits ahead of origin (`b5011d5`, `67328f4`, `a9570bb`). A `chezmoi apply` on terra now would leave all fourteen App Store declarations unloadable.

**Query:** How should terra get the provider?

**Options:**

a) (recommended) Authorise a push of tools-rig `main` from sol, so that the remote is consistent again. Kris then upgrades Rig on terra before running `chezmoi apply` there.

b) Hold off: no `chezmoi apply` on terra until a later tools-rig push.

### MAS-PUBLIC - keep `mas` in the public view

**Context:** Eleven public App Store apps require `mas`, and Rig refuses a public tool that depends on a non-public one, so `79d667f` put `tool.mas` in `public`. It shows only that the `mas` command is used. The unmerged `rig-public-by-default` branch (krisb/dotfiles#1) would make the question moot.

**Query:** Keep `mas` in the public view?

**Options:**

a) (recommended) Keep it as committed in `79d667f`.

b) Take `requires = ["mas"]` off the public apps and take `mas` back out of `public`.

### OBS-RESTART - restart the Observatory so port 1675 shows the new icon

**Context:** The icon is committed on `main` (`d9c66cd`), but the running service has the old code, and `/favicon.svg` answers 404. The repository lets an interactive session restart the service, but not a background run.

**Query:** Should the Observatory service be restarted now so it serves the icon?

**Options:**

a) (recommended) In an interactive session on sol, run `launchctl kickstart -k "gui/$(id -u)/uk.me.kris.rig.observatory"`, then confirm that `http://127.0.0.1:1675/favicon.svg` answers 200.

b) Leave it until the next restart or delivery.

### HEADROOM-ICON - ask Headroom upstream for a dashboard icon

**Context:** Headroom answers `/favicon.ico` with 204 and has no icon setting. A local patch would be lost on upgrade, and Headroom is a connection-critical service.

**Query:** How should Headroom get a better tab icon?

**Options:**

a) (recommended) Open a feature request on the Headroom repository asking it to serve an SVG icon and link it from `dashboard.html` and `settings.html`, attaching `favicons-headroom.svg`. Kris files it, or a run authorised to call GitHub does.

b) Leave Headroom with no icon.

### DESK-KIT - which bundle to buy

**Context:** Mid-range kit for sol: the recommended bundle is £730.23, the cheaper one £376.20 and the step-up about £808, all in desk-resume.report.md.

**Query:** Which bundle should Kris buy?

**Options:**

a) (recommended) Buy the recommended bundle: Shure MV7+ (B0CTJ7PVN1), RØDE PSA1+ (B09JBVR5B4), Logitech MX Brio (B07W4DHLWV) and Kanto ORA (B0CLHKBKL8), checking each price first.

b) Buy the cheaper bundle: Shure MV6 Gen 2, Elgato Facecam MK.2 and Edifier MR4, plus a 3.5 mm to RCA lead.

c) Buy the step-up bundle, with the Insta360 Link 2 and the Kanto ORA4.

### RESEARCH-FOOTER - explicit remote reads in briefs

**Context:** Two runs, desk-kit and this one, were asked to make read-only remote calls (web research; `git fetch` and SSH to terra) under a footer that forbids every remote call. Both followed the task text.

**Query:** Should briefs that need read-only remote calls carry a footer clause allowing them?

**Options:**

a) (recommended) The coordinating thread adds "read-only web search and fetches, `git fetch` and read-only SSH named in the task are allowed; no sign-in, purchase, posting, push or other remote call" to the footer of such briefs.

b) Leave the footer as it is and let the task text override it.

### SITE-PUSH - publish the two site commits over the new origin commit

**Context:** Local `main` in apps-rig.midnight.ninja holds `cef3f96` (catalogue refresh) and `e9503fd` (guides level with Rig). Another session has since pushed `550a946`, which guards the restricted tools and handles the Brewfile placeholder rationale. The branch is now `ahead 2, behind 1`, so a push would be refused. Pushing `main` triggers a Workers Builds deploy.

**Query:** Rebase the two commits onto `550a946` and push?

**Options:**

a) (recommended) An agent on sol rebases `cef3f96` and `e9503fd` onto `origin/main` and resolves any `data/rig.json` conflict by re-pulling the catalogue. It runs the gate, including `550a946`'s restricted-tool test, and pushes once the gate passes. It stops and reports on any conflict it cannot resolve mechanically.

b) Rebase and gate locally, but hold the push until krisb/dotfiles#1 lands, then refresh the catalogue and push once.

### CORE-059-ACCEPT - accept the Mac App Store provider

**Context:** [KI-TOOL-RIG-CORE-059](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md) is Awaiting review. Its acceptance condition is now met on sol, after Kris applied `~/.config/rig`: `rig doctor` shows `warn=0`, and the App Store rows name `mas`. UTM's remaining drift comes from sol's Homebrew copy, not from the provider. Two review points stand: Linux is rejected only when a `mas` install names `linux` itself, and Homebrew provider arguments no longer reach `mas`.

**Query:** Accept [KI-TOOL-RIG-CORE-059](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md) now?

**Options:**

a) (recommended) Yes. An agent on sol closes [KI-TOOL-RIG-CORE-059](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md) as done under `ki-accept` and commits locally in tools-rig.

b) Hold it and say what to change.

### UTM-SOL - swap UTM on sol to the App Store copy

**Context:** Rig expects the App Store UTM. sol still has the Homebrew copy, which `rig doctor` reports as `utm: drifted via mas`. Uninstalling without `--zap` keeps the virtual machines in `~/Library/Containers/com.utmapp.UTM`.

**Query:** Swap UTM on sol now?

**Options:**

a) (recommended) At sol's screen, in Terminal:

1. Quit UTM, then run `brew uninstall --cask utm`. Expect: `Uninstalling Cask utm`.
2. Run `mas install 1538878817`. Expect: `Installed UTM`.
3. Run `mas list | grep 1538878817; ls ~/Library/Containers/com.utmapp.UTM`. Expect: one UTM line, then the container listed. Open UTM and check that the VMs are shown.

b) Keep the Homebrew copy, and an agent reverts UTM to the cask declaration.

### KEYONLY-SKIP-EXIT - exit code when the key-only script skips

**Context:** The key-only SSH script in [KB-DOTFILES-UE-088](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-088-ssh-alias-for-sol.md) exits 1 when it skips because sudo needs a password, so chezmoi retries it on the next apply. With exit 0, chezmoi would record the skip as done and never install the drop-in. The cost is a reported script failure when applying over SSH, until the drop-in is installed at the screen.

**Query:** Keep exit 1 on a skip?

**Options:**

a) (recommended) Keep exit 1 on a skip, so that a skip is visible and retried.

b) Exit 0 on a skip, and accept that the drop-in only arrives when the script changes.

### ADOBE-DATA - what happens to the Adobe data left after the scripted uninstall

**Context:** Kris has asked for the Adobe uninstall to be scripted rather than done by hand. sol still has Creative Cloud, Lightroom Classic and Photoshop 2023 to 2026, and terra has Creative Cloud. The uninstallers leave caches, logs, preferences and presets. The Lightroom catalogue and photos are Kris's own data.

**Query:** Once the script has removed the apps, what happens to the data they leave?

**Options:**

a) (recommended) The uninstall script keeps preferences, deletes nothing else, and ends by listing the Adobe folders left with their sizes and every Lightroom catalogue path. An agent then proposes a per-folder list for Kris to approve: delete caches, logs and empty support folders; keep every catalogue, the presets and the Photoshop settings. The approved deletions run at each Mac's screen.

b) Delete nothing now and look again later.

c) Kris decides folder by folder from the script's lists.

### SITE-ACTUAL - Actual on the software page

**Context:** The software page lists Actual as an adopted budgeting app. It is installed on sol as Homebrew cask `actual`, with no Rig declaration, and is not on terra.

**Query:** Should Actual be declared in Rig and kept on the page?

**Options:**

a) (recommended) Yes. An agent declares Actual in chezmoi's Rig config as Homebrew cask `actual` for sol's profile, runs the gate and commits locally under Kris's standing local-change authority of 2026-10-15. The page line stays.

b) Remove it from the page, leave it undeclared, and Kris uninstalls it.

c) Declare it for both Macs.

### SITE-SPARK - which Spark is the mail client

**Context:** The page still calls Spark Mail a retained client that is not the default. Rig's private `spark-desktop` entry says Spark Desktop is the one mail client on every machine. Both Macs have both `Spark.app` and `Spark Desktop.app`.

**Query:** Should the page say Spark Desktop is the mail client?

**Options:**

a) (recommended) Yes. Update the line to "Spark Desktop - the one mail client on every machine".

b) Leave it, keeping the mail client off the public page.

### SITE-PRIVATE - privately held tools named on the software page

**Context:** The catalogue holds back 1Password, its CLI and The Tower, and origin's `550a946` now refuses any export that carries them. The software guide still names all three in prose, which predates these runs.

**Query:** Keep them named in the software guide?

**Options:**

a) (recommended) Keep them: the guide records choices, not inventory, and names no versions or machine identity.

b) Remove them from the guide, so that it matches the catalogue boundary.

```text
TERRA-ORDER

a) authorise a push of tools-rig main from sol so the remote is consistent; I then upgrade Rig on terra before running chezmoi apply there

---

MAS-PUBLIC

a) keep mas in the public view as committed in 79d667f

---

OBS-RESTART

a) in an interactive session on sol, run launchctl kickstart -k "gui/$(id -u)/uk.me.kris.rig.observatory", then confirm http://127.0.0.1:1675/favicon.svg answers 200

---

HEADROOM-ICON

a) open a feature request on the Headroom repository asking it to serve an SVG icon and link it from dashboard.html and settings.html, attaching favicons-headroom.svg; I file it, or a run authorised to call GitHub does

---

DESK-KIT

a) buy the recommended bundle: Shure MV7+ (B0CTJ7PVN1), RØDE PSA1+ (B09JBVR5B4), Logitech MX Brio (B07W4DHLWV) and Kanto ORA (B0CLHKBKL8), checking each price first

---

RESEARCH-FOOTER

a) the coordinating thread adds "read-only web search and fetches, git fetch and read-only SSH named in the task are allowed; no sign-in, purchase, posting, push or other remote call" to the footer of briefs that need them

---

SITE-PUSH

a) an agent on sol rebases cef3f96 and e9503fd onto origin/main 550a946 in apps-rig.midnight.ninja, resolves any data/rig.json conflict by re-pulling the catalogue, runs the gate including the restricted-tool test, and pushes once it passes; stop and report on any conflict it cannot resolve mechanically

---

CORE-059-ACCEPT

a) an agent on sol closes KI-TOOL-RIG-CORE-059 as done under ki-accept and commits locally in tools-rig

---

UTM-SOL

a) at sol's screen: quit UTM; brew uninstall --cask utm; mas install 1538878817; then mas list | grep 1538878817 and ls ~/Library/Containers/com.utmapp.UTM; expect one UTM line, the container listed and the VMs shown in UTM

---

KEYONLY-SKIP-EXIT

a) keep exit 1 on a skip, so a skip is visible and retried

---

ADOBE-DATA

a) the Adobe uninstall script keeps preferences, deletes nothing else and ends by listing the Adobe folders left with sizes and every Lightroom catalogue path; an agent then proposes a per-folder list for me to approve (delete caches, logs and empty support folders; keep catalogues, presets and Photoshop settings), and the approved deletions run at each Mac's screen

---

SITE-ACTUAL

a) an agent declares Actual in chezmoi Rig config as Homebrew cask actual for sol's profile, runs the gate and commits locally; the page line stays

---

SITE-SPARK

a) update the software page line to "Spark Desktop - the one mail client on every machine"

---

SITE-PRIVATE

a) keep 1Password, its CLI and The Tower named in the software guide
```

```text
╭─ run report · 2026-10-15T21:20:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · check done              │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing changed         │
│  █  █ █▄▄▄ ▄▄▄█   █    · 14 queries open         │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] query-check finished; nothing running from this run
- [waiting] TERRA-ORDER
- [waiting] MAS-PUBLIC
- [waiting] OBS-RESTART
- [waiting] HEADROOM-ICON
- [waiting] DESK-KIT
- [waiting] RESEARCH-FOOTER
- [waiting] SITE-PUSH
- [waiting] CORE-059-ACCEPT
- [waiting] UTM-SOL
- [waiting] KEYONLY-SKIP-EXIT
- [waiting] ADOBE-DATA
- [waiting] SITE-ACTUAL
- [waiting] SITE-SPARK
- [waiting] SITE-PRIVATE
- [uncommitted] query-check.report.md in the thread folder

```text
Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
