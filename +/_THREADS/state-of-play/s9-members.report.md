# Step 9 - Capitals' territory members and stale names - report

## Done

- **Territory members updated** in four Capitals to the `apps-*` names. All were committed and pushed fast-forward:
  - ki-principal `46a1b71`
  - er-principal `c2f3067`
  - va-principal `c1319de`
  - personal-principal `4fa5453`
  - Personal already listed `apps-rig.midnight.ninja` and `apps-tower.midnight.ninja` from s9-midnight. All other members still resolve.
- **Known Lands and territory prose fixed** in the same commits:
  - Known Lands in all four Capitals.
  - personal-principal's `Pillars/Knowledge Capital/Known Lands.md`.
  - ki-principal's Arcadia note, Tool Ecosystem Map and README link.
  - The personal Known Lands already listed the two new midnight repos.
- **Tower source-store owner corrected.** The KI registry binds the sources store to `personal-principal`; it has no `kit-principal` entry, so the old lookup failed.
  - `pipeline/snapshot.ts` now names `personal-principal`, and its AGENTS.md and Data Pipeline notes match.
  - A new `tests/snapshot.test.ts` adds 3 tests.
  - Commit `4e29115` in apps-tower.midnight.ninja, pushed.
  - Checks pass: tests, typecheck, Biome and build. The live lookup resolves to `sources-personal/+/midnight.ninja`, where `playerInfo.dat` is present.
- **Territory checks:** `ki territory show` passes for all eight territories: personal 8, knowledge-islands 20, legal 2, humans-not-robots 8, valle-armonia 4, sacred-inquiry 2, techmedix 2, equal-remedy 3. `ki territory audit --estate` is healthy: 49 repositories, 0 findings.

## Needs the owner

- **Stale old names remain** outside Known Lands and territory prose. They were left alone because they are records, checkpoints, a decision, conventions or live artifacts:
  - ki-principal:
    - GitHub Apps convention.
    - Release Cascade process and diagram.
    - GDR-KI-PRINCIPAL-006.
    - Streams Projects and KI-PRINCIPAL-MOD-008.
    - `_state-of-play` checkpoints.
  - va-principal:
    - VA-PRINCIPAL-GOV-003.
    - A checkpoint.
  - personal-principal:
    - Live Artifacts, including the Estate Map and Targets, which the final map run owns.
    - Project Portfolio.
    - The Tower game notes.
    - KB Specifics Integrations.
  - Approve a follow-up sweep if wanted.
- **Techmedix's two `apps-*` sites are not territory members.** `techmedix` still shows only its Capital and harness. This predates this run.
DONE
