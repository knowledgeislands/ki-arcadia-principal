# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio setup](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › launcher-footer

**Run report at 21:34 BST · last mark 21:32 BST**

---

## Done

- Stopped before writing or committing. No record was written, no ID was reserved and nothing was committed. Two things stopped the run:
  - **The shared tools-ki checkout is mid-rebase.** An interactive rebase of `main` onto `c058981a` started at 08:51 today. It stopped on a conflict in [KI-TOOL-KI-CLI-139](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-139-ebu-sources-sync.md), with 3 of 22 steps done and seven other roadmap records staged. A commit now would go into that rebase. Another session's work is in it, so I left it alone.
  - **The request is already open in tools-ki.** [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md), "Launch footer follows brief", is in Next as a draft under tools-burndown. It covers the same fault: the footer is stricter than the approved brief, and it blocks fetches. It also covers the two report paths. Its Out list excludes "inferring authority from free text in the brief", but a quoted approval in the brief is exactly what this handoff asks the launcher to accept. A new record would duplicate [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md) and conflict with that exclusion.
- Found the footer source to cite. `footer()` in [`src/core/agent/runs.ts:72`](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/core/agent/runs.ts) reads `rules-<tier>.md` from the `ki-delegation` assets and cuts it from the first `## Rules`. `composePrompt` appends it at [line 177](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/core/agent/runs.ts). The tiers `none`, `push`, `prune` and `release` are listed in [`src/core/agent/context.ts:9`](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/core/agent/context.ts). This brief showed the cut is wrong: its footer starts with the stray text "`## Rules` onwards. See the background-run standard", which [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md) already describes.
- Confirmed the evidence. The 15 October reports [push-trio](https://github.com/knowledgeislands/ki-principal/blob/84e5882/+/_THREADS/mac-studio-setup/push-trio.report.md), [site-push](https://github.com/knowledgeislands/ki-principal/blob/84e5882/+/_THREADS/mac-studio-setup/site-push.report.md) and [chezmoi-ue086](https://github.com/knowledgeislands/ki-principal/blob/84e5882/+/_THREADS/mac-studio-setup/chezmoi-ue086.report.md) each say the appended footer ("never push", "no remote call") contradicted the brief's quoted approval. This brief has the same contradiction.
- Checks: none run, because no code or record changed.

## In Progress

Nothing running. The record is waiting on the two queries below.

## Queries

**FOOTER-RECORD**

**Context:** [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md) already tracks this fault, from the 14 October `sol-fix` run. It considers three fixes: a fifth tier, named grants such as `--allow fetch`, or "a footer that defers explicitly to the brief's cited decision". Its Boundary rules out inferring authority from free text in the brief. This handoff adds three things: the 15 October push evidence, the RESEARCH-FOOTER approval (read-only web search, `git fetch` and named read-only SSH), and the ask that the footer give way to remote calls named in the brief with a quoted owner approval while staying strict by default.

**Query:** Should the handoff go into [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md) or into a new record?

**Options:** a) (recommended) add a dated cross-repository handoff note from Knowledge Islands Principal (mac-studio-setup) to the Discussion of [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md), with the 15 October evidence and RESEARCH-FOOTER. Mark it not blocking, and ask that the Boundary's free-text exclusion be revisited so that a remote call named in the brief with a quoted approval, or a launch flag, can lift the footer. Leave priority and plan to tools-ki.

b) Write a new triage record that names [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md) as related.

c) Drop the handoff, because [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md) already covers it.

**FOOTER-REBASE**

**Context:** Another session left the tools-ki checkout mid-rebase at 08:51 today (`main` onto `c058981a`, with a conflict in [KI-TOOL-KI-CLI-139](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-139-ebu-sources-sync.md) and 19 steps left). No commit can safely go in until that rebase is finished or aborted, and that decision belongs to the session or person that started it.

**Query:** How should the record get committed?

**Options:** a) (recommended) once the rebase is finished and `main` is clean, relaunch this run with the FOOTER-RECORD answer. It commits only `docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md`, or the new record under b), by explicit path, locally, with no push.

b) Commit in a separate `git worktree` on `main` now, leaving the rebase alone.

```text
FOOTER-RECORD - a) add a dated, not-blocking handoff note from Knowledge Islands Principal (mac-studio-setup) to KI-TOOL-KI-CLI-134's Discussion with the 15 October push-trio, site-push and chezmoi-ue086 evidence and RESEARCH-FOOTER, asking that its free-text exclusion be revisited so a brief-named remote call with a quoted owner approval, or a launch flag, can lift the footer, strict by default; priority to tools-ki
FOOTER-REBASE - a) after the tools-ki rebase is finished and main is clean, relaunch launcher-footer with the FOOTER-RECORD answer; commit only the touched roadmap file by explicit path, locally, no push
```

```text
╭─ run report · 2026-10-16T20:34:00Z ──────────────╮
│                                                  │
│  █  █ █▀▀█ █    █▀▀▄   · run stopped             │
│  █▀▀█ █  █ █    █  █   · nothing committed       │
│  █  █ █▄▄█ █▄▄▄ █▄▄▀   · 2 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [held] launcher-footer stopped on FOOTER-RECORD and FOOTER-REBASE; nothing written in tools-ki
- [blocked] the tools-ki checkout is mid-rebase from 08:51 with a conflict in [KI-TOOL-KI-CLI-139](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-139-ebu-sources-sync.md); another session owns it
- [queries] FOOTER-RECORD, FOOTER-REBASE

Resume: answer FOOTER-RECORD and FOOTER-REBASE, finish or abort the tools-ki rebase, then relaunch launcher-footer.
