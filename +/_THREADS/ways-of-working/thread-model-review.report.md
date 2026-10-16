# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › thread-model-review

**Run report at 23:04 BST · last mark 16:09 BST**

---

## Done

- **Read-only review of the six PRIORITIES topics finished. The only file written is this report; nothing was committed or pushed.** Kris named the topics on 15 October: "Some other things high on my list are: `+/_THREADS` vs `tmp`; Thread types and behaviours (conversational, coordination, state-of-play); Thread naming; Thread footer types, states and projects; Initiative naming in `knowledge-islands`; Ideas (Scratch Areas) vs Initiatives vs Projects vs Roadmap Items".
- **Not committed, on purpose.** The ki-principal commit gate cannot run on sol. `core.hooksPath` is unset and `node_modules/.bin` is missing, and the tracked `.githooks/pre-commit` says "a gate that cannot run is unknown, not a pass". So I left this report uncommitted, as the `thread-names` and `registry-model` runs did with theirs, and raised GATE-PRINCIPAL below.
- **What "as now landed" means here.** ki-agentic-harness `main` is level with `origin/main` at `0df81f40`, which is the landed text. The harness working tree also holds 25 uncommitted paths from `pmo-hold`, `registry-model` and `threads-records`. These are the hold model, the pick-up block, the messages block, idea-stage Projects, rooting and the attribute table, all held for GATE-INACTIVE and SOL-GATE. I compared both versions and say which one each finding rests on. I edited none of those files.
- **Sources read:** the ki-pmo standard, the ki-delegation background-run standard, the ki-work Project registry standard, the ki-work-roadmap ideas-and-graduation section and the ki-checkpoint label rule (landed and pending), the [restart-model design note, now in ki-pmo](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md#picking-up-a-thread), the [thread-types design note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/thread-types-and-durable-decisions.md), the four Initiatives under `Streams/Initiatives/`, the Project notes' frontmatter, every checkpoint label, an inventory of `+/_THREADS/`, the [decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md) and the [thread checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md).

### 1. `+/_THREADS` vs `tmp`

- **Settled (decided, not yet landed):** THREADS-CONTENT: "A thread folder holds a closed list, decisions.md and <name>.report.md only; briefs live in the state folder, work products in their owning home, temporary output in the temporary location." THREADS-TMP-HOME: "Temporary output goes in <primary checkout>/tmp/<run>/<name>/ in the repository the agent works in, ignored and deleted when the run closes or they are superflous to requirements; machine-only scratch may stay in the state folder as <name>.work/." THREADS-CLEAR: "Each owning thread clears its own folder at its next mark". The tools-ki half of THREADS-TELL is captured as [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md). The managed `tmp/` ignore already applies at any depth.
- **Landed:** the ki-delegation run packet lists only `decisions.md` and `<name>.report.md` as knowledge files, so the closed list is implied rather than stated as closed. Neither ki-delegation nor ki-pmo mentions `tmp/`. The only trimming rule is the ki-pmo tidy at each mark.
- **Conflicts:**
  - The harness half of THREADS-TELL has not landed and has no record yet. `threads-records` drafted it as [KI-HARNESS-GOV-195](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-195-thread-folder-closed-list.md) under the harness `tmp/`, uncaptured, so the closed list, the run-prompt footer line and the rubric item exist only as decisions.
  - Three thread folders already break the closed list. [tools-burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/tools-burndown/) holds six evidence, manifest and brief files. [mac-studio-setup](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-setup/) holds eight: PNG and SVG favicons, a shell script and two dry-run logs. [knowledge-acquisition](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/knowledge-acquisition/) holds `run-decisions.md`. THREADS-CLEAR covers these at each thread's next mark.
  - Kris asked for more than the mark tidy: "Improve the ways-of-working via whichever skill to ensure that the threads are regularly trimmed back as needed." A thread trims only when Kris strikes its mark, and this thread's folder now holds 24 reports. No skill yet carries a regular trigger (THREADS-TRIM).
  - THREADS-TMP-HOME says `tmp/` is deleted when the run closes. A run's draft that has not landed yet can sit only in `tmp/`: the `threads-records` harness drafts are there now. [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md) leaves open "whether close removes the folder unconditionally" (TMP-CLOSE).
- **Open:** THREADS-TRIM and TMP-CLOSE.

### 2. Thread types and behaviours

- **Settled and landed** in the ki-pmo Thread types table: "adopt the three thread types conversational, coordination and state-of-play, replacing the old names". A thread with no stated type is conversational. The coordination thread works one Project, delegates always and alternates REST and BUSY, with DONE only at Project close. The state-of-play thread does project management only and has one checkpoint per Capital. Kris's BANNER-LETTERS words set the lifecycles: "a conversational thread can be considered done. That's the end of the conversation. But a coordination thread can either be busy or at rest."
- **Settled, pending:** STATE-OF-PLAY-ROLE, "the coordination thread of coordination threads", which may "write directly into the projects and the checkpoints of the other coordination threads". Also the hold and resume verbs, "hold is a better word than drain. And what happens when you go on a hold is that you drain any work that is ongoing by not restarting any", and the restart-model pick-up table. All sit uncommitted in the harness (GATE-INACTIVE).
- **Conflicts:**
  - The landed table gives the conversational thread "Run and thread folder: None" and a banner of "None; ends DONE through `ki-recap`". The restart-model note and the pending text add HOLD for a conversational thread with a checkpoint. The tree already has a conversational-style thread with a run folder: untracked [desk-kit](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/desk-kit/), which matches `KI > mics / webcams` in THREAD-NAMES, has no Project and holds two reports. Neither version says whether a conversational thread that delegates gets a run and a thread folder (CONVERSATIONAL-RUN).
  - The restart-model note's rule 1 draws the pick-up block as an H2, `## Pick-up - mark ...`. The pending ki-pmo text and the live checkpoint use a bold line, so that `ki-checkpoint`'s closed headings hold. PICKUP-HEADING, already open from `pmo-hold`, carries this. Not re-raised.
  - The landed ki-pmo standard says a thread folder is `+/_THREADS/<project>/`. The [techne.agent-host checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/techne.agent-host.md) names `+/_THREADS/techne/`, and the state-of-play folder is `state-of-play`, not `<territory>-state-of-play`. The state-of-play case is allowed: "a run that predates this rule may keep its existing name". The Techne one is an older run name of the same kind. No query.
- **Open:** CONVERSATIONAL-RUN.

### 3. Thread naming

- **Settled (decided, not landed):** THREAD-NAMES. Showing `KI > SoP`, `KI > Model > ways of working`, `KI > Model > knowledge acquisition`, `KI > Rig > mac studio setup`, `KI > mics / webcams`, `Acquire > intake (sol)` and `Chezmoi > misc (sol)`, Kris said "this is a better way I think", and on the host: "no, the machine is only added if its limited to that machine, so intake and chezmoi misc are machine specific". The [thread-names report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/thread-names.report.md) stopped before any edit (THREAD-NAMES-GATE).
- **Landed:** the ki-checkpoint label is `<Initiative title>: <project>`, for example `Techne: agent-host`, with `Master: state-of-play` for the state-of-play thread. The ki-pmo openers carry that label. The ki-pmo mechanical boundary checks that "each coordination checkpoint's label ends in the Project name its filename carries".
- **Conflicts:**
  - Today's labels follow neither form consistently: `KI Model`, `Knowledge Islands Model`, `Fnd`, `Observatory: product` and `Knowledge Islands: registry removal`. The [knowledge-islands-model.observatory checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.observatory.md) names a Project with no note in `Streams/Projects/`. The ki-checkpoint example `Platform Foundations: chezmoi` is stale, because chezmoi now sits under Rig.
  - The new form writes the Project in words, as in `ways of working`. The landed rubric line compares the label's end with the slug `ways-of-working`, so it fails every new label unless the rubric reads spaces as hyphens.
  - The host suffix, `(sol)`, puts a host into the label. Every resume line embeds the label, but restart-model rule 3 says "Neither the pick-up block nor any resume line names a host" (NAME-HOST).
  - The first segment mixes a territory handle, `KI`, with names that are not Knowledge Islands registry entries, `Acquire` and `Chezmoi`. Meanwhile the [rig.chezmoi checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.chezmoi.md) is a KI Project thread. No rule yet says what the first segment is (NAME-ROOT).
- **Open:** NAME-HOST and NAME-ROOT. The rewrite itself waits on THREAD-NAMES-GATE.

### 4. Thread footer types, states and projects

- **Landed:** the REST, BUSY and DONE frames, plus the DRAINED frame and drain report from Kris's DRAIN-CHECK: "Add Drain as a thread state and a report form ("Drain report") ... and add the DRAINED footer frame below beside REST, BUSY and DONE." The `[state]` list order is landed too.
- **Settled, pending:** HOLD-BANNER replaces DRAINED with HOLD, the `hold report` border and the captions "threads drained / queries parked / fully archived". Every banner rewrites the pick-up block.
- **Conflicts:**
  - The output style deployed to `~/.claude/output-styles/` is symlinked from the harness checkout. Live threads therefore already render HOLD from uncommitted text, while the landed standard and its rubric still say DRAINED. GATE-INACTIVE closes the gap; not re-raised.
  - Kris's word "projects" has no counterpart in any footer. The heading names the Project, and the footer carries state only. The state-of-play footer names no coordination thread or its pick-up status, although the pending text makes state-of-play own the territory hold "with the list of threads to restart from it" (FOOTER-PROJECTS).
  - The restart-model table gives a conversational thread with a checkpoint a HOLD state. ki-recap draws only DONE, and ki-pmo's HOLD frame belongs to coordinating threads. Folded into CONVERSATIONAL-RUN.
- **Open:** FOOTER-PROJECTS.

### 5. Initiative naming in knowledge-islands

- **Settled and landed:** an Initiative is `slug` (never changes), `title`, `direction`, `lifecycle` and `lead`. The report heading uses the `title`, `Knowledge Islands model`, which Kris approved as "Actually, that is really good."
- **Facts:**
  - The four Initiatives are `knowledge-islands-model` ("Knowledge Islands model"), `platform-foundations` ("Platform foundations"), `rig` ("Rig") and `techne` ("Techne").
  - Two H1s disagree with their titles: [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) has `# Knowledge Islands Model` and [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md) has `# Platform Foundations`.
  - `knowledge-islands-model` is still a folder note holding the territory-selection design loop. Its outcome is [ADR-KI-PRINCIPAL-002](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/ADR-KI-PRINCIPAL-002-territory-derived-repository-selection.md), yet the registry standard links the Decision Record "once the design is consolidated and the folder deleted".
- **Conflicts:**
  - THREAD-NAMES uses short Initiative names, `Model` and `Rig`. No short name exists for Platform foundations, which labels currently write as `Fnd`, and nothing in the registry holds one, so every thread invents its own (INITIATIVE-NAMES).
  - TERRITORY-RULE: "the model and method root in Knowledge Islands, and my own life and machine bindings root in Personal". The Rig Initiative's Projects are [chezmoi](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/chezmoi.md), [mac-studio-setup](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md), [host-network](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/host-network.md) and [secrets-hygiene](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/secrets-hygiene.md). They are largely Kris's own machine bindings, yet they root in Knowledge Islands (RIG-ROOT).
- **Open:** INITIATIVE-NAMES and RIG-ROOT.

### 6. Ideas (scratch areas) vs Initiatives vs Projects vs roadmap items

- **Settled (pending in the harness):**
  - INCEPTION-SHAPE: "No new kind of Project: inception is the idea-stage pattern".
  - AREAS-OVERTAKE: "an idea-stage Project is a planned Project whose Outcome is a decision, ideas in Notes, no records and no thread, at most one per Initiative and three across the territory".
  - PAUSE-CONDITION, and PRIORITY-FIELD: "horizon stays the only priority signal".
  - The rooting step and the territory rule. Concepts are held as Emerging Concepts notes, work as `Idea:` bullets, and graduation goes "by quotation".
  - The attributes-by-level table: Initiatives and Projects carry no type, and records carry `kind` and `purpose`.
  - All of this sits in `registry-model`'s 11 uncommitted paths (SOL-GATE). The landed text still offers only Project `## Notes` or `_IDEAS.md`.
  - The record threshold is landed: "a record only for a product or standard change needing acceptance".
- **Conflicts:**
  - The idea-stage cap is full. [ai-observability](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ai-observability.md) (Platform foundations), [delta-evaluation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/delta-evaluation.md) (Techne) and [host-network](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/host-network.md) (Rig) make three. Knowledge Islands model therefore cannot open one until another graduates or folds, so the AREAS-DISPATCH ideas stay as `Idea:` bullets in the Ways of working note. This follows the rule as decided, so there is no query.
  - The pending registry text says a concept is held "as an Emerging Concepts note ... which `ki-repo-kb` places". ki-repo-kb says nothing about Emerging Concepts. In this island the home is `Pillars/Philosophy/Emerging Concepts/`, and Pillars changes "must go through the Enactment Process", so the lightest home for an idea is the most heavily gated (CONCEPT-HOME).
  - "Scratch areas" appears in no standard. Ideas now have five homes: Emerging Concepts, `Idea:` bullets, idea-stage Projects, Initiative Notes and `_IDEAS.md` (absent here). Working material has three more: `design/`, `+/_DESIGN/` (decided as DESIGN-RETENTION, absent here) and `+/` staging. Nothing maps Kris's word onto them (SCRATCH-TERM).
- **Open:** CONCEPT-HOME and SCRATCH-TERM.

## In Progress

Nothing is running in this run.

Outstanding - no action requested now:

- Already open elsewhere and not re-raised here:
  - GATE-INACTIVE and PICKUP-HEADING, in the [pmo-hold report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/pmo-hold.report.md).
  - SOL-GATE, in the [registry-model report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/registry-model.report.md).
  - THREADS-APPLY, in the [threads-records report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/threads-records.report.md).
  - THREAD-NAMES-GATE, in the [thread-names report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/thread-names.report.md).
- Untracked files from other sessions, left alone: `+/_THREADS/desk-kit/`, and `messenger.report.md`, `streams-index.report.md`, `thread-names.report.md` and `threads-records.report.md` in this thread folder.
- The harness `docs/diagrams/`, every checkpoint, and `Admin`, `Pillars` and `Resources` were not touched.
- My scratch copies of landed standards sit in the ignored `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/tmp/ways-of-working/thread-model-review/`. Delete them when the run closes.

## Queries

### GATE-PRINCIPAL - commit this report once ki-principal's gate runs on sol

**Context:** ki-principal on sol has no `core.hooksPath` and no `node_modules`, so the tracked commit gate cannot run. A plain commit would go in unchecked, without `--no-verify`, and the gate's own text says "a gate that cannot run is unknown, not a pass". This report and four other untracked reports in the thread folder are waiting on it.

**Query:** Should the thread commit this report through the gate once ki-principal's dev tools are installed and the gate is bound?

**Options:**

a) (recommended) Authorise `bun install` and the `core.hooksPath` binding in ki-principal on sol alongside SOL-GATE, then commit this report with the thread folder through the gate by explicit path and push fast-forward only.

