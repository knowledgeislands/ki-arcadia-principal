# Knowledge Islands factorisation review: Codex synthesis position

Model: `codex`

Review date: 2026-09-20

Status: comparative synthesis position, not an independent review and not an adopted implementation plan

Brief: `knowledge-islands-factorisation-brief.md`

Inputs: the estate brief, the independent GPT-6 Astra review, the independent Fable 5.1 review, focused inspection of the current housekeeping MCP repositories, and maintainer direction received after both independent reviews.

## 1. Updated position

Retain the federated estate and most current repository boundaries. Consolidate the ChatGPT and Codex housekeeping adapters into one private OpenAI-family MCP. Establish behavioural conformance before extracting common MCP code, then pilot a narrow Harness-owned implementation kit through pinned ordinary-file copies. Make projections and deployed versions attributable and checkable. Do not introduce estate-wide specifications before Knowledge Islands reaches overall V1.

Fable provides stronger measured evidence than the original brief and makes several recommendations more concrete. Astra provides the safer posture where the evidence does not yet justify an irreversible structural change. This position adopts the strongest common ground, accepts the maintainer's consolidation decision, and retains the material differences below.

## 2. Maintainer direction treated as binding

### OpenAI housekeeping consolidation

Merge `mcp-housekeeping-chatgpt` and `mcp-housekeeping-codex`. The target should support both sources concurrently because a machine may use both ChatGPT and Codex.

Use `mcp-housekeeping-openai` as the working repository name. It names the parent product family in the same way that `mcp-housekeeping-claude` names the Anthropic product family while supporting Claude Desktop, Cowork, and Claude Code. Calling the combined repository ChatGPT would make Codex appear subordinate to the wrong product surface.

Keep the combined repository private through the migration. Source visibility is not necessary to prove the product boundary, and widening access during a history merge would add an unrelated decision. Review public visibility separately after the combined product and its tests are stable.

### No estate-wide specifications before V1

Do not create KIS-0003, a new KIP, an estate-wide MCP schema, or an equivalent portable specification during this work. `ki-specifications` is outside the delivery path until overall V1.

Until then:

- the Harness may own a repository-local shared-control decision, reference implementation, and conformance fixtures;
- each MCP repository owns its provider policy, configuration, product behaviour, and adoption commit;
- tests and manifests can prove compatibility without claiming ecosystem-wide normative status; and
- evidence that may support future specification should be retained for reconsideration at V1.

This rejects Fable's proposed KIS-0003 and narrows Astra's references to possible portable specification work.

## 3. Findings accepted from Astra and Fable

### Keep the five factorisation decisions separate

Conceptual authority, executable ownership, source organisation, distribution, and runtime security are different decisions. Repository separation does not itself provide runtime isolation, and a shared repository need not imply one release unit or process.

### Retain the wider federation

Apart from the OpenAI housekeeping consolidation, no merge, split, move, or archive is sufficiently justified now. Arcadia, Techne Principal, the Harness, `tools-ki`, Techne Harness, Website, Plugins, Homebrew, the general tools, provider MCPs, and dotfiles continue to serve distinct responsibilities.

### Build behavioural assurance before sharing implementation

The first MCP engineering deliverable should be a behavioural suite covering access derivation, registration and invocation gating, annotation semantics, audit-event shape, sanitisation, error paths, and rotation. Run it against all current MCPs before deciding which apparent differences are policy and which are drift.

Fable's proposal to exercise built servers over stdio is stronger than source-hash comparison and should be retained. Byte identity can prove provenance of a vendored copy; only behavioural tests can prove the relevant contract.

### Use a narrow Harness-owned MCP kit

If the behavioural audit confirms common mechanics, the Harness is the best current home for a narrow reference implementation because it already owns reusable capability semantics and MCP guidance.

The kit may contain:

- access-level derivation and rank mechanics;
- generic access-gate mechanics;
- annotation presets or validators whose values are genuinely shared; and
- audit-event and sanitisation mechanics with policy injected by each server.

It must not absorb provider credentials, allowed paths, provider-specific redaction fields, server identity, SDK bindings, or product logic.

### Prefer pinned ordinary-file copies for the pilot

Vendored files preserve independent local builds and avoid a public registry or runtime Git dependency. Each consumer should record the canonical revision, hashes, supported interface, configuration inputs, and local edit policy. Adoption remains an explicit reviewable commit in the consumer.

### Make projections and deployments observable

Record source, transformation, revision, editability, regeneration, and drift checks for `ki-plugins`, website copies, installed Harness state, shared decisions, dotfiles-rendered configuration, and any future MCP kit copies.

Inventory which MCP build is actually running, its source revision, launch path, configuration source, permissions, and rollback target. Unknown deployed versions are a larger operational risk than the current repository count.

### Name an owner for estate-wide campaigns

Choreography gives each receiving repository authority over its commits but does not ensure a multi-repository migration finishes. Every SDK migration, CI pin update, shared-control rollout, or projection repair needs:

- one named campaign owner;
- one source record with the exact consumer set;
- per-repository status and evidence;
- an explicit completion condition; and
- a recorded decision to finish, defer, or abandon remaining adoption.

`mgit`, Agora membership, and `ki repo audit` can provide fan-out and evidence without centralising commit authority.

### Accept the factual corrections

Current inspection confirms:

- `src/utils/annotations.ts` has nine distinct hashes rather than eight; and
- `mcp-housekeeping-chatgpt`, `mcp-housekeeping-codex`, and `mcp-acquire-whatsapp` are private, while `mcp-housekeeping-claude` is public.

