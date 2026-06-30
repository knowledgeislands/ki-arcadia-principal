---
tags:
  - card/note
  - topic/mcp
  - topic/git
  - topic/knowledge-islands
source: claude
status: current - June 2026
---

# Git Audit

MCP server that walks a tree of git repositories and reports on their state. Source: `mcp-git-audit` (Knowledge Islands workspace).

## Tools

**Inspection**

`git_repos_audit` — scans a configured root directory recursively, returning branch name, working-tree cleanliness, ahead/behind count relative to upstream, last-commit metadata, and fetch age for each repository found.

**Optional mutations** (require elevated access level)

`git_repo_fetch`, `git_repo_pull`, `git_repo_push`

## Notes

Used as a fleet-wide housekeeping view: surfaces stale branches, uncommitted work, or repos that have drifted from their remote without needing to `cd` into each one. Does not replace per-repo `git status`.
