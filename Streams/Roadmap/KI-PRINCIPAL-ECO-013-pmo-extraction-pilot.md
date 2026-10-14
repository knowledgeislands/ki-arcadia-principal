---
note_type: stream-roadmap
id: KI-PRINCIPAL-ECO-013
area: ECO
title: PMO extraction pilot
kind: deliver
purpose: governance
project: ways-of-working
horizon: next
status: draft
tags:
  - topic/knowledge-islands
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-13T13:42:43Z
updated_at: 2026-10-14T00:40:00Z
---

# PMO Extraction Pilot

## Goal

A coordinating thread's rules live in their own skill, `ki-pmo`, so that a thread can be rebuilt from repository evidence alone and the thread stays responsive: it delegates every unit of work to a detached background agent, answers Kris within one short turn while agents keep running, and is reminded of that on every message by a hook on both runtimes. This is the one pilot of the change-management design; the waves that restructure the rest wait for its lessons.

## Context

The change-management design in the [[ways-of-working|Ways of working]] Project ran under `ki-design-loop`: a brief, two independent reviews, one merged report and Kris's decisions, all in the Project's [[ways-of-working/design/design|design folder]]. Kris chose the pilot's scope as `PILOT-SCOPE` (a), "ki-pmo move only, with the rebuild-from-checkpoint test.", and `COORD-HOOK` (a), "both runtimes before the pilot opens, as the pilot's first task." (Kris's answers of 2026-10-13, recorded in [[change-management-decisions]]). The pilot also carries the responsive coordinator, which Kris made a fundamental requirement on 2026-10-13, "This is a fundamental requirement of the delegation capability.": the report's responsive-coordinator section sets six enforcement layers and requires the pilot to carry layers 1, 2, 3 and 6, the opener's role line, the salience hook, the counted turn budget and the measured acceptance test.

Today the thread material sits inside the `ki-delegation` background-run standard, beside the run mechanics, and the written responsiveness rules are not holding: threads keep doing work directly and every owner message pre-empts it. The report's diagnosis is that the rule is right and the enforcement is missing, so the pilot pairs the move with enforcement that does not depend on the model remembering.

The first task, the coordinator reminder hook for Claude Code and Codex, is done: the `coord-hook` agent of the `ways-of-working` run built it under Kris's "COORD-HOOK: (a) - build the coordinator reminder hook for both runtimes (Claude Code and Codex) now, before the pilot opens, and get it trialled.", with the script shipped by the harness beside its existing hooks and the registration managed in chezmoi. This record references that work as landed and does not re-plan it.

This record belongs to Knowledge Islands Principal because the pilot is the design's rollout step under the ways-of-working Project, which this Capital owns, and its delivery spans the `ki-agentic-harness` skills and the chezmoi user configuration. It follows the pattern Kris set for the notification strategy under `HOME` (a): keep the record in `ki-principal` and hand deliveries to each repository, which keeps its own plan, priority and acceptance.

## Boundary

- The `ki-pmo` move only. No checkpoint schema field, no label change, no default coordinator model change and no `ki` command change; those belong to the waves.
- Layers 4 and 5 of the responsive coordinator are out: the `ki agent` mechanical support lands in Wave C and the lighter coordinator through the `COORD-DEFAULT` trial, each judged against the same acceptance test.
- The `COORD-DEFAULT` trial of `fast` at low effort may run on the pilot's Project thread but is not this record's deliverable, and the open Claude Code `fast` binding under `BINDINGS` is not needed by it.
- No rename of `ki-design-loop` or `ki-work-housekeeping`; `NAMES` is Wave E.
- No Decision Record and no deletion of the design folder; both are Wave F. Kris has since settled where design working material lives, in words that reached the thread with stop words stripped, quoted as received: "DESIGN-RETENTION - (a) +/_DESIGN/<subject-slug>/ in every repository." The pilot does not move the design folder or change the design loop's standard: the standard change is Wave B's and the move is Wave F's, and the choice is held here and in [[change-management-decisions]] until those waves have records.

## Scope

