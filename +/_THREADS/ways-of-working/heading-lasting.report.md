# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › heading-lasting

**Run report at 03:12 BST · last mark 23:22 BST**

---

## Done

- **The problem.** A report heading opens with three `---` rules. When an agent saved those rules at the top of a report file, the file's first line was `---`, so Markdown tooling read the opening as a front-matter block. The ki-repo-kb metadata check (NOTE-1c, `note_type`) then flagged `+/_THREADS/knowledge-acquisition/handoff-review.report.md`. Two agents in the [knowledge-acquisition checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.knowledge-acquisition.md) went in opposite directions. First, `heading-fix` followed Kris's HEADING-AUDIT instruction of 2026-10-14, "Launch a Haiku agent to add a minimal front matter block above the heading of +/_THREADS/knowledge-acquisition/handoff-review.report.md and commit and push it", and committed 075f1057. Then `heading-trim` followed REPORT-HEADING-GATE from Master: state-of-play: "the ki-pmo standard already says a saved report file omits the three opening --- rules and begins at the # heading. Remove those three rules and their blank lines ... The lasting fix is forwarded to KI Model: ways-of-working." It removed the front matter and the rules in cb71a96f, and the outcome was recorded in d0935407. Both are in ki-principal and both are pushed. The heading-fix report was itself saved with real front matter, then a lint-disable comment, then the three rules.
- **The rule in prose.** The rule in the [ki-pmo standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md), "A saved report file omits them, because a file that begins with `---` is read as front matter; the file begins at the heading.", dates from ki-agentic-harness cf601d66, which delivered [KI-HARNESS-GOV-191 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/ab5abbb79c9f82f3f43b0c2f0507bc9ac4c6bb48/docs/roadmap/KI-HARNESS-GOV-191-banner-frame.md) on 2026-10-14. 8f447874 then reworded it. It is already in the ways-of-working checkpoint rule.
- **No lasting fix has landed.** I checked four places:
  - **ki-pmo rubric.** The [ki-pmo rubric](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/rubric.md) has no item that flags a saved report opening with `---` or front matter. PMO-7, the only mechanical item over `+/_THREADS/<run>/*.report.md`, checks record links only. PMO-6 is a judgement item about the heading in the report as given.
  - **ki-delegation footer.** The [ki-delegation run-prompt footer](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/assets/run-prompt.md) tells an agent how to shape the heading but never says the saved file must begin at the `#` heading.
  - **tools-ki launcher.** The launcher in `tools-ki/src/core/agent/` builds the prompt from that harness footer (`runs.ts`), adds the progress protocol and never reads or normalises a report.
  - **Open records.** No open record in either roadmap carries the fix. [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) (Next, draft, Project ways-of-working) is related. It plans a mark in front matter on Markdown that a run writes into a working area. That would give reports real front matter above the heading, so the lasting fix and that record have to agree.
- **Prose alone has not held.** Two reports committed in ki-principal after the rule was written still open with rules: `mac-studio-bootstrap/gate-fix` (d9a955e6, 2026-10-15 00:52) and `chezmoi/vault-left` (b3bc216b, 2026-10-14 22:23).
- **Scan.** I scanned 103 saved reports: 100 in ki-principal and 3 in ki-agentic-harness. None carries real front matter. Six open with `---` rules instead of the heading:
  - **ki-principal `chezmoi`: 2.** `vault-left.report.md` is committed, with the rules behind a `<!-- rumdl-disable-file MD041 -->` comment. `commit-fix.thread-copy.report.md` is untracked, from another session.
  - **ki-principal `mac-studio-bootstrap`: 1.** `gate-fix.report.md` is committed.
  - **ki-agentic-harness `skill-reviews`: 3.** `area-layout`, `functional-pass` and `regroup` are all untracked, from another session.
  - **Lint workaround.** Two further chezmoi reports, `burn-a` and `burn-order`, begin with the lint-disable comment and then the heading. That is a third, unstandardised variant.
  - **No edits.** I changed none of these files. They belong to other threads.
- **Commit.** I committed this report and `+/_THREADS/ways-of-working/decisions.md` to ki-principal by explicit path through a private index. The decisions log was already dirty when I started. Its only change was the coordinator's HANDED-OFF entry of 15 October that authorises this run, so I committed it as the brief asked. The commit identifier and the push result are given in the run's final message.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- The six offending reports belong to the chezmoi, mac-studio-bootstrap and skill-reviews threads. Each thread can trim its own reports at its next mark, or once the check below lands.
- The duplicate `heading-trim` queue entry that knowledge-acquisition noted is stale. No dispatcher runs it.

## Queries

### HEADING-LASTING - where the lasting report-heading fix sits

**Context:** The rule exists only as prose in the ki-pmo standard and the ways-of-working checkpoint, and two reports were committed against it after it was written. Nothing enforces or states it at the point where an agent writes the file. The rubric does not check it, the ki-delegation footer does not say it and the tools-ki launcher never touches reports. [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) (Next, draft, ways-of-working) already changes what a run writes into a working area and plans a front-matter mark on Markdown. Putting the heading rule in the same record settles in one place whether a report carries that mark. Launcher normalisation would rewrite agent output after the fact and would miss reports a coordinating thread writes interactively.

**Query:** Where should the lasting fix sit, and which record carries it?

**Options:**

a) (recommended) Widen [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) to carry two changes. The first is a mechanical ki-pmo rubric check: every `+/_THREADS/<run>/*.report.md` has as its first non-blank line the `#` report heading, or a front-matter block in the form that record settles and then the heading, never a bare `---` rule. The second is one line in the ki-delegation `run-prompt.md` footer saying the saved file begins at the heading. No new record.

b) Add only the footer line to `run-prompt.md`, under a new KI-HARNESS GOV record captured through `ki-next`, with no rubric check.

c) Make the tools-ki launcher strip leading `---` rules from a run's report when the run finishes, under a new KI-TOOL-KI-CLI record captured through `ki-next`.

```text
HEADING-LASTING

Widen KI-HARNESS-GOV-175 (/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) to carry the lasting report-heading fix. First, add a mechanical ki-pmo rubric check: every +/_THREADS/<run>/*.report.md has as its first non-blank line the # report heading, or the front-matter block that record settles and then the heading, never a bare --- rule. Second, add one line to the ki-delegation run-prompt.md footer saying the saved file begins at the heading. Create no new record.
```

```text
╭─ run report · 2026-10-15T02:12:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] HEADING-LASTING
- [committed] heading-lasting report and decisions log, push result in the run's final message

```text
Resume heading-lasting under current ki-pmo and ki-delegation since 23:22 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
