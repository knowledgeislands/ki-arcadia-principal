# Live-artifact capture: report

## Done

- I captured the triage record [KI-OBSERVA-INT-002 Portable live-artifact interface](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/roadmap/KI-OBSERVA-INT-002-portable-live-artifact-interface.md) in apps-observatory. The Observatory owns it because the host it calls for is new and has to live within the Observatory's boundary. No existing record covered this. The record has not been adopted.
- **Cowork.** The contract runs on a single saved HTML page.
  - Manifest: `artifacts.json` lists each artifact's MCP tools as an allow-list.
  - Data access: the page gets data from `window.cowork.callMcpTool`. It can also call `askClaude`, which runs Haiku, and `runScheduledTask`.
  - Refresh: the page refreshes when opened, from a per-artifact cache. The Reload button in the view header refetches.
  - Limits: desktop only, local to one machine, and the only CDN libraries allowed are Chart.js, Grid.js and Mermaid.
- **Observatory.** It has no artifact host yet. The nearest precedent is its sandboxed Mermaid frame.
- **Harness skill.** `ki-repo-kb-live-artifacts` covers only a Markdown and HTML pair, with no contract for data access or hosting. Its standard will need a follow-on trade.
- **ChatGPT.** It has nothing that saves and refreshes a page. Canvas was dropped from GPT-5.5 on 2026-05-28. Pulse was retired on 2026-06-17 and replaced by Scheduled Tasks. The equivalent is Apps on the open MCP Apps standard (SEP-1865, stable since 2026-01-26), which is also hosted by Claude. Its widgets are tied to a conversation rather than saved. Sources and dates are in the record.
- **Recommendation, recorded in the record.** Define one bridge, with MCP Apps `postMessage` JSON-RPC as the strongest candidate, and give it three hosts:
  - Cowork, through `window.cowork`;
  - the Observatory, through a sandboxed frame and a `window.cowork` shim over its backend ports;
  - ChatGPT and other MCP Apps hosts, through a `ui://` resource.
- **Commits.** e7c2057 reserved INT-002 in the ledger. c96fd46 added the record. Both are pushed to origin/main as fast-forwards. The `ki-work-roadmap` audit passes.

## Needs the owner

- Decide whether to adopt [KI-OBSERVA-INT-002](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/roadmap/KI-OBSERVA-INT-002-portable-live-artifact-interface.md), and answer its open questions:
  - Should the Observatory accept arbitrary Cowork HTML, or only artifacts with a manifest?
  - Can the CDN libraries run under the Observatory's no-external-script boundary?
  - How should `askClaude` degrade when no LLM is available?
  - Where should the portable contract live?