1. Create `ki-pmo` in the harness's `change-management` area, declaration-only, and move the thread material of the `ki-delegation` background-run standard into it without changing its meaning: the coordinator responsiveness rules, the coordinating-thread reporting practices and the full summary, project threads, the territory master thread, opening a thread, bootstrap, directions from the master and the thread working rules. Worker reporting and the run mechanics stay with `ki-delegation`; the owner report and its Needs tags stay with their canonical owner and `ki-pmo` adopts them by reference. The pilot declares `ki-pmo` in this island and in the harness; the other Capitals declare it under `CAPITALS` below.
2. Add reciprocal off-ramps in `ki-delegation`, `ki-checkpoint`, `ki-tokenomics` and `ki-recap`. The `ki-recap` off-ramp is the form Kris chose for `RECAP-AWARE`, quoted as received: "RECAP-AWARE - (c) ki-recap detects a coordinating thread and hands to ki-pmo's forms." In a coordinating thread `ki-recap` hands to `ki-pmo`'s forms, and elsewhere it recaps as it does today. Then re-point `ki-checkpoint`'s cross-references and the refresh rule to `ki-pmo`; refine `ADR-KI-HARNESS-SKILLS-005` and `ADR-KI-HARNESS-SKILLS-006` in place and widen the `change-management` area description; write the five-word glossary and the thin rubric.
3. Layer 1: the opener's role line carries the three rules of the responsive coordinator in Kris's words, and the thread re-bootstraps on request, after a compaction and after a model switch.
4. Layer 2: the coordinator reminder hook on both runtimes, built and registered as the pilot's first task under "COORD-HOOK - When to build the reminder hook: (a) both runtimes before the pilot opens, as the pilot's first task." The pilot makes `ki-pmo` the owner of its line and moves its signal to the `ki-pmo` declaration, as Kris settled: "HOOK-OWNER - (a). A repository that doesn't delegate then never gets the hook, and removing ki-pmo disables it."
5. Layer 3: the counted turn budget and self-check, at most five tool calls a turn with reads and writes limited as the report states, anything beyond a launch, and drift reported to Kris in one line and noted in the checkpoint.
6. Layer 6: the acceptance tests below, run and scored from the session transcript.
7. Coordinator output style, Kris's `COORD-STYLE` answer of 2026-10-14, "(c) in the pilot; (a) now.": the harness ships an output-style file for coordinating threads, selected by `outputStyle` in the tracked `.claude/settings.json` of this island and the harness, carrying the three responsiveness rules and the owner-report shape as the style text so that the style and the contract are one document; `Concise` stays everywhere else. Option (a), the one sentence in `ki-delegation`'s Reporting section that no style or shaping layer shortens an owner report, is applied and is the fallback. Its first check is resolved: a project-level `outputStyle` does override the user-level one in Claude Code 2.1.287, so the style can be selected per repository. The evidence is under Discussion.

## Acceptance tests

1. **Rebuild from checkpoint.** With the run folder made unavailable, a fresh session re-bootstraps the master and one Project thread from repository evidence alone, recovers scope, in-force authority, outstanding Needs and the next step, and derives the correct opener by hand from the rule. A generic checkpoint in a repository without `ki-pmo` still validates.
2. **Responsiveness.** While a background agent of the pilot's run is working, Kris sends the Project thread a message. The thread answers within one turn of at most five tool calls, reading nothing beyond its checkpoint and `ki agent status`; `ki agent status` before and after shows the same agents running; the session transcript shows no in-session subagent. Run at least three times, once after a compaction.
3. **Hook.** The reminder line appears on every owner message in a coordinating thread on Claude Code and on Codex, appears again after a compaction, and does not appear in an agent launched by `ki agent`.

## Current state

