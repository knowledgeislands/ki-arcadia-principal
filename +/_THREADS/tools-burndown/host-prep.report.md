# Protected tooling preparation

Read-only preparation on 11 October 2026, terra (local Mac), for the existing **Techne: agent-host** owner. Authority: tools-burndown Decisions 1, 3 and 4 in [the run decisions](/Users/krisbrown/.local/state/ki/agents/tools-burndown/decisions.md). These recommendations transfer no execution, adoption, acceptance, push or remote-operation authority. All four records remain triage and untouched. No implementation or delivery tests were performed.

## Done

- Read all four records in full, both tools' AGENTS.md, CLAUDE.md and .ki.toml, the owner's [checkpoint](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/techne.agent-host.md), and [Techne Programme Hold](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Admin/Governance/Policies/Techne Programme Hold.md). Applied ki-delegation, ki-work, ki-work-roadmap, ki-engineering, ki-repo-tools and tools-ki's ki-self guidance and delivery checklists.
- Resolved checkouts using `ki registry list`. Inspected source, existing isolated test seams and local harness contracts without executing scripts or contacting a host.
- Checked actual techne PID liveness and DONE markers: 48 finished, five exited without DONE, zero live PIDs and no queue. The five are build-015, naming, naming2, rename-agent-host and setup-ki010. The related legacy state-of-play/close-ki run is DONE and its PID is dead; its old prompt explains the writing-checkout work merged into the existing tools-ki record. A bounded filename/PID survey of local state and temporary directories found no additional techne run. These observations establish local worker inactivity, not ownership release or remote inactivity.
- Prepared the four bounded plans below and a pasteable handoff. Shared parsing does not merge, close or replace records.

### Baseline evidence

Initial content snapshot: approximately 10:00 BST. All five checkouts were clean on main. Recorded HEADs:

| Repository | HEAD |
| --- | --- |
| tools-ki | 38c35150810142ef4f95b5b95f796bfca3152be5 |
| tools-techne | 684de1f32956f14a4cb823c8034ae9e46b7efbb7 |
| ki-techne-harness | fb158cadaab4355e4e4e1905bf11e05debbac2f2 |
| ki-agentic-harness | ce65b6b110e1cc07c8d2db5c8c8f0ff2338f1e83 |
| ki-arcadia-principal | 846f56fae13d8ea7d52bed8c3a7e78395db96579 |

Machine-local [baseline snapshot](/Users/krisbrown/.local/state/ki/agents/tools-burndown/host-prep.baseline.json) contains HEAD, branch, porcelain status, index hash and SHA-256 hashes of tracked and non-ignored untracked files. No fetch was allowed, so this report makes no fresh remote-synchronisation claim. Final comparison appears below.

Read-only checks passed: both tool TOML declarations parse and select roadmap; exact predicates verify all four identifiers and triage states; the actual marker writer uses `~/.config/ki/host-marker`; parsed recipe operations and status exit mapping match the plans. Full test, coverage, build, audit and manual gates are future owner delivery checks, not results from this preparation.

### [KI-TOOL-CLI-115 (pruned)](https://github.com/knowledgeislands/tools-ki/blob/70c9337f618d114f95725d2496c23ea439279f53/docs/roadmap/KI-TOOL-CLI-115-enforce-roadmap-writing-checkout.md) - writing-checkout protection

[Existing record](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/docs/roadmap/KI-TOOL-CLI-115-enforce-roadmap-writing-checkout.md).

**Settled:** the checkpoint's Decision 19 fixes the marker at `~/.config/ki/host-marker`; the harness already writes it in [converge.sh](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/operations/aws/agent-host/host/converge.sh:554). It is a machine exclusion, not a declaration of the designated checkout. The record's marker-location discussion is stale; do not reopen it or add an environment-variable alternative. The operator workstation is the writing locus, and remote-main serialisation remains outside this delivery.

**Next steps:** enumerate actual roadmap mutations, then put one typed preflight in the work domain and feed it injected config/home paths. Current native writes are [move/prune/migrate](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/src/core/work/operations.ts:420), [horizon publication](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/src/core/work/items.ts:617) and any catalogue conformance that scaffolds or repairs ROADMAP.md/_ISSUES.md. Inventory that last route before asserting complete coverage. Marker refusal must precede every write, deletion, staging or commit across the full selection. Reading, migration preview and prune dry-run should stay available. No native reservation/capture/accept command was found in the current work surface: do not invent those commands; cover any existing write route and document the manual-edit boundary honestly.

**Change boundary:** src/core/work/, context wiring in src/commands/repo/roadmap.ts, declaration validation only if the owner chooses a tracked designation, and the existing conform route where it publishes roadmap files. Align the repository-operations guide, manual and changelog with actual behaviour. Harness marker generation and portable skill wording stay with their owners; no changes to them in this delivery.

