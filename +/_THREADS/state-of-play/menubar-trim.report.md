# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › menubar-trim

**Run report at 21:52 BST · last mark 21:52 BST**

---

## Done

- **Trimmed [KI-TOOL-RIG-CORE-053](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-053-macos-menu-bar-declarations.md) to report-only.** It stays an unadopted Triage record. Rig now only reports menu-bar drift: icons out of order, Apple modules shown or hidden differently from the declaration, an app's icon missing, or a menu-bar app that does not start at login. `rig apply` changes nothing in the menu bar. Kris drags the icons into order once on each Mac. Dropped: writing icon positions, turning Apple's modules on or off, and restarting Control Centre.
- **Captured [KI-TOOL-RIG-CORE-056](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-056-menu-bar-order-persistence.md)** (draft, horizon `future`, kind `investigate`). It asks where macOS stores menu-bar order between restarts, covering each app's `NSStatusItem Preferred Position` value and the Control Centre settings. It then asks whether Rig could ever declare that order safely. It is limited to reading, and any experiment uses a throwaway app.
- **Committed and pushed** to tools-rig `main` as a fast-forward: `d716b57` reserves the record number and `0dd86a8` holds both records. Both commits are mine, and no other session's commits went with them. `ki repo audit` passed with no failures and one existing warning: there is no committed pre-commit hook. The working tree had no uncommitted work from another session when I ran, so nothing was disturbed.

## In Progress

Nothing.

## Queries

### MENUBAR-MODULES

**Context** Kris chose "Rig reports drift only, no enforcement". I applied that to the whole menu bar, so Rig no longer turns Apple's own modules on or off either, such as Battery, Sound or the clock date. The earlier proposal had Rig set those because the setting is reliable. Clock, Siri and hot-corner values can still be set with Rig's existing setting kind in Kris's personal configuration.

**Query** Is report-only right for Apple's own modules too?

**Options** a) (recommended) Keep it report-only, as now committed. Kris sets the modules by hand once on each Mac, as with the icon order. b) Let Rig turn Apple's modules on or off and restart Control Centre, and report only for other apps' icon order.

```text
MENUBAR-MODULES

Keep KI-TOOL-RIG-CORE-053 report-only for Apple's own menu-bar modules as well; Kris sets them by hand once on each Mac, as with the icon order.
```

```text
╭─ run report · 2026-10-14T20:52:06Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] MENUBAR-MODULES

Resume: reply with the block above, or "continue" to take the recommended option.