b) Commit this report now without the gate, by explicit path, and run `ki repo audit` on ki-principal by hand afterwards.

### THREADS-TRIM - make thread-folder trimming regular, not only at a mark

**Context:** Kris asked: "Improve the ways-of-working via whichever skill to ensure that the threads are regularly trimmed back as needed." Landed ki-pmo trims only at a mark, which only Kris strikes. This thread's folder holds 24 reports, and three other folders break the closed list. The harness record for THREADS-TELL is not yet captured, so the rubric item it promises could carry the trigger.

**Query:** What should make a thread trim its folder between marks?

**Options:**

a) (recommended) Fold the trigger into the THREADS-TELL harness record. The ki-pmo rubric item flags any thread folder holding a file outside the closed list, or holding answered and homed reports. The thread then tidies at every resting point, with the same explicit-path `git rm` and no record. The state-of-play thread names flagged folders in their checkpoints' messages blocks at its own mark.

b) Keep the tidy at the mark only, and add the state-of-play flag alone.

c) Tidy at every report, as well as at each resting point.

### TMP-CLOSE - what `ki agent close` does with a non-empty tmp folder

**Context:** THREADS-TMP-HOME has the run's `tmp/<run>/<name>/` "deleted when the run closes or they are superflous to requirements". [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md) leaves open whether close removes it unconditionally. Today the only copies of the `threads-records` harness drafts are in `ki-agentic-harness/tmp/ways-of-working/threads-records/`.