**Tests:** through `sandbox()`/`run(args, context)` in src/tests/cli/repo/roadmap.test.ts and roadmap-model.test.ts, plus applicable conform-execution coverage: marked/unmarked, sandbox HOME and non-default config roots, readonly operations/previews, every existing mutation, and bulk refusal leaving every selected repository and Git state unchanged. If a callable manual-write preflight is selected, test that public route too.

**Decision before adoption/planning:** the record expressly includes declaration location and skill access. Recommend a machine-local registry designation keyed by stable repository identity, with marker exclusion enforced first, avoiding committed physical paths; the owner must agree the declaration/read contract and whether a public check is needed for manual skill edits. This lane does not select a schema or reduce the record to marker-only delivery. Recommend no remote-main design work or new record here.

### [KI-TOOL-CLI-116 (pruned)](https://github.com/knowledgeislands/tools-ki/blob/70c9337f618d114f95725d2496c23ea439279f53/docs/roadmap/KI-TOOL-CLI-116-launcher-held-wait-gates.md) - launcher-held wait gates

[Existing record](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/docs/roadmap/KI-TOOL-CLI-116-launcher-held-wait-gates.md).

**Evidence:** [runs.ts](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/src/core/agent/runs.ts:164) still adds a prompt-only wait; launchAgent starts the runtime immediately. dispatchRun dequeues without inspecting dependencies. Existing agentState already distinguishes DONE, live and exited, using injected AgentProcesses.alive/sleep. The checkpoint's manual sequencing workaround remains necessary.

**Next steps:** recommend the record's detached holder approach: reuse the dispatcher self-launch pattern for a narrow `hold --foreground` worker. Validate and prepare the immutable run packet once; the held agent's PID identifies the holder and status names pending gates. Poll all same-run gates before launching either runtime; replace PID with runtime PID at launch without a transient exited window visible to status/wait. Remove composePrompt's wait paragraph. Ensure queued requests receive exactly the same gate enforcement; a holder may occupy a dispatcher slot until its gate opens, so avoid queuing a prerequisite behind its dependent under --max 1. Reject self-gates and invalid/missing references before creating an impossible hold; allow a genuinely queued prerequisite as pending.

**Failure boundary:** the goal already calls for clean termination when a prerequisite exits without DONE. Recommend immediate failure with the dependency name, a failure report and final status that does **not** end DONE, so downstream gates cannot mistake failure for successful delivery. Do not silently wait for relaunch. Keep the Claude ceiling variable in this bounded fix because other in-session waits still exist; removing it is unnecessary. No dependency-graph framework or runtime patch.

**Change/tests:** src/core/agent/runs.ts, src/commands/agent/index.ts and the background-agents guide, with any grammar inventory/manual/completion alignment required by the added holder route. Extend [agent.test.ts](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/src/tests/cli/agent.test.ts:20) using fake processes/time: no runtime before all gates are DONE; multiple gates; DONE despite a still-live prerequisite PID; death without DONE; missing/invalid PID; held PID/status/wait observations; holder-to-runtime handover; duplicate launch; Claude and Codex; queued launch; spawn failure. Tests must never start real agents. Owner confirms the narrow holder grammar and missing-reference rule in the existing plan; no new Kris architecture decision is inherent in moving the gate out of the model.

### [TECHNE-TOOL-CLI-006 (pruned)](https://github.com/knowledgeislands/tools-techne/blob/684de1f32956f14a4cb823c8034ae9e46b7efbb7/docs/roadmap/TECHNE-TOOL-CLI-006-guarded-host-commands.md) - guarded host commands

[Existing record](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-techne/docs/roadmap/TECHNE-TOOL-CLI-006-guarded-host-commands.md).

**Settled prerequisite:** the checkpoint says the durability pilot is accepted. The current [recipe manifest](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/recipes/agent-host/recipe.toml:33) declares structured status and rebuild/withdraw through destroy. No rebuild of the live host is prerequisite for local CLI delivery. Copy the relevant pilot lessons into this existing record when its owner plans it: stop warns and still proceeds, destruction fails closed, exact repository overrides, same-host identity check and separate administrator/operator profiles.

**Next steps:** extend Recipe parsing to retain manifest status schema/exit mapping and named operations; HarnessCheckout must resolve provider-specific stop/destroy paths rather than hardcode AWS paths. Capture status with `--json` and a bounded connect timeout, without --fetch. Parse/validate the document, schema, repositories/problems and outcome-to-exit agreement; embed the structured document in the next host-status schema rather than a text string. Preserve 0/3/4, failure 1 and unreachable 255 at the public seam. A stopped/unreadable workspace must be explicitly unknown rather than a successful safety assessment; preserve absent-host diagnostics distinctly. Define deterministic aggregation for --all in the plan.

