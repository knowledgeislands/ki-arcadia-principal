# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › registry-model

**Run report at 22:44 BST · last mark 16:09 BST**

---

## Done

- **REGISTRY-RECORD carried, no new record.** Kris set on 15 October: "No new record: after pmo-hold, one agent carries ROOTING-MODEL, AREAS-PATTERN, TERRITORY-RULE, PAUSE-CONDITION and the types-review attribute rules into the ki-work Project registry standard and the ki-work-roadmap ideas-and-graduation section, with the decisions log and run report holding the change." All of it is written in the ki-agentic-harness working tree on sol. It is **not committed**: see SOL-GATE.
- **[Project registry standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work/references/standards-project-registry.md)** gains four sections, each quoting Kris inline:
  - _Idea-stage Project_ (AREAS-PATTERN, AREAS-OVERTAKE, IDEA-STAGE, IDEA-CAP): a `planned` Project whose `outcome` opens "<lead> decides", ideas in Notes, no records and no thread, at most one per Initiative and three across the territory, reviewed at each state-of-play mark. It graduates to `active` or folds after a close-out. It takes no type field, quoting "No new kind of Project: inception is the idea-stage pattern".
  - _Paused Project_ (PAUSE-CONDITION): `## Notes` opens with one line giving the release condition and review date, with no new front matter.
  - _Attributes by level_ (the types-review rules): a crosswalk of Initiative, Project, work record and Activity. It states that Projects and Initiatives take no type field, that `kind` and `purpose` are record-only, and that "horizon stays the only priority signal".
  - _Rooting_ (ROOTING-MODEL, TERRITORY-RULE): the rooting step at the mark; owning territory = "whose Capital must accept it"; concepts go to an Emerging Concepts note and work to `Idea:` bullets; one handoff, never a mirror; graduation slice by slice.
- **[Repository roadmap standard, Ideas and graduation](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work-roadmap/references/standards-repository-roadmaps.md)**:
  - Ideas now wait in four places: the rooting rule first, then Project Notes, an idea-stage Project, Initiative Notes, then `_IDEAS.md`.
  - No record names an idea-stage Project.
  - Graduation by quotation adds one "built as" or "settled in" line, quoting ROOTING.
  - Correction: the old text said graduation "links the new record from the idea's place", which clashes with links pointing upwards. It now says a registry note never names a record identifier.
- **PRIORITY-FIELD, harness half, and idea-stage recognition in the [Streams checker](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/repo-structure/ki-repo-kb-streams/references/standards-streams-structure.md)**:
  - **STREAM-11** _idea-stage Projects_ warns when an open record names an idea-stage Project, or when the per-Initiative cap (1) or territory cap (3) is passed.
  - **STREAM-12** _known record fields_ warns on any `Streams/Roadmap/` record field outside the work-item format and `ki-repo-kb`'s universal note fields (`note_type`, `tags`, timestamps, `author`). A test holds its field list level with the roadmap adapter's.
  - The rubric is regenerated.
  - Limitation: STREAM-11 warns rather than fails on a record naming an idea-stage Project. The AREAS-PATTERN answer sets no severity, and records outside the Capital may be invisible.
- **Checks on sol:**
  - `bun run test`: 1193 pass, 1 fail. The failure is `hooks/commit-msg.test.ts`, because commitlint is not installed on sol. It is not this change.
  - The `ki-repo-kb-streams` tests pass 32 of 32.
  - Focused audits: `ki-work` PASS and `ki-work-roadmap` PASS. `ki-skills` shows WARN only, the existing LONG-3 refresh cadence. `ki-repo-kb-streams` on ki-principal shows STREAM-11 PASS (host-network, ai-observability, delta-evaluation within the caps) and STREAM-12 PASS. Its 3 WARN are existing STREAM-10 close-out findings for chezmoi, paperclip-capture-and-rebuild and website.
  - `rumdl` on the edited Markdown is clean.
  - **Not run, so unknown:** `bunx tsc --noEmit`, Biome and Knip. ki-agentic-harness on sol has no `node_modules` (`bunx biome` resolves to an unrelated 0.3.3 package).
  - Whole-repository `ki repo audit` fails on TSC-1, BIO-1 and KNIP-2 for the same reason. It also fails on MD-mech and PMO-7, both in Kris's archived `+/_THREADS/skill-reviews/` files: a fleet finding, not this change.
