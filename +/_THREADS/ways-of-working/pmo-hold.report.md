# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › pmo-hold

**Run report at 22:35 BST · last mark 16:09 BST**

---

## Done

- **RESTART-SET, HOLD-MODEL, HOLD-VERBS and HOLD-BANNER** are adopted into the [ki-pmo standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md) from the [restart-model design note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/restart-model.md):
  - **Glossary:** hold is the state, and drain and resume are the activities. Kris's words are quoted: "I am guessing a Mark is a point in time and a Hold / Drain is a Mark + stopping all work" and "hold is a better word than drain".
  - **Draining a thread:** rewritten so that a thread drains to a hold. The pick-up block's status `hold` replaces `State: drained`, and the section adds the territory hold: coordination threads drain first, and state-of-play drains last, naming the threads that restart.
  - **Picking up a thread:** a new section. It carries the full status, resume line and first-on-resume table for each banner and thread type, the combinations that cannot occur, and the rule that every banner rewrites the block and a mark rewrites its heading.
  - **Hosts:** no thread state or resume line names a host, so "on sol" is gone.
  - **Hold report:** closes with the HOLD frame exactly as rule 5 draws it, with every framed line 52 code points. Then come its list, "To bring this thread back and continue the work, paste this:" and the resume line. The DRAINED frame is retired.
  - **Generated surfaces and rubric:** the hook line, the ki-coordinator output style and the PMO-6 rubric are regenerated to match, along with `SKILL.md`, the catalogue line, HARN-013 in `docs/specs/harness.md` and the banner tests.
- **PUSH-BENEATH:** the new ki-pmo section "Pushing beneath other sessions" and ki-delegation's Coordination › Pushing line now quote Kris: "each agent session commits its own work. And if there's a need or it has little confidence in the other commits that are stacked up with it, that's flagged to me, and I will then push if I'm happy with the push. If it's only their commits, then them committing and pushing is absolutely fine though."
- **CHECKPOINT-MESSAGES:** "Directions from the state-of-play thread" is now the messages block. It sits beneath the pick-up block at the top of the receiving checkpoint, and the receiving thread acts on each line and then removes it. The hook line now says this.
- **STATE-OF-PLAY-ROLE:** the thread-types table now calls state-of-play "the coordination thread of coordination threads", and quotes in full that it "can write directly into the projects and the checkpoints of the other coordination threads".
- **Source reviews:** the eighteenth ki-pmo source review and a ki-delegation review entry quote each decision inline.
- **Checks:**

  | Check | Result |
  | --- | --- |
  | ki-pmo banner and hook tests | pass |
  | `bun run test` | 1188 pass, 1 fail† |
  | `bunx tsc --noEmit` | cannot run‡ |
  | `ki repo audit --skill ki-delegation` | PASS |
  | `ki repo audit --skill ki-checkpoint` | PASS |
  | `ki repo audit --skill ki-pmo` | FAIL, 4 findings§ |
  | `ki dev skill generate ki-pmo` | 7 surfaces in sync |
  | rumdl on the changed Markdown | clean |
  | Biome on the changed TypeScript | clean, with 1 warning¶ |

  † The failing test is `hooks/commit-msg.test.ts`: `bunx commitlint` cannot find `@commitlint/config-conventional`, because the harness on sol has no `node_modules`.

  ‡ It stops at `TS2688: Cannot find type definition file for 'bun'` and `'node'`, for the same missing `node_modules`.

  § All four are PMO-7 findings in Kris's committed `+/_THREADS/skill-reviews/` reports: [KI-HARNESS-GOV-193](https://github.com/knowledgeislands/ki-agentic-harness/blob/c092431687d3542e55058cecd545e816a1dbadcf/docs/roadmap/KI-HARNESS-GOV-193-area-diagrams-with-html.md) is unlinked or points at a file that is not there. These are fleet findings from `0df81f40`, not from this change.

  ¶ The warning predates this change, in `pmo.test.ts:47`.

## In Progress

Nothing is running.

- **Uncommitted:** the 14 changed files sit in the harness primary checkout on sol, on `main`, level with `origin/main`. Nothing was committed or pushed. sol has no commit gate: `core.hooksPath` is unset, `.git/hooks` holds only samples and `node_modules` is absent. `AGENTS.md` says "A declared audit or hook that cannot run is unknown, not a pass: stop and report the activation step it needs". Waiting on GATE-INACTIVE.
- **Retracted package fetches:** while formatting I ran `bunx prettier` by mistake; it fetched Prettier into the bunx cache and reformatted two test files. I reverted that, and the files are formatted with the repository's own Biome. `bunx` also fetched Biome and commitlint transiently. No repository lockfile or dependency changed.

