# decisions-sync - record Decision 21 and adopt the three records

## What has been done

- Recorded Kris's Decision 21 answers, in his words, in [change-management-decisions.md](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-decisions.md>): `BINDINGS` closed with `claude-haiku-5-5`; `NAMES` revised so `ki-design-loop` becomes `ki-pmo-review` and `ki-blueprint` is withdrawn; new entries for `BLUEPRINT-FIT`, `DESIGN-AREA`, `SUMMARY-ENTRY`, `RECYCLE`, `SHAPE-21` and `DEFAULTS`. Commit `07560fd` in `ki-principal`, pushed fast-forward.
- Adopted [KI-TOOL-KI-CLI-123](</Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md>) to `draft`, horizon `next`, kind `deliver`, first in order. Commit `6916ddc` in `tools-ki`, pushed fast-forward.
- Adopted [KI-HARNESS-GOV-175](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md>) to `draft`, horizon `next`, kind `deliver`, with its dependency on `KI-TOOL-KI-CLI-123` recorded in prose under Dependencies / blocks (cross-repository, so `blocked_by` stays empty as the roadmap standard requires).
- Adopted and accepted [KI-HARNESS-GOV-176](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-176-explicit-skill-dependency-graph.md>) as `done` on Kris's instruction "Adopt KI-HARNESS-GOV-176 and take it through ki-accept", with baseline `2ffb152f`, three completed Steps, Files touched, Verify, Documentation impact, the six-part Review packet and `## Done`. Acceptance checks all passed: skill-graph sync check (exit 0), the three focused test files (19 pass, 0 fail), `ki-skills`, `ki-repo-harness`, `ki-diagrams`, `ki-work-roadmap` and `ki-authoring` audits (FAIL=0), and `docs/diagrams/` holds exactly the four expected files. Both open questions in the record are annotated with Kris's `RECYCLE` and `SHAPE-21` answers. Commit `42aeadd5` in `ki-agentic-harness` (shared with GOV-175), pushed fast-forward.
- Replaced every bare "Decision N of the ways-of-working run" citation in the three records with Kris's quoted words (`ADOPT`, `HOME`, `RECV-ADOPT`, the owner-report format, and the skill-graph and archify instructions).
- Audits: no new FAIL in any repository. The pre-existing failures are unchanged: `ki-principal` (checkpoint `updated_at` format, Enactment anchor PRINCIPAL-2, GitHub topics TOPICS-1), `tools-ki` (Knip KNIP-2, rumdl DEPS-1), `ki-agentic-harness` (`.ki.toml` table order FILES-10). Pre-commit hooks passed in all three repositories.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- Retained decision: adopting a record to `next` makes the roadmap checker require Current state, Steps, Files touched, Verify and Documentation impact (ITEM-3 failed without them). I added those sections to `KI-TOOL-KI-CLI-123` and `KI-HARNESS-GOV-175` as explicit "not yet planned" statements with one unticked step that names `ki-plan`; no delivery step, file or gate was planned.
- Receiver-owned: Kris's `BLUEPRINT-FIT` question, how `ki-pmo-review` differs from `ki-pmo`, is marked open in the decisions file and another agent is answering it.
- Verification limitation: the baseline full `ki repo audit` ran the `ki-repo` TOPICS-1 criterion, which the tool checks against GitHub live state; I did not repeat that criterion in the post-edit audits, which ran per skill.
- Retained material: `ki-agentic-harness` has an untracked `+/diagrams/skill-graph` folder from another session; left untouched.
- Retained material: the harness push reported that the required `build` status check is expected on `main`; nothing for this run to do.

## Outstanding queries

No outstanding queries.

```text
No outstanding queries.
```
