# knowledge-acquisition: route-local-review - [knowledge-acquisition](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/knowledge-acquisition.md>) - since the ROUTE-LOCAL instruction of 14 October 2026 - waiting on you

ACK GRANOLA-PLAN - receiving review complete. The support split in KB-ACQUIRE-002 holds, with three corrections: the Harness rubric paths are wrong; nested migration proof sits inside the folder `reset --rebuild` deletes recursively; and `.acquire/chatgpt/` is not mapped. No existing record carries the tools-ki or Harness support. The query GRANOLA-CARRIER below asks which record should. No blocker to the review itself.

ACK BINARY-PROOF - receiving review complete. An exact-path first-probe build-and-test scope is below. The probe is held behind two decisions: the master must settle its home and hosting (BINARY-HOME), and the owner must rule on whether the Techne Programme Hold covers hosting it (BINARY-HOLD). Local build cannot start until a home is selected.

## What has been done

- Acted on the acquire-intake routing message. The owner's 14 October routing approvals are in the [acquire-intake decisions log](</Users/krisbrown/workspaces/personal/acquire/+/_THREADS/acquire-intake/decisions.md>), and the ROUTE-LOCAL instruction of 14 October 2026 is in the [knowledge-acquisition decisions log](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/knowledge-acquisition/decisions.md>). The message is now delivered and acknowledged by this report. This closes the delivery gap that acquire-intake recorded as ROUTE-LOCAL.
- Reviewed [KB-ACQUIRE-002](</Users/krisbrown/workspaces/personal/acquire/docs/roadmap/KB-ACQUIRE-002-migrate-granola-state.md>) against the code at these HEADs: tools-ki `81cdf04ea132b49da0cbeea1d162e44d2858025d`, ki-agentic-harness `221cc5de7d1c8ff5d8166cec763850e2de56410a` and acquire `ce8e4585735dfc9bac89b8e3450e645e0d34a23e`. Also checked [KI-HARNESS-OPS-005](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md>), every open tools-ki and Harness roadmap record, the `ki-acquire-granola` skill and the installed `ki`. Findings are under GRANOLA-PLAN.
- Reviewed [KB-ACQUIRE-003](</Users/krisbrown/workspaces/personal/acquire/docs/roadmap/KB-ACQUIRE-003-investigate-binary-bridge.md>) and its [probe contract](</Users/krisbrown/workspaces/personal/acquire/docs/guides/chatgpt-mobile-binary-capture-investigation.md>). Compared the candidate homes `mcp-housekeeping-chatgpt` and `mcp-acquire-whatsapp`, and the estate's existing managed hosting, against the [Techne Programme Hold](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Policies/Techne Programme Hold.md>). The scope is under BINARY-PROOF.
- Limits: read-only throughout. No code, record, registry, checkpoint or commit was made, and no provider, network, test-suite or remote call. The only command that touched an executable was a read-only `ki harness` query plus `--help` output. The commands below are proposals and have not been run.

## What is in progress

Nothing is running. Both records stay Next/Draft with a null baseline. Migration and probe implementation remain gated.

### Outstanding - no action requested now

- **Correction for KB-ACQUIRE-002 (acquire-intake owns the edit).** The Harness rubric paths are wrong. `scripts/rubric/items/acquisition.ts` and `publication.ts` do not exist at the Harness root. The real files are under `skills/acquire/ki-acquire-granola/scripts/rubric/`:
  - `items/acquisition.ts`
  - `items/publication.ts` and `items/publication.test.ts`
  - `items/index.ts` and `items/index.test.ts`
  - `contexts/granola.ts`
- **The migration map leaves out `.acquire/chatgpt/`.** That folder holds `account-export-2026-09-22/checkpoint.json` and `convert.py`, and nothing in KB-ACQUIRE-002 maps it. Under its own "stop for review" rule, the cutover will halt there. The `.acquire` formatter exclusion cannot be removed until this folder has an owner.
- **The live `ki` runs from the primary tools-ki checkout.** `~/.local/bin/ki` points to `.ki-local-runner`, which runs `bun .../tools-ki/src/main.ts`. Any tools-ki change in that working tree changes the live executable at once, so the support work must be built in a tools-ki worktree, not the primary checkout.
- KI-TOOL-KI-CLI-124 is Awaiting review in tools-ki and touches neither handoff.