- The thread material still sits in the `ki-delegation` background-run standard: Coordinator responsiveness at lines 41 to 57 and the Reporting, Project threads and Thread working rules sections at lines 148 to 370 of `skills/governance/ki-delegation/references/standards-background-runs.md` at harness revision `71d7a0fd`. The standard's owner report and Needs tags are the canonical form Kris set on 2026-10-13 and stay there. `ki-pmo` does not exist; no repository declares it; `ki-checkpoint`'s standard cites the `ki-delegation` opener, parking rule and refresh rule by anchor; `ki-recap` and `ki-tokenomics` do not mention coordinating threads.
- The coordinator reminder hook is built, tested, registered on both runtimes through the chezmoi source and trialled live; `claude -p` runs hooks, which closes the first open question below. Its line already carries the cadence clause of "HOOK-LINE - (b)." and its detection signal is `+/_CHECKPOINTS/` at the Git top level, as HARN-012 of the harness specification states. The `ki-delegation` standard's Coordinator responsiveness section carries the tool-call and cadence rules, the sentence that no output style shortens an owner report, and the two decisions-log rules of "PROMPT-PROTECT - (a), plus the two (c) rules in ki-delegation."
- The proxy setting of `PROMPT-PROTECT` (a) is declared in the chezmoi source but the running Headroom proxy has not been restarted; Kris: "RESTART-PROXY - will restart Headroom after the chain finishes." Until then owner turns and hook lines read from earlier turns may be compressed, so acceptance tests 2 and 3 cannot be scored verbatim.
- The user-level Claude Code settings select `Concise`; this island's tracked `.claude/settings.json` holds only the memory switch and the harness's holds its proxy environment and permissions. Neither sets `outputStyle`, and the harness ships no output-style file.
- A sibling background agent of the `ways-of-working` run is renaming `ki-design-loop` to `ki-pmo-design` and `ki-work-housekeeping` to `ki-work-recurring` and moving `ki-pulse`, in a harness worktree under its own deliver record, after Kris's "SKILLS-PARALLEL - yes; start the two Wave E renames and the ki-pulse move now in a worktree, with a deliver record; leave ki-pmo for the pilot." The pilot's harness work starts from a baseline that includes those commits.

## Steps

Each repository delivers its steps under its own authority; the harness and chezmoi steps are the handoff this record describes under Dependencies / blocks.

### ki-agentic-harness

- [ ] Create `skills/change-management/ki-pmo/` with `SKILL.md` (governance, declaration-only, `ki-depends-on` naming `ki-delegation` and `ki-checkpoint`, as Kris requires: "where a skill relies on another, its imperative that that mapping is clear in the frontmatter"), `references/standards-pmo.md`, `references/sources.md`, the rubric items under `scripts/rubric/` and the generated `references/rubric.md`. The standard opens with the responsive coordinator principle in Kris's words and the three rules, then holds the moved material in this order: coordinator responsiveness with the counted turn budget and self-check, coordinating-thread practices, the three report forms and the full summary, project threads, the territory master thread, opening a thread with both openers, bootstrap, directions from the master, recap since the mark, parking tangents, linking records, keeping primary checkouts current and refreshing this guidance. The owner report and Needs tags are adopted by link to the `ki-delegation` Reporting section, not restated. The refresh rule compares `git log -1 -- skills/change-management/ki-pmo` and the checkpoint line becomes `ki-pmo read at <revision>`. The openers and the bootstrap line read `under ki-pmo`, and bootstrap accepts the old `under ki-delegation` form during the pilot. The glossary defines session, thread, run, worker and agent with one owner each.
- [ ] Reduce `ki-delegation`: delete the moved sections from the standard and its Contents, leaving Scope, Detachment, Run packet, Prompt shape, Authority tiers, Decisions log, Coordination, Run queue, Monitoring, Reporting with the owner report and Needs tags, Reference launcher and Mechanical boundary; replace Coordinator responsiveness with a short off-ramp that a coordinating thread follows `ki-pmo`; keep the sentence that no output style shortens an owner report and the two decisions-log rules; move the thread half of rubric item RUN-3 into `ki-pmo`'s rubric; update the SKILL.md description, HELP text and Notes.
- [ ] Add the off-ramps: `ki-checkpoint`'s standard cites `ki-pmo` for the opener, the parking rule and the refresh rule; `ki-recap` detects a coordinating thread, meaning the repository declares `ki-pmo` and the session resumed a `+/_CHECKPOINTS/` checkpoint, and hands to `ki-pmo`'s Summary, recap and full summary, recapping as now everywhere else; `ki-tokenomics` points the coordination purpose at `ki-pmo` for the coordinator's budget and escalation rule.
- [ ] Make `ki-pmo` the hook's owner: the script comment, `hooks/README.md` and HARN-012 say the line is `ki-pmo`'s text restating its rules; the coordinating-thread signal becomes a `[skills.ki-pmo]` table in the top-level `.ki.toml` of the hook's `cwd` or its Git top level, replacing the `+/_CHECKPOINTS/` test; `hooks/coordinator-reminder.test.ts` covers a declaring checkout, a checkout with checkpoints but no declaration, and the existing silence cases. The harness declares `[skills.ki-pmo]` in its own `.ki.toml`.
- [ ] Ship the coordinator output style: one Markdown file with frontmatter `name` and `description` under a tracked `output-styles/` folder beside `hooks/`, whose body is the three responsiveness rules in Kris's words and the owner-report shape with its banner, sections, query form and reply block, stating that no section, query or reply block is ever shortened; select it with `outputStyle` in the harness's tracked `.claude/settings.json`; add a HARN clause to `docs/specs/harness.md` with its verify line.
- [ ] Refine `ADR-KI-HARNESS-SKILLS-005` and `ADR-KI-HARNESS-SKILLS-006` in place: delegation is the run contract and the PMO is the coordinating thread, and the `change-management` concern description also holds the coordinating-thread governance.
- [ ] Regenerate the skill graph and skill map under `docs/diagrams/` so `ki-pmo` and its declared reliances appear, and update any harness document that cited the moved anchors (`docs/specs/bootstrap.md`, the subagent coordination note and `AGENTS.md` where they do).
- [ ] Run the gates under Verify, commit as Conventional Commits by explicit path, and push fast-forward.

