<!-- markdownlint-disable-file MD041 -->
---

---

---

# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › bug-census

**Run report at 15:00 BST · last mark 16:14 BST**

---

## Done

A read-only census of the five tools repositories and the 17 October intake, giving [Fnd: tools-burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/platform-foundations.tools-burndown.md) a starting list for the [tools burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md) Project under [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md). No code, record, checkpoint or working tree was changed, and nothing was done in `tools-ki` beyond reading Git refs.

### 1. Repository health

| Repository | Branch state | Tree | Tests | Lint and types |
| --- | --- | --- | --- | --- |
| tools-ki | Mid-rebase of `main` onto `origin/main` (`e9770dc6`), stopped at step 3 of 31 since 01:16 BST today. Local `main` is 31 ahead and 9 behind | Conflict in `KI-TOOL-KI-CLI-139`; seven other records staged | Not run: mid-rebase | Not run: mid-rebase |
| tools-mgit | `main` 4 ahead and 2 behind `origin/main`, diverged | Clean | `bats tests/`: 98 of 98 pass | `shellcheck`: clean |
| tools-git-almanac | Level with `origin/main` | Clean | `vitest`: 64 of 64 pass (12 s) | `tsc --noEmit`: clean. No lint script declared; Biome not run |
| tools-rig | Level with `origin/main` | Clean | Partial: 130 of 550 Bats tests passed, none failed; stopped at the two-minute limit | `shellcheck`: clean |
| tools-techne | Level with `origin/main` | Clean | `vitest`: all pass (4 s) | `self:typecheck`: clean |

No suite produced a failing test. Every tree I tested was still clean afterwards.

### 2. Bugs, ranked by impact on daily work

1. **tools-ki rebase stalled for 14 hours.** No record. The replay that PUSH-REBASE-CODE covers stopped at step 3 of 31 on a conflict in [KI-TOOL-KI-CLI-139](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-139-ebu-sources-sync.md). The tools-burndown checkpoint says the installed `ki` runs from the working tree. If that is right (I inferred it and did not test it), the live `ki` has none of the 28 commits not yet replayed, including the delivered fixes below. Every other tools-ki unit waits on this one.
2. **tools-mgit has two different `KI-TOOL-MGIT-CLI-017` records.** No record covers the clash. Local `main` holds the delivered [KI-TOOL-MGIT-CLI-017](/Users/krisbrown/workspaces/knowledge-islands/tools-mgit/docs/roadmap/KI-TOOL-MGIT-CLI-017-unified-external-members.md) "Unified external members" (awaiting review, 4 unpushed commits, 17 hours old). `origin/main` holds a second CLI-017, "Unify repository members" (`KI-TOOL-MGIT-CLI-017-unify-repository-members.md`, triage), captured on another host 4 hours ago for the same request. The two cannot both stand, and the branch cannot be pushed or released until they are reconciled. MGIT-017-CLASH below.
3. **[KI-TOOL-KI-CLI-135](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-135-reused-agent-name-overwrites.md) Reused agent name overwrites.** Awaiting review on local `main`, so it is not live until bug 1 is resolved. A run packet and report can be lost without warning.
4. **[KI-TOOL-KI-CLI-133](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md) Retired reports come back.** Awaiting review on local `main` and not live. It undoes every thread's tidy.
5. **`KI-TOOL-KI-CLI-144` Older runs start seen.** Triage, on local `main` only (`docs/roadmap/KI-TOOL-KI-CLI-144-older-runs-start-seen.md`, not in the mid-rebase tree). Coordinators get replayed `needs-owner` queries that were already answered, and false `failed: no report` events.
6. **[KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md) Launch footer follows brief.** Planned draft. This run's own prompt shows the bug: the appended footer grants a push the brief limits, and it carries a stray "``## Rules` onwards`" fragment.
7. **[KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) Unavailable store breaks repair.** Awaiting review. ki-principal's CI goes red without it. Its follow-ons are [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md) Host-absent store state (draft, blocked by -126) and [KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md) Errors suggest fixes (draft).
8. **[KI-TOOL-KI-CLI-142](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-142-preserve-harness-release-settings.md) Preserve harness release settings.** Triage, on `origin/main`. A configuration rewrite silently drops harness release locations, digests and authentication settings. Paired with [KI-TOOL-KI-CLI-143](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-143-separate-local-harness-paths.md) Separate local harness paths (triage).
9. **[KI-TOOL-KI-CLI-138](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-138-warn-unknown-record-fields.md) Warn unknown record fields.** Awaiting review on local `main`.
10. **[KI-TOOL-KI-CLI-128](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-128-granola-retention-safeguards.md) Granola retention safeguards.** Next, draft, corrective. A reset can destroy retained evidence.
11. **tools-rig correctives**, outside tools burndown until RIG-OWNER is answered:
    - [KI-TOOL-RIG-CORE-058](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-058-apply-lock-handler-history.md) Apply lock, handler history (triage). A scheduled upgrade can race `apply`.
    - [KI-TOOL-RIG-CORE-055](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-055-interpreter-port-owner-matching.md) Interpreter port owner matching (triage). `rig doctor` reports false port conflicts.
    - [KI-TOOL-RIG-CORE-052](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-052-doctor-service-launch-prerequisites.md) Doctor service launch prerequisites (triage).
    - [KI-TOOL-RIG-CORE-054](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-054-command-line-tools-check.md) Command Line Tools check (triage).
    - [KI-TOOL-RIG-DIST-011](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-DIST-011-stale-terra-rig-link.md) Stale vega rig link (hold).

