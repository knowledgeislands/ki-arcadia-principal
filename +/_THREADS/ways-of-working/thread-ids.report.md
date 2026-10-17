# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › thread-ids

**Run report at 01:42 BST · last mark 16:09 BST**

---

## Done

- Wrote the canonical **Thread naming** section in the `ki-pmo` standard, `skills/change-management/ki-pmo/references/standards-pmo.md#thread-naming`, under [KI-HARNESS-GOV-199](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-199-thread-identity-role-native-sessions.md). It quotes THREAD-IDS and THREAD-IDS-DOC and supersedes NAMING's label rule. `ki-checkpoint` (Coordination-thread naming) and `ki-delegation` (Run packet) now point to it rather than repeat it. The Naming and Run bullets in `ki-pmo` point to it as well.
- Amended the plan in [KI-HARNESS-GOV-199](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-199-thread-identity-role-native-sessions.md): a Thread naming boundary item, one step ticked, one migration step added, and PILOT-LABEL now waits on THREAD-IDS-AGREE and IDS-MIGRATE. No new record was needed.
- Commit `655350a8`, `docs(ki-pmo): document the thread id, slug and title model`, is in ki-agentic-harness and pushed fast-forward. Only my commit was stacked.
- Checks:
  - `bun run test` passed 1208 of 1208, and `bunx tsc --noEmit` is clean.
  - `ki repo audit` passes for ki-checkpoint, ki-delegation, ki-work-roadmap and ki-authoring. ki-authoring failed once on a code span in my new text; I fixed it before committing.
  - ki-skills passes with two WARNs, both stale refresh dates in `references/sources.md`, which predate this run.
  - ki-pmo FAILs on fleet findings that are not mine: PMO-7 and PMO-9 in the untracked `+/_THREADS/skill-reviews/` folder in the harness, which belongs to another session. The rubric is in sync.
- Nothing was renamed: no checkpoint, folder, run or label. No checkpoint was edited.

**The documented section, in short:**

- **Id (authoritative):**
  - The forms are `<territory>.sop`, `<territory>.<initiative>.<project>` and `<territory>.<slug>`. Segments are lower-case kebab names, `[a-z0-9]+(-[a-z0-9]+)*`, joined by `.`.
  - `territory` is the Known Lands alias of the territory whose repository holds the checkpoint (`ki`, `hnr`, `er`, `tmx`, `va`, `lgl`, `kb`, `si`). The Initiative and Project segments are their registry slugs, whatever those are at the time.
  - A conversational slug is a short kebab name for the subject, led by the system where the subject alone is ambiguous (`acquire-intake`, not `intake`). It is never `sop`, an Initiative or Project slug, a date or a host.
  - An id is unique within its territory, and so is the slug derived from it.
  - An id is set once and stays stable. It changes only through an owner-approved rename, when a Project moves Initiative or a registry slug is renamed, and then every derived name changes in the same commit.
- **Slug:**
  - The slug is the id with `.` written as `-`. `ki agent` run names accept only `[A-Za-z0-9_-]`, with no dot.
  - The slug names the checkpoint (stem, `thread` and H1), the run and thread folder `+/_THREADS/<slug>/`, the state folder `~/.local/state/ki/agents/<slug>/` and the binding `~/.local/state/ki/threads/<repository>/<slug>.json`.
  - The slug is never parsed back into an id. THREAD-KEY stays the locator, `<repository>/<slug>`, derived from the id. Where key and id disagree, the id wins.
- **Title and label:**
  - The title uses display names joined by ` > `. The territory segment is the territory's name where it is one word (`Personal`, `Legal`, `Techmedix`), and otherwise its alias in capitals (`KI`, `HNR`). Initiative and Project titles come from the registry. The state-of-play thread is `SoP`, and a conversational thread uses its topic.
  - The label is the title, plus a `(<host>)` suffix only for a thread limited to one machine.
  - The label is copied exactly into the native session name, the opener's `Label:` line and the resume line, so a machine-bound thread's resume line keeps its suffix.
  - The report heading keeps its linked display names joined by ` › `, without the territory, and writes `State of play` in full.
- **Where they live:**
  - Front matter carries `id` and `title` beside `label` and `role`. `label` is written only where a host suffix makes it differ from the title.
  - `id` and `title` become valid in `ki-checkpoint` with the approved migration. Until then every existing name stands, and an agent reads the id from the current stem: `_state-of-play` gives `<territory>.sop`, `<initiative>.<project>` gives `<territory>.<initiative>.<project>`, and any other stem gives `<territory>.<stem>`.

