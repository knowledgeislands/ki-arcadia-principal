# Owner report: thread signal and noise

## What has been done

- Investigated, read-only, everything that rewrites owner prompts and tool output or shapes model output on Claude Code and Codex: the Headroom proxy (input compression, tool-output compression, output shaping, effort routing), the Claude Code `Concise` output style, the coordinator reminder hook, and the Codex config, instructions and hooks. Nothing was changed: no setting, hook, chezmoi source or credential.
- Wrote the section **Thread signal and noise** into the change-management report, with the evidence table (what each layer does, when it arrived in the chezmoi history, whether it alters Kris's words or the formats), the risk to the thread contract, the cadence answer, and four owner decisions with options and a recommendation each: `PROMPT-PROTECT`, `COORD-STYLE`, `HOOK-LINE`, `CODEX-NOISE`. Added the changes-after-review entry. Kris's words are quoted inline; no decision numbers are used.
  - Report: [change-management-report.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-report.md), section at the heading `## Thread signal and noise` (line 462), log entry at the end of `## Changes after review`.
- Verified: `ki repo audit --repo .` FAIL=0 (two pre-existing STREAM-10 warnings on `paperclip-bootstrap-and-recovery` and `website`, unrelated); pre-commit hooks passed; the diff touched only the design folder, one file, 42 insertions.
- Committed `258388b` on `main` ("docs(ways-of-working): add Thread signal and noise to the change-management report") with the required trailer, staged by explicit path; `git pull --rebase` was already level; pushed fast-forward to `origin/main`.

Findings in brief, for the coordinator:

- **Kris's words are lost in flight, not on disk.** The Headroom proxy's default `coding` savings profile turns on user-message compression (`compress_user=True` in every proxy log since 2026-09-22; routing since 2026-06-18). Only the newest owner turn is protected; earlier turns are compressed by Kompress, which keeps numbers, paths, flags, capitals, negations and modals and drops function words. The transcript file holds Kris's messages verbatim; the stripped wording appears only in the coordinator's own entries from 22:42 on 2026-10-13. The decisions log therefore holds a lossy copy of Kris's answers. Lever, not applied: `HEADROOM_COMPRESS_USER_MESSAGES=0` on the `init-user` profile, to be declared in chezmoi under [KB-DOTFILES-UE-087](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-087-manage-headroom-profile-arguments.md).
- **Format squeezing has three sources, none from 2026-10-13.** Claude Code's `Concise` output style (chezmoi, 2026-08-27) says its rules win over other formatting guidance and is restated by Claude Code on every turn; Headroom's output shaper (flags from 2026-08-25) appends a verbosity block to the system prompt on Claude Code and to `instructions` on Codex, with autotune able to rise to a level that forbids rationale; Headroom's effort router lowers effort on mechanical turns. Tool output is compressed on both runtimes, so any agent reading a transcript or report through the shell sees a lossy copy.
- **Cadence was not captured.** The coordinator hook carries only the three responsiveness rules. The timestamped-update requirement lives only in `~/.claude/communication.md` and `~/.codex/AGENTS.md`; the `ki-delegation` standard's Coordinator responsiveness section and HARN-012 do not carry it. Sources: [coordinator-reminder.sh](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/hooks/coordinator-reminder.sh), [harness.md](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/specs/harness.md), [standards-background-runs.md](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md), [communication.md](/Users/krisbrown/.claude/communication.md).

## What is in progress

Nothing. The run is complete.

## Outstanding queries

The four decisions are in the report for Kris; the recommendations are: `PROMPT-PROTECT` (a) exempt user turns via the proxy env, plus log-in-the-turn and verify-by-file-read rules in `ki-delegation`; `COORD-STYLE` (c) a coordinating-thread output style shipped by the harness, with (a) the one-sentence "never shortened" rule applied now; `HOOK-LINE` (b) add a twenty-token cadence clause naming the owner-report form; `CODEX-NOISE` (a) and (b) nothing Codex-specific beyond removing the unmanaged "Headroom Learned Patterns" block from `~/.codex/instructions.md`.

Needs-Decision: the four decisions above, for Kris in the report.

Needs-Note: the decisions log entry for Kris's 2026-10-13 answers was written from the compressed in-flight view; the verbatim text is in the transcript at `/Users/krisbrown/.claude/projects/-Users-krisbrown-workspaces-knowledge-islands-ki-principal/514bc6f3-c7af-460a-b5db-35ee00080979.jsonl` (user entry at 2026-10-13T22:40:22Z) if the coordinator wants to correct the log.

Dirty file left untouched: `/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md` (another session's edit).

```text
PROMPT-PROTECT: a | b | c
COORD-STYLE: a | b | c
HOOK-LINE: a | b | c
CODEX-NOISE: a | b | c
Correct the decisions-log quotation from the transcript: yes | no
```
