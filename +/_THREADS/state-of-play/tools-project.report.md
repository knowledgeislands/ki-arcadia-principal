# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › tools-project

**Run report at 01:03 BST · last mark 16:14 BST**

---

## Done

- The [Tools burndown Project](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md) is up as a flat note under [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md), matching most siblings. It carries Kris's TOOLS-PROJECT words, the scope and exclusions, the inventory table and the history pointer to +/_THREADS/tools-burndown/. It is listed in [Projects](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/Projects.md) and in the Initiative note's Notes.
- Inventory, records in scope per repository: `tools-ki` 14, `tools-mgit` 0, `tools-git-almanac` 0, `ki-agentic-harness` 0. Of the 14 `tools-ki` records, seven are triage, one is Ready / Now, one is in progress, one is awaiting review, three are Draft / Next and one is Draft / Hold. All six open harness records are skill or standard work, not the CLI, so they are left out. `tools-ki` [KI-TOOL-KI-CLI-139](https://github.com/knowledgeislands/tools-ki/blob/6e9b32aa/docs/roadmap/KI-TOOL-KI-CLI-139-ebu-sources-sync.md) is on origin but not yet in the local checkout, which is two commits behind and was not pulled. Its link therefore points at GitHub.
- The checkpoint [platform-foundations.tools-burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/platform-foundations.tools-burndown.md) is created with `state: active`. Its pick-up block reads rest, not yet opened, with a fresh-bootstrap resume line and the next steps. The Messages from Master block holds REPO-GIT-HYGIENE in Kris's words with its three steps, and STALE-BRANCHES, AUTOMATION-BRANCHES, UNPUSHED-COMMITS and STAGING-LEFTOVERS folded into it. That line cites the digest-churn and hold-branches reports, and the query-review report once it exists.
- One correction: the label is `KI > Foundations > tools burndown`, Kris's own words in TOOLS-PROJECT, rather than the brief's `Fnd: tools-burndown` (LABEL-FORM).
- The existing +/_THREADS/tools-burndown/ files are untouched.
- Committed as `970880d`, with this report in a second commit; the repository's pre-commit gate passed. The push result is in the footer list.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- The thread still has to be opened from its checkpoint. Its first act is REPO-GIT-HYGIENE.
- OLD-THREAD-FOLDERS still covers +/_THREADS/tools-burndown/.

## Queries

### LABEL-FORM - Which thread label the checkpoint carries

**Context:** The brief asked for the label `Fnd: tools-burndown`. Kris's TOOLS-PROJECT words name the thread "KI > Foundations > tools burndown", which is also the `<Space> > <Initiative> > <project in words>` form adopted on 15 October. The checkpoint uses Kris's form.

**Query:** Should the checkpoint keep `KI > Foundations > tools burndown`?

**Options:**

a) (recommended) Keep `KI > Foundations > tools burndown`, as Kris worded it, and use it in the opener.

b) Change it to `Fnd: tools-burndown`, as the brief worded it.

### PROJECT-OVERLAP - Records that already name another Project

**Context:** Six of the 14 `tools-ki` records name another Project. [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md), [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md), [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) and [KI-TOOL-KI-CLI-130](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-130-skill-generated-surfaces.md) name ways-of-working. [KI-TOOL-KI-CLI-125](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md) names agent-host, and [KI-TOOL-KI-CLI-128](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-128-granola-retention-safeguards.md) names knowledge-acquisition. The Project note says this Project burns them down with their owning threads rather than taking them over. The checkpoint's working rules say the same.

**Query:** Should those six records keep their Projects and be burned down through the owning threads?

**Options:**

a) (recommended) Keep their Projects; the tools burndown thread works the eight unassigned records directly and asks the owning threads, through state-of-play, to close the other six.

b) Reassign all 14 to `tools-burndown` so one thread owns the whole roadmap.

```text
LABEL-FORM

Keep the checkpoint label `KI > Foundations > tools burndown`, as Kris worded it in TOOLS-PROJECT, and use it in the opener.

---

PROJECT-OVERLAP

Keep the Projects on KI-TOOL-KI-CLI-123, 125, 126, 127, 128 and 130; the tools burndown thread works the eight unassigned tools-ki records directly and asks the owning threads, through state-of-play, to close the other six.
```

```text
╭─ run report · 2026-10-16T00:03:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] LABEL-FORM
- [waiting] PROJECT-OVERLAP
- [committed] Project note, checkpoint and this report, pushed

```text
Resume Master: state-of-play under current ki-pmo and ki-delegation since 2026-10-15T15:14:39Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
