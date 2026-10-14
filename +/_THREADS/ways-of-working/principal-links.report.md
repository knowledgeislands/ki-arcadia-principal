# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › principal-links

**Run report at 23:36 BST · last mark 23:22 BST**

---

## Done

- PRINCIPAL-LINKS, under Kris's instruction of 14 October 2026: "send an agent to make the ways-of-working Project note and the Engineering Practice Pillar describe the skill map, the eight area diagrams and the thread model, and mark the HTML-opt-in idea as delivered by [KI-HARNESS-GOV-193 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/c092431687d3542e55058cecd545e816a1dbadcf/docs/roadmap/KI-HARNESS-GOV-193-area-diagrams-with-html.md)". This instruction stood in for an Enactment record. The brief's general rule says not to edit `Pillars`, but this instruction names the [Engineering Practice Pillar](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Pillars/Engineering Practice/Engineering Practice.md>) itself, so I edited it.
- [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md): the Skill diagrams note now describes the skill map, the eight per-concern area diagrams (Keystone, Governance, Change Management, Repo Structure, Agentic Systems, Environment, Acquire, Design) and the thread-model workflow. It links each diagram's SVG at harness revision `fcad8a1e`, which is on `origin/main`, and quotes Kris's DIAGRAM-SET, THREAD-DIAGRAM and DIAGRAMS words.
- The HTML-opt-in idea is now headed **Delivered idea**. It records what was delivered (`commit_html = true` per diagram in `diagrams.toml`, committed HTML, `bun run self:diagrams:html`) and quotes Kris's HTML and AREA-ACCEPT words.
- Limitation: `ki repo audit --staged` failed STREAM-9 ("Registry note lists work records") while the Project note named [KI-HARNESS-GOV-193 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/c092431687d3542e55058cecd545e816a1dbadcf/docs/roadmap/KI-HARNESS-GOV-193-area-diagrams-with-html.md) or linked its file. The rule also catches the identifier inside a link URL. To pass, the note now calls it "the harness's area-diagrams-with-HTML record (pruned)" and links the accepting commit `c0924316`. In the AREA-ACCEPT quote, the record identifier is replaced by `[it]`. See RECORD-NAME.
- Engineering Practice Pillar: the skill-diagrams paragraph now describes the skill map, the eight area diagrams and the thread model, with links at `fcad8a1e`, and points to the ways-of-working Project for their history.
- Checks: `ki repo audit --staged` PASS on the two paths (FAIL=0, WARN=0 in scope). There are no en or em dashes. Committed in `95e4dc9c` (`docs(ways-of-working): describe the skill map, area diagrams and thread model`), which was pushed fast-forward to `origin/main`. The follow-up commits for this report, `19eef4a6` and the update that records these identifiers, are not pushed (see PUSH-LINKS).

## In Progress

Nothing is running.

Outstanding - no action requested now:

- The link to the accepting commit `c0924316` resolves only after ki-agentic-harness `main` is pushed. Local `main` is ahead of `origin/main` by `a830b6ed`, `58d41ccc`, `c0924316`, `b7f35cdf`, `5ec6ad28`, `8f400524` and now `9a495773`. They are held under the harness-accept run's PUSH-OTHERS query. The diagram links at `fcad8a1e` already resolve.

## Queries

### PUSH-LINKS - push the ways-of-working report commits together

**Context:** After `95e4dc9c` was pushed, another session committed `924a89e5` (`docs(threads): link every record in the ways-of-working reports`, four ways-of-working reports) on ki-principal `main`. This run's later report commits sit on top of it. This run pushes only its own commits, so they wait behind `924a89e5`. The Project note and Pillar changes are already on `origin/main`.

**Query:** May the next push carry `924a89e5` with this run's report commits?

**Options:**

a) (recommended) Push ki-principal `main` fast-forward, carrying `924a89e5` and this run's report commits.

b) Leave them for the session that made `924a89e5` to push.

### AREAS-REFRESH - refresh the notes when the functional-area diagrams land

**Context:** The notes describe the eight per-concern area diagrams that are on `origin/main` at `fcad8a1e`, as instructed. Kris's harness layout session has since committed `9a495773` locally ("draw skill diagrams by functional area"). That commit replaces them with ten functional-area diagrams: Fundamentals, Records and code, Coordination, Work and delivery, Repository types, Agentic systems, Environment, Acquire, Signals and Design. It also deletes the Keystone, Governance, Change Management and Repo Structure files. The links are pinned to `fcad8a1e`, so they will not break, but once that commit is pushed both notes will describe a superseded set.

**Query:** Should an agent update both notes to the functional-area set once `9a495773` is on `origin/main`?

**Options:**

a) (recommended) After the harness push, send one agent to rewrite both notes' diagram descriptions for the ten functional areas, linked at the pushed revision.

b) Leave the notes on the eight-concern set at `fcad8a1e` as a dated snapshot.

### RECORD-NAME - name the delivering record in the Project note

**Context:** The instruction asked to mark the idea "delivered by [KI-HARNESS-GOV-193 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/c092431687d3542e55058cecd545e816a1dbadcf/docs/roadmap/KI-HARNESS-GOV-193-area-diagrams-with-html.md)". `ki-repo-kb-streams` STREAM-9 forbids a Project note from listing work records, including by link URL, so the note describes and links the accepting commit instead. This report carries the identifier in full.

**Query:** Is the description and commit link enough, or must the identifier appear in the note?

**Options:**

a) (recommended) Keep the description and commit link, which pass the audit.

b) Name [KI-HARNESS-GOV-193 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/c092431687d3542e55058cecd545e816a1dbadcf/docs/roadmap/KI-HARNESS-GOV-193-area-diagrams-with-html.md) in the note and route a STREAM-9 exception for delivered ideas to the harness as a handoff.

```text
PUSH-LINKS

Push ki-principal main fast-forward, carrying 924a89e5 from the other session together with the principal-links report commits.

---

AREAS-REFRESH

After ki-agentic-harness main is pushed with 9a495773, send one agent to rewrite the diagram descriptions in the ways-of-working Project note and the Engineering Practice Pillar for the ten functional-area diagrams, linked at the pushed revision.

---

RECORD-NAME

Keep the ways-of-working Project note's description and accepting-commit link for the delivered HTML-opt-in idea, which pass STREAM-9.
```

```text
╭─ run report · 2026-10-14T22:36:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] PUSH-LINKS
- [waiting] AREAS-REFRESH
- [waiting] RECORD-NAME
- [committed] ways-of-working note and Engineering Practice Pillar, pushed
- [unpushed] ki-principal main, 2 report commits held behind 924a89e5 from another session