**Query:** Should close remove a run's tmp folders unconditionally?

**Options:**

a) (recommended) Close lists each non-empty `tmp/<run>/<name>/` and keeps it under the same strict gate, with `--reconciled` as the owner's waiver. A draft that must survive is homed first, as an uncommitted change named in the report or committed in its owning repository. Record this as [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md)'s planning answer.

b) Close removes every tmp folder unconditionally, and a run never parks a needed draft in `tmp/`.

### CONVERSATIONAL-RUN - may a conversational thread own a run, a thread folder and HOLD

**Context:** Landed ki-pmo gives the conversational thread no run, no thread folder and no banner, and says it "ends DONE through `ki-recap`". The restart-model note gives one with a checkpoint a HOLD state. `KI > mics / webcams` already has an untracked `+/_THREADS/desk-kit/` folder of agent reports and no Project. It "May, but need not" delegate.

**Query:** When a conversational thread launches background agents, what does it own?

**Options:**

a) (recommended) It takes a run and a thread folder named for its checkpoint, under the same closed list and commit rule, and deletes the folder at its DONE. Its HOLD uses the ki-pmo hold report and HOLD frame with the conversational resume line from the restart-model table. It never gets REST or BUSY.

b) A conversational thread may launch agents but keeps no thread folder. Its agents report into the state folder only, and anything lasting goes to a record or a routed learning.