Route stop through the recipe stop script, passing --now only when requested. Route rebuild/withdraw through the manifest destroy operation with --discard repository arguments or --discard-unreadable-host, never direct EC2 terminate. The script owns guards, recovery advice and same-host checks. Respect `CONFIRM_DESTROY_AGENT_HOST=<resolved stack name>` and interactive `discard <stack name>` confirmation for unreadable-host override; do not auto-confirm or weaken either. Destruction uses the administrator profile; stop uses the operator profile. Important existing pitfall: Context.hostEnvironment currently overlays adapter.environment after scriptEnvironment, so its administrator AWS_PROFILE would overwrite the manifest's operator profile for stop. Correct precedence for script-specific declared variables and prove it with stubs.

**Change boundary:** src/recipes.ts, src/harness.ts, src/config.ts, src/cli.ts, provider contracts only where obsolete terminate is removed, src/completion.ts; src/tests/cli.test.ts/core.test.ts and recipe fixtures; help, docs/guides/user/agent-host.md, README, man/techne.1 and changelog. No harness writes or live operations. Recommended removal of teardown outright follows current-contract policy; retain a migration error only if the owner explicitly selects that transition.

**Tests:** runCli plus FakeRunner and non-AWS StubHost: schema/exit mismatches, malformed JSON, clean/at-risk/unknown/unreachable/absent/stopped, --all aggregation, optional additive members, warning stop and --now, both operations, exact overrides, mutual exclusion, interactive refusal, cancellation, distinct admin/operator environments, missing manifest paths and dry-run with no mutating subprocess. Use harness [AWS script fixtures](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/tooling/checks/agent-host-aws-scripts.sh:113) as expected equivalence cases, not as scripts to run on a host.

**Remaining scope limit:** expiry/drift warnings are currently text-only in the harness; its JSON document contains no expiry member. Do not scrape secrets or invent an expiry contract in this adapter. Preserve structured profile/updates data and surface a future supplied warning when its owner supplies one. The thread must settle teardown removal and --all/stopped semantics in this record before implementation.

### [TECHNE-TOOL-CLI-008 (pruned)](https://github.com/knowledgeislands/tools-techne/blob/684de1f32956f14a4cb823c8034ae9e46b7efbb7/docs/roadmap/TECHNE-TOOL-CLI-008-host-patching-fields.md) - patching binding fields

[Existing record](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-techne/docs/roadmap/TECHNE-TOOL-CLI-008-host-patching-fields.md).

**Settled:** recipe parameters are reboot_window/livepatch, provision environment names AGENT_HOST_REBOOT_WINDOW/AGENT_HOST_LIVEPATCH. No weekday, no automatic reboot without a window, Livepatch opt-in, and update signals never alter outcome. The status schema stays techne/host-workspace/v1.

**Next steps:** add only these optional neutral binding fields in src/bindings.ts. Validate the raw window as a string matching `^(?:[01][0-9]|2[0-3]):[0-5][0-9]$`, and livepatch as an actual TOML boolean before scalarText converts it to script text. Preserve absence and false distinctly. Existing scriptEnvironment should pass values only to scripts the manifest names; do not add provisioning commands or token handling.

Render optional updates fields from the shared structured workspace report: os, pending, security, reboot_required, reboot_required_since, reboot_packages and livepatch, preserving null/unknown and absent updates. JSON retains these exact fields and human output labels them clearly. Exit status remains driven solely by the underlying outcome. Avoid implementing a second parser alongside the guarded-command work.

**Change/tests:** bindings.ts and the status renderer/parser in harness.ts/cli.ts; src/tests/cli.test.ts, recipe fixtures and focused core coverage; binding/status user guide, help/manual/changelog where affected. Test absent fields, true/false, 00:00 and 23:59, 24:00/short/weekday/whitespace/non-string windows, string/number Livepatch, exact provision environment, no leakage to unrelated scripts, no updates, null updates and complete updates. Compare otherwise identical reports with/without updates for all 0/3/4 outcomes. No remote prerequisite or unresolved patching-policy choice remains.

### Fastest bounded sequencing and delivery gates

Prepare 115/116 in tools-ki independently by file boundary; let the owner integrate serially because both share CLI inventory and verification. Prefer 116 first to restore reliable local orchestration. In tools-techne, plan the common structured-status seam once under 006, then deliver 008's binding validation/rendering against it in a distinct reviewable unit. They stay separate records; 008 is intrinsically non-blocking and can proceed first if the owner instead establishes its minimal structured parser there. No simultaneous editors of shared fixtures/cli.ts.

