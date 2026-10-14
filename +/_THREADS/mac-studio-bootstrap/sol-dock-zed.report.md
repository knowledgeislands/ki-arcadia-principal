# Why Zed is not on sol's Dock

## What has been done

**The short answer:** Zed is installed on sol, but Rig does not manage sol's Dock at all. Your Rig declares one Dock layout, `dock.workstation`, and it is selected only by the `laptop` profile. sol runs the `studio` profile, so Rig leaves sol's Dock as it was set up by hand, and that Dock never had Zed. This has nothing to do with the failed `rig upgrade`.

### What I found

- **Zed on sol:** installed at `/Applications/Zed.app` as the Homebrew app `zed` (1.23.3, updates itself). Rig sees it as present. The catalogue puts Zed in `core`, so both machines select it.
- **The Dock declaration:** in your chezmoi source, `dot_config/rig/conf.d/private_40-macos.toml` declares `[dock.workstation]` with `profiles = ["laptop"]`. Zed is in its item list, between Claude and Delta. There is no Dock layout for `studio` or `core`. This was a deliberate choice in your 9 October profile-split commit ("Keep today's Dock as laptop-only"), because Rig can't yet show one shared Dock with different apps on each machine.
- **KI-TOOL-RIG-CORE-042** ([record](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md)) is the Rig feature that would allow this: one ordered Dock list, where each item can be linked to an app and each machine shows only the apps its profile selects. It is approved and Ready at Next, but **it has not been built yet**.
- **What Rig says on sol** (Rig 0.6.3, default profile `studio`): `rig show dock:workstation` lists the layout with `Profiles: laptop`. `rig show --profile studio` includes the Dock _settings_ (tile size, autohide and so on) and `dockutil`, but no Dock layout. `rig doctor` and `rig status` check those settings and never mention the Dock layout. So Rig reports nothing wrong, because as far as it knows nothing is.
- **sol's Dock now** (28 apps): Path Finder, System Settings, iMazing, 1Password, Preview, Google Chrome, TickTick, Linear, Notion, Notes, Goodnotes, Obsidian, Granola, Raindrop.io, ChatGPT, Claude, Warp, Visual Studio Code, GitHub Desktop, Redis Insight, Beyond Compare, Slack, Messages, WhatsApp, Spark Desktop, Microsoft Outlook, Photos, Adobe Lightroom Classic. The Dock file was last changed today at 15:18 BST.
- **terra's Dock** (laptop profile, 36 apps) matches the declared layout. It includes Zed, plus NordVPN, ChatGPT Classic, Delta, LaunchControl, draw.io, Telegram, RendApp and The Tower, none of which are on sol's Dock. sol has Adobe Lightroom Classic, which terra doesn't, and Warp and Visual Studio Code are the other way round.
- **Not related to the upgrade failures:** those were Homebrew upgrades failing because sol's Command Line Tools are out of date (see `rig-upgrade-failures.report.md`). A failed upgrade leaves the installed app and the Dock alone, and Zed is installed and working.

### Cause and fix

- **Cause:** a gap in what's declared, which you chose while waiting for KI-TOOL-RIG-CORE-042. It isn't a Rig defect, and **running `rig apply` on sol won't fix it**: with nothing selected for the Dock, apply doesn't touch it.
- **Proper fix:** build KI-TOOL-RIG-CORE-042, then change the declaration in chezmoi. Move `dock.workstation` to `core`, link the machine-specific items to their apps (Delta for laptop, add Lightroom Classic for studio), then run `rig apply` on sol. That gives sol Zed and the rest of your shared order.
- **Stopgap while you wait:** either drag Zed onto sol's Dock (Rig won't undo it, because it doesn't manage that Dock), or add a second, studio-only Dock layout in chezmoi and apply it. I don't recommend the second layout: it copies the whole list and has to be removed again once KI-TOOL-RIG-CORE-042 is built.

### Side observations

- terra's chezmoi source has an uncommitted change that isn't mine in `private_40-macos.toml`: a new `default-application.svg` entry (open SVG files in Chrome). I left it alone.
- The chezmoi checkouts are not level: sol's is clean at `d7b4b5b` and terra's is at `4d07f9c`. I didn't check which is ahead.

### What I touched

Everything was read-only. On sol I listed `/Applications`, ran `brew list`/`brew info`, `rig --version`, `rig show`, `rig status` and `rig doctor`, and read the Dock contents and the Rig config. On terra I read the Rig and chezmoi files, the Dock contents and `rig doctor`. I made no applies, setting writes, Dock restarts or commits. I deleted two temporary helper scripts from terra's `/tmp`.

## What is in progress

Nothing. This run has finished.

## Outstanding queries

### SOL-DOCK-ZED - How to get Zed onto sol's Dock

**Summary:** sol's Dock isn't managed by Rig until KI-TOOL-RIG-CORE-042 is built. `rig apply` won't add Zed.

**Need from you:** choose a route.

**Recommendation:** drag Zed onto sol's Dock now, and prioritise KI-TOOL-RIG-CORE-042 (it's already Ready). Then a follow-up run can move the Dock to `core` with links for each machine and apply it on sol.

```text
SOL-DOCK-ZED: drag now + schedule 042 / build 042 now / interim studio Dock layout / leave — <notes>
```

### SOL-DOCK-EXTRAS - Which laptop Dock extras belong on sol

**Summary:** once the Dock is shared, sol would also get NordVPN, ChatGPT Classic, LaunchControl, draw.io, Telegram, RendApp and The Tower where they're selected for studio, and Lightroom Classic would need adding for studio. Your 9 October answer was "would need to check".

**Need from you:** say which of those you want on sol's Dock, or confirm "same as laptop wherever the app is installed".

**Recommendation:** same order as the laptop, filtered by what each profile selects, which is what KI-TOOL-RIG-CORE-042 gives by default.

```text
SOL-DOCK-EXTRAS: same as laptop where selected / list — <notes>
```

### Reply block

```text
SOL-DOCK-ZED: drag now + schedule 042 / build 042 now / interim studio Dock layout / leave — <notes>
SOL-DOCK-EXTRAS: same as laptop where selected / list — <notes>
```