c) A thread that launches agents becomes a coordination thread and needs a Project.

### NAME-HOST - the host suffix in a label and the no-host resume line

**Context:** Kris set the host suffix as "the machine is only added if its limited to that machine", as in `Acquire > intake (sol)`. Restart-model rule 3 says "Neither the pick-up block nor any resume line names a host", but every resume line embeds the thread's label.

**Query:** Does the resume line carry the host suffix of a machine-bound thread's label?

**Options:**

a) (recommended) Yes. The suffix marks the thread as machine-bound, not where work comes back up, so a machine-bound thread's label and resume line keep it. Rule 3 then reads "no thread's state names a host other than in a machine-bound label".

b) No. The resume line and pick-up block use the label without its suffix, which then appears only in the runtime's session name.

### NAME-ROOT - what the first segment of a thread name is

**Context:** THREAD-NAMES opens five names with `KI` and two with `Acquire` and `Chezmoi`. Neither of those two is a Knowledge Islands Initiative, and the `rig.chezmoi` checkpoint is a KI Project thread. The landed rubric checks that a label ends in its Project slug, but the new names write Projects in words, such as `ways of working`.

**Query:** What does each segment of a thread name stand for, and what does the rubric check?

**Options:**

a) (recommended) The form is `<root> > <Initiative short name> > <Project in words>`, with a `(<host>)` suffix only for a machine-bound thread. The root is the territory's short name (`KI`) for a thread on a registry Project. For a thread outside any registry it is the system it works on, such as `Acquire` or `Chezmoi`. The Initiative is left out where none fits, and the state-of-play thread is `<root> > SoP`. The rubric reads spaces in the last segment as hyphens when matching the Project slug.