No failing tests were found. tools-git-almanac and tools-techne have no open bug records.

### 3. Feature bounty, by repository and ranked (no design)

**tools-mgit**

1. MGIT-OUTPUT, no record: a progress bar, changed-only results, and a sync that aborts on a rebase or merge warning, with code behind it as Git Almanac has.
2. MGIT-ESCAPE, no record: `--bare` and `--raw`, kept clear of the physical and follow-symlinks options and of `-B`.
3. [KI-TOOL-MGIT-CLI-017](/Users/krisbrown/workspaces/knowledge-islands/tools-mgit/docs/roadmap/KI-TOOL-MGIT-CLI-017-unified-external-members.md) Unified external members: awaiting review (MGIT-ACCEPT), then the mgit release.

**tools-ki**

1. [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) Agent thread coordination commands and [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) Agent run events: both awaiting review on local `main`.
2. [KI-TOOL-KI-CLI-130](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-130-skill-generated-surfaces.md) Generated skill surfaces and [KI-TOOL-KI-CLI-141](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-141-granola-screenshots-markers.md) Granola screenshots and markers: both awaiting review.
3. [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md) Agent run temporary home: draft, waiting on TMP-HOME. Pairs with [KI-HARNESS-GOV-196](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-196-scratch-output-in-temp.md).
4. `KI-TOOL-KI-CLI-145` Thread session bindings: triage, on local `main` only.
5. [KI-TOOL-KI-CLI-140](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-140-git-hygiene-estate-audit.md) Git hygiene estate audit: draft, waiting on the `ki-git` rubric and [KI-HARNESS-GOV-203](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-203-git-clean-down-criteria.md). Related to GIT-SURFACE.
6. [KI-TOOL-KI-CLI-139](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-139-ebu-sources-sync.md) EBU sources sync: draft, owned by knowledge acquisition.
7. [KI-TOOL-KI-CLI-125](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md) KI release contract: on hold, outside burn-to-zero.

**tools-git-almanac**

- No open records. GIT-SURFACE is an Engineering Practice document in ki-principal, not tools work.

**tools-rig** (outside scope until RIG-OWNER)

1. [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) Tailnet-only listener firewall: awaiting review. Connection-critical.
2. [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md) Profile-filtered Dock items: ready.
3. [KI-TOOL-RIG-CORE-057](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-057-github-desktop-repository-list.md) GitHub Desktop repository list: triage.
4. [KI-TOOL-RIG-CORE-053](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-053-macos-menu-bar-declarations.md) macOS menu bar declarations: triage.
5. RIG-CATALOGUE: intake, no record.
6. On hold or future: [KI-TOOL-RIG-CORE-056](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-056-menu-bar-order-persistence.md), [KI-TOOL-RIG-CLI-026](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CLI-026-per-tool-development-mode-switch.md) and [KI-TOOL-RIG-CORE-048](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-048-signed-release-install-kind.md).

**tools-techne** (excluded, and under the Techne Programme Hold)

- [KI-TOOL-TECHNE-CLI-009](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-009-tailscale-oauth-binding-field.md) Tailscale OAuth binding field: next, draft.
- [KI-TOOL-TECHNE-CLI-006](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-006-guarded-host-commands.md) Guarded host commands: on hold.

**ki-agentic-harness**, where a record pairs with a tool

- [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) Delegation run events: pairs with -123.
- [KI-HARNESS-GOV-196](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-196-scratch-output-in-temp.md) Scratch output in temp: pairs with -137.

### 4. Suggested first wave

