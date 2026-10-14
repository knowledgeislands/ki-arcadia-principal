# hooks-diagnose: why threads regress after compaction (Decision 170), resting

Read-only diagnosis. Nothing changed, committed or pushed. The fix belongs to the ways-of-working thread.

## What has been done

### Finding: the hook is deployed but has never fired in the master thread

- **The hook exists and is registered for both runtimes.** [coordinator-reminder.sh](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/hooks/coordinator-reminder.sh) is committed and documented in [hooks/README.md](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/hooks/README.md). chezmoi registers it from [coordinator-hook.yaml](/Users/krisbrown/.local/share/chezmoi/.chezmoidata/coordinator-hook.yaml) through [coordinator-hook-registrations-json](/Users/krisbrown/.local/share/chezmoi/.chezmoitemplates/coordinator-hook-registrations-json). It is applied to [~/.claude/settings.json](/Users/krisbrown/.claude/settings.json) (`UserPromptSubmit` and `SessionStart` with matcher `compact`) and to [~/.codex/hooks.json](/Users/krisbrown/.codex/hooks.json), and both Codex trust hashes are in [~/.codex/config.toml](/Users/krisbrown/.codex/config.toml). The matcher is correct.
- **It has been silent in every Zed thread, so the master thread never received it.** The master thread runs in Zed through the Claude Agent SDK (`claude-acp`, entrypoint `sdk-ts`). In that setup no process in the hook's ancestry has a controlling terminal. The hook's `has_terminal` check treats "no terminal" as "launched by `ki agent`" and exits silently. Its reminder line never appears in the master transcript, including after this morning's 00:46 BST compaction. Other hooks from the same settings file (`Stop`, `PreToolUse`) do fire in that session, so registration is not the problem. Replaying a `SessionStart`/`compact` payload without a terminal gives no output.
- **Why the terminal check exists:** the hook's own marker, `KI_AGENT_RUN`, is unreleased. It reached tools-ki source on 2026-10-13, after `v0.10.1`, and installed `ki` is 0.10.1, so this agent runs without it. Its other guard, `CLAUDE_CODE_PRINT_BG_WAIT_CEILING_MS`, is set in `ki agent` Claude children (including this one) but not in Zed threads. Claude can therefore be told apart without the terminal check. Codex agents cannot, until `ki` ships the marker.
- **Even when it fires, the reminder is too thin to restore behaviour.** The one line covers delegation, responsiveness, cadence and the name "owner report". It says nothing about quiet-level brevity, banners, the three report forms, the checkpoint or re-reading the skill. After compaction the shape itself is what gets lost.
- **Nothing else is in play.** ki-principal's [.claude/settings.json](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/.claude/settings.json) and `settings.local.json` have no hooks. There are no `PreCompact` or `PostCompact` hooks anywhere. No other thread has uncommitted `hooks/*` work: the harness is clean and has no other worktrees. The plan-stamp, plan-sync and lock-check hooks are unrelated.

### What the skill already provides

[standards-background-runs.md](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md) already owns all the behaviour:

- Coordinator responsiveness (line 41), and line 56 already describes the hook.
- Owner report and levels (lines 148–215, including the quiet-level depth at line 213).
- Coordinating-thread forms (line 219).
- Bootstrap, including a one-line re-bootstrap opener (lines 307–316).
- Thread working rules and "Refreshing this guidance" (lines 324–368).

What is missing:

1. **No compaction trigger.** "Refreshing this guidance" lists bootstrap, checkpoint updates and skill changes, but not "after compaction".
2. **No skill-name-only re-bootstrap form.** The documented form needs the Project name.
3. **No short re-anchor step list** for a compacted thread to run before its next reply.

### Recommendation: the smallest change

Put each behaviour in the skill and make the hook only a trigger.

1. **Skill, in `standards-background-runs.md`** (owner: ways-of-working thread, harness `KI-HARNESS-*` record of its choosing):
   - Add a `### Re-anchoring after compaction` subsection under Thread working rules. It covers: after compaction, or when the owner says `Re-bootstrap ki-delegation.`, the thread, before its next reply:
     - re-reads Coordinator responsiveness, Reporting and Thread working rules;
     - re-reads its checkpoint, including the mark, open Needs queries and the `ki-delegation read at` revision;
     - checks `ki agent status`;
     - confirms in one line, then answers in the owner-report form at the owner's level.
   - Add "after compaction" to the "Refreshing this guidance" triggers.
   - Accept `Re-bootstrap ki-delegation.` as the name-free form in Bootstrap, with the thread taking its Project from its checkpoint label.
   - Update line 56 so it names the new subsection.
2. **Hook, in `hooks/coordinator-reminder.sh` and its test:**
   - On `SessionStart`/`compact`, emit a pointer to that subsection, for example: `Context was compacted. Before replying, follow "Re-anchoring after compaction" in ki-delegation (standards-background-runs.md): re-read the rules and your checkpoint, then confirm in one line.`
   - Keep the current one-liner for `UserPromptSubmit`.
   - Drop the terminal check for Claude, because the print-ceiling guard already covers `ki agent` children. Keep it for Codex only until a tools-ki release ships `KI_AGENT_RUN`, then drop it entirely.
   - No chezmoi change is needed: the registration and matcher stay the same, and the Codex trust hashes cover handler entries, not script contents.
3. **Message Kris can push into any thread now, with no deployment:**

```text
Re-bootstrap ki-delegation: re-read Coordinator responsiveness, Reporting and Thread working rules in standards-background-runs.md and your checkpoint, then confirm in one line and use the owner-report form from now on.
```

## What is in progress

Nothing. This run is complete.

## Outstanding queries

### HOOK-FIX - hand the fix to ways-of-working

- **Summary:** the reminder hook is silent in every Zed thread because of its terminal check, and its text is too thin to restore behaviour after compaction.
- **Need from you:** approval to route the skill and hook change above to the ways-of-working thread.
- **Recommendation:** approve. The ways-of-working thread delivers the skill subsection first, then the hook change with its test.

### KI-MARKER-RELEASE - release tools-ki with `KI_AGENT_RUN`

- **Summary:** Codex agents can be told apart from interactive threads only once `ki` ships the run marker. The marker sits unreleased after tools-ki `v0.10.1`.
- **Need from you:** a decision on whether to include it in the next tools-ki release, under the release-on-demand policy.
- **Recommendation:** release it with the next tools-ki patch. Until then, Codex keeps the terminal check.

```text
HOOK-FIX - approve; route the skill subsection and hook change to ways-of-working
KI-MARKER-RELEASE - include KI_AGENT_RUN in the next tools-ki patch release
```