b) Every thread roots in a territory, so `Chezmoi > misc (sol)` becomes `Personal > Chezmoi > misc (sol)` under TERRITORY-RULE.

### FOOTER-PROJECTS - what "projects" means in the footer

**Context:** Kris's topic is "Thread footer types, states and projects". Footers carry only the frame and `[state]` items, and the heading names the Project. The pending text makes the state-of-play thread own the territory hold "with the list of threads to restart from it", but nothing in its footer shows the coordination threads.

**Query:** Should a footer show Projects?

**Options:**

a) (recommended) Only the state-of-play footer does. Its list gains one `- [thread] <label> - rest | busy | hold` item per coordination thread, read from each pick-up block. Coordination footers stay as they are, because the heading names the Project.

b) Every footer's top border names its Project after the form word.

c) No change, with the Project shown in the heading only.

### INITIATIVE-NAMES - one short name per Initiative, and titles matching H1s

**Context:** THREAD-NAMES uses `Model` and `Rig`. Labels use `KI Model`, `Knowledge Islands Model` and `Fnd`, and no registry field holds a short name. Two Initiative H1s disagree with their `title`: `Knowledge Islands Model` and `Platform Foundations`. The report heading uses the `title`, so the title stays as it is.

**Query:** Where does an Initiative's short name live?

