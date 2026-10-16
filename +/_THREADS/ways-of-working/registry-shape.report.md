# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › registry-shape

**Run report at 22:17 BST · last mark 16:09 BST**

---

## Done

- Read-only review of REGISTRY-SHAPE finished. Nothing was changed except this report, which is committed locally in ki-principal and not pushed: the brief forbids any remote call. That overrides the common rules' push step.
- Sources read: the ki-work [Project registry standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work/references/standards-project-registry.md), the [Streams structure standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/repo-structure/ki-repo-kb-streams/references/standards-streams-structure.md), [ki-pmo](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md), [ki-pmo-design](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo-design/references/standards-pmo-design.md), the ki-repo-kb index-note rule, the `tools-ki` [registry reader](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/core/work/registry.ts), every registry note in ki-principal, and the registries in hnr-principal, personal-principal and legal-principal.
- Main finding: an earlier decision already retires the design folders, but it was only half delivered. ki-pmo's "Design notes" section already says, from Kris's DESIGN-RETENTION answer of 13 October ("(a) +/_DESIGN/<subject-slug>/ in every repository") and its confirmation ("design notes move to +/_DESIGN/<subject>/ and are deleted on graduation"), that "a design folder under a Project note is retired". However, ki-pmo-design's Artefact home and the registry standard still put design work in `Streams/Projects/<slug>/design/`, and ki-principal still has five such folders. That contradiction is the source of the design sections.
- Second finding: the proposed short names `model` and `foundations` clash with existing notes: [Pillars/Philosophy/Model/Model.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Pillars/Philosophy/Model/Model.md) and [Pillars/Engineering Practice/Foundations/Foundations.md](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Pillars/Engineering Practice/Foundations/Foundations.md>). SHORT-NAMES deals with this.

### 1. Current state

**How Projects relate to Initiatives.** Each Project's frontmatter has one `initiative` slug, and that is the only link. All 30 Projects across the four Capitals that have a registry carry one. None has no Initiative. The standard says links point upwards only, so "an Initiative note names no Project". ki-principal breaks this in three places:

- the [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) Notes have pointers to `ways-of-working` and `command-centre`;
- the [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md) Notes have a "Tools burndown" bullet;
- [Projects.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/Projects.md) adds "It sits under [[X]]" to six entries.

So membership is held twice, by the field and by prose, and the two are already inconsistent: some Projects get an "It sits under" line and some don't.

**Initiative notes** (4 in ki-principal) have frontmatter, `## Direction` and `## Notes`. Direction is in good shape. Notes mixes four things:

- projectless upkeep and recurring work (keep);
- `Idea:` bullets and hand-ons (keep);
- pointers to Projects (drop);
- pointers to design folders and checkpoints (drop).

**Project notes** (20 in ki-principal) have frontmatter, `## Outcome` and `## Notes`, and some add `###` subsections under Notes: Phases, Scope, Inventory, History, Boundaries, Open questions, Close-out assessment. Two go beyond the two sections the standard allows:

- [paperclip-capture-and-rebuild](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/paperclip-capture-and-rebuild/paperclip-capture-and-rebuild.md) adds `## Capture`, `## Shut down`, `## Design` and `## Rebuild`. Its `## Design` is a list of questions waiting on Ways of working.
- [mac-studio-setup](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) adds `## Remit`.

**Design folders.** There are five, about 720 KB in all:

| Folder | Holds | Outcome lives in | What reads it |
| --- | --- | --- | --- |
| [knowledge-islands-model/design](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/design/design.md) | territory-selection brief, 2 reviews, report, decisions | [ADR-KI-PRINCIPAL-002](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/ADR-KI-PRINCIPAL-002-territory-derived-repository-selection.md), current | nothing |
| [ways-of-working/design](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/design.md) | change-management loop (brief, 2 reviews, 149 KB report, decisions), skill graph JSON and SVG, four thread papers, roadmap-sizing paper | harness skills, mostly `ki-pmo` and `ki-delegation`; restart-model already approved for deletion | nothing; `ki-pmo-design` `resume` only |
| [agent-host/design](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/agent-host/design/design.md) | workstation-bundle walkthrough (open), Rig and Techne boundary audit | audit: [Hosts, Roles and Layers](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Pillars/Engineering Practice/Architecture/Hosts, Roles and Layers.md>), to confirm | nothing |
| [mac-studio-setup/design](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/design/design.md) | decisions in force, hosts table | not yet in a durable home; the hosts table is Pillars-grade knowledge | Project note links |
| [paperclip-capture-and-rebuild/design](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/paperclip-capture-and-rebuild/design/design.md) | rebuild structure of the stopped `terra` instance | input to the rebuild design, still live | Project note links |