**The worked example, as committed (today's registry slugs):**

| Thread | Type | Id | Slug | Title | Label | Today |
| --- | --- | --- | --- | --- | --- | --- |
| Knowledge Islands state of play | State-of-play | `ki.sop` | `ki-sop` | `KI > SoP` | as title | `_state-of-play.md`, `Master: state-of-play` |
| Ways of working (this thread) | Coordination | `ki.knowledge-islands-model.ways-of-working` | `ki-knowledge-islands-model-ways-of-working` | `KI > Knowledge Islands model > Ways of working` | as title | `knowledge-islands-model.ways-of-working.md`, `KI > Model > ways of working` |
| Tools burndown | Coordination | `ki.platform-foundations.tools-burndown` | `ki-platform-foundations-tools-burndown` | `KI > Platform foundations > Tools burndown` | as title | `platform-foundations.tools-burndown.md`, `Fnd: tools-burndown` |
| Chezmoi | Coordination | `ki.rig.chezmoi` | `ki-rig-chezmoi` | `KI > Rig > chezmoi` | as title | `rig.chezmoi.md`, `Rig: chezmoi` |
| Acquire intake | Conversational | `kb.acquire-intake` | `kb-acquire-intake` | `Personal > Acquire intake` | `Personal > Acquire intake (sol)` | `acquire-intake.md` in `acquire`, `Acquire: acquire-intake` |

If SHORT-NAMES is taken, the Model and Foundations rows become `ki.model.ways-of-working` (`KI > Model > Ways of working`) and `ki.foundations.tools-burndown` (`KI > Foundations > Tools burndown`).

## In Progress

Nothing is running.

Outstanding - no action requested now:

- Acquire's territory is taken as Personal (`kb`), because the repository sits in the personal workspace and its `.ki.toml` names no territory.
- Left alone in ki-principal, from other sessions: `+/_THREADS/chezmoi/decisions.md` is modified and `+/_THREADS/desk-kit/setup-note.report.md` is untracked. `+/_CHECKPOINTS/rig.chezmoi.md` was read only.
- In the harness, the untracked `+/_THREADS/skill-reviews/` folder carries the ki-pmo PMO-7 and PMO-9 findings. It belongs to its own thread.

## Queries

### THREAD-IDS-AGREE - the derivations chosen where the message left room

**Context:** Your message fixed the three id forms. I chose the rest:

- The territory is the Known Lands alias, so Acquire's intake is `kb`.
- The slug is the id with dots as hyphens, because `ki agent` run names refuse dots. One slug names the checkpoint, thread folder, run, state folder and binding. That replaces `ki-checkpoint`'s `<initiative>.<project>` and `_state-of-play` stems at migration.
- THREAD-KEY stays as the derived locator, with the id primary.
- The title uses registry titles, with a one-word territory name or the alias in capitals, and `SoP`.
- The label adds the host only for a machine-bound thread, and the resume line keeps it. This is NAME-HOST option a).
- `id` and `title` are front-matter fields, with `label` written only when it differs from the title.
- The id is stable except through an approved rename when a Project changes Initiative or a slug is renamed.

**Query:** Do you agree the derivations as documented in the ki-pmo Thread naming section?

**Options:**

a) (recommended) Agree them as documented, including NAME-HOST option a) and Personal as Acquire's territory.

b) Keep the dotted id as the checkpoint stem, such as `ki.rig.chezmoi.md`, and use the hyphenated slug only for the run, thread folder and state folder.

c) Make the slug the id without its territory, keeping today's coordination stems, and keep the territory prefix rule for run names.

### IDS-MIGRATE - rename existing checkpoints, folders, runs and labels

**Context:** Nothing has been renamed. The migration covers these names:

- **Knowledge Islands checkpoints (13):** `_state-of-play` to `ki-sop`, and each `<initiative>.<project>` to `ki-<initiative>-<project>`, such as `ki-rig-chezmoi`. `registry-removal` becomes `ki-registry-removal`. Labels move to titles, such as `Fnd: tools-burndown` to `KI > Platform foundations > Tools burndown`.
- **Knowledge Islands thread folders and runs:** `state-of-play`, `ways-of-working`, `chezmoi`, `tools-burndown` and `desk-kit`.
- **Acquire intake:** to `kb-acquire-intake`, labelled `Personal > Acquire intake (sol)`.
- **Other Capitals:** HNR has 7 checkpoints, Personal 12, and ER, TMX, VA, LGL and SI one `_state-of-play` each, with VA holding one more.
- **Tooling:** first, the harness checker must accept `id` and `title` and check stem, slug and id against each other, with ki-pmo's PMO-10 and the registry context reading the new stems.

If SHAPE-AGREE and SHORT-NAMES are taken, renaming first would mean renaming seven ids twice.

**Query:** When and in what order should existing names move to the model?

**Options:**

a) (recommended) After SHAPE-AGREE and SHORT-NAMES are answered, migrate in this order:

1. The harness checker and rubric accept `id` and `title`, with old stems tolerated for a window.
2. Each Knowledge Islands thread renames its own checkpoint, label, thread folder and run at its next update or hold. The state-of-play thread asks through messages blocks, and goes first itself.
3. Acquire intake follows, as the PILOT-LABEL pilot.
4. HNR, Personal and the other Capitals follow, each through its own state-of-play thread.
5. The tolerance window closes.

b) Migrate now with today's slugs, accepting a second rename if SHORT-NAMES lands.

c) Apply the model to new threads only. Existing threads keep their names and derive their ids from their stems, as the standard already allows.

### NAMING-REST - close what NAMING still holds

**Context:** NAMING now stands as follows:

- The model answers NAME-ROOT: the first segment is the territory, so `Acquire > intake (sol)` becomes `Personal > Acquire intake (sol)`.
- NAME-HOST is folded into THREAD-IDS-AGREE.
- INITIATIVE-NAMES is re-posed as SHORT-NAMES.
- PILOT-LABEL waits on the migration.
- FOOTER-PROJECTS is untouched. A state-of-play footer shows no coordination threads, although that thread owns the territory hold "with the list of threads to restart from it".

**Query:** How should the remaining NAMING points close?

**Options:**

a) (recommended) Withdraw NAME-ROOT as answered by the model. Pilot PILOT-LABEL with `Personal > Acquire intake (sol)` under IDS-MIGRATE. Take FOOTER-PROJECTS option a): only the state-of-play footer gains one `- [thread] <label> - rest | busy | hold` item per coordination thread, read from each pick-up block.

b) As a), but take FOOTER-PROJECTS option c), with no footer change and the Project shown in the heading only.

```text
THREAD-IDS-AGREE

Agree the thread-naming derivations as documented in the ki-pmo Thread naming section under KI-HARNESS-GOV-199: territory from the Known Lands alias (Acquire intake in Personal, kb), the slug as the id with dots as hyphens naming the checkpoint, thread folder, run, state folder and binding, THREAD-KEY kept as the derived locator with the id primary, titles from registry titles with a one-word territory name or the alias in capitals and SoP, the host suffix only for a machine-bound thread and kept in its resume line (NAME-HOST option a), id and title in front matter with label only where it differs, and the id stable except through an approved rename.

---

IDS-MIGRATE

Migrate existing names to the thread-naming model after SHAPE-AGREE and SHORT-NAMES are answered, in this order: the harness checker and rubric accept id and title with old stems tolerated for a window; each Knowledge Islands thread renames its own checkpoint, label, thread folder and run at its next update or hold, the state-of-play thread first and asking the others through messages blocks; Acquire intake next as the PILOT-LABEL pilot; then HNR, Personal and the other Capitals through their own state-of-play threads; then close the tolerance window.

---

NAMING-REST

Withdraw NAME-ROOT as answered by the thread-naming model; pilot PILOT-LABEL with Personal > Acquire intake (sol) under IDS-MIGRATE; take FOOTER-PROJECTS option a): only the state-of-play footer gains one "- [thread] <label> - rest | busy | hold" item per coordination thread, read from each pick-up block.
```

```text
╭─ run report · 2026-10-17T00:42:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued in this run
- [waiting] THREAD-IDS-AGREE
- [waiting] IDS-MIGRATE
- [waiting] NAMING-REST
- [committed] harness change pushed; this report committed and pushed in ki-principal

```text
Resume KI > Model > ways of working under current ki-pmo and ki-delegation since 2026-10-15T15:09:48Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
