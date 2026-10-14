# acquire-route - receiving review of KB-ACQUIRE-002 and KB-ACQUIRE-003 for [state-of-play](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/_state-of-play.md) and [knowledge-acquisition](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/knowledge-acquisition.md) - since the run began - resting

This review was read-only. The only file written is this report. Authority: Kris's 14 October instruction to act on the prepared Master message and return the MCP home, hosting and first-probe scope for review before implementation (master decisions log, `/Users/krisbrown/.local/state/ki/agents/state-of-play/decisions.md`).

## What has been done

- Read the [routing report](/Users/krisbrown/workspaces/personal/acquire/+/_THREADS/acquire-intake/route-engineering-handoffs.report.md), [Kris's approvals](/Users/krisbrown/workspaces/personal/acquire/+/_THREADS/acquire-intake/decisions.md), [KB-ACQUIRE-002](/Users/krisbrown/workspaces/personal/acquire/docs/roadmap/KB-ACQUIRE-002-migrate-granola-state.md), [KB-ACQUIRE-003](/Users/krisbrown/workspaces/personal/acquire/docs/roadmap/KB-ACQUIRE-003-investigate-binary-bridge.md) and the [probe contract](/Users/krisbrown/workspaces/personal/acquire/docs/guides/chatgpt-mobile-binary-capture-investigation.md). Checked them against the tools-ki source at `81cdf04`, the Harness at `221cc5de`, [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md), the MCP precedents, the [Techne Programme Hold](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Policies/Techne Programme Hold.md>) and [Known Lands](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Known Lands.md>).
- **Overlap found.** The knowledge-acquisition thread launched its own read-only review of the same two records, `route-local-review`, at 14:14 BST. It was still running when I finished (prompt: `/Users/krisbrown/.local/state/ki/agents/knowledge-acquisition/route-local-review.prompt.md`, report due at `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/knowledge-acquisition/route-local-review.report.md`). I suggest this split: the master settles home, hosting and ownership from this report, and knowledge-acquisition's report owns the receipt (ACK GRANOLA-PLAN and ACK BINARY-PROOF) and the final probe scope. Where the two disagree, reconcile them before anything is allocated.

### KB-ACQUIRE-002 (Granola state migration): review

- **The gap the record describes is real.** In [layout.ts](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/core/acquire/granola/layout.ts), lines 11-13 hard-code state to `.acquire/granola` whenever `capture_root` is set, and to `+/_ACQUIRE/granola` otherwise. The command at [index.ts:249](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/commands/acquire/index.ts) passes `capture_root` and nothing else. The reset code in [import.ts](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/core/acquire/granola/import.ts) at line 732 recursively deletes the entire state directory, ledger included. The Harness declaration on line 9 of the [ki-acquire-granola SKILL.md](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/acquire/ki-acquire-granola/SKILL.md) admits `capture_root` but not `state_root`.
- **No existing work covers it, so nothing gets allocated twice.** The tools-ki roadmap holds only KI-TOOL-KI-CLI-115, 123, 124, 125 and 126, and none of them is about Granola. In the Harness roadmap, the only acquisition record is KI-HARNESS-OPS-005, and it covers AI sessions, not Granola state. The pending proposal to narrow KI-HARNESS-OPS-005 does not change that. Under the roadmap-focus rule, the support needs exactly two receiving records, one in each repository, and nothing in Acquire beyond KB-ACQUIRE-002.
- **Owners.**
  - Harness owns the property admission and the acquisition contract (skill `ki-acquire-granola`). Its record goes first, because tools-ki validates adapter properties against the Harness inventory.
  - tools-ki owns the importer layout and the safe reset and retention behaviour (local skill `ki-self`, under [ADR-KI-TOOL-KI-004](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/decisions/ADR-KI-TOOL-KI-004-acquisition-command-boundary.md)). It goes second.
  - The knowledge-acquisition thread coordinates and allocates both records through `ki-next`, after one more deduplication pass.
  - Acquire keeps the migration itself.
- **Property spelling: `state_root`.** This is snake_case to match `capture_root`. The value is a safe repository-relative directory, checked by the existing guard at line 7 of `layout.ts`. Provider state resolves to `<state_root>/granola/`, so Acquire sets `state_root = "+/_ACQUIRE"`. That lands on the same `+/_ACQUIRE/granola` path that legacy receivers already use. When the property is absent, today's behaviour stays exactly as it is.
- **Harness build and test paths** (under `/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/acquire/ki-acquire-granola/`):
  - Files: `SKILL.md` (line 9), `references/standards-granola-acquisition.md`, `references/rubric.md`, and `scripts/rubric/items/{acquisition,routing,publication}.ts` with `index.test.ts`, `publication.test.ts` and `scripts/rubric/contexts/granola.ts`.
  - Correction for the record: its rubric paths should be read relative to this skill folder. There is no top-level `scripts/` directory in the Harness.
  - Checks: `bun test --isolate --max-concurrency=1 ./skills ./hooks ./evals` (the package `test` script), the TypeScript check, and `ki repo audit --skill ki-skills`.
- **tools-ki build and test paths** (under `/Users/krisbrown/workspaces/knowledge-islands/tools-ki/`):
  - Source: `src/core/acquire/granola/{layout,routing,import,images}.ts`, `src/commands/acquire/index.ts` and `src/core/acquire/adapters.ts`.
  - Tests: `src/tests/cli/acquire/granola.test.ts` and `adapters.test.ts`, with the helper `src/tests/cli/_granola_helper.ts`.
  - Docs: `docs/specs/acquisition.md` and `docs/guides/user/granola-acquisition.md`.
  - Gates: `bun run test:coverage` (which enforces 100% thresholds in `vitest.config.ts`) and the TypeScript check. `bun run build` then produces `dist/ki` for executable proof.
- **Reset, retention and rollback gates.**
  - Reset and rebuild must refuse to delete the ledger, handled dispositions, variants, attachment manifests or any proof unless an explicit, previewed, disposable scope is given.
  - Migration proof stays at `<state_root>/migration/`, a sibling of `granola/`, so it is never inside a recursive reset target.
  - Conflicting old and new ledgers, unsafe roots, and stale or corrupt journals all stop the run with an error. There is no silent fallback.
  - Rollback order:
    1. Revert Acquire's config change and the relocation commit.
    2. Restore the known working executable. Record `ki --version` and the binary's hash beforehand.
    3. Re-verify the state and proof hashes against the relocation receipt.
    4. Run status and reconcile read-only, with no reset and no Granola call.
  - An old executable that meets an unknown `state_root` must reject it rather than ignore it. Check this in `adapters.test.ts`.
- **How the executable and the Harness projection are verified.** These are two separate pieces of evidence:
  1. From the built `dist/ki`, then from the installed `ki` after a separately granted install: `ki acquire list` shows `state_root` in the adapter inventory read from the projected Harness skill.
  2. In a disposable receiver fixture: `ki acquire status --adapter granola` and `ki acquire reconcile --adapter granola` resolve the configured root, with no provider call.
  - A source commit alone does not prove support.
- **Migration** stays separately gated, exactly as the record's Steps set out.

### KB-ACQUIRE-003 (binary bridge): review

- **MCP home: recommend a new private `knowledgeislands/mcp-acquire-chatgpt`**, local checkout `/Users/krisbrown/workspaces/knowledge-islands/mcp-acquire-chatgpt`. It does not exist yet and is still only a proposal. Reasons not to extend [mcp-housekeeping-chatgpt](/Users/krisbrown/workspaces/knowledge-islands/mcp-housekeeping-chatgpt/README.md):
  - That repository is a local, read-only stdio adapter over on-disk stores, with no network and no auth. A public HTTPS endpoint with OAuth would change its security posture, its distribution and its threat model all at once.
  - The territory naming already separates acquisition from housekeeping: [mcp-acquire-whatsapp](/Users/krisbrown/workspaces/knowledge-islands/mcp-acquire-whatsapp/README.md) sets the precedent, and KI-HARNESS-OPS-005 asks for exactly that split.
  - A small, separate repository can be deleted cleanly if the gate on iPhone fails.
  - Caveat: the workspace MCP standard in [ki-repo-mcp](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/repo-structure/ki-repo-mcp/SKILL.md) assumes stdio. The new repository should follow its shape (`src/config`, `src/mcp-server`, `src/tools`, `src/utils`, the annotation presets) and declare Streamable HTTP as a stated deviation, rather than reshape the standard now.
- **Hosting: recommend managed, stateless HTTPS with OAuth.** The deciding fact is that ChatGPT calls a custom MCP server from OpenAI's own servers, not from the handset. The server therefore has to be reachable from the public internet over HTTPS.
  - **Local stdio on a Mac:** ChatGPT cannot reach it at all, so it fails the journey. It is fine for synthetic tests only.
  - **Tailnet-only on `sol` or `terra`:** OpenAI cannot reach a tailnet address. Making it reachable means Tailscale Funnel or similar public inbound access, which breaks the "no public inbound access" bound of `sol`'s owned-host exemption. It also changes Tailscale, which counts as a connection-critical change. `terra` is a laptop and not always on.
  - **Managed, stateless HTTPS with OAuth (as the record proposes):** this is the only option that meets the journey. It still needs grants. Under the Techne Programme Hold, provisioning or deploying a remote service is held "whether initiated locally ... or from another project". Deployment therefore needs Kris to make a bounded exemption to the hold: one stateless probe service, a fixed test window, and teardown at the end of the window. Local build needs nothing from the hold.
- **Owners.**
  - Accountable engineering owner: the knowledge-acquisition thread ([checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.knowledge-acquisition.md)), delivering in `mcp-acquire-chatgpt`. The Harness `ki-acquire-chatgpt` contract under KI-HARNESS-OPS-005 is updated only after the gate passes.
  - Auth and hosting owner: the state-of-play master thread, because it holds the hold-exemption decisions, the rollout rule for connection-critical changes, and account, domain and identity choices across Projects.
  - Acquire keeps the destination contract and CAPTURE-CHATGPT.
- **Deduplication.** No existing record delivers the original-file probe. The nearest is the KI-HARNESS-OPS-005 step "connect ChatGPT acquisition to a readable, authorised source", which is about enumerating conversation text, not original binaries. Allocate one delivery record in the new repository when it is created, as a blocker that KB-ACQUIRE-003 links to, and none in the Harness.
- **First-probe scope (proposed paths in the new repository, nothing created):**
  - `src/tools/probe-original-files.ts`: the single read-only tool `probe_original_files`, with input from `_meta["openai/fileParams"]` and a declared outputSchema (probe ID, ordinal, safe name, byte_size, sha256, media type, status, safe error code).
  - `src/utils/stream-hash.ts`: a streaming length counter plus SHA-256 over unmodified bytes, nothing written to disk.
  - `src/utils/url-policy.ts`: HTTPS only, a host allowlist built from authorised evidence, rejection of private, loopback and link-local addresses (rechecked after DNS resolution and after every redirect), a redirect cap, and byte, time and concurrency-one caps (nine files and 10 MiB per file, both configurable).
  - `src/utils/auth.ts`: the OAuth resource-server check (audience, owner allowlist, scope), with no token forwarded to file hosts.
  - `src/utils/log-scrub.ts`: removes URLs, query strings, headers and arguments from logs and errors.
  - `src/config/index.ts` and `src/mcp-server/http.ts` (the Streamable HTTP entry point).
  - `docs/guides/user/probe-setup-test-restore.md`.
  - Synthetic tests: `src/tools/probe-original-files.test.ts`, `src/utils/stream-hash.test.ts` (fidelity, partial transfer and truncation never reported as success), `src/utils/url-policy.test.ts` (URL, redirect, private address, DNS rebinding, size, timeout), `src/utils/auth.test.ts` (missing, wrong, expired and revoked identity; 401, 403 and 429), `src/utils/log-scrub.test.ts`, and `src/mcp-server/http.contract.test.ts` (output schema over the wire). All tests use an in-process fixture file server, with no external network.
  - Independent size and hash check: a fixture whose size and SHA-256 are computed separately (with `shasum -a 256` and `stat`) and committed as expectations. In the live gate, the comparison target is the Acer original row's SHA-256 from the [Acer capture](/Users/krisbrown/workspaces/personal/acquire/captures/personal/chatgpt/2026-10-13-acer-windows-11-performance/README.md), never the resized row. Size proof stays pending until an independent original size is available.
  - The iPhone gate on an earlier turn, using the single instruction exactly as written in the probe contract. It needs no picker, no re-upload and no pasted ID. The result is pass, fail or blocked, with sanitised evidence only.
  - Restore path, tested before any connection-critical step:
    1. Export the non-secret connector and descriptor state.
    2. Prove on a disposable client that disconnecting, revoking the token and tearing down the service leaves existing ChatGPT connectors working.
    3. Do not alter any existing MCP, Headroom proxy, Tailscale or SSH service.
- **The grants come in separate stages:**
  1. Local build: create the private repository and its delivery record, then build and run synthetic tests locally only.
  2. Hosting: a bounded exemption to the hold, plus a named provider, account and region.
  3. Endpoint domain.
  4. OAuth identity provider and client registration.
  5. ChatGPT account, workspace and connector connection.
  6. The live iPhone test window: the first Acer JPEG, then a second conversation, then all nine originals.
  - No stage implies a later one.

## What is in progress

Nothing is running from this run. knowledge-acquisition's `route-local-review` was still running at 14:15 BST and belongs to that thread.

Outstanding - no action requested now:

- Optional cheaper off-ramp before any build: Kris could open the Acer conversation on iPhone and note which connected tools are offered. If an existing authorised hash-by-reference tool is there, nothing needs building.
- GRANOLA-PLAN and BINARY-PROOF stay open until Kris closes them.
- KB-ACQUIRE-002 and KB-ACQUIRE-003 remain Next/Draft. Correcting KB-ACQUIRE-002's Harness rubric paths falls to acquire-intake.

## Outstanding queries

### GRANOLA-SUPPORT - Authorise local delivery of the Granola support

**Summary:** Neither tools-ki nor the Harness has a record or any code for an independent `state_root` or safe reset and retention. Two receiving records are needed: Harness first, then tools-ki. Migration stays gated. **Need from you:** Say whether knowledge-acquisition may allocate those two records and deliver them locally. **Recommendation:** Approve local delivery, with `state_root` as the property and local commits only. Exclude installation, release, migration, reset of real state and push.

### BINARY-HOME - Approve the probe home and local build

**Summary:** The best home is a new private `knowledgeislands/mcp-acquire-chatgpt`. Only managed HTTPS with OAuth can reach ChatGPT, and deploying it needs a later, bounded exemption to the Techne Programme Hold. **Need from you:** Choose the home and say whether the synthetic build may proceed locally. **Recommendation:** Approve the private `mcp-acquire-chatgpt` home and its local synthetic build under knowledge-acquisition, and accept managed HTTPS with OAuth as the hosting route in principle. Hold deployment, domain, OAuth, connection and live tests for separate grants.

```text
GRANOLA-SUPPORT - Approve knowledge-acquisition allocating one Harness record (ki-acquire-granola admits state_root) then one tools-ki record (state_root layout plus safe reset and retention) and delivering both locally; local commits only; no install, release, migration, real reset or push.
BINARY-HOME - Approve a private knowledgeislands/mcp-acquire-chatgpt as the probe home and a local synthetic build of the probe_original_files scope under knowledge-acquisition; managed HTTPS with OAuth accepted in principle; deployment, domain, OAuth, connection and live iPhone tests each need a separate grant.
```