No tool reads a design folder. `tools-ki` reads only the folder note, and the Streams checker skips `design/`.

**Index-note rule.** `Projects.md` and `Initiatives.md` describe each child in its own H2 section. A registry note in folder form doubles as its folder's index. Under nesting this causes a conflict: an Initiative folder note would be the index of its Project folders, and ki-repo-kb wants an H2 section for each child, but the registry standard says an Initiative names no Project.

**Other Capitals.**

- hnr-principal has 2 Initiatives and 4 Projects, with a `Fourth paper figures/` asset folder loose in `Streams/Projects/`.
- personal-principal has 6 Initiatives and 5 Projects.
- legal-principal has 6 Initiatives and 1 Project. Its Initiatives, such as "Tending - Audits" and "File System", look like former roadmap themes.
- er-principal, tmx-principal and va-principal have no registry.

### 2. Proposed shape

**Path.** `Streams/Initiatives/<initiative>/<initiative>.md`, with each Project at `Streams/Initiatives/<initiative>/<project>/<project>.md`. `Streams/Projects/` and `Projects.md` are retired, and `Streams/Roadmap/` stays flat beside it. I considered dropping the `Initiatives` level and using `Streams/<initiative>/`, and rejected it: it mixes Initiatives with the fixed `Roadmap/` area and loses the one index that describes the Initiatives.

**Every Project is a folder.** That gives a single form: the two-form rule, `<slug>.md` or `<slug>/<slug>.md`, goes. A Project folder holds its note and any assets that support it, such as HNR's figures, which become `5g-emerge/fourth-white-paper/figures/`. It never holds `design/`.

**Projects with no Initiative.** None exists today. An Initiative becomes required. Work that fits no Initiative is a sign that an Initiative is missing, or that an idea-stage Project is needed under the nearest one. ki-pmo's clause "a Project with no Initiative gives the Project alone" is dropped.

**One Initiative per Project.** The folder now enforces this. Project slugs stay unique across the territory, so records keep `project: <slug>` unchanged. A move between Initiatives is a folder move, and the slug never changes.

- The `initiative` field stays. Tooling and cross-territory references read it, and it survives a careless drag in Obsidian.
- The Streams checker fails a note whose `initiative` disagrees with its parent folder.
- A Project that touches a second Initiative is mentioned in that Initiative's `## Direction` boundary prose, never as a list.

**Slimmer Initiative note.**

- Keeps: frontmatter (`note_type`, `slug`, `title`, `direction`, `lifecycle`, `lead`), `## Direction` with its boundary, and `## Notes` for projectless upkeep, recurring work and `Idea:` bullets.
- Drops: Project pointers, design-folder pointers and checkpoint pointers. The folder level is the Project list.
- An Initiative or Project folder note is a registry note. It satisfies its folder's index-note requirement without a section for each child, so links still point upwards. The ki-repo-kb index-note rule gains that one exception.
- `Initiatives.md` keeps one H2 per Initiative.

**Design sections.** These follow ki-pmo's existing rule, as DESIGN-TIDY sets out note by note. Body sections beyond Outcome and Notes become `###` subsections under Notes, as estate-factorisation already does with its Phases.

**How things find Projects after the move:**

