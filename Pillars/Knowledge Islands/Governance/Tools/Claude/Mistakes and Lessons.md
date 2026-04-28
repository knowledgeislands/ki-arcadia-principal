---
tags:
  - card/note
  - topic/productivity
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Human-readable incident register for Claude KI operational errors; lessons are extracted to auto-memory files and do not require this note to be loaded at session start
author: Written with Claude
memory_file:
  - feedback_{ki_prefix}_operations.md
  - feedback_{ki_prefix}_notion_tag_updates.md
  - feedback_{ki_prefix}_multi_column.md
  - feedback_any_context_limit_warning.md
---

# Mistakes and Lessons

## Overview

A closed-loop incident register for mistakes made during island operations - file creation, routing, automation, and daily note tasks. When Claude gets something wrong, the error is logged here, the fix is applied to the relevant auto-memory file, and the resolved lesson is recorded permanently in the table below.

This note is a **human-readable reference**. All lessons are extracted to auto-memory and are active in every session without this file needing to be loaded. See [[CLAUDE]] for the incident logging workflow.

---

## How It Works

1. **Log it** - record the incident below with date, description, and root cause
2. **Fix it** - apply the fix (update the relevant auto-memory file, correct the KI file, adjust routing)
3. **Audit it** - confirm the fix is permanent and won't recur
4. **Summarise** - move the resolved lesson to the table below; delete the log entry

Keep this file lean. The Incident Log should be empty most of the time.

---

## Incident Log

Log active mistakes here. Delete each entry once the fix is applied and the lesson recorded below.

---

## Resolved Lessons

| Date | What went wrong | Root cause | Fix applied |
| --- | --- | --- | --- |
| 14-03-26 | `rm` failed with "Operation not permitted" on island files; fell back to redirect stubs instead of requesting permission | Did not know about `mcp__cowork__allow_cowork_file_delete` tool; assumed deletion was permanently blocked | When `rm` fails with "Operation not permitted" on a mounted island path, immediately call `allow_cowork_file_delete` - do not work around it |
| 17-03-26 | Write tool failed with "File has not been read yet" on multiple files in a single session | Write and Edit both require the file to have been read in the current session before they will accept a write - this resets between sessions | Always use the Read tool on a file before attempting to Write or Edit it, even if the content is known |
| 17-03-26 | Edit tool failed with "File has been modified since read" after another operation touched the same file | The Edit tool tracks file modification timestamps; any change between the Read and the Edit invalidates the read | If an Edit fails with this error, re-read the file immediately and retry - do not attempt to work around it |
| 01-04-26 | Could not rename a Cowork project folder path when the folder was actively mounted | The mounted folder path is locked by the OS while in use; `mv` fails with "Device or resource busy" | Rename the folder in Finder or Terminal while Cowork is not using it, then update the path in `~/Library/Application Support/Claude/local-agent-mode-sessions/<account-id>/<org-id>/spaces.json` - restart the Claude desktop app afterwards for the change to take effect |
| 08-04-26 | Notion MCP `update_properties` returned 200 success but tags were silently not saved on Notion wiki database pages | Notion's API blocks custom property updates on wiki databases via the MCP/public API - success responses are misleading | Use the Claude in Chrome integration to set tags via Notion's internal `/api/v3/saveTransactions` API (cookie-authenticated). Command is `addSelectOptionAfter` with `args: {option: "Value"}`. Batch all pages into one transaction. Capture the exact format by monkey-patching `window.fetch` if unsure. Never rely on the Notion MCP `update_properties` for wiki database property values. |
| 10-04-26 | Chrome coordinate clicks for Linear UI elements (title field, filter button, save button) were unreliable - often hit adjacent elements or missed entirely | Linear's UI elements are small and densely packed; fixed coordinates diverge from actual positions at different zoom levels or window states | Use `find` to get element refs and click via ref. Pair title field clicks with `cmd+a` before typing. Fall back to coordinates only when `find` cannot locate an element. Full patterns documented in [[Pillars/Knowledge Islands/Governance/Tools/Linear/Linear\|Linear]] - Browser-Based View Management. |
| 10-04-26 | KI-wide Related Topics sections had three systematic errors: (1) duplicate parent index entries where the self-referencing entry came first and the correct parent second - a naïve "keep the first" fix preserved the wrong one; (2) `## Related Topics` headings immediately followed by list items with no blank line; (3) grandparent index links present alongside the true parent index | Notes were authored with self-referencing parent index entries; the blank-line rule was not enforced; some notes accumulated links two levels up. On the first bulk-fix attempt, "keep first" ordering logic was used without verifying which entry was actually correct | When bulk-fixing parent index entries, derive the correct parent from the file's path (immediate containing folder's index), not from entry order. See updated rules in [[Pillars/Knowledge Islands/Governance/Conventions/Notes\|Notes]] - Parent index rule and Lists. |
| 17-04-26 | Used raw HTML `<table><td>` wrapper to place a mermaid chart beside a markdown table in a KI note; rendered poorly in Obsidian | HTML tables do not reliably render fenced mermaid blocks or nested markdown tables in Obsidian's live preview - the layout looks broken even when blank lines are used around the inner content | For multi-column layouts in the HNR KI, use the [Modular CSS Layout plugin](https://github.com/efemkay/obsidian-modular-css-layout) syntax: a `> [!multi-column]` callout containing nested `> [!blank]` callouts (one per column). Every line inside each column - including mermaid fences and markdown table rows - must be prefixed with `>> `. Do not fall back to HTML `<table>` for layout purposes. |
| 18-04-26 | Context limit hit mid-task during a multi-step email triage run; session continued via summary in a new context without warning the user | No proactive monitoring for context window depletion; the transition appeared seamless from the model side but caused continuity loss for the user | When context is running low, warn explicitly - state what's been done and what remains. When resuming after a limit, open with a clear statement that the context was exhausted, not a silent continuation. Never let a context limit look like normal task completion. |

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Claude|Claude]] - parent index
- [[CLAUDE|CLAUDE]] - the CLAUDE.md instruction file that references this note as a pre-flight check
