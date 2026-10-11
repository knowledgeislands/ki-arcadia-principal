---
note_type: streams/design
updated: 2026-10-11T02:38:00Z
author: Written with Claude
---

# Hosts

**For:** Kris Brown - **Project:** [[mac-studio-bootstrap|Mac Studio bootstrap]], with [[Initiatives/rig|Rig]] - **Date:** 2026-10-11

The estate's machines, by name, with the machine type and operating system of each.

| Name    | Machine type | OS     |
| ------- | ------------ | ------ |
| `vega`  | agent-host   | Ubuntu |
| `sol`   | studio       | macOS  |
| `terra` | laptop       | macOS  |

---

## Naming

The Rig profiles (`core`, `laptop` and `studio`) and the Cheztoi host profile (`--host`, `target_host`) take their names from this table.

## Omarchy

Moving `vega` to Omarchy is a separate, future idea. It concerns the agent host, so it belongs to the [[agent-host]] Project, not to this one.
