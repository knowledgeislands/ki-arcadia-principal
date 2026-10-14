# Owner report: Wave E skill renames (skill-renames run)

Record: [KI-HARNESS-GOV-182](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-182-wave-e-skill-renames.md), status `awaiting-review`. Authority: Kris, 2026-10-14: "SKILLS-PARALLEL - yes; start the two Wave E renames and the ki-pulse move now in a worktree, with a deliver record; leave ki-pmo for the pilot."

## Done

- Harness, local `main` (worktree and branch `skill-renames` removed): `ki-design-loop` → `ki-pmo-design`, `ki-work-housekeeping` → `ki-work-recurring`, `ki-pulse` moved to `skills/acquire/`; 52 tracked files re-pointed, standards and user guide renamed with former-name notes, catalogue, skill graph and skill map regenerated, SVGs re-exported, `.ki.toml` declaration renamed, diagram manifest stamped. Commits: 3beced0a (reserve), a45605c8 (record), 0b6349c8 (rename), 8d961be2 (diagrams), 561dadf4 (`.ki.toml`), 1ff64155 (manifest), c44623ee (record review). No `ki-pmo`, no change to `ki-signals`, no edit to `ki-delegation`.
- Harness checks on `main`: `bun run test` 1112 pass; `bunx tsc --noEmit` clean; skill-graph `--check` in sync; audits `ki-skills`, `ki-repo-harness`, `ki-work-roadmap`, `ki-work-recurring`, `ki-diagrams` all PASS (two pre-existing refresh-cadence warnings on `ki-skills` sources only); `ki dev skill rubric` in sync; conform dry-run proposes nothing.
- tools-ki: bootstrap list and tests updated, commit f6d65d8, pushed fast-forward. 1144 tests pass, tsc clean.
- ki-principal: four references outside protected zones updated, commit b203b70, pushed fast-forward. Design history artefacts untouched.

## In progress

- Harness push held. Local `main` is 10 commits ahead of `origin/main`; three are from other sessions (df08e1e5 skill map, 49fde031 quotes-fix, 71d7a0fd quiet-tools) and would be published by my push. Hold commits 38bff4fd, dfc92f15, b053086a confirmed on `origin/main`. The record stays `awaiting-review`, not `done`, until the push lands.

## Outstanding queries

- `PUSH-HARNESS-3` - may the harness `main` be pushed as it stands (publishing the three other-session commits above together with mine), or should the owning sessions push first?
- `HOUSEKEEPING-DECLS` - five repositories still declare `[skills.ki-work-housekeeping]` in `.ki.toml`: legal-principal, apps-midnight.ninja, apps-rig.midnight.ninja, apps-tower.midnight.ninja, and the chezmoi source (also AGENTS.md, tests/ki-self-skill.test.mjs, .agents/skills/ki-self/SKILL.md, docs/guides/agents/audits.md). Rename now in one sweep, or leave for the naming wave?
- `KI-RELEASE` - installed `ki` 0.10.1 still requires `ki-design-loop` in its bootstrap list until a tools-ki release; `ki bootstrap`/`ki dev` against the renamed harness will complain. Release now?
- `PRINCIPAL-ENACT` - protected-zone references left for enactment: `Admin/Governance/Conventions/Streams Conventions/Streams Conventions.md:26`, `Admin/Governance/Decisions/GDR-KI-PRINCIPAL-005-the-roadmap-model.md:34`, `Admin/Operations/Processes/Enactment Process.md:25`, `Pillars/Philosophy/Model/Conventions/Structure/Structure.md:140`, `Pillars/Philosophy/Model/Processes/Enactment Process/Enactment Process.md:46`, checkpoints `knowledge-islands-model.command-centre.md:42`, `knowledge-islands-model.ways-of-working.md:26`, `platform-foundations.baseline-rollout.md:39`, `techne.agent-host.md:43`; plus [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) lines 28, 41, 66 left for the pilot agent. Website skills-by-outcome guide also names the old skills.

```text
PUSH-HARNESS-3 - 
HOUSEKEEPING-DECLS - 
KI-RELEASE - 
PRINCIPAL-ENACT - 
```