### chezmoi source

- [ ] Deploy the harness's output-style file to `~/.claude/output-styles/` as a managed file sourced from the primary harness checkout, the way `.chezmoidata/coordinator-hook.yaml` points at the hook script, so that a repository-level `outputStyle` can resolve it; keep `.chezmoidata/claude.yaml` at `Concise`. No change to the hook registration: the command path and the Codex trust hashes cover the handler entry, not the script.
- [ ] Review `chezmoi diff`, apply only the new file, run `node --test`, commit and push fast-forward.

### ki-principal

- [ ] Declare `[skills.ki-pmo]` in `.ki.toml` once the harness has pushed the skill, and set `"outputStyle"` to the shipped style's name in the tracked `.claude/settings.json`.
- [ ] Run `ki repo audit --skill ki-pmo --repo .` and `ki repo audit --skill ki-checkpoint --repo .`; both pass.
- [ ] Run acceptance test 1 on the master thread and the `ways-of-working` Project thread with `~/.local/state/ki/agents/ways-of-working` renamed aside for the test and restored afterwards, in a fresh session on each runtime, and a generic checkpoint audit in a repository that does not declare `ki-pmo`.
- [ ] After Kris's Headroom restart, run acceptance tests 2 and 3 from the `ways-of-working` Project thread on Claude Code and on Codex: three owner messages while an agent runs, one after a compaction, and the hook line checked verbatim in each transcript; each coordinating checkpoint replaces its `ki-delegation read at` line with `ki-pmo read at` at its next update.
- [ ] Score the tests from the transcripts, record the outcome and the lessons for the waves under Discussion, and hand this record to Kris for `ki-accept`.

## Files touched

- `ki-agentic-harness`: `skills/change-management/ki-pmo/**` (new); `skills/governance/ki-delegation/SKILL.md`, `references/standards-background-runs.md`, `references/rubric.md`, `scripts/rubric/**`; `skills/governance/ki-checkpoint/references/standards-checkpoints.md`; `skills/change-management/ki-recap/SKILL.md`; `skills/environment/ki-tokenomics/SKILL.md`; `hooks/coordinator-reminder.sh`, `hooks/coordinator-reminder.test.ts`, `hooks/README.md`; `output-styles/<style>.md` (new); `.claude/settings.json`; `.ki.toml`; `docs/specs/harness.md`; `docs/decisions/ADR-KI-HARNESS-SKILLS-005-*.md`, `ADR-KI-HARNESS-SKILLS-006-*.md`; `docs/diagrams/skill-graph.*`, `skill-map.*`; `docs/specs/bootstrap.md` and other anchor citers.
- chezmoi source: one managed file for `~/.claude/output-styles/<style>.md` and its test.
- `ki-principal`: `.ki.toml`; `.claude/settings.json`; this record; each coordinating checkpoint's `ki-pmo read at` line, written by its own thread.

