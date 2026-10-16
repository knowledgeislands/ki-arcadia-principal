# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › cli-pin

**Run report at 23:07 BST · last mark 16:09 BST**

---

## Done

- **Kris's HARNESS-PIN decision is carried out through the release and the CI watch.** In the [decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md), Kris worded it on 15 October as: "Authorise the Harness archive download and a fix(bootstrap) pin commit at Harness main as it stands once threads-records has landed, with its gates, then cut v0.10.5, bump ki-principal's .github/ki-version and watch CI to the audit step."
- **The Harness is pinned at `0df81f40`, which was `origin/main` at fetch time.** The codeload archive was downloaded twice, and both copies gave the digest `ca8c7e09…52d9fc2`.
  - The pin commit `18867d8`, fix(bootstrap), updates `src/core/storage/registry.ts`, the bootstrap test's digest and the changelog's pin line.
  - The threads-records run landed only its tools-ki half. Its three Harness drafts are not applied (its THREADS-APPLY query), so this pin does not carry them. That follows the brief's "as it stands now".
- **Every gate passed on the pin:**
  - both frozen installs;
  - `bun run test:coverage`: 1189 tests at the 100% thresholds;
  - `bunx tsc --noEmit`, `bunx biome check .` (warnings and infos only), `bunx knip` and `mandoc -T lint man/ki.1` are clean;
  - `ki repo audit --repo .` shows FAIL=0, with the same two unrelated warnings as before, `CI-1` and `HOOK-1`.
- **v0.10.5 is released.** It carries [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) and [KI-TOOL-KI-CLI-132 (pruned)](https://github.com/knowledgeislands/tools-ki/blob/9fe5811469cda1464e9ed43585374bbc8a14f0d8/docs/roadmap/KI-TOOL-KI-CLI-132-launcher-only-thread-writer.md).
  - The commit `ac7d98d`, chore(release), sets the version; the tests pass and `--version` prints 0.10.5.
  - tools-ki was pushed fast-forward (`19b4cc0..ac7d98d`), then tag `v0.10.5` was pushed.
  - Release run [38814212599](https://github.com/knowledgeislands/tools-ki/actions/runs/38814212599) passed every job. These include signing, publication, the asset re-verification, the clean Linux install proof and the Homebrew tap dispatch.
- **ki-principal's pin is bumped.** The commit `1ab7d36`, chore(ci): pin ki v0.10.5, changes only `.github/ki-version`. It was pushed fast-forward (`a478ecb..1ab7d36`).
- **ki-principal CI got to the audit step, and the audit failed.** In run [38814652019](https://github.com/knowledgeislands/ki-principal/actions/runs/38814652019), "Install released KI" (bootstrap, registry add, repair) **passed**. "Run ki repo audit --repo ." then failed with FAIL=143 and WARN=21 across five skills. This is the first time the whole-tree audit has run in CI.
  - For [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md), Verify 4's condition is met. The failures are audit findings, not a repair or store error. The known STREAM-9 failure did not appear. The record stays at `awaiting-review` for acceptance.
- **New findings in the CI audit:**
  - **`ki-pmo` PMO-7, 128 failures.** The pin carries the change that raised this criterion to failure level.
    - 65 are "missing": absolute `/Users/krisbrown/...` record links that cannot exist on a runner, so they can never pass in CI.
    - 63 are "unlinked": bare record identifiers in older thread reports.
  - **`ki-checkpoint`, 10 failures:**
    - LIFECYCLE-1, 8: "state must be active at the checkpoint location". These are in `_state-of-play`, `knowledge-islands-model.command-centre`, `knowledge-islands-model.observatory`, `platform-foundations.baseline-rollout`, `platform-foundations.estate-factorisation`, `registry-removal`, `rig.chezmoi` and `techne.agent-host`.
    - RECORD-2, 2: the heading sequence in `_state-of-play` and `knowledge-islands-model.knowledge-acquisition`.
  - **`ki-decision-records` BODY-11, 3 failures:** [ADR-KI-PRINCIPAL-007](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/ADR-KI-PRINCIPAL-007-territory-seats-on-hosts.md) links to `[[Known Lands]]` and `[[Known World]]`.
  - **`ki-repo-kb` NOTE-1a, 1 failure:** malformed frontmatter fences in several thread reports, including `state-of-play/hold-branches`, `state-of-play/reinstate` and four `mac-studio-setup` reports.
  - **`ki-authoring` MD-mech, 1 failure:** rumdl line-length, list-spacing and first-heading findings in thread reports.
- **[KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md) stays at `triage`, untouched.** No checkpoint, `Admin`, `Pillars` or `Resources` file was touched.

## In Progress

Nothing is running in this run. No follow-up release was started.

Outstanding - no action requested now:

- **Agent work:** acceptance of [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) can now cite run 38814652019 as the evidence for Verify 4.
- **Retained material:** this report is uncommitted in the thread folder, for the thread to commit. Other sessions' uncommitted reports sit beside it and were left alone: `messenger`, `streams-index`, `thread-model-review`, `thread-names` and `threads-records` in `ways-of-working`, and the `+/_THREADS/desk-kit/` folder.

## Queries

### PMO-CI - PMO-7 cannot pass on a CI runner

**Context:** The ki-pmo standard makes every record link in a thread report an absolute local path. PMO-7, now at failure level, checks that each target file exists. On a GitHub runner none of these paths exist, so 65 of the 128 PMO-7 failures can never clear in ki-principal CI, however the reports are fixed. Fixing this is a Harness change, and any fix reaches CI only after another pin and release.

**Query:** How should PMO-7 treat absolute local paths when the audit runs where those paths cannot exist?

**Options:**

a) (recommended) capture a ki-agentic-harness triage record to make PMO-7 check only link shape for absolute paths outside the audited checkout, and keep the existence check where the path is inside it

b) lower PMO-7 back to warning level in the Harness until the design is settled

c) leave PMO-7 as it is and accept a failing ki-principal CI audit for now

