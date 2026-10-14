# principal-tidy (SNAPSHOT-LOGS and PRINCIPAL-HTML) - report

## What has been done

- Kris's decision "SNAPSHOT-LOGS - b" is enacted: interim tracked copies of the two threads' decisions logs and every `*.report.md` from `~/.local/state/ki/agents/state-of-play/` and `~/.local/state/ki/agents/ways-of-working/` now live in [+/_THREADS/state-of-play/](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/>) (decisions log plus 130 reports) and [+/_THREADS/ways-of-working/](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/>) (decisions log plus 46 reports), in the flat layout [KI-HARNESS-GOV-180](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md>) plans (`decisions.md` and `<name>.report.md` directly in the thread folder). No prompt, launch record, status, pid, log, queue or worktree file was copied. The source files were not edited. `+/_THREADS/` is not ignored, so no ignore change was needed.
- Screening before copying: a pattern sweep for tokens, keys, passwords and private-key blocks found nothing. A sweep for legal, personal and medical terms found only workspace, repository and project names. Two state-of-play reports were omitted as doubtful because they name a family-court casework Initiative, at Initiative-name level only: `territory-masters.report.md` and `baseline-fixes.report.md` (the latter quotes a commit subject). Both remain in the state folder for you to judge.
- Two departures from byte-identical copies, forced by the repository's pre-commit hook: the Markdown formatter (rumdl, which the hook runs with `--fix`) applied 98 formatting-only fixes across 41 copies (blank lines around lists, emphasis style, bare-URL brackets, code-fence languages); and `+/_THREADS/ways-of-working/coord-hard.report.md` gained one leading `<!-- rumdl-disable MD051 -->` line because two of its anchors point into another document. Its content is otherwise identical to the source.
- Kris's decision "PRINCIPAL-HTML - a" is enacted: [change-management-skills.html](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/diagrams/change-management-skills/change-management-skills.html>) rebuilt from the committed source by the `ki-diagrams` local route (`archify finalize architecture ... --quality showcase --json`, update check disabled, no network). All four gates pass (validate, deliver, check, browser-check) with zero diagnostics; the four receipts sit beside the HTML. One finding: the source's authored repository evidence names `ki-agentic-harness`, so `--repo-root` had to point at the harness checkout, not the Principal; with the Principal as root the validate gate fails with an origin mismatch. [mark.toml](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/diagrams/change-management-skills/mark.toml>) names thread `KI Model: ways-of-working`, run `ways-of-working`, agent `principal-tidy`, the UTC time and the source path, in the same shape as the harness marks. `+/diagrams/` is visible and now tracked in the Principal (the harness keeps its own untracked).
- Commits in `ki-principal`, explicit paths, co-author trailer, pre-commit hook passing (rumdl, Biome, `ki repo audit`): `135fe9e` docs(threads): snapshot state-of-play and ways-of-working decisions logs and reports; `90f0ca9` docs(diagrams): rebuild change-management-skills interactive HTML with mark. `ki repo audit` reports two pre-existing STREAM-10 warnings (Projects `paperclip-bootstrap-and-recovery` and `website` have no open records), unrelated to this run. `git pull --rebase` replayed both commits over one upstream commit (`6185ea1`, another session's checkpoint commit); pushed fast-forward `6185ea1..90f0ca9` to `origin/main`; the checkout is level with origin.
- Not touched: any checkpoint, `Admin`, `Pillars`, `Resources`, the state-folder sources, other repositories. No `--no-verify`, no force, no package install, no remote call beyond the pull and the one push.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- The copies are a one-time snapshot. Until `tools-ki` ships the launcher change, the thread must re-copy at each mark as KI-HARNESS-GOV-180 plans; reports that land after this run are not in the tracked folder.
- Retained material: the rebuild receipts beside the HTML, now tracked.

## Outstanding queries

### [OMITTED-REPORTS](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/>) - two state-of-play reports left out as doubtful

- Summary: `territory-masters.report.md` and `baseline-fixes.report.md` mention a family-court casework Initiative by name (no case detail). The brief said to omit and name anything doubtful, so they stayed in the state folder.
- Need from you: whether they may be copied as they are.
- Recommendation: copy them; an Initiative name is not private legal content, and the thread history is more complete with them.

```text
OMITTED-REPORTS - <copy / leave> territory-masters.report.md and baseline-fixes.report.md into +/_THREADS/state-of-play/.
```