## Verify

Harness gates, run in the harness checkout:

```text
bun run test
bunx tsc --noEmit
bun test hooks/coordinator-reminder.test.ts
ki repo audit --skill ki-skills --repo .
ki repo audit --skill ki-delegation --repo .
ki repo audit --skill ki-checkpoint --repo .
ki repo audit --skill ki-pmo --repo .
ki repo audit --skill ki-repo-harness --repo .
```

Chezmoi gate: `chezmoi diff` shows only the new output-style file; `node --test` passes.

Island gates, run here:

```text
ki repo audit --skill ki-pmo --repo .
ki repo audit --skill ki-checkpoint --repo .
ki repo audit --skill ki-repo-kb-streams --repo .
```

Acceptance tests 1 to 3 pass as written above and their transcript evidence is cited under Discussion. Tests 2 and 3 are scored verbatim only after the Headroom restart of `RESTART-PROXY`; the unit tests and test 1 do not wait for it. A live check that a fresh Claude Code session in this island reports the coordinator style as active, and a session in an ordinary repository still reports `Concise`, confirms the override in use.

## Dependencies / blocks

- The coordinator reminder hook is built, registered on both runtimes and trialled; nothing in it blocks the pilot. The installed `ki` already silences the hook in background agents through the terminal check, so the `KI_AGENT_RUN` marker release is not needed.
- `ki-agentic-harness` delivers the skill, standard, hook, output-style, Decision Record and rubric changes under its own authority and acceptance; the harness steps above are the handoff, written as `ki-work-roadmap` describes, and the harness owns its plan and priority. Its baseline includes the skill-renames commits of the sibling agent, so the two do not collide in `skills/change-management/` or the skill graph. The chezmoi source deploys the style file under its own ownership and leaves the hook registration unchanged.
- The `ki-delegation` background-run standard at harness revision `71d7a0fd`, with the Reporting section that carries Kris's owner report, is the source of the moved material.
- Acceptance tests 2 and 3 depend on Kris's Headroom restart; test 1 depends on nothing outside this island and the harness.
- Nothing in this repository blocks the pilot; `blocked_by` is empty. Waves A to F wait for the pilot's lessons, which are written into each wave's brief before it starts. The tracked thread home of `DECISION-HOME` (b) is harness work outside the pilot, so test 1 proves rebuild from the checkpoint alone.
- Follow-on, not blocking: `tools-rig`'s `rig doctor` check that a machine declaring a Capital has the reminder registered, which `HOOK-OWNER` (a) names; and the KI Website's harness skill pages, which list `ki-delegation`'s thread material and gain `ki-pmo`.

## Delegation

The `ways-of-working` Project thread coordinates; every unit below is a detached background agent under the `ki-delegation` contract, and the thread itself makes no edit beyond its checkpoint, the decisions log and a brief.

- **Round 1, harness, one agent in a worktree:** the `ki-pmo` skill, the `ki-delegation` reduction, the four off-ramps, the hook ownership and signal change with tests, the output-style file and setting, the two Decision Record refinements, the diagrams and the gates. Deliverable: one or more Conventional Commits pushed fast-forward under the harness's roadmap record. Gate: harness gates pass and the push has landed.
- **Round 1, chezmoi, one agent:** the managed output-style file, test, diff review and apply of that file only. Gate: `node --test` passes and `chezmoi diff` is clean for the file.
- **Round 2, this island, one agent:** the `.ki.toml` declaration and the settings change, the island audits, then acceptance test 1 and the generic-checkpoint audit, reporting transcript paths. Gate: audits pass and test 1 is scored.
- **Round 3, Kris and the thread:** acceptance tests 2 and 3 after the Headroom restart, scored by a background agent from the transcript files; lessons written into this record.
- The thread reviews each report against the acceptance tests and this plan before the next round; Kris accepts through `ki-accept`.

## Documentation impact

### Decision Records

