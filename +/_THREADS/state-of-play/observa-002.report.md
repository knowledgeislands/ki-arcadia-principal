# observa-002 — KI-OBSERVA-INT-002 adopt and plan

## Done

- Adopted [KI-OBSERVA-INT-002](file:///Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/roadmap/KI-OBSERVA-INT-002-portable-live-artifact-interface.md) as Next, kind deliver, status draft. The plan is published and awaits Kris's approval. Nothing is implemented.
- Recorded the bridge choice as [PDR-KI-OBSERVA-006](file:///Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/decisions/PDR-KI-OBSERVA-006-live-artifacts-speak-the-mcp-apps-bridge.md). MCP Apps postMessage JSON-RPC is the wire; the `window.cowork` subset is what pages code against, provided by a bridge script outside Cowork; the Observatory acts as an MCP Apps host.
- Captured the harness handoff as triage [KI-HARNESS-GOV-174](file:///Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-174-portable-live-artifact-standard.md): the live-artifact standard gains a manifest (declared tools and bridge version) and audit checks for it.
- Commits: apps-observatory 338d1b0; ki-agentic-harness 68c88d5e (number reservation) and 8bf6ee74 (record). All three were pushed as fast-forwards. GitHub reported its usual "required status check expected" bypass notice on the harness push.
- Checks: the ki-work, ki-work-roadmap, ki-decision-records and ki-authoring audits passed; rumdl was clean; `bun run test` passed (187 site tests, all from cache); the harness roadmap audit passed. Another thread's uncommitted GOV-171 and GOV-172 edits in the harness were left alone.

**Plan summary.** Add a typed artifact contract and a discovery step for tracked pairs under `Admin/Operations/Live Artifacts/`. Answer `mcp-ki-kb-fs` reads from the native Knowledge Base reader, with that server's result shape, read-only, and with no `+/` or `-/` paths. Refuse any undeclared or write tool, and cache answers per artifact. Serve the bridge script and an opaque-origin artifact frame under its own policy (`connect-src 'none'`). Add an Artifacts instrument, extend the degraded gate, and add browser smoke tests with fixture and hostile artifacts. The real proof is HNR Council (hnr-principal) and Legal Activity Status (legal-principal) opening unchanged from their tracked HTML in both the Observatory and Cowork. Kit Git Repo Tracker comes next, once it has a tracked home.

## Needs Kris

1. **Approve the plan for Ready**, or ask for changes.
2. **Manifest only (recommended):** open only pairs whose Markdown half declares tools and bridge version. The page HTML stays unchanged Cowork HTML.
3. **External scripts (recommended):** keep the page's no-external-script rule. The artifact frame runs its own inline code in an opaque origin with no network. Mermaid is already embedded. None of the surveyed artifacts uses Chart.js or Grid.js, so vendor them only when one does.
4. **askClaude (recommended):** answer it at once as unavailable, and call no LLM. The contract makes it an optional, feature-detected capability. `runScheduledTask` is answered the same way.
5. **Contract home (recommended):** ki-specifications, with the harness skill and the Observatory citing it. Delivery does not wait for it. Approving this means a record in ki-specifications later.
6. **Proof pairs:** both need the manifest fields added in hnr-principal and legal-principal. That needs those repositories' authority. Legal Activity Status also reads `-/_LOGS/`, which the Observatory never serves; the recommendation is to keep that line and show its logs block as unavailable.