## Outstanding queries

### GRANOLA-PLAN - Granola importer support: receiving review

**Summary:** The ownership split holds:

- **tools-ki** owns the importer core, the command and the executable.
- **ki-agentic-harness** owns the property declaration and the acquisition contract.
- **acquire** owns its local migration.

**Property spelling.** The setting is `state_root`, in the `[skills.ki-acquire-granola]` table. It is snake_case like `capture_root` and `folder_territories`. Its value is the parent folder, `state_root = "+/_ACQUIRE"`, and the tool adds `granola/` to it, as `layout.ts:13` already does for `.acquire/granola`. Validation rules:

- Accept it only together with `capture_root`, in the same way `folder_territories` already requires `capture_root` (`routing.ts:85`).
- Require a safe relative path that stays physically inside the repository.
- Reject a value that is equal to, or overlaps, `capture_root`.
- When it is absent, keep the current defaults: `.acquire/granola` with `capture_root`, and `+/_ACQUIRE/granola` for legacy receivers.

**tools-ki files:**

- `src/core/acquire/granola/layout.ts`
- `src/core/acquire/granola/routing.ts` (add the key to `CONFIG_KEYS`)
- `src/core/acquire/granola/import.ts` (`resetGranola` at line 697)
- `src/core/acquire/granola/images.ts:110`
- `src/commands/acquire/index.ts:249` (it passes only `capture_root` today)
- tests: `src/tests/cli/acquire/granola.test.ts` and `src/tests/cli/acquire/adapters.test.ts`
- docs: `docs/specs/acquisition.md` and `docs/guides/user/granola-acquisition.md`
- `src/core/harness/inspection.ts` reads the declared properties and needs no change.

**Harness files:**

- `skills/acquire/ki-acquire-granola/SKILL.md`: add `state_root` to `ki-acquire-repository-properties`.
- `references/standards-granola-acquisition.md`: around lines 106 and 151.
- The corrected rubric files listed under "What is in progress".

**Reset and retention gates.** One material gap: `.acquire/granola/migration/` already holds nested proof, including the 10 October and 12 October receipts. `reset --rebuild` runs `rm(state, {recursive: true})` at `import.ts:732`, and KB-ACQUIRE-002 moves that proof to `+/_ACQUIRE/granola/migration/`, still inside the target that gets deleted. tools-ki must make these changes:

- Rebuild deletes only an enumerated set of files the tool owns, never the folder recursively.
- Adapter reset and rebuild refuse to run while any identity has a handled disposition. They currently delete the ledger, which loses suppression for the two harvested identities.
- A reset of a single source refuses to drop a handled identity.
- Every reset previews its exact file list first.

**Rollback gates.**

- Record the known-good tools-ki revision (`81cdf04e...` today) and the Harness projection mode before cutover.
- Restoring means returning the primary checkout to that revision, then `ki dev local off knowledgeislands/ki-agentic-harness` if the projection had been switched. Then restore the old `.ki.toml`, and check the state hashes against the relocation receipt.
- Never reset, and never contact Granola, as part of a rollback.

**Build and test commands.** From `/Users/krisbrown/workspaces/knowledge-islands/tools-ki`, run in a worktree:

- `bunx vitest run src/tests/cli/acquire/granola.test.ts src/tests/cli/acquire/adapters.test.ts`
- `bunx tsc --noEmit -p tsconfig.json` (no typecheck script exists)
- `bun run test:coverage` (thresholds are 100%)
- `bunx @biomejs/biome check`
- `bunx rumdl check docs/specs/acquisition.md docs/guides/user/granola-acquisition.md`
- `git diff --check`

From `/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness`:

- `bun test --isolate --max-concurrency=1 ./skills/acquire/ki-acquire-granola`
- then `bun run test` and `bunx tsc --noEmit`
- the commit hook enforces lint-staged and syncpack

**Verifying the executable and the Harness projection.**

- The executable is proven when the primary tools-ki checkout HEAD contains the support commit, because the runner executes the source directly. A worktree commit alone does not count.
- The projection is proven against a disposable fixture repository that declares `state_root`. Run `ki acquire list --repo <fixture>`: before the Harness change it must report the granola configuration as invalid (unsupported key), and after it as valid. `ki harness info knowledgeislands/ki-agentic-harness` must still list `ki-acquire-granola`.
- Then run `ki acquire status --adapter granola` and `ki acquire reconcile --adapter granola` against the fixture only.

