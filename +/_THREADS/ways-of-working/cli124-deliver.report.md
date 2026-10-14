# Owner report: KI-TOOL-KI-CLI-124 agent run close

Run `ways-of-working`, agent `cli124-deliver`, in `tools-ki`. Approval, in Kris's words: "approve KI-TOOL-KI-CLI-124".

## Done

- [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md) is delivered and sits at `awaiting-review` on `main`, pushed fast-forward to `origin/main` at `81cdf04`. Baseline `91e6e0b` (the approval commit). Four commits, all with the Co-Authored-By trailer:
  - `docs(roadmap): approve KI-TOOL-KI-CLI-124`
  - `feat(agent): write the decisions log and reports to the tracked thread folder`
  - `feat(agent): add close with a reconcile gate`
  - `docs(roadmap): move KI-TOOL-KI-CLI-124 to awaiting review`
- `ki agent` now keeps runtime files in the state folder and writes the knowledge files, `decisions.md` and each `<name>.report.md`, to the owning repository's tracked `+/_THREADS/<run>/`. It never commits them. The first `launch`, `queue`, `new` or `decide` fixes the thread home (Git top level of the working directory or `--repo <dir>`), records it in `thread.json`, and refuses outside a repository. Decisions carry UTC-seconds timestamps and an optional `home:` line from `decide --home`; `ki agent reconcile <run> <number> <home>` writes or replaces one. This follows Kris's decision as received: "tracked +/_THREADS/<thread>/ for the decisions log and agent reports; state folder keeps runtime only."
- `ki agent close <run> [--delete] [--compress] [--accept-exited <name>...] [--reconciled] [--repo <dir>]` gates on: every agent `DONE` or accepted, no dispatcher, queue and `worktrees/` empty, every decision housed in a Git-tracked path or a registered roadmap record, thread folder committed and clean. Each line prints `ok` or `blocker`; any blocker exits 1 and changes nothing. Archive to `_archive/<run>/` by default, tarball or delete on request, with a close note naming each decision's home or the `--reconciled` waiver.
- Aligned with [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md), already `done`: the new skeleton's `+/_THREADS/<run>/decisions.md` and `<report path>` placeholders are both filled.
- Docs updated: README `ki agent` section, both `Background agents` sections of `man/ki.1` with `man/ki.commands.json` regenerated, `docs/guides/user/background-agents.md` (new "Close a run" section), CHANGELOG command surface and behaviours.
- Verification: 1152 tests pass at 100% coverage on every metric; `tsc`, biome, mandoc lint and the dependency-cruiser boundary gate clean; `ki repo audit --skill ki-work-roadmap` passes; `ki repo audit --skill ki-engineering` on the merged checkout shows only the pre-existing CI-1 warning. Temp-repo transcript matched the record's Verify step exactly (untracked home blocked with exit 1; after commit every line `ok` and `_archive/t/close.md` written). Read-only `ki agent close ways-of-working` printed 60 blockers, exit 1, and changed nothing.
- Worktree `cli124` removed and its branch deleted. No other file was touched; the `+/_THREADS` folder of this run was not created (the run predates the change and keeps its state-folder log).

## In progress

Nothing.

## Outstanding queries

- **Needs: release decision.** The change is merged, not released. The installed `ki` lacks the tracked home and `close` until a release or `ki dev local on`. Kris said any further `tools-ki` release must ask first, so a release is needed and awaits the word.
- **Needs: acceptance.** The record awaits review through `ki-accept`.
- **Needs: ruling on checkpoint homes.** The gate treats a decision housed under `+/_CHECKPOINTS/` as unhoused where that folder is git-ignored, though the standard names the thread's checkpoint as a durable owner. Options: accept `--reconciled` as the route, or let a checkpoint path count as housed when the file exists.
- **Noted, no reply needed.** Two small additions beyond the Steps' letter, recorded in the review packet: `newPrompt` fills `<report path>`, and `close` reads a legacy state-folder `decisions.md` when no tracked log exists so old runs gate on real decisions. The planned gate between the two commits (thread reads the first report before `close` starts) was not observed because the brief asked for both in one run and the harness wording had already landed.

```text
release KI-TOOL-KI-CLI-124: yes | no, later
accept KI-TOOL-KI-CLI-124: yes | changes: <what>
checkpoint homes: reconciled waiver | count checkpoint path as housed | other: <what>
```