**Options:**

a) (recommended) Add an optional `short` field to the Initiative note in the ki-work registry standard, set to `Model`, `Foundations`, `Rig` and `Techne`, and use it in thread names. In the same change, align the two H1s with their titles.

b) Derive the short name by dropping the territory name from the title. This gives `Model`, but leaves `Platform foundations` long.

c) Keep it in the ki-pmo label rule as a per-territory list.

### RIG-ROOT - where the Rig Initiative roots under the territory rule

**Context:** TERRITORY-RULE: "the model and method root in Knowledge Islands, and my own life and machine bindings root in Personal". Rig holds chezmoi, mac-studio-setup, host-network and secrets-hygiene, largely Kris's own machines and vaults, yet they root in Knowledge Islands.

**Query:** Does Rig stay a Knowledge Islands Initiative?

**Options:**

a) (recommended) Rig stays in Knowledge Islands as the method: Rig, its profiles and the workstation standard. Each Project's Kris-specific bindings are confirmed for Personal at that thread's next mark under the rooting step. Nothing moves now.

b) Move the Rig Initiative and its Projects to the Personal territory now.

### CONCEPT-HOME - where an uncommitted concept waits

**Context:** The pending rooting rule holds a concept "as an Emerging Concepts note in the owning Capital's knowledge base, which `ki-repo-kb` places". ki-repo-kb has no such rule. Here the home is `Pillars/Philosophy/Emerging Concepts/`, and every Pillars change needs an Enactment record or an owner instruction.

**Query:** Should a concept that is not yet committed to wait in Pillars?

**Options:**

a) (recommended) Keep Emerging Concepts in Pillars as the settled home for a concept Kris has accepted for ideation. Until then the concept waits as an `Idea:` bullet in the nearest Project or Initiative Notes, and moves into Emerging Concepts through the Enactment Process when Kris confirms it at the mark. Add the placement to ki-repo-kb.

b) Give Emerging Concepts a home under `Streams/`, outside Enactment.

### SCRATCH-TERM - what "scratch area" names

**Context:** Kris wrote "Ideas (Scratch Areas)". Ideas have five homes: Emerging Concepts, `Idea:` bullets, idea-stage Projects, Initiative Notes and `_IDEAS.md`. Working material has three: `design/`, `+/_DESIGN/` and `+/` staging. `tmp/` is disposable. No standard uses "scratch area".

**Query:** What does "scratch area" mean in the standards?

**Options:**

a) (recommended) It is the plain-language name for the idea homes taken together, with no new place. The ki-work-roadmap ideas section gains one table mapping each kind of idea to its home and its way out: graduation, quotation or fold. It also says `tmp/` is never an idea home.

b) A new tracked scratch folder per Capital, such as `+/_SCRATCH/`, for ideas before rooting.

