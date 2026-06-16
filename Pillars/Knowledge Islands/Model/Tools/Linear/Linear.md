---
tags:
  - card/note
  - topic/knowledge-management
  - topic/automation
  - topic/mcp
  - source/claude
status: current - April 2026
author: Written with Claude
---

# Linear

## Overview

Linear is used for issue tracking and project management. It integrates with the island ecosystem via MCP and via browser-based interaction
through Claude in Chrome.

---

## MCP Integration

Linear is connected as an MCP server, providing tool-based access to issues, projects, cycles, and documents directly from Claude sessions.
See [[Tools/Integrations|Integrations]] for the full list of MCP-connected services for this island, and [[Tools]] for the generic
integrations index.

---

## Browser-Based View Management

When interacting with Linear's UI via Claude in Chrome, the following patterns apply:

- **Use `find` for element references** - Linear's UI elements are small and densely packed. Fixed pixel coordinates are unreliable across
  zoom levels and window states. Always use `find` to get an element reference and click via ref.
- **Title field interaction** - pair title field clicks with `cmd+a` before typing, to ensure the existing text is selected and replaced.
- **Coordinate fallback** - only fall back to fixed coordinates when `find` cannot locate the target element.
