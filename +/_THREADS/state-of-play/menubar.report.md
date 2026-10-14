# menubar — owner report (Decision 185)

## Done

- **Read-only inventory of terra and sol.** Nothing was written on either Mac. The differences Kris noticed are real, and most come from which apps run rather than from settings:
  - CodexBar and FluidVoice are installed on sol, but they are not login items there and are not running.
  - Control Centre shows different modules in the menu bar on each Mac. terra shows Battery, Siri, Timer and Weather; sol shows Sound, Screen Mirroring, Bluetooth and Now Playing.
  - The clock shows the date on terra but not on sol.
  - Hot corners differ: none on terra, Quick Note in the bottom right on sol.
  - Login items differ. The Dock has 36 apps on terra and 28 on sol.
  - Neither Mac runs a menu-bar manager. Ice is installed on sol but has never been set up. terra has leftover Ice and Bartender settings but neither app.
  - Keyboard, Finder, trackpad and screenshot settings already match on both Macs.
- **What Rig has today.** Rig can set single `defaults` values: 55 are declared, all in `core`. It can also set an ordered Dock. It has nothing for the menu bar, hot corners, the clock or login items. It cannot use `-currentHost` and does not restart the app that reads a setting after changing it.
- **Design proposal**, captured as the unadopted Triage record [KI-TOOL-RIG-CORE-053](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-053-macos-menu-bar-declarations.md). It holds the side-by-side table and four parts:
  1. Settings get two optional fields: a current-host scope, and a restart of ControlCenter, Dock or Finder after a write.
  2. A new ordered menu-bar layout, built like the Dock. One list serves both Macs, and each profile filters out the items it does not use. Rig turns Apple's own menu-bar items on or off. For other apps' icons it only reports when they are out of order.
  3. A check that each menu-bar app is set to start at login, because an icon only appears while its app is running.
  4. Kris's own choices go in their chezmoi Rig configuration: shared items in `core`, Battery in `laptop`.

  The record also says what cannot be set reliably: the exact positions of other apps' icons, the Control Centre controls gallery, and anything connection-critical.
- **Pushed** to tools-rig `main` as a fast-forward: one commit reserving the record number, then the record itself. `ki repo audit` passed with one existing warning (no committed pre-commit hook), and `assemble-rig --check` passed. No other threads' commits were pushed with these.

## In progress

Nothing.

## Needs the owner

- **[MENUBAR-ORDER]** How should Rig keep menu-bar icons in order?
  - (a) Rig reports when the order is wrong, and you drag the icons back into place once on each Mac.
  - (b) Rig quits each app, writes its icon position, then reopens it. This is fragile because positions are pixel offsets that change with screen and icon widths.
  - (c) Use a menu-bar manager such as Ice to do the ordering.

  **Recommendation: (a).** It is the only option that stays reliable. Once you have chosen, Rig can drop the other options from [KI-TOOL-RIG-CORE-053](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-053-macos-menu-bar-declarations.md) before planning. Separately, starting CodexBar and FluidVoice at login on sol would remove most of the visible difference. That change belongs in your personal configuration.

```text
MENUBAR-ORDER: a / b / c — 
```
