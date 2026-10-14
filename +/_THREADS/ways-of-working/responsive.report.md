# responsive - owner report

Run `ways-of-working`, agent `responsive`, 2026-10-13, under [Decision 15](</Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md>).

## Plain summary

1. The written rule is right but nothing enforces it: a thread reads the standard once, and by the thirtieth turn it is buried behind reports and diffs while the system prompt is re-supplied every turn.
2. Mechanically, a turn blocks until it ends, Claude Code queues or (on Escape) kills your message's target, and only detached `ki agent` runs are out of reach; the work you have been pre-empting was always in-thread or in-session work.
3. Behaviourally, doing the task is one read and one edit while delegating is four tool calls, so the model drifts, and compaction then preserves what it did rather than what it was told.
4. The report now carries the principle in your words at the top and six enforcement layers, weakest to strongest: the opener's role line, a per-message hook (Claude Code and Codex both have the event), a counted turn budget, cheaper `ki agent` launch, wait and recap, a lighter coordinator, and a measured acceptance test.
5. The pilot must carry layers 1, 2, 3 and 6; `COORD-HOOK` now decides only when the hook is built and how wide.

## What has been done

- Diagnosed why the Coordinator responsiveness rules in the [`ki-delegation` background-run standard](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md>) (revision `70606d77`) are not holding, split into runtime mechanics and model behaviour, checked against Claude Code 2.1.287 (`claude --help`, the binary's queue, interrupt and compaction strings, the local hook documentation and your chezmoi-managed `settings.json`), Codex CLI 0.162.1 (`codex --help`, `codex queue`, its hook events including `UserPromptSubmit` with `additionalContext`, `hooks = true` in your `config.toml`, no `hooks.json` registered) and `tools-ki`'s runtime adapters. Inferences are labelled in the text.
- Amended [the merged report](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-report.md>): new section "The responsive coordinator" near the top with your verbatim message, the three rules, the diagnosis and a six-layer enforcement table; the principle threaded through the Summary, PMO (a Responsiveness rule set with a counted budget), Delegation and `ki agent` (mechanical support and a child marker so the hook stays silent in background agents), Continuity (re-bootstrap after compaction and model switch, no schema change), Coordinator model and effort (lighter model as a layer, responsiveness test added to the `fast` gate), the pilot and Wave C; `COORD-HOOK` folded in as layer 2 and rewritten as decision 9 covering only timing and scope; Models and environment records this amendment; three entries added to Changes after review citing Decision 15.
- Verification: `rumdl` clean on the file and the repository; `ki repo audit --repo .` shows no new FAIL (the three remaining FAILs predate this run: the checkpoint's `updated_at` format, GitHub topics versus keywords, and the Enactment anchor in `CLAUDE.md`/`AGENTS.md`); pre-commit hooks (lint-staged with `rumdl --fix`, syncpack, commitlint) passed; the diff touches only `Streams/Projects/ways-of-working/design/change-management-report.md`.
- Commit `c5a8307` on `main` in ki-principal, Conventional Commit `docs(ways-of-working): ...`, staged by explicit path, trailer `Co-Authored-By: Claude Opus 5.5` as the prompt instructed. Limitation: the launch record shows this run on Claude Fable 5.1 at high effort, so the trailer names a model other than the one that wrote it.
- `git pull --rebase` ran: `main` was already level with `origin/main`; the push would be a fast-forward.
- Not pushed: see `PUSH-RESP` below. No checkpoint, `Admin`, `Pillars`, `Resources` or other repository was changed.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- Retained design material: the counted turn budget (at most five tool calls a turn; reads limited to the checkpoint, `ki agent status`, one report and one short file) and the hook's one-line text are proposals in the report for you to bottom out; nothing in any skill, tool or chezmoi source was changed.
- Verification limitation: whether `claude -p` runs hooks, and whether Codex's interactive session queues a mid-turn message the same way as Claude Code, are inferred and marked so in the report; the proposed `KI_AGENT_RUN` child marker makes the hook safe either way.
- Verification limitation: the Claude Code `SessionStart` `compact` matcher is cited from Claude Code's published documentation, not verified locally.

## Outstanding queries

### `COORD-HOOK` - When is the salience hook built, and how wide?

- **Summary:** The hook is now settled in the design as enforcement layer 2: one line injected on every owner message in a coordinating thread, on Claude Code and Codex, with a post-compaction injection, silent in any agent `ki agent` launched, script shipped by the harness beside its existing hooks and registered through chezmoi. Both runtimes carry the event today. The open question in [the checkpoint](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md>) is left for you to update.
- **Need from you:** Choose (a) build both runtimes' hooks before the pilot opens, as the pilot record's first task; (b) Claude Code first, Codex when the first Codex coordinating thread opens; or (c) after the pilot, only if the acceptance test shows the opener and counted budget do not hold alone.
- **Recommendation:** (a). It is one script and two configuration entries, and the pilot's acceptance test cannot say which layers hold if the hook arrives after it.

### `PUSH-RESP` - Push of the amendment commit

- **Summary:** `main` in ki-principal is two commits ahead of `origin/main`: my `c5a8307` and `c3db5dc` (`docs(checkpoint): record notification record and owner-report standard`), which the coordinating thread made before this run. The footer forbids pushing commits I did not make without asking, and a push would carry both.
- **Need from you:** Confirm the push of both commits, or push yourself.
- **Recommendation:** Say "PUSH-RESP push both" and I, or the coordinating thread, push fast-forward; both commits are on `main` and the push is a plain fast-forward.

```text
COORD-HOOK - build both runtimes' hooks before the pilot opens, as the pilot record's first task (option a).
PUSH-RESP - push both commits c5a8307 and c3db5dc on ki-principal main fast-forward.
```