Outstanding - no action requested now:

- **Changed files:**
  - `hooks/coordinator-reminder.sh` and `hooks/coordinator-reminder.test.ts`
  - `output-styles/ki-coordinator.md`
  - `docs/specs/harness.md`
  - `skills/README.md`
  - `skills/change-management/ki-pmo/SKILL.md`
  - in `skills/change-management/ki-pmo/references/`: `standards-pmo.md`, `rubric.md` and `sources.md`
  - in `skills/change-management/ki-pmo/scripts/`: `banner.test.ts`, `generate/index.ts` and `rubric/items/threads.ts`
  - in `skills/governance/ki-delegation/references/`: `standards-background-runs.md` and `sources.md`
- **Commit to make once the gate runs:** one commit, `feat(ki-pmo): adopt the hold, the pick-up block, the messages block and pushing beneath other sessions`, with the trailer `Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>`.
- **Tweaks for the review around 21 October, under SHAPE-FREEZE:**
  - HOLD-MODEL's "it should put a mark as a thing in the banner" is already met by the hold report's form line, which carries the mark. Kris may still want the mark shown in the frame.
  - The hold resume line in the output style is the coordination thread's. State-of-play and conversational threads take theirs from the pick-up table.
  - The legacy heading anchor `#directions-from-the-state-of-play-thread` is kept for the messages block, so existing links still resolve. A rename can wait for the review.
- **Not edited, as the brief set:** the ways-of-working checkpoint and its message lines; [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) (SYNC-GUARD); and `docs/diagrams/`.

## Queries

### GATE-INACTIVE - activate the harness commit gate on sol before committing

**Context:** All the edits are in place, and every ki-pmo test passes. Committing requires the pre-commit and commit-msg gate, plus `bunx tsc --noEmit` and the commit-msg test, and all of these need the harness dependencies installed. sol has no `node_modules` and no `core.hooksPath`, so a commit would go through with no gate at all. The brief forbids package installs, and `AGENTS.md` forbids committing past a gate that cannot run.

**Query:** Will you activate the gate on sol so that this change can be committed and pushed?

**Options:**

a) (recommended) Run `bun install` in the harness on sol, whose `prepare` script sets `core.hooksPath`. Then relaunch `pmo-hold`, or a short follow-up run, to rerun `bun run test` and `bunx tsc --noEmit`, commit the 14 files by explicit path through the gate, pull with rebase and push fast-forward.

b) Authorise a commit on sol now with the checks as run here, leaving TypeScript and the commit-msg test unverified until the gate is active.

### PICKUP-HEADING - render the pick-up block as a bold line, not an H2

**Context:** The restart-model design note draws the pick-up block under an H2. `ki-checkpoint`'s mechanical audit fails any checkpoint whose headings are not exactly the H1 and its six ordered sections, so the standard now opens the block with the bold line `**Pick-up - mark <UTC> (<local time>)**`. The messages block uses the same bold-line form.

**Query:** Should the pick-up block keep the bold-line heading?

**Options:**

a) (recommended) Keep the bold line, so that every checkpoint passes `ki-checkpoint` unchanged.

b) Amend `ki-checkpoint` to admit an optional `## Pick-up` H2 before `## Objective`, and switch the standard to it.

```text
GATE-INACTIVE

Run bun install in /Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness on sol so that core.hooksPath and node_modules are in place, then relaunch pmo-hold to rerun bun run test and bunx tsc --noEmit, commit the 14 changed files by explicit path through the gate as feat(ki-pmo): adopt the hold, the pick-up block, the messages block and pushing beneath other sessions, pull with rebase and push fast-forward.

---

PICKUP-HEADING

Keep the pick-up block's bold-line heading in ki-pmo's Picking up a thread, so that checkpoints keep ki-checkpoint's closed heading sequence.
```

```text
╭─ run report · 2026-10-15T21:35:39Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] GATE-INACTIVE
- [waiting] PICKUP-HEADING
- [uncommitted] 14 harness files on sol, gate not active

```text
Resume KI Model: ways-of-working under current ki-pmo and ki-delegation since 16:09 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
