# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) › site-sync

**Run report at 10:47 BST · last mark 17:47 BST**

---

## Done

[apps-rig.midnight.ninja](/Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja) is level with Rig at `a9570bb` and the chezmoi onboarding guide [setup-mac-rig.md](/Users/krisbrown/.local/share/chezmoi/docs/guides/user/setup-mac-rig.md), in two local commits on `main` (2 ahead of the local `origin/main` ref `fc07407`; not pushed, so not deployed).

- `cef3f96` refreshes the catalogue under [MIDNIGHT-HK-001](/Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja/docs/housekeeping/MIDNIGHT-HK-001-refresh-the-rig-catalogue.md): 101 public tools, up from 100. Python is newly published; chezmoi `bfafe0a` ("offer python in the public profile", 14 October) made that deliberate. It links to python.org, and both terra and sol declare it.
- `e9503fd` corrects the three guide pages. The bootstrap guide described the retired Brewfile and commands Rig no longer has (`rig bootstrap`, `rig run workstation audit`, `machine apply`). It now follows the current order: Command Line Tools, Homebrew, chezmoi with a Rig profile and `--keep-going`, the 1Password CLI checked with `op vault list`, then `rig apply` after App Store sign-in, `rig doctor` and `rig status --unmanaged`. App Store apps are described as installed through `mas`, never Homebrew. The software page now has Adobe retired from both Macs and DaVinci Resolve as the studio editor from the App Store. It lists TigerVNC and Rekordbox as catalogued but not adopted, and the Brewfile paragraph is replaced. The power-tools page's Dock, defaults and Fileside checks now name `rig doctor`, `rig apply` and `rig status --unmanaged`.
- Checks: `bun run self:typecheck && bun run test` passed (22 site tests, 5 boundary tests); rumdl and Biome were clean, and the commit hooks passed. `ki repo audit --repo .` fails on four findings in [KB-MIDNIGHT-RIG-SITE-001](/Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja/docs/roadmap/KB-MIDNIGHT-RIG-SITE-001-show-hosts-per-tool.md): no horizon, no `baseline_ref`, and two body-shape findings. Those findings were already at `HEAD` before this run, and this run did not touch the record.
- The catalogue itself never names a provider, because Rig's public export carries none. The App Store and Homebrew confusion could appear only in the guide prose, which is now corrected. [KI-TOOL-RIG-CORE-058](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-058-apply-lock-handler-history.md) is triage and changes nothing the site shows.

**Deliberately left:**

- The software page names 1Password, its CLI and The Tower, which the catalogue holds back on purpose. That text was already published, so I neither removed nor widened it. See SITE-PRIVATE.
- **Actual** (budgeting) is listed as adopted, but Rig declares it nowhere. See SITE-ACTUAL.
- **Spark Mail** is called "not currently the active default", yet Rig's private `spark-desktop` entry says it is the one mail client on every machine. I left it so the page names no private declaration. See SITE-SPARK.
- Rig on the dev-channel Macs runs from a checkout, not the Homebrew tap the software page names. I kept the tap, because it is the declared and published route.
- The chezmoi source has uncommitted edits from another run: the App Store migration and the Adobe sweep. The site reflects what is rendered now. After those land, the weekly MIDNIGHT-HK-001 refresh will catch any change in public membership.
- Three tools still have no homepage link: Activity Monitor, Finder and Delta, unchanged from the last refresh.

## In Progress

Nothing; the run is finished.

## Queries

### SITE-PUSH - publish the two commits

**Context:** Pushing `main` triggers a Workers Builds deploy of rig.midnight.ninja.

**Query:** Push `cef3f96` and `e9503fd`?

**Options:** a) (recommended) yes: `git -C ~/workspaces/personal/apps-rig.midnight.ninja push`, after a fetch shows `origin/main` still at `fc07407`; b) hold until the chezmoi App Store migration lands, then refresh the catalogue again and push once.

### SITE-ACTUAL - Actual on the software page

**Context:** The software page lists Actual as an adopted budgeting app, but no Rig declaration exists for it, so `rig status --unmanaged` would flag it if it is installed.

**Query:** Is Actual still adopted?

**Options:** a) (recommended) an agent checks read-only whether Actual is installed on terra and sol, then either declares it in chezmoi Rig config or removes it from the page; b) remove it from the page now; c) declare it in Rig now.

### SITE-SPARK - which Spark is the mail client

**Context:** The page calls Spark Mail a retained client that is not the default. Rig's private `spark-desktop` entry says Spark Desktop is the one mail client on every machine, in the same Dock place.

**Query:** Should the page say Spark Desktop is the mail client?

**Options:** a) (recommended) yes, update the line to "Spark Desktop — the one mail client on every machine"; b) leave it, keeping the mail client off the public page.

### SITE-PRIVATE - privately held tools named on the software page

**Context:** The catalogue holds back 1Password, its CLI and The Tower, but the published software page names all three, and this predates the run.

**Query:** Keep them on the software page?

**Options:** a) (recommended) keep them: the guide records choices, not inventory, and names no versions or machine identity; b) remove them from the page so it matches the catalogue boundary.

```text
SITE-PUSH - a) after a fetch shows origin/main still at fc07407, git -C ~/workspaces/personal/apps-rig.midnight.ninja push
SITE-ACTUAL - a) an agent checks read-only whether Actual is installed on terra and sol, then either declares it in chezmoi Rig config or removes it from the software page
SITE-SPARK - a) update the software page line to "Spark Desktop — the one mail client on every machine"
SITE-PRIVATE - a) keep 1Password, its CLI and The Tower on the software page
```

```text
╭─ run report · 2026-10-15T09:47:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · 2 commits local         │
│  █  █ █▄▄▄ ▄▄▄█   █    · 4 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] site-sync finished; nothing running from this run
- [queries] SITE-PUSH, SITE-ACTUAL, SITE-SPARK, SITE-PRIVATE
- [unpushed] apps-rig.midnight.ninja `main` on sol is 2 commits ahead (`cef3f96`, `e9503fd`)
- [audit] KB-MIDNIGHT-RIG-SITE-001's record shape already fails `ki repo audit`; it is owned by that record's own review

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