**Record per piece.**

- acquire: KB-ACQUIRE-002 carries the migration.
- tools-ki and Harness: no record covers the support. KI-HARNESS-OPS-005 covers AI sessions, KI-TOOL-KI-CLI-124 covers agent run close and KI-TOOL-KI-CLI-126 covers repair. See GRANOLA-CARRIER.

**Need from you:** Accept this as the agreed support scope for both receiving owners.

**Recommendation:** Accept it, with the reset fix (enumerated deletion and refusal while handled dispositions exist) as a precondition of support. Keep the migration gated.

### GRANOLA-CARRIER - Which record carries the tools-ki and Harness support

**Summary:** No existing record fits, and the burn-down rule forbids new feature records. The reset behaviour is a data-loss defect, though: rebuild would erase the migration proof and the handled-source suppression. Defects remain capturable. The Harness side is three small declaration and document edits that depend on the tools-ki change.

**Need from you:** Decide whether one tools-ki defect record may be allocated to carry both lanes.

**Recommendation:** Allocate one tools-ki defect record covering `state_root` and safe reset. The Harness property admission is delivered under it as an explicit, bounded owner-instructed change, so no Harness record is needed. Do not widen KI-HARNESS-OPS-005.

### BINARY-PROOF - First-probe build-and-test scope for the ChatGPT binary bridge

**Summary:** The prospective files below are for the selected home, modelled on the `mcp-acquire-whatsapp` layout and confirmed under `ki-repo-mcp` before freezing. The local build is a no-write streaming and hashing probe exposing one tool, `probe_original_files`.

**Prospective files:**

- `src/config/index.ts` and its test: caps of 9 files, 10 MiB per file, concurrency 1, two redirect hops, the timeouts, and the source-host allowlist.
- `src/tools/probe-original-files.ts` and its test: input follows the fileParams file object (`download_url`, `file_id`, optional `mime_type` and `file_name`). The outputSchema returns:
  - the probe ID;
  - per-file name or ordinal, byte count, SHA-256, magic-byte media type and status;
  - a safe error code.
- `src/fetch/source-url-policy.ts` and its test.
- `src/fetch/stream-hash.ts` and its test: streams with a length counter and digest, never buffers the whole file and writes nothing to disk.
- `src/auth/owner-guard.ts` and its test.
- `src/logging/redact.ts` and its test.
- `src/mcp-server/server.ts`, `index.ts`, `server.test.ts` and `tool-conformance.integration.test.ts`: Streamable HTTP, one tool, read-only annotation.
- `src/tests/boundaries.test.ts`: asserts that no file-system write or repository-writer import exists.
- `docs/guides/user/probe-setup-test-restore.md`, `README.md`, and the first roadmap record of the home.
- No deployment manifest belongs to the local build.

**Synthetic tests.** All use an injected transport and resolver, so the private-address policy is never relaxed for fixtures.

- **URL:** reject HTTP, userinfo, hosts not on the allowlist, IPv4 and IPv6 literals, and names that resolve to loopback, link-local, private, CGNAT or metadata addresses.
- **Redirect:** re-check the policy at every hop; reject a redirect to a private address, to HTTP, a loop, or a chain over the limit.
- **Size:** test below, at and over the per-file and combined caps; a lying or missing Content-Length.
- **Timeout:** the header deadline and a stalled body.
- **Partial:** a reset in the middle of the stream, or a short body, returns `partial` and no digest.
- **Auth:** a missing or expired token, the wrong audience, another account or a revoked token are denied. Source-host 401, 403 and 429 map to safe codes. The fixture asserts that the MCP token is never forwarded.
- **Output:** schema validity; no URL, bytes, credentials or arguments in the output; names never select paths; digests match known vectors.
- **Logging:** a captured logger shows no URL, query string, header, token or `file_id`, including in exceptions.

**Commands:** `bun run test`, `bun run test:coverage` (100%), `bunx tsc --noEmit`, `bun run build` and `git diff --check`.

**Hard gate.** The size and SHA-256 independently recorded for the original of the first earlier-turn Acer JPEG must match what the remote probe returns. If no independent size is recorded, the size proof stays pending. The test runs in the existing iPhone conversation with exactly the one instruction given in the contract: no picker, no re-upload, no pasted ID. Before any build, the owner first makes a zero-build check of the connected tools on the iPhone, such as the existing Pages page-reference hash tool.