`ADR-KI-HARNESS-SKILLS-005` and `ADR-KI-HARNESS-SKILLS-006` are refined in place in the harness, as the design-loop standard requires for an existing record. No new Decision Record: Wave F consolidates the whole design into one, and the pilot's rationale lives in the design report and this record until then.

### Specifications

HARN-012 in the harness specification is re-pointed to `ki-pmo` as the line's owner and to the declaration as the signal, and a new HARN clause specifies the shipped output-style file and its selection. No `ki` command or checkpoint schema behaviour changes.

### Guides

The harness `hooks/README.md` describes the new signal and owner. The chezmoi Claude Code guide gains the managed output-style file beside its `Concise` note. The KI Website's harness skill pages follow as a non-blocking handoff.

### Roadmap

Waves A to F are captured as records only after the pilot's lessons are written here, under Kris's standing focus of 2026-10-14: "Create no new feature records and do not widen scope". The harness and the website each capture their own delivery record for the handoffs above; `tools-rig` captures the `rig doctor` check when it takes it.

## Discussion

### Why one record and why here

The design-loop standard asks for one pilot before any parallel wave, and `PILOT-SCOPE` (a) narrows it to the `ki-pmo` move so that one failure mode gives clean lessons. The report places the pilot record in `ki-agentic-harness`; Kris's `HOME` answer for the sibling notification record keeps the coordinating record in the Capital and hands deliveries to each repository, and this record follows that pattern. If Kris prefers the harness to hold the record directly, the trade of its content is one `ki-trade` step.

### Output style precedence

Checked on 2026-10-14 against the installed Claude Code 2.1.287, by reading the runtime binary's strings and the settings schema shipped with its editor extension, without changing any setting. The runtime lists its settings sources in the order user, project, local, command-line flag and managed policy, labelled `user`, `project`, `project, gitignored`, `cli flag` and `managed`, and resolves a key by walking that list from the last source to the first and taking the first source that defines it, so a project-level value overrides the user-level one and a gitignored `.claude/settings.local.json` overrides both. The runtime's own `/output-style` command writes the chosen style to the project's local settings file, and its project-local settings writer allows exactly one key, `outputStyle`, which is how it expects per-project selection to work. The settings schema describes `outputStyle` as an ordinary setting with no scope restriction. Custom styles are read from `output-styles` folders under the user and project `.claude` directories and from plugins, which is why the chezmoi step deploys the harness file to the user folder rather than copying it into every repository. Two consequences for the plan: a tracked repository setting is enough to select the coordinator style, and a stray `.claude/settings.local.json` written by `/output-style` in a Capital would silently override it, so the acceptance check includes the live "style is active" line.

### Planning choices held as defaults

- The style file is named `ki-coordinator`, so the per-turn reminder reads as the coordinator style being active; the harness may choose another name that passes Kris's glance test.
- The openers and bootstrap line move to `under ki-pmo`, since the skill name in the opener points at where the rules live; the old form is accepted during the pilot and dropped in Wave F.
- `ki-pmo` is created user-invocable with the argument hint `summary | recap | full-summary | mark`, because Kris chose "SUMMARY-ENTRY - (b) /ki-pmo entry point once KI-PRINCIPAL-ECO-013 creates ki-pmo; build nothing now." and this record is where `ki-pmo` is created; the entry adds frontmatter and no new skill.
- The hook's signal moves to the declaration in this pilot rather than keeping `+/_CHECKPOINTS/` as a fallback, because Kris's `HOOK-OWNER` words make removing the declaration the way to disable it; which Capitals declare it in the pilot is the `CAPITALS` query to Kris.

### Open questions

- Whether `claude -p` runs hooks is settled: the `coord-hook` agent's live trial showed it does, on both the scratch and the real registration.
- Whether a project-level `outputStyle` overrides the user-level one is settled above.
- The `fast` trial under `COORD-DEFAULT` could run on this pilot's Project thread once the hook and the budget are in place; that is a choice for the thread, not a change to this record's boundary.
- Which Capitals declare `ki-pmo` in the pilot: this island and the harness only, leaving the other six territories' master threads without the hook until Wave F, or every Capital by a one-line handoff now. Raised to Kris as `CAPITALS`.
