# kb-layers report (2026-10-11)

Commit `e5b7e8e` in `ki-arcadia-principal` (local only, not pushed): docs(engineering): explain hosts, roles and layers across Rig and Techne.

Checks: pre-commit rumdl passed. `ki repo audit`: PASS=22 WARN=1 FAIL=0. The 3 warnings are existing STREAM-10 close-out prompts on island-model-and-tending, paperclip-bootstrap-and-recovery and website, which this change did not cause.

## Done

- New note: `Pillars/Engineering Practice/Architecture/Hosts, Roles and Layers.md`. It covers the layers and the hand-off, the roles (terra, sol, vega, appliance), machine naming, version policy, packaging and Omarchy, and links to the audit, ADR-KI-ARCADIA-003, ADR-KI-ARCADIA-006, ODR-KI-ARCADIA-001 and GDR-KI-ARCADIA-004.
- Added a section to the Architecture index and a paragraph to Engineering Practice MEMORY.
- Recorded in the audit, under its Decisions section, that Kris accepted all ten as recommended on 2026-10-11.
- Added a one-line pointer from agent-host.md, rig.md and techne.md.

## Needs the owner

- Handoff to the Knowledge Islands model Initiative to check the note makes sense (Decision 40). Not started in this run.
- State-of-play still needs to cover the Initiative wording, ADR-KI-ARCADIA-003 and the `direct-host` rename.
- The audit's opening paragraph still says the holds stand "until Kris answers". It was left as written because the brief limited edits to its Decisions section.
- Push when ready.