Use the pinned root Bun and installed dependencies. Focused tests first, then each repository's [tools-ki definition of done](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/docs/guides/developer/definition-of-done.md) or [tools-techne definition of done](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-techne/docs/guides/developer/definition-of-done.md): complete test/coverage, typecheck, lint, relevant build/package/manual/completion checks, `ki repo audit` and diff check. Updating command grammar also updates tools-ki's generated manual inventory. Dependency installation, audit execution and generated artifacts were not run here because this lane is read-only. Release, push, acceptance and live verification require their own existing authority.

### Ready-to-paste owner handoff

> Tools-burndown has prepared the four existing protected records for Techne: agent-host; ownership stays with you. Local techne workers are idle, with five old non-DONE failures still visible. Please resume local planning/delivery through your existing authority and lifecycle: [KI-TOOL-CLI-116 (pruned)](https://github.com/knowledgeislands/tools-ki/blob/70c9337f618d114f95725d2496c23ea439279f53/docs/roadmap/KI-TOOL-CLI-116-launcher-held-wait-gates.md) first using a launcher-held gate; [KI-TOOL-CLI-115 (pruned)](https://github.com/knowledgeislands/tools-ki/blob/70c9337f618d114f95725d2496c23ea439279f53/docs/roadmap/KI-TOOL-CLI-115-enforce-roadmap-writing-checkout.md) with the already-set ~/.config/ki/host-marker, agreeing designation/manual-check details before its plan; [TECHNE-TOOL-CLI-006 (pruned)](https://github.com/knowledgeislands/tools-techne/blob/684de1f32956f14a4cb823c8034ae9e46b7efbb7/docs/roadmap/TECHNE-TOOL-CLI-006-guarded-host-commands.md) consuming the accepted harness status/destroy contracts; [TECHNE-TOOL-CLI-008 (pruned)](https://github.com/knowledgeislands/tools-techne/blob/684de1f32956f14a4cb823c8034ae9e46b7efbb7/docs/roadmap/TECHNE-TOOL-CLI-008-host-patching-fields.md) adding the settled patching fields against the same parser. Keep 006/008 separate. The report gives exact change/test boundaries, including the stop-profile precedence pitfall. No live host connection, rebuild, new record, acceptance or execution transfer is authorised by this handoff. Plans and baseline evidence: /Users/krisbrown/.local/state/ki/agents/tools-burndown/host-prep.report.md.

## Failed

- No delivery attempted or claimed. A local Python TOML parser was unavailable; the verification was completed with the repository's installed smol-toml under Bun. Some exploratory guessed file paths/globs were absent; discovery recovered the actual paths. No dependency installation or environment change was made.

## Needs Kris

- **HOST-HAND:** paste the handoff to state-of-play / the existing agent-host owner. This preparation cannot authorise or start protected implementation.
- **WRITE-LOCUS:** with that owner, agree the designation location and whether manual skills need a public preflight for [KI-TOOL-CLI-115 (pruned)](https://github.com/knowledgeislands/tools-ki/blob/70c9337f618d114f95725d2496c23ea439279f53/docs/roadmap/KI-TOOL-CLI-115-enforce-roadmap-writing-checkout.md). Recommended machine-local registry designation plus the settled host-marker exclusion; no remote-main redesign.
- **HOST-GRAMMAR:** resolve [TECHNE-TOOL-CLI-006 (pruned)](https://github.com/knowledgeislands/tools-techne/blob/684de1f32956f14a4cb823c8034ae9e46b7efbb7/docs/roadmap/TECHNE-TOOL-CLI-006-guarded-host-commands.md)'s retained open teardown choice in its plan. Recommend outright removal; do not leave an unguarded termination path. The owner can settle --all/stopped status semantics locally against the stated fail-closed intent.

## Final preservation check

Checked at 10:02 BST. Concurrent baseline changes were observed; none was made by this read-only lane.

- ki-arcadia-principal: {"repo": "ki-arcadia-principal", "head_unchanged": false, "index_unchanged": false, "status_unchanged": true, "changed_files": ["+/_CHECKPOINTS/_state-of-play.md", "+/_CHECKPOINTS/platform-foundations.estate-factorisation.md"], "final_head": "9045d41caeb161e52cc2bce79ecd03c070a489ea", "final_status": ""}

Detailed comparison: [verification evidence](/Users/krisbrown/.local/state/ki/agents/tools-burndown/host-prep.verification.json). The hash inventory excludes ignored generated/dependency files; no command run here wrote those files. Preparation coverage is 4/4. Delivery checks: not run.