### CI-FINDINGS - clear ki-principal's remaining audit findings

**Context:** Apart from the PMO-7 "missing" links, the CI audit has fixable content findings:

- 63 PMO-7 "unlinked" identifiers in older thread reports;
- NOTE-1a frontmatter fences in thread reports;
- MD-mech rumdl findings;
- 3 BODY-11 links in [ADR-KI-PRINCIPAL-007](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/ADR-KI-PRINCIPAL-007-territory-seats-on-hosts.md).

The 10 `ki-checkpoint` findings are in checkpoints, which runs may not edit without the owner.

**Query:** Should a run conform these findings in ki-principal?

**Options:**

a) (recommended) dispatch one ki-principal run to fix the PMO-7 unlinked identifiers, NOTE-1a, MD-mech and BODY-11 findings by explicit path, run `ki repo audit --repo .`, commit and push fast-forward, and report the checkpoint findings for Kris to decide separately

b) include the 10 checkpoint findings in the same run

c) leave the findings for the next state-of-play mark

```text
PMO-CI

capture a ki-agentic-harness triage record to make PMO-7 check only link shape for absolute paths outside the audited checkout, and keep the existence check where the path is inside it

CI-FINDINGS

dispatch one ki-principal run to fix the PMO-7 unlinked identifiers, NOTE-1a, MD-mech and BODY-11 findings by explicit path, run ki repo audit --repo ., commit and push fast-forward, and report the checkpoint findings for Kris to decide separately
```

```text
╭─ run report · 2026-10-15T22:07:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █  █ █▀▀▀ █  █   · thread busy             │
│  █▀▀▄ █  █ ▀▀▀█  ▀█▀   · running or queued work  │
│  █▄▄▀ █▄▄█ ▄▄▄█   █    · lines below say which   │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [waiting] PMO-CI, CI-FINDINGS
- [waiting] THREADS-APPLY (threads-records)
- [uncommitted] cli-pin.report.md in the thread folder
