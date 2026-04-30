---
tags:
  - card/note
  - topic/productivity
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
author: Written with Claude
memory_file: feedback_{ki_prefix}_operations.md
---

# Linear Sync

## Overview

A daily scheduled task that reconciles Linear's initiative and project state against the island. Catches naming drift, missing projects in stream notes, and initiatives that have concluded and need their stream notes archived.

The authoritative rules for naming conventions, lifecycle management, project labels, and the Initiative → KI Mapping table are in [[Knowledge Capital/Activities/Linear/Linear|Linear Workspace]]. Generic MCP query patterns and browser-based interaction rules are in [[Tools/Linear/Linear]].

---

## What It Does

Using the Linear MCP, fetches all active and planned initiatives and their projects, then compares them against the Initiative → KI Mapping table in [[Knowledge Capital/Activities/Linear/Linear|Linear Workspace]]. Specifically checks:

- **New or removed initiatives** - creates or archives stream notes, Pillars notes, and Resources company profiles as needed, and updates the mapping table
- **Initiative name drift** - names changed in Linear but not reflected in the island
- **Project naming conventions** - enforces bracket spacing and hyphenation rules per [[Knowledge Capital/Activities/Linear/Linear|Linear Workspace]]
- **Stream note project coverage** - ensures every uncompleted project under an initiative appears in the corresponding stream note's projects table

All fixes are applied directly - project renames in Linear via `save_project`, island note updates via file writes.