- **[KI-PRINCIPAL-MOD-006](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-006-knowledge-acquisition-lifecycle.md) and [KI-PRINCIPAL-MOD-008](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-008-whole-philosophy-coherence-review.md)** no longer carry `priority`; another session had already removed it. delta-evaluation is already `planned`.
- **Backup.** The 11-path patch is at `/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/tmp/registry-model/patch/registry-model.patch` (ignored) and `/Users/krisbrown/.local/state/ki/agents/ways-of-working/registry-model.patch`. It reverse-applies cleanly.

## In Progress

Nothing is running in this run.

- The harness change waits uncommitted on SOL-GATE. These are the 11 paths:
  - `skills/change-management/ki-work/references/standards-project-registry.md`
  - `skills/change-management/ki-work-roadmap/references/standards-repository-roadmaps.md`
  - `skills/repo-structure/ki-repo-kb-streams/references/rubric.md`
  - `skills/repo-structure/ki-repo-kb-streams/references/standards-streams-structure.md`
  - the `ki-repo-kb-streams` `closeout.ts`, `closeout.test.ts`, `streams.ts`, `streams.test.ts`, `items/stream.ts` and `items/index.test.ts`
  - `skills/keystone/ki-skills/scripts/internal/remediation-inventory.test.ts`, whose counts rise by two criteria
- These dirty files belong to another session and were not touched: `docs/specs/harness.md`, `hooks/coordinator-reminder.sh`, `hooks/coordinator-reminder.test.ts`, `output-styles/ki-coordinator.md`, `skills/README.md`, `skills/governance/ki-delegation/references/sources.md` and `standards-background-runs.md`, and the `ki-pmo` files (`SKILL.md`, `references/rubric.md`, `sources.md`, `standards-pmo.md`, `scripts/banner.test.ts`, `scripts/generate/index.ts`, `scripts/rubric/items/threads.ts`).
- This report is written but not committed. ki-principal on sol has no active hooks either, so the thread commits it with its folder once SOL-GATE is settled.

Outstanding - no action requested now:

- The tools-ki half of PRIORITY-FIELD, warning on unknown record fields, belongs to a tools-ki run.
- STREAMS-INDEX is queued to follow once this change lands.
- Applying PAUSE-CONDITION's opening line to the paused Project notes (roadmap-model, specifications) is ki-principal note work, not done here. The `website` note now shows only as a STREAM-10 close-out finding.
- Two of types-review's attribute findings were not carried, because they sit outside the two named sections: optional `purpose` and `component` in the `ki-repo-kb-activities` standard, and mechanical checks on Project and Initiative `lifecycle`, `lead`, `outcome` and `direction` values. The crosswalk states the rule.
- The rooting-model report that ROOTING-MODEL cites lives in the terra state folder and is not on sol. Section 2's four points were taken from the checkpoint's quotation.

## Queries

### SOL-GATE - The harness commit gate cannot run on sol

**Context:** On sol, neither ki-agentic-harness nor ki-principal has `node_modules` or a hooks path, so `git commit` would run no pre-commit audit and no commitlint. The repository rule says "A declared audit or hook that cannot run is unknown, not a pass: stop and report the activation step it needs". The run's rules forbid package installs, so the 11 paths stay uncommitted with a backup patch. Tests and focused audits pass. TypeScript, Biome and Knip are unknown.

**Query:** May a run activate the harness toolchain on sol with `bun install`, then commit and push this change through the gate?

**Options:**

a) (recommended) Authorise `bun install` in ki-agentic-harness on sol, which installs the locked dev tools and activates the Husky hooks through `prepare`. A follow-up run then re-runs `bun run test`, `bunx tsc --noEmit` and the focused audits, commits the 11 paths by explicit path as `feat(ki-work): idea-stage Projects, rooting and the attribute crosswalk` through the hooks, and pushes fast-forward only.

b) Commit now without hooks, recording the manual checks above, and run TypeScript, Biome and Knip on terra later.

c) Leave it uncommitted and apply the backup patch on terra, whose toolchain is installed.

```text
SOL-GATE

Authorise `bun install` in /Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness on sol to install the locked dev tools and activate the Husky hooks; then have a run re-run bun run test, bunx tsc --noEmit and the focused ki-work, ki-work-roadmap, ki-skills and ki-repo-kb-streams audits, commit the 11 registry-model paths by explicit path as feat(ki-work): idea-stage Projects, rooting and the attribute crosswalk through the hooks, and push fast-forward only.
```

```text
╭─ run report · 2026-10-15T21:44:56Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] SOL-GATE
- [uncommitted] ki-agentic-harness, 11 registry-model paths; this report in ki-principal

```text
Resume ways-of-working under current ki-pmo and ki-delegation since 16:09 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