```text
GATE-PRINCIPAL

Authorise `bun install` and the `core.hooksPath` binding in /Users/krisbrown/workspaces/knowledge-islands/ki-principal on sol alongside SOL-GATE, then commit +/_THREADS/ways-of-working/thread-model-review.report.md with the thread folder through the gate by explicit path and push fast-forward only.

---

THREADS-TRIM

Fold the trigger into the THREADS-TELL harness record: a ki-pmo rubric item flags any thread folder holding a file outside the closed list, or answered and homed reports, and the thread then tidies at every resting point with the same explicit-path git rm and no record; the state-of-play thread names flagged folders in their checkpoints' messages blocks at its own mark.

---

TMP-CLOSE

Answer KI-TOOL-KI-CLI-137's planning question so: ki agent close lists each non-empty tmp/<run>/<name>/ and keeps it under the strict close gate, with --reconciled as the owner's waiver; a draft that must survive is homed first, as an uncommitted change named in the report or committed in its owning repository.

---

CONVERSATIONAL-RUN

A conversational thread that launches background agents takes a run and a thread folder named for its checkpoint, under the same closed list and commit rule, and deletes the folder at its DONE; its HOLD uses the ki-pmo hold report and HOLD frame with the conversational resume line from the restart-model table; it never gets REST or BUSY.

---

NAME-HOST

A machine-bound thread keeps its host suffix in its label and its resume line, because the suffix marks the thread as machine-bound rather than where work comes back up; restart-model rule 3 reads "no thread's state names a host other than in a machine-bound label".

---

NAME-ROOT

Thread names take the form <root> > <Initiative short name> > <Project in words>, with a (<host>) suffix only for a machine-bound thread. The root is the territory's short name (KI) for a registry Project and the system worked on (Acquire, Chezmoi) otherwise; the Initiative is left out where none fits; the state-of-play thread is <root> > SoP; the rubric reads spaces in the last segment as hyphens when matching the Project slug. Carry this into the THREAD-NAMES change.

---

FOOTER-PROJECTS

Only the state-of-play footer shows Projects: its list gains one - [thread] <label> - rest | busy | hold item per coordination thread, read from each pick-up block; coordination footers stay as they are.

---

INITIATIVE-NAMES

Add an optional short field to the Initiative note in the ki-work registry standard, set to Model, Foundations, Rig and Techne, used in thread names; in the same change align the Knowledge Islands model and Platform foundations H1s with their titles.

---

RIG-ROOT

Rig stays a Knowledge Islands Initiative as the method: Rig, its profiles and the workstation standard. Each Rig Project's Kris-specific bindings are confirmed for Personal at that thread's next mark under the rooting step; nothing moves now.

---

CONCEPT-HOME

Emerging Concepts stays in Pillars as the home for a concept Kris has accepted for ideation; until then a concept waits as an Idea: bullet in the nearest Project or Initiative Notes and moves into Emerging Concepts through the Enactment Process when Kris confirms it at the mark; add the placement to ki-repo-kb.

---

SCRATCH-TERM

"Scratch area" is the plain-language name for the idea homes taken together, with no new place: the ki-work-roadmap ideas section gains one table mapping each kind of idea to its home and its way out (graduation, quotation or fold), and says tmp/ is never an idea home.
```

```text
╭─ run report · 2026-10-15T22:04:51Z ──────────────╮
│                                                  │
│  █▀▀▄ █  █ █▀▀▀ █  █   · thread busy             │
│  █▀▀▄ █  █ ▀▀▀█  ▀█▀   · running or queued work  │
│  █▄▄▀ █▄▄█ ▄▄▄█   █    · lines below say which   │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [running] cli-pin - Harness pin and the v0.10.5 release
- [waiting] GATE-PRINCIPAL
- [waiting] THREADS-TRIM
- [waiting] TMP-CLOSE
- [waiting] CONVERSATIONAL-RUN
- [waiting] NAME-HOST
- [waiting] NAME-ROOT
- [waiting] FOOTER-PROJECTS
- [waiting] INITIATIVE-NAMES
- [waiting] RIG-ROOT
- [waiting] CONCEPT-HOME
- [waiting] SCRATCH-TERM
- [uncommitted] this report in ki-principal, waiting on GATE-PRINCIPAL
