# Historical patching plan report

## Done

- Adopted CLI-006 as deliver/draft Hold with `hold.reason: parked` and explicit Kris release for local planning through agent-host; adopted CLI-008 as deliver/draft Next with no hold mapping. Preserved identities, creation timestamps, project/dependencies and null baselines; advanced source timestamps and appended Decision 11/12 approval evidence.
- Adoption commit `633bbc0953a049ba503cb232a3473e289e6ca4a4` and separate planning commit `2023daacb55aa707d7e8d0da2d01e1ced023eea0` were made with normal hooks and explicit owned paths, then pushed own-only fast-forward to origin/main from tools-techne on terra. The final checkout was clean and matched origin/main at verification.
- Prepared [CLI-008's canonical plan](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-008-host-patching-fields.md): strict HH:MM/boolean validation, manifest-driven field pass-through, optional nullable updates, concrete source paths, six bounded Steps, public stubbed CLI tests, audit gates, dependencies and exclusions. It remains draft Next, with no source or test edits and no Ready/implementation transition. CLI-006 was unchanged after adoption.
- Work-selector, roadmap and authoring audits passed; full audit completed with 17 passing skills, two pre-existing warnings and zero failures. rumdl, diff checks, metadata/source-drift predicates, committed-path inspections and normal hooks passed. The initial Next-body shape failure was resolved before adoption publication. Full audits retain the inline CI KI_VERSION and absent committed .githooks/pre-commit warnings; unrelated files were not repaired. Implementation tests are planned, not authored or claimed as delivered.
- Exact managed config verified/restored after audits and both hook-backed commits. Protected source hashes and owner checkpoint were preserved. No new records, release, remote agents or provider/host/environment operations occurred.

## Needs the owner

Review the [draft CLI-008 plan](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-008-host-patching-fields.md) before Ready or delivery. To preserve the existing text report and exits, JSON consumers would use one additional advisory structured read; it can observe a different moment and never determines workspace safety. Text consumers keep one read. No unsettled contract choice blocks this draft; local planning does not resume all agent-host work.