1. **tools-ki: finish the replay and push.** Resolve the stalled rebase under PUSH-REBASE-CODE, run `bun run test`, then push fast-forward only. Fold in the ECO-PRUNE-CHECKS rewrite of the two "Decision 55" citations in -139, which is the file in conflict. This gates every other tools-ki unit.
2. **tools-mgit: reconcile CLI-017 and review it.** Settle the duplicate CLI-017 under MGIT-017-CLASH, rebase onto `origin/main`, rerun `bats` and `shellcheck`, then run the independent review for MGIT-ACCEPT. This runs in parallel with unit 1.
3. **tools-mgit, chained after unit 2: capture MGIT-OUTPUT and MGIT-ESCAPE.** Capture them as records and plan them to Ready. The Git Almanac code-behind question stays the thread's design call.
4. **tools-ki, chained after unit 1: agent coordination correctness.** Plan and deliver `KI-TOOL-KI-CLI-144` and [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md). These are the two bugs that hit coordinating threads every day.
5. **Kris, in parallel: acceptance session.** Accept the tools-ki awaiting-review records (-123, -126, -127, -130, -133, -135, -138, -141) once unit 1 has pushed them, and accept KI-TOOL-MGIT-CLI-017 after unit 2.

## In Progress

Nothing is running. The Rig suite was stopped at its time limit. No processes are left over, and every tree tested was clean afterwards.

Outstanding - no action requested now:

- PUSH-REBASE-CODE, MGIT-ACCEPT, TMP-HOME and the other queries already open in the tools-burndown checkpoint stand as they were.
- RIG-OWNER, open in state of play, decides whether the tools-rig rows ever join a burndown.
- A full Rig test run takes well over two minutes (550 Bats tests). Whoever owns tools-rig should run it detached.

## Queries

### REBASE-OWNER - who finishes the stalled tools-ki rebase

**Context:** The tools-ki replay onto `origin/main` has stood at step 3 of 31 since 01:16 BST, 14 hours ago, on a conflict in KI-TOOL-KI-CLI-139. My brief says another session holds it, but nothing has moved since early morning. Until it finishes, nothing in tools-ki can be committed, tested or pushed, and the live `ki` probably lacks the delivered fixes.

**Query:** Should the tools burndown thread take over the rebase as its first unit?

**Options:** a) (recommended) The tools burndown thread's first unit confirms no live session holds tools-ki, then finishes the rebase under PUSH-REBASE-CODE, folding in the ECO-PRUNE-CHECKS citation rewrite. It runs the test suite and pushes fast-forward only. b) Kris names the session that owns the rebase and it finishes the replay; tools burndown starts with tools-mgit only.

### MGIT-017-CLASH - two different KI-TOOL-MGIT-CLI-017 records

**Context:** tools-mgit's local `main` has the delivered KI-TOOL-MGIT-CLI-017 "Unified external members", awaiting review in 4 unpushed commits. `origin/main` has a different CLI-017, "Unify repository members", a triage capture of the same request pushed from another host 4 hours ago. Both claimed number 017 in the issue ledger.

**Query:** How should the two records be reconciled?

**Options:** a) (recommended) Treat the `origin/main` capture as a duplicate of the delivered record. Rebase local `main` onto `origin/main`, keep the delivered record as KI-TOOL-MGIT-CLI-017, and remove the triage capture in that rebase, citing this decision. Then push fast-forward only. b) Keep both: renumber the `origin/main` capture to KI-TOOL-MGIT-CLI-018 and advance the ledger, so the two can be compared before one is cancelled.

```text
REBASE-OWNER

The tools burndown thread's first unit confirms no live session holds tools-ki, then finishes the stalled rebase of main onto origin/main under PUSH-REBASE-CODE, folding in the ECO-PRUNE-CHECKS rewrite of the two "Decision 55" citations in KI-TOOL-KI-CLI-139. It runs bun run test and pushes fast-forward only.

---

MGIT-017-CLASH

Treat the origin/main triage capture KI-TOOL-MGIT-CLI-017-unify-repository-members.md as a duplicate of the delivered KI-TOOL-MGIT-CLI-017 Unified external members. Rebase tools-mgit main onto origin/main, keep the delivered record as KI-TOOL-MGIT-CLI-017, remove the triage capture in that rebase citing this decision, rerun bats and shellcheck, and push fast-forward only.
```

```text
╭─ run report · 2026-10-17T14:00:05Z ──────────────╮
│                                                  │
│  █▀▀▄ █  █ █▀▀▀ █  █   · thread busy             │
│  █▀▀▄ █  █ ▀▀▀█  ▀█▀   · running or queued work  │
│  █▄▄▀ █▄▄█ ▄▄▄█   █    · lines below say which   │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [waiting] REBASE-OWNER
- [waiting] MGIT-017-CLASH
- [committed] bug-census report, local only
