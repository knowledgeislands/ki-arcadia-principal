# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › inception-type

**Run report at 22:09 BST · last mark 22:05 BST**

---

## Done

- **First look, what exists.** A Project in the [Projects registry](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/Projects.md) has no type, kind or stage field: only `lifecycle` (`planned`, `active`, `paused`, `completed`, `cancelled`), per the harness [Project registry standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work/references/standards-project-registry.md). The nearest shape is the evaluation-stage pattern in the [areas-proposal report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/areas-proposal.report.md) (a `planned` Project whose Outcome is a decision, ideas in Notes or `design/`, no records or thread, capped), still Kris's open AREAS-PATTERN; [delta-evaluation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/delta-evaluation.md) already works that way. ChatGPT reaches the island only through `krisb/acquire` (`/Users/krisbrown/workspaces/personal/acquire`): a chat bootstraps from its README, reads `context/chatgpt/` and one territory summary, and captures itself under `captures/<territory>/chatgpt/` by CAPTURE-CHATGPT.md, routed by the ChatGPT project name `<Territory> - <Sub-area>`. The [Knowledge acquisition Project](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/knowledge-acquisition.md) holds the remaining ChatGPT steps (readable source, project enumeration, verified retirement).
- **First look, the gap.** Nothing seeds a ChatGPT session from a KI Project: seeding is per territory, and ChatGPT cannot read a Project note in ki-principal unless its content is placed in acquire's `context/`. A capture records the ChatGPT project name, not a KI Project slug, so there is no return path from a capture into the inception Project's Notes. An inception type would need either a Project kind, or simply the evaluation-stage pattern plus a seed (Project Notes published into acquire context) and a return (a `ki_project` capture field that the knowledge-acquisition thread folds back into Notes).
- **Dispatched.** Prepended an INCEPTION-TYPE line, quoting Kris, to the Messages from Master block of the [ways-of-working checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md) and the [knowledge-acquisition checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.knowledge-acquisition.md). Added the idea in Kris's words as the last bullet of the Notes in the [Ways of working Project note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) (the file was clean, so an ordinary append). No records, Projects or skill edits.
- **Committed and pushed** the Ways of working note and this report's copy in `+/_THREADS/ways-of-working/`; commit identifier in the In Progress line below if the push needed holding.
- **Not committed:** both checkpoints already hold other threads' staged, uncommitted edits (ways-of-working and knowledge-acquisition), so my prepended lines stay uncommitted and travel with those threads' next checkpoint commits.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- The two checkpoint lines wait for the ways-of-working and knowledge-acquisition threads to act on them.
- Whether inception becomes a kind depends partly on Kris's open AREAS-PATTERN.

## Queries

### INCEPTION-SHAPE - Is inception a new Project kind or the evaluation-stage pattern?

**Context:** Projects carry only `lifecycle` today, and the proposed evaluation-stage pattern (AREAS-PATTERN, open) already gives an idea-holding Project with no records; what inception adds is the ChatGPT seed-and-return loop, which belongs to knowledge-acquisition rather than to a new field.

**Query:** Should an inception Project be the evaluation-stage pattern plus a seed-and-return loop, rather than a new Project kind?

**Options:**

a) (recommended) No new kind: treat inception as the evaluation-stage pattern, and have knowledge-acquisition design the loop (Project Notes published into acquire's ChatGPT context as the seed; a `ki_project` field on captures, folded back into the Project's Notes as the return).

b) Add a `kind` field to the Project registry standard with `inception` as its first value, owned by ways-of-working.

```text
INCEPTION-SHAPE

No new Project kind: treat inception as the evaluation-stage pattern, and have the knowledge-acquisition thread design the seed-and-return loop with acquire - Project Notes published into acquire's ChatGPT context as the seed, a ki_project field on captures folded back into the Project's Notes as the return.
```

```text
╭─ run report · 2026-10-14T21:09:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] INCEPTION-SHAPE
- [uncommitted] two checkpoint lines, behind other threads' staged edits