- **Wikilinks.** Obsidian resolves `[[ways-of-working]]` by basename, so most links survive the move. The path-qualified ones break: 8 `[[Initiatives/techne`, 4 `[[Initiatives/rig`, and 4 `.../design/design` links, which go with the folders.
- **ki-pmo report headings.** These link `…/Streams/Initiatives/<i>/<i>.md › …/Streams/Initiatives/<i>/<p>/<p>.md`. That path can be derived from the checkpoint name `<initiative>.<project>`. Update the three examples in `standards-pmo.md` and the one in `output-styles/ki-coordinator.md`.
- **Checkpoints.** `<initiative>.<project>.md` keeps its form. Renaming the slugs renames 7 checkpoints (the `knowledge-islands-model.*` and `platform-foundations.*` ones), and the links inside all 13 are rewritten.
- **`ki work` (tools-ki).** `registry.ts` reads the files directly inside `Streams/Projects/` and `Streams/Initiatives/`, plus the folder notes. The new reader walks `Streams/Initiatives/<i>/<i>.md`, then `<i>/<p>/<p>.md`, skipping any child without a same-name note, such as `figures/`. It reports a slug that appears under two Initiatives as an error. It still reads the old layout, with a warning, for the length of the tolerance window, the same way it handles the legacy `Initiatives.md` today.
- **`ki agent`.** It does not read the registry: `close.ts` resolves only roadmap folders. Only the run-events record [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) cites registry paths.
- **Checkers.** The harness checkers change too: the registry context in ki-work-roadmap (`project-registry.ts`), the `ki-pmo` rubric context (`pmo.ts`, which checks that a checkpoint's Project and Initiative exist), and the Streams item `stream.ts`.

### 3. Short names

| Slug now | Title now | Proposed slug, folder and title |
| --- | --- | --- |
| `knowledge-islands-model` | Knowledge Islands model | `model`, Model |
| `platform-foundations` | Platform foundations | `foundations`, Foundations |
| `rig` | Rig | unchanged |
| `techne` | Techne | unchanged |

- **Model, not Philosophy.** `Philosophy` is the Pillars zone that holds the model's content. Naming the work Initiative after it would blur the strict Pillars and Streams boundary, and `Pillars/Philosophy/Philosophy.md` would clash as well. THREAD-NAMES already uses `Model`.
- **One name for folder and title.** The short name becomes the slug, the folder name and the title, so the `short` field INITIATIVE-NAMES proposed is no longer needed. Thread labels become `<root> > <Initiative title> > <Project in words>`, as in `KI > Model > ways of working`, which the labels already show.
- **Breaking "slug never changes".** The rename breaks that rule once, as an authorised migration. It rewrites `initiative:` in about 23 files: 10 name `knowledge-islands-model` and 13 name `platform-foundations`, across ki-principal Streams and Admin, harness examples and docs.
- **The clash.** A bare `[[model]]` or `[[foundations]]` would be ambiguous with the two Pillars notes, so wikilinks to an Initiative note always use the path form `[[Initiatives/model/model|Model]]`. Rig and Techne already do this in places, and a rubric item can check it.

### 4. Migration

Order:

1. Settle the three queries below.
2. **Design tidy in ki-principal.** This comes first, so the move does not carry the folders.
3. **ki-agentic-harness.**
   - Update the registry standard, the Streams standard, ki-pmo (headings, the no-Initiative clause), ki-pmo-design (Artefact home to `+/_DESIGN/`), the ki-repo-kb index-note exception, the output style, `AGENTS.md` and the pmo-design guide.
   - Make the three checkers accept both layouts, with a warning on the old one, and add a check that the field matches the folder.
4. **tools-ki.** The nested reader with legacy tolerance, a test, the man page and the user guide, then a `ki` release. Capitals' audits use the installed `ki`, so the release must come before any Capital moves. Otherwise `ki work` views quietly ungroup.
5. **ki-principal.**
   - One commit of `git mv`s: 4 Initiatives, 20 Projects, the two slug renames and the 7 checkpoint renames.
   - Retire `Projects.md`, slim the Initiative notes, and rewrite live links: 13 checkpoints, Initiatives.md, the 16 path-qualified wikilinks, and the open records [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) and [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md).
   - [GDR-KI-PRINCIPAL-005](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/GDR-KI-PRINCIPAL-005-the-roadmap-model.md) and the other Admin citations go through Enactment.
   - This must wait until `rig.chezmoi.md` is no longer in flight in another session.
6. **hnr-principal, personal-principal and legal-principal.** One mechanical move each, with slugs unchanged. HNR's figures folder moves under its Project. er-principal, tmx-principal and va-principal have no registry: only one stray mention each to check.
7. **Close the tolerance window.** Remove the legacy readers from the checkers and `tools-ki`.

Links: live surfaces are rewritten. Historical thread reports, design artefacts being deleted, and pruned-record links pinned to a revision are left as they are, with Git holding the history; THREAD-TIDY keeps shrinking that set. Other live mentions to rewrite:

- ki-agentic-harness: [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md), [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) and [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md);
- tools-ki: [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) and [KI-TOOL-KI-CLI-125](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md);
- 2 files in tools-rig, 1 in ki-techne-harness and 1 in apps-knowledgeislands.info.

**Rough size.** Files citing `Streams/Projects/` or `Streams/Initiatives/`:

| Repository | Files | Mostly thread reports |
| --- | --- | --- |
| ki-principal | 149 | about 130 |
| hnr-principal | 102 | about 91 |
| personal-principal | 30 | |
| ki-agentic-harness | 24 | about 10 |
| tools-ki | 10 | |

The live edit set is about 60 files plus 51 moved notes across the four Capitals. That is about six background runs, chained per repository: design tidy, harness, tools-ki with release, ki-principal, then the three other Capitals in parallel.

**Records to capture, proposed only:**

- ki-agentic-harness: one KI-HARNESS-GOV record for the nested registry shape, design-home alignment and checkers, including closing the tolerance window.
- tools-ki: one KI-TOOL-KI-CLI record for nested registry discovery in `ki work`.
- ki-principal: one KI-PRINCIPAL record for the design tidy, which carries the Enactment for the hosts table in Pillars; one KI-PRINCIPAL record for the registry move and short names, which carries the Enactment for the Admin citations.
- hnr-principal, personal-principal and legal-principal: one migration record each, under each one's own prefix.

## In Progress

Nothing is running.

### Outstanding - no action requested now

- [knowledge-islands-model.observatory](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.observatory.md) names a Project, `observatory`, that is not in the registry. The migration should either retire it or map it to `command-centre`.
- legal-principal's six Initiatives look like former roadmap themes rather than long-lived directions. Worth a separate look at its next mark, but not part of this change.
- personal-principal has its own `rig` and `knowledge-acquisition` Initiatives. Slugs are scoped to a territory, so there is no conflict, but RIG-ROOT may bear on them.

## Queries

### SHAPE-AGREE - nest Projects under their Initiative, as described above

**Context:** Section 2 sets out the shape and section 4 the migration. Projects become folders under their one Initiative, and `Streams/Projects/` and `Projects.md` go. An Initiative becomes required. Project slugs stay unique, so no work record changes, and the `initiative` field stays, checked against the folder. Initiative notes lose their Project, design and checkpoint pointers, and registry folder notes are exempt from listing their children. Tooling reads both layouts during a tolerance window, and the migration runs harness, then tools-ki with a release, then ki-principal, then the other three Capitals. Thread reports and pruned-record links stay as history.

**Query:** Do you adopt the nested registry shape, its migration order and the proposed records as a whole?

**Options:**

a) (recommended) Adopt the whole shape, the order (design tidy, harness, tools-ki with release, ki-principal, then hnr-principal, personal-principal and legal-principal, then close the window) and capture the six records proposed in section 4.