**Restore before anything connection-critical.** Before connecting the connector, record the non-secret list of existing ChatGPT connectors. Prove disconnection and token revocation on a disposable client. Change nothing in Headroom, mcporter, `mcp-servers.yaml` or any existing MCP binding. Re-verify existing access after disconnecting.

**Separate grants:**

- local build: needs a selected home and local repository initialisation;
- creating the GitHub remote and pushing;
- host, account and region;
- domain and endpoint;
- OAuth, identity provider, client registration and secrets;
- ChatGPT account, workspace and connector connection;
- the live iPhone window: first JPEG, then a second conversation, then all nine.

**Record.** The engineering fits the open KI-HARNESS-OPS-005 steps "Connect ChatGPT acquisition to a readable, authorised source ... assets" and "Decide whether the existing `mcp-housekeeping-*` repositories remain shared ...". No new record is needed until a home exists.

**Need from you:** Accept this as the first-probe scope, carried under KI-HARNESS-OPS-005.

**Recommendation:** Accept it. The owner does the zero-build iPhone tool check first, and the probe is built only if that check finds no existing route.

### BINARY-HOME - Engineering home, hosting and ownership for the probe

**Summary:**

- **`mcp-housekeeping-chatgpt` is a poor home.** It is public, a local store read over stdio, and has no OAuth or cloud lifecycle. A private-file fetcher there would mix trust boundaries.
- **`mcp-acquire-whatsapp` is WhatsApp-specific.** It is the right naming and layout precedent, and it is `private: true`.
- **A new private `knowledgeislands/mcp-acquire-chatgpt`** fits that precedent and keeps the cloud boundary isolated.
- **Hosting.** The estate already deploys to Cloudflare through the `ki-repo-website-cloudflare` overlay, used by `apps-knowledgeislands.info` and `apps-midnight.ninja` among others. A stateless Worker offers Streamable HTTP and streaming digests. Its streaming, limit and OAuth fit must be confirmed against current documentation before any host grant.
- **Ownership.** Engineering sits with the knowledge-acquisition Project under KI-HARNESS-OPS-005. The auth administrator and host account owner should be Kris.

**Need from you:** The master settles the home, hosting candidate and ownership.

**Recommendation:** Select a new private `mcp-acquire-chatgpt` with Cloudflare Workers as the candidate host. Create the repository and its registry entry only after the zero-build iPhone check finds no existing route.

### BINARY-HOLD - Whether hosting the probe falls under the Techne Programme Hold

**Summary:** The hold is written for the Techne harness and CLI. It also covers deployment "initiated ... from another project", and its "What stays held" list names "every other environment". Read literally, it may catch a KI MCP deployment, so local build is unaffected but any host grant is uncertain.

**Need from you:** Rule whether a private KI acquisition-probe deployment is inside the hold.

**Recommendation:** Rule it outside the hold, limited to the time-boxed probe test window, with a documented kill switch and teardown. Record the ruling before any host grant.

```text
GRANOLA-PLAN - Accept the receiving review in /Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/knowledge-acquisition/route-local-review.report.md as the tools-ki/Harness support scope, with state_root = "+/_ACQUIRE" and enumerated-deletion, refuse-on-handled reset as preconditions; acquire-intake corrects the Harness rubric paths and the .acquire/chatgpt mapping in KB-ACQUIRE-002; migration stays gated.
GRANOLA-CARRIER - Allocate one tools-ki defect record for state_root and safe reset, with the Harness property admission delivered under it by explicit owner instruction; no Harness record, and KI-HARNESS-OPS-005 is not widened.
BINARY-PROOF - Accept the first-probe scope in route-local-review.report.md under KI-HARNESS-OPS-005; I will first check the iPhone's connected tools myself, and the probe is built only if no existing route passes.
BINARY-HOME - Master: select a new private knowledgeislands/mcp-acquire-chatgpt, Cloudflare Workers as the candidate host, knowledge-acquisition as engineering owner and Kris as auth and host owner; create the repository only after the zero-build check fails.
BINARY-HOLD - A private KI acquisition-probe deployment is outside the Techne Programme Hold, limited to the probe test window with a kill switch and teardown; record this before any host grant.
```
