# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › apps-resume

**Run report at 10:39 BST · last mark 17:47 BST**

---

## Done

- **Finished and committed rig-apps' work in chezmoi as `219607f`** (local only, not pushed). It changes three files: the applications declarations, the catalogue test and [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md).
- **KEYNOTE-ROUTE.** On sol, `mas info` finds none of 409183694, 409203825 and 409201541, even though `mas list` shows all three installed. So Keynote, Numbers and Pages stay catalogue-only, the comment now says "App Store, not resolvable by mas", and step A8 is closed.
- **Photoshop and Creative Cloud are out of Rig.** Both are now retired declarations, the form Rig's spec uses for a retired tool. Nothing installs or removes them, and `rig status --retired` shows what is left on each Mac. Photoshop covers its 2023 to 2026 copies. Neither app had a Dock, file-handler or profile reference. rig-apps had kept Creative Cloud declared to serve Lightroom Classic. Kris's ADOBE-OUT answer ("Lightroom Classic can go too") settled that, so I retired Creative Cloud as well. Lightroom Classic is still declared, because the queued adobe-out run takes it out.
- **UE-086.** C7i now reads: remove every Photoshop and Creative Cloud on both Macs, following the steps in the [sol-remove report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-setup/sol-remove.report.md), with Creative Cloud last. C8 no longer expects Photoshop or Creative Cloud.
- **UTM is declared as App Store app 1538878817.** DaisyDisk already was. The check showed **UTM on sol is still the Homebrew copy**: `brew list --cask` lists `utm`, `mas list` does not, and the app has no App Store receipt. DaisyDisk on sol is the App Store copy. terra could not be checked because it has been offline on the tailnet since about 10:10 BST. See UTM-SOL and TERRA-CHECK.
- **Checks.** `rumdl check .` is clean. `node --test tests/*.test.mjs` gives 239 pass and 2 fail, the two known failures (`ki-self-skill` and `scheduled-emerge-session`). `ki repo audit --repo .` has one failure, the missing `.claude/skills/ki-self` projection, which is the same known gap and not from this change. `rig apply --dry-run` against a config copy plans UTM through the App Store and nothing for Adobe. `rig doctor` against a config copy went from 1 finding to 2:
  - `port.headroom` was already there. The Headroom port is held by a Python process, not `headroom-ai`. I left it alone because the Headroom proxy is connection-critical.
  - `utm: drifted via mas` is new and comes from this change. It stays until the Homebrew copy on sol is swapped (UTM-SOL).
- **Caveat on the Rig results.** Rig on sol runs straight from the tools-rig working tree, which the concurrent provider-resume run is editing. One doctor run crashed partway through an edit, and I re-ran it. The figures above come from the runs that completed.
- Cleanup: the temporary config copy is deleted, no Git locks are left, and no other changes were touched.

## In Progress

Nothing is running from this run.

## Queries

**UTM-SOL**

**Context:** Rig now expects the App Store UTM, but sol still has the Homebrew copy. Uninstalling the cask without `--zap` leaves the virtual machines in `~/Library/Containers/com.utmapp.UTM`.

**Query:** Swap UTM on sol now?

**Options:** a) (recommended) yes, at sol's screen in Terminal, using the steps below; b) keep the Homebrew copy and I revert UTM to the cask declaration.

1. Quit UTM, then run: `brew uninstall --cask utm` Expect: `Uninstalling Cask utm` and no error.
2. Run: `mas install 1538878817` Expect: `Installed UTM` (sign in to the App Store first if asked).
3. Run: `mas list | grep 1538878817; ls ~/Library/Containers/com.utmapp.UTM` Expect: one UTM line, and the container folder listed. Open UTM and check your virtual machines are shown.

**TERRA-CHECK**

**Context:** terra was offline, so I could not confirm that UTM and DaisyDisk there are App Store copies.

**Query:** How should terra be checked?

**Options:** a) (recommended) when terra is back online, an agent on sol re-runs `brew list --cask` and `mas list` on terra read-only; b) Kris checks at terra's screen.

**APPLY-STEPS**

**Context:** `219607f` is only on sol. terra gets it after a push.

**Query:** Apply it on both Macs?

**Options:** a) (recommended) yes, with these steps.

1. At sol, run: `chezmoi diff ~/.config/rig/conf.d/10-applications.toml` Expect: Photoshop and Creative Cloud move to `retired-application` tables, UTM moves to `kind = "mas"` 1538878817, and the Keynote, Numbers and Pages comments change.
2. At sol, run: `chezmoi apply ~/.config/rig/conf.d/10-applications.toml && rig doctor` Expect: once UTM-SOL is done, the only finding is `port.headroom`.
3. At sol, run: `rig status --retired` Expect: Photoshop and Creative Cloud are listed as `matched` until C7i removes them.
4. At sol, run: `git -C ~/.local/share/chezmoi push` Expect: `main -> main`.
5. At terra, run: `chezmoi update && rig doctor && rig status --retired` Expect: no UTM or Adobe findings, and the retired report shows only what Creative Cloud left behind.

```text
UTM-SOL - a) at sol's screen in Terminal: quit UTM; brew uninstall --cask utm; mas install 1538878817; then mas list | grep 1538878817 and ls ~/Library/Containers/com.utmapp.UTM; expect one UTM line, the container listed and your VMs shown in UTM
TERRA-CHECK - a) when terra is back online, an agent on sol re-runs brew list --cask and mas list on terra read-only to confirm UTM and DaisyDisk are App Store copies
APPLY-STEPS - a) at sol: chezmoi diff ~/.config/rig/conf.d/10-applications.toml; chezmoi apply ~/.config/rig/conf.d/10-applications.toml && rig doctor; rig status --retired; git -C ~/.local/share/chezmoi push; then at terra: chezmoi update && rig doctor && rig status --retired
```

```text
╭─ run report · 2026-10-15T09:39:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · 219607f local           │
│  █  █ █▄▄▄ ▄▄▄█   █    · 3 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] apps-resume finished; nothing running from this run
- [waiting on Kris] UTM-SOL and APPLY-STEPS at sol's screen; terra once it is back online
- [queries] UTM-SOL, TERRA-CHECK, APPLY-STEPS
- [for adobe-out] Lightroom Classic is the last Adobe declaration; Creative Cloud is already retired
- [unpushed] chezmoi `main` on sol is 1 commit ahead (`219607f`)

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