b) Nest, but keep a Project as a plain `<initiative>/<project>.md` file unless it holds assets. This means fewer folders, but two forms again.

c) Keep the flat registry and only slim the Initiative notes.

### SHORT-NAMES - Model and Foundations as slug, folder and title

**Context:** Kris asked for short Initiative names. Making the short name the slug, the folder and the title together removes the need for INITIATIVE-NAMES' `short` field, and thread labels use the title. Renaming the two slugs breaks "slug never changes" once and rewrites about 23 `initiative:` values. `model` and `foundations` clash with the Pillars notes `Model.md` and `Foundations.md`, so wikilinks to Initiatives must use the path form. `Philosophy` clashes too, and names the Pillars zone that holds the model's content.

**Query:** Should the Knowledge Islands Initiatives become `model` (Model), `foundations` (Foundations), `rig` and `techne`, as slug, folder and title, replacing INITIATIVE-NAMES?

**Options:**

a) (recommended) Rename `knowledge-islands-model` to `model` (Model) and `platform-foundations` to `foundations` (Foundations) as slug, folder and title in the migration. Leave Rig and Techne unchanged, withdraw INITIATIVE-NAMES' `short` field, and require path-form wikilinks to Initiative notes.

b) Shorten the titles only and keep the long slugs and folders: no rename and no clash, but the folders stay long.

c) Use `philosophy` (Philosophy) in place of `model`.

