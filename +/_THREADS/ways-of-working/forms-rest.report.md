# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › forms-rest

**Run report at 22:37 BST · last mark 16:09 BST**

---

## Done

- Confirmed that forms-harness's reply-forms commit `f23c1ccc` is on ki-agentic-harness `origin/main`, so Phase 1a could go ahead.
- **chezmoi:** made edits 5.7 to 5.9 from the [reporting-forms report (deleted)](https://github.com/knowledgeislands/ki-principal/blob/528b53b1cddabb0bb4fb809a426a08baac75fa8b/+/_THREADS/ways-of-working/reporting-forms.report.md) exactly as drafted, after re-reading each target. The edits are in `dot_claude/private_communication.md`, in `dot_codex/private_AGENTS.md.tmpl` (lines 20-21) and in both branches of `dot_claude/private_delegation.md.tmpl`. They are committed locally as `d1a6e6d` (`docs(claude,codex): point reporting at the ki-pmo reply forms`). Nothing is applied or pushed.
- chezmoi gate: `rumdl check .` is clean. `node --test` gives 248 passes and 2 failures, and `ki repo audit --repo .` gives one failure. None of these failures comes from this change: the same two tests fail on a clean checkout of the previous `HEAD`. They are `tests/ki-self-skill.test.mjs` and the wrapper-reporter exit-40 test. The audit failure is RUNTIMES-3, because the `.claude/skills/ki-self` projection is missing.
- **ki-principal:** made edit 5.10 to `AGENTS.md`. I also added one workstream line, "Reply forms and session identity, 2026-10-16", to the [Ways of working Project note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md). Both are in commit `e1cb6e8` (`docs(agents): align commits with the ki-pmo reply forms`). The first commit attempt failed the gate on STREAM-9, because a registry note must not list work records. I removed the KI-HARNESS-GOV-198 link from the line, and the scoped gate then passed.
- Pushed `e1cb6e8` and this report to ki-principal `origin/main` fast-forward. No other session's commit was beneath them. The brief's footer said never to push, while step 3 and the common rules under ROUTINE said to push, so I followed step 3.
- Under CONV-CHECKPOINT I left intake untouched.

## In Progress

Nothing is running in this run.

Outstanding - no action requested now:

- Another session's work in ki-principal is uncommitted: `+/_THREADS/chezmoi/decisions.md` is modified and `+/_THREADS/desk-kit/setup-note.report.md` is untracked. I left both untouched. The gate also notes malformed frontmatter in `+/_THREADS/desk-kit/cam-check.report.md` and `webcam-compare.report.md`. This is outside my scope and belongs to that session.
- The two failing chezmoi tests and the RUNTIMES-3 audit failure predate this run and are for the chezmoi Project to pick up.
- The chezmoi commit `d1a6e6d` is local only, on the Mac in `~/.local/share/chezmoi` on branch `main`.

## Queries

### CHEZMOI-APPLY - review and apply the reply-forms guidance

**Context:** Edits 5.7 to 5.9 are committed locally in chezmoi as `d1a6e6d` but are not yet applied. Until they are, your live `~/.claude/communication.md`, `~/.claude/delegation.md` and `~/.codex/AGENTS.md` still describe the old single report shape. Below is the output of `chezmoi diff` for those three targets. It contains no secrets, and no other target is affected.

```diff
diff --git a/.claude/communication.md b/.claude/communication.md
index 39432ecc0d3be363d6adc5ae484ffe140829d487..088ad297a64d97a03db0a0e5a75d8fd5fe60ba5e 100600
--- a/.claude/communication.md
+++ b/.claude/communication.md
@@ -5,8 +5,8 @@
 - During work, give a timestamped update (local time, e.g. `20:45 CEST`) at least every few minutes and at each change of activity: one or two plain-language lines on what is happening and what comes next, with no technical detail. Raise a failure, blocker, or decision that needs the user immediately.
 - Tool-heavy work is quiet too: do not narrate routine tool calls, commands, passing checks or ordinary command output, and never let technical or tool output substitute for a plain-language progress summary. Commentary covers only material outcomes, decisions, blockers, changed assumptions and useful review links.
 - Do not relay subagent reports, command output, commit SHAs, check results, or step-by-step narration; report only the outcome.
-- End a unit of work with the owner report the `ki-delegation` background-run standard defines: what has been done, what is in progress, and outstanding queries under stable Needs tags with a copyable reply block. The level sets only its depth.
-- An owner report, and the full summary form, is a complete deliverable: no output style, proxy shaping block or communication level shortens its sections, its queries or its reply block, as the `ki-delegation` Reporting section states.
+- Reply in the three forms the `ki-pmo` standard's Reply forms section sets: a plain conversational reply by default, with no report sections, reply block or "No reply needed"; the owner report (Done, In Progress, Queries and a copyable reply block) when a unit of work ends, as that section defines it; and the coordinator forms only in a coordinating thread. The level sets only the report's depth.
+- An owner report, and every coordinator summary, is a complete deliverable: no output style, proxy shaping block or communication level shortens its sections, its queries or its reply block.
 - Give details, evidence, and rationale only when asked.
 
 The other levels are `standard` (outcomes, material context, and exceptions) and `detailed` (plan, progress, validation, and rationale); the owner report keeps its shape at every level. An explicit current-thread request takes precedence over a repository instruction, which takes precedence over this default. Never let a quieter level hide a failure, a required decision, or a material risk.
diff --git a/.claude/delegation.md b/.claude/delegation.md
index 22021c2a8accc36aff0118d98d05a860ae4ccb11..ae29bb1c28020937ef85fe345ee4e579c53f02c9 100600
--- a/.claude/delegation.md
+++ b/.claude/delegation.md
@@ -2,5 +2,5 @@ # Delegation
 
 The `ki-delegation` skill owns the background-run contract: detachment, the run packet, prompt shape and brief-writing rules, authority footers, the decisions log, coordination, the run queue and monitoring. `ki agent` is its launcher (`ki agent --help`, `man ki`). This file keeps only personal preferences.
 
-- In Claude Code, delegate substantive work to detached background agents by default, launched with `ki agent launch` or `ki agent queue`, not in-session background subagents.
-- The user sees only the one-line status updates and the final owner report in the shape `ki-delegation` sets, at the level `communication.md` sets.
+- In a coordinating thread in Claude Code, delegate every unit of work to detached background agents, launched with `ki agent launch` or `ki agent queue`, not in-session background subagents. A conversational thread does bounded work directly and may delegate the same way.
+- The user sees only the one-line status updates and, when a unit of work ends, the owner report, in the reply forms `ki-pmo` sets, at the level `communication.md` sets.
diff --git a/.codex/AGENTS.md b/.codex/AGENTS.md
index 5665373758427701298210f25d15a4c2671ff159..7b7fd1e3d5a5f97437ab0c00dff299fa7bd6f5c4 100600
--- a/.codex/AGENTS.md
+++ b/.codex/AGENTS.md
@@ -13,8 +13,8 @@
 - During work, give regular timestamped updates (local time, e.g. `20:45 CEST`) at least every few minutes and at each change of activity. Each update is one or two plain-language lines saying what work is happening and what comes next - no technical detail. Raise a failure, blocker, or decision that needs the user immediately.
 - Tool-heavy work is quiet too: do not narrate routine tool calls, commands, passing checks or ordinary command output, and never let technical or tool output substitute for a plain-language progress summary. Commentary covers only material outcomes, decisions, blockers, changed assumptions and useful review links.
 - Do not relay subagent reports, command output, commit SHAs, check results, or step-by-step narration. Absorb them and report only the outcome.
-- When giving a completed-work report, use the owner-report shape defined by `ki-pmo` and referenced by `ki-delegation`, including its required sections, Needs tags and copyable reply block. Ordinary conversational replies, acknowledgements and clarifications do not require report headings or a reply block. Follow `ki-pmo` for the distinction between conversational and coordinating threads; the communication level sets only a report's depth.
-- An owner report, and the full summary form, is a complete deliverable: no output style, proxy shaping block or communication level shortens its sections, its queries or its reply block, as the `ki-delegation` Reporting section states.
+- Reply in the three forms the `ki-pmo` standard's Reply forms section sets: a plain conversational reply by default, with no report sections, reply block or "No reply needed"; the owner report (Done, In Progress, Queries and a copyable reply block) when a unit of work ends, as that section defines it; and the coordinator forms only in a coordinating thread. The level sets only the report's depth.
+- An owner report, and every coordinator summary, is a complete deliverable: no output style, proxy shaping block or communication level shortens its sections, its queries or its reply block.
 - Give details, evidence, and rationale only when asked.
 
 Treat messages arriving while work is in progress as steering unless they expressly replace or cancel prior instructions. Before the final response, reconcile all visible material messages, including decisions made after a draft summary. If a queued message was not reasonably actionable before the previous response, address its still-relevant content in the next response rather than treating that summary as closure. Do not infer queue versus steer solely from message timing when the runtime does not expose it.
```

**Query:** Will you review this diff, apply it and push the chezmoi commit?

**Options:** a) (recommended) Review the diff above, then run `chezmoi apply ~/.claude/communication.md ~/.claude/delegation.md ~/.codex/AGENTS.md` yourself and push `d1a6e6d` from `~/.local/share/chezmoi`. b) Hold the apply and send back the wording you want changed first.

```text
CHEZMOI-APPLY

I have reviewed the chezmoi diff in forms-rest's report and will run chezmoi apply ~/.claude/communication.md ~/.claude/delegation.md ~/.codex/AGENTS.md myself, then push d1a6e6d from ~/.local/share/chezmoi.
```

```text
╭─ run report · 2026-10-16T21:37:50Z ──────────────╮
│                                                  │
│  █▀▀▄ █  █ █▀▀▀ █  █   · thread busy             │
│  █▀▀▄ █  █ ▀▀▀█  ▀█▀   · running or queued work  │
│  █▄▄▀ █▄▄█ ▄▄▄█   █    · lines below say which   │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [waiting] CHEZMOI-APPLY
- [committed] ki-principal `e1cb6e8` and this report, pushed
- [unpushed] chezmoi `d1a6e6d`, awaiting CHEZMOI-APPLY