These correct the original brief without changing the architectural conclusion.

## 4. Material differences retained

### Repository-boundary criteria are heuristics, not a complete rule

Fable's release, trust, and host-mandate tests are useful, but the conclusion that content must share a repository whenever none applies is too strong. Independent acceptance, audience, governance lifecycle, change coupling, cognitive scope, and historical continuity also matter.

Use the tests to challenge a boundary, not to decide every boundary mechanically.

### Do not place MCP materialisation in `tools-ki` before the pilot

The pilot should use an explicit, small sync and verification mechanism beside the Harness kit. This keeps the experiment reversible and exposes the real update semantics.

Only after at least one SDK v1 consumer and `mcp-git-audit` on SDK v2 have adopted it successfully should the estate decide whether generic materialisation belongs in `ki repo conform`. `tools-ki` should not acquire MCP-specific layout knowledge merely because it is able to write files.

### Do not retire the Harness workspace option

Mark broader MCP workspace consolidation as deferred, not rejected permanently. Fable itself identifies conditions that could reverse the decision, including a much larger set of public same-SDK servers and subtree-aware repository governance.

The current target is independent provider repositories with shared conformance and controlled copies. The workspace option remains a documented future alternative with explicit reconsideration thresholds.

### Do not supersede the shared fundamentals record before adoption

Correct factual errors and stale references now. Record local ownership seams where they are already decided. Do not create a replacement estate-wide fundamentals record merely to encode a review recommendation that has not yet been accepted and implemented.

Once the target structure has working evidence, decide whether the existing record needs an amendment, annotation, or formal supersession.

### Deletion is a diagnostic, not a test of authority

Fable's question, "what observably changes if this authority disappears?", usefully exposes unenforced or purely aspirational relationships. It does not determine whether an authority is legitimate. Normative and conceptual sources often constrain design and review without being runtime dependencies.

Use the test to measure enforcement and consumption, not to erase non-executable authority.

### Keep visibility separate from consolidation

The OpenAI MCP should remain private during consolidation. The fact that much of the estate is public does not by itself make publication beneficial. Review visibility later against source sensitivity, test fixtures, licence, intended users, and support posture.

## 5. OpenAI MCP target

The combined `mcp-housekeeping-openai` should be one product with two adapters:

- a ChatGPT adapter for the installed local ChatGPT session store; and
- a Codex adapter for repository-scoped sessions exposed by the Codex app-server protocol.

Both adapters should be independently discoverable and usable in one running server. Absence of one source should make that adapter unavailable without preventing the other from operating.

The merge should preserve:

- both Git histories;
- separate provider configuration and availability diagnostics;
- the four read-only acquisition operations for each source;
- source-specific provenance and checkpoint schemas;
- independent provider tests beneath a shared server-level conformance suite; and
- a rollback point before the old Codex repository is archived.

`mcp-housekeeping-claude` remains separate. It already spans the Anthropic family, including Claude Desktop, Cowork, and Claude Code, and has a materially different public history and broader legacy housekeeping behaviour.

The old ChatGPT and Codex repository names should redirect to the combined product after migration. Archive rather than delete the absorbed repository.

## 6. Revised delivery sequence

### Stage 1: factual and ownership corrections

- Correct the two brief facts above and known stale cross-references.
- Record the Harness/CLI, CLI/controller, and Rig/dotfiles/bootstrap ownership seams.
- Establish the estate-wide campaign record pattern.
- Make no new portable specification or replacement fundamentals record.

### Stage 2: behavioural baseline

- Build the SDK-neutral conformance harness.
- Run it against all nine current MCPs.
- Classify every divergence as common invariant, provider policy, SDK adaptation, or defect.
- Fix confirmed defects in their owning repositories before sharing code.

### Stage 3: OpenAI consolidation

- Freeze the exact merge baseline after existing work is clean.
- Create `mcp-housekeeping-openai` with ChatGPT and Codex adapters.
- Prove concurrent operation, isolated source failures, and read-only behaviour.
- Update Agora and dotfiles references.
- Keep the target private and archive the absorbed repository only after rollback evidence is recorded.

### Stage 4: shared-control pilot

- Create the narrow Harness-local decision, modules, manifest, and tests.
- Pilot pinned copies in one SDK v1 server and `mcp-git-audit` on SDK v2.
- Keep the sync mechanism local and explicit during the pilot.
- Decide whether to extend `ki repo conform` only after the pilot.

### Stage 5: projection and deployment controls

- Add projection provenance and drift checks.
- Inventory running MCP revisions and rollback targets.
- Measure adoption delay, repeated edits, CI cost, and rollback time.

### Stage 6: V1 reconsideration

At overall V1, review the accumulated repository-local evidence and decide whether any behaviour warrants an estate-wide specification, whether the Harness workspace option should remain deferred, and whether further repository consolidation has measurable value.

## 7. Position held pending new evidence

The following position should be used for consolidation unless new evidence materially changes it:

- merge ChatGPT and Codex into private `mcp-housekeeping-openai`;
- keep Claude separate;
- retain every other repository boundary for now;
- test behaviour before extracting shared implementation;
- pilot a narrow Harness kit through pinned ordinary-file copies;
- defer `tools-ki` materialisation until the pilot proves the contract;
- keep broader workspace consolidation as a future option;
- make projections, deployments, and estate-wide campaigns observable; and
- create no estate-wide specification before overall V1.