### DESIGN-TIDY - deliver the design-notes rule ki-pmo already carries

**Context:** ki-pmo already retires design folders under Project notes, from DESIGN-RETENTION on 13 October, but ki-pmo-design and the registry standard still put them in `Streams/`, and ki-principal has five of them. Their outcomes mostly have homes already: ADR-KI-PRINCIPAL-002, the harness skills, and Hosts, Roles and Layers. Two hold live material: the workstation-bundle walkthrough and the Paperclip rebuild structure. The mac-studio-setup hosts table is durable knowledge. Paperclip's and mac-studio-setup's extra H2 sections break the Outcome and Notes rule.

**Query:** Should each design folder be resolved as below, before the registry move?

**Options:**

a) (recommended) Delete `knowledge-islands-model/design`. For `ways-of-working/design`, have a run confirm that every decision in change-management-decisions has its home, then delete the folder, moving `roadmap-sizing-and-burn-down.md` to `+/_DESIGN/roadmap-sizing/`. Move `workstation-bundle-walkthrough.md` to `+/_DESIGN/workstation-bundle/`, and delete `rig-techne-boundary-audit.md` once Hosts, Roles and Layers is confirmed to carry it. Merge `hosts.md` into Hosts, Roles and Layers through Enactment, fold `decisions-in-force.md` into the mac-studio-setup Notes, and delete both. Move `paperclip-rebuild-structure.md` to `+/_DESIGN/paperclip-rebuild/`. Turn the extra H2 sections into `###` subsections under Notes. Align ki-pmo-design and the registry standard to `+/_DESIGN/`, with the Streams checker failing a `design/` folder in the registry.

b) Move all five folders whole to `+/_DESIGN/` now and graduate them later.

```text
SHAPE-AGREE

Adopt the nested registry shape in /Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/registry-shape.report.md: Streams/Initiatives/<initiative>/<initiative>.md with every Project as Streams/Initiatives/<initiative>/<project>/<project>.md; retire Streams/Projects/ and Projects.md; an Initiative is required and there is one per Project; Project slugs stay unique, so records do not change; keep the initiative field, checked against the parent folder; slim Initiative notes to frontmatter, Direction and Notes with no Project, design or checkpoint pointers; registry folder notes are exempt from the index-note child sections; migrate design tidy, then harness, then tools-ki with a ki release, then ki-principal, then hnr-principal, personal-principal and legal-principal, then close the tolerance window; leave thread reports and pruned-record links as history; capture the six records proposed in section 4.

---

SHORT-NAMES

Rename knowledge-islands-model to model (title Model) and platform-foundations to foundations (title Foundations) as slug, folder and title in the registry migration; leave rig and techne unchanged; withdraw INITIATIVE-NAMES' short field, with thread labels using the title; require path-form wikilinks such as [[Initiatives/model/model|Model]] to Initiative notes because of the Pillars Model.md and Foundations.md notes.

---

DESIGN-TIDY

Before the registry move: delete Streams/Initiatives/knowledge-islands-model/design; have a run confirm every decision in Streams/Projects/ways-of-working/design/change-management-decisions.md has its home, then delete that folder, moving roadmap-sizing-and-burn-down.md to +/_DESIGN/roadmap-sizing/; move agent-host's workstation-bundle-walkthrough.md to +/_DESIGN/workstation-bundle/ and delete rig-techne-boundary-audit.md once Hosts, Roles and Layers is confirmed to carry it; merge mac-studio-setup's hosts.md into Hosts, Roles and Layers through Enactment and fold decisions-in-force.md into the mac-studio-setup Notes, deleting both; move paperclip-rebuild-structure.md to +/_DESIGN/paperclip-rebuild/; turn the extra H2 sections in paperclip-capture-and-rebuild and mac-studio-setup into ### subsections under Notes; align ki-pmo-design and the registry standard to +/_DESIGN/, with the Streams checker failing a design/ folder in the registry.
```

```text
╭─ run report · 2026-10-16T21:17:34Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] SHAPE-AGREE
- [waiting] SHORT-NAMES
- [waiting] DESIGN-TIDY
- [unpushed] run report committed locally; the brief forbids push

```text
Resume KI > Model > ways of working under current ki-pmo and ki-delegation since 2026-10-15T15:09:48Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
