# KI-OBSERVA-INT-002 — build report

## Done

- [KI-OBSERVA-INT-002](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/roadmap/KI-OBSERVA-INT-002-portable-live-artifact-interface.md) is at `awaiting-review`. The review packet is in the record under `## Review`.
- **What works.** The Observatory opens Cowork live artifacts unchanged.
  - The new **artifacts** instrument lists the manifest-declared pairs and refuses the rest by reason.
  - Each artifact runs in an opaque-origin sandbox, with a bridge script that provides `window.cowork` over the MCP Apps wire.
  - Its reads are answered natively and read-only from its own Knowledge Base, with no LLM and no MCP server.
  - Answers are cached for ten minutes, and **reload** reads afresh. `askClaude` and `runScheduledTask` answer as unavailable.
- **Real proof, on a separate port.**
  - HNR Council drew its live Council: 23 calls answered.
  - Legal Activity Status drew 23 clean activities: 24 calls answered and 1 refused. The refused call was the `-/_LOGS` read, and the page shows that block as unavailable.
- **How to see it.** After the restart below, open `http://127.0.0.1:1675/?view=artifacts` and choose HNR Council or Activity Status Live Artifact.
- **Commits, all pushed fast-forward.**
  - apps-observatory: `7e5e53d` approval and ready, `0fd2717` code, and `80fbb8a` docs and review.
  - hnr-principal: `4b6167f` adds the manifest fields.
  - legal-principal: `14268896` adds the manifest fields.
  - ki-specifications: `ac16589` reserves the number, and `17e0b36` captures [KI-SPEC-KIN-003](/Users/krisbrown/workspaces/knowledge-islands/ki-specifications/docs/roadmap/KI-SPEC-KIN-003-portable-live-artifact-contract.md), the portable contract, as triage.
- **Checks.**
  - `bun run test --force` passed: 1,167 tests across four packages.
  - `self:typecheck`, `build` and `self:test:browser` passed. The browser test includes the live-artifact flow with a hostile fixture artifact.
  - Archify `finalize` passed for both changed diagrams.
  - The ki-work, ki-work-roadmap, ki-decision-records and ki-authoring audits passed, and so did rumdl and `git diff --check`.
- **Documentation.**
  - New: the OBS-ART specification area and the operator guide `open-a-live-artifact.md`.
  - Amended: the boundary, locality and contracts specifications, PDR-KI-OBSERVA-006, the instruments and boundary guides, README, CHANGELOG, and the architecture and site-map diagrams.

## Failed

- One evidence test failed intermittently under the full parallel test run: twice in about fourteen runs, never in isolation, and its name was not captured. It is recorded as an outstanding concern in the review.

## Needs the owner

- **Restart due.** This detached run did not restart the service. Run `launchctl kickstart -k "gui/$(id -u)/uk.me.kris.rig.observatory"`, then check `http://127.0.0.1:1675/`.
- **Check in Cowork.** Open HNR Council and Activity Status in Cowork to confirm they still work. Their HTML is unchanged.
- **Issuing area.** [KI-SPEC-KIN-003](/Users/krisbrown/workspaces/knowledge-islands/ki-specifications/docs/roadmap/KI-SPEC-KIN-003-portable-live-artifact-contract.md) was issued under `KIN`, the nearest protocol area, because ki-specifications has no area for presentation protocols. Confirm the area or re-home it when you adopt the item.
- **Review the record.** Review [KI-OBSERVA-INT-002](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/roadmap/KI-OBSERVA-INT-002-portable-live-artifact-interface.md) for acceptance. Its deviations are listed under Outstanding concerns.
