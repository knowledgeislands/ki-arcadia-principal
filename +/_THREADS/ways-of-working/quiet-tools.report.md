# Owner report - quiet-tools

Applies Kris's decision, verbatim: "QUIET-TOOLS - (a) coordinator rule in ki-delegation plus restore the quiet-tool-work sentence in communication.md." Decision source: `/Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md` (Decision 27, 2026-10-14).

## Done

- **chezmoi** - restored the quiet tool-work sentence, tightened, as a bullet under the `quiet` level in `dot_claude/private_communication.md` and `dot_codex/private_AGENTS.md.tmpl`. Wording recovered from `git log -p` of commits 9e9d13e and 31aa259 ("Do not narrate routine tool calls, commands, passing checks, or ordinary command output ... never let technical or tool output substitute for a plain-language progress summary"). `chezmoi diff` reviewed, `chezmoi apply` run for `~/.claude/communication.md` and `~/.codex/AGENTS.md` only; the post-apply diff is empty. Commit f2ced1e `docs(agents): restore the quiet tool-work sentence`. Pushed fast-forward to `origin/main` (8ff0758..f2ced1e) under Kris's decision "PUSH-CHEZMOI - yes; push chezmoi fast-forward after quiet-tools." The push carried three earlier local commits by Kris from other sessions (264341f, f62f1f2, fba0911) that the fast-forward necessarily included.
- **ki-agentic-harness** - added a **Tool calls** rule to Coordinator responsiveness in `/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md`: every coordinator tool call is short; never paste a prompt, brief or long text inline in a command (write prompt files out of sight with `ki agent new` or a one-line copy); delegate lookups needing more than one or two short reads; no raw tool output in replies. Commit 71d7a0fd `docs(ki-delegation): add the coordinator tool-call rule`, local only.
- **Checks** - `ki repo audit --skill ki-delegation` PASS; `bun run test` 1112 pass, 0 fail; `bunx tsc --noEmit` clean; pre-commit hook (lint-staged, rumdl, staged-snapshot `ki-skills` audit) passed with FAIL=0. Two pre-existing WARNs in the ki-skills audit (sources.md refresh cadence overdue) are fleet findings, not new.

## In progress

- Nothing.

## Pending handoff

- **PUSH-HARNESS hold honoured.** The three commits named in the brief (38bff4fd, dfc92f15, b053086a) are now on `origin/main`. However `main` still carries two further commits from another session that are not on `origin`: 49fde031 `docs(roadmap): restore Kris's verbatim words in KI-HARNESS-GOV-179 and KI-HARNESS-GOV-180` and df08e1e5 `feat(ki-repo-harness): generate a skill map beside the skill graph`. Per "wait for the other session; push ours once its commits land", 71d7a0fd stays local on `main` in `/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness`. Nothing behind `origin`, so a later `git push` is a fast-forward.
- Untouched dirty paths left in place: harness `+/diagrams/` (untracked), chezmoi `dot_config/rig/conf.d/private_56-firewall.toml` (untracked).

## Needs

- **PUSH-HARNESS-2** - When the other session's two commits (49fde031, df08e1e5) are on `origin`, may the harness commit 71d7a0fd be pushed, or should the next harness run push all three together?

```text
PUSH-HARNESS-2 - 
```
