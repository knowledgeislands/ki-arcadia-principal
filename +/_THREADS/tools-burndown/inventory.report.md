---

---

---

# [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md) › [Tools burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md) › inventory

**Run report at 01:32 BST · last mark none**

---

## Done

- Read-only stock-take of the four repositories, written from local refs. **Limitation:** I did not fetch. The brief said "Fetch each", but its Rules forbid any Git fetch, and the Rules win. The remote-tracking refs come from the thread's own fetch at 00:58-00:59 BST today (`FETCH_HEAD`), so the picture is about 30 minutes old. Nothing was changed in any repository. No commits.

| Repository | Branch | Ahead / behind `origin/main` | Dirty | Latest tag; unreleased on `origin/main` |
| --- | --- | --- | --- | --- |
| `tools-ki` | `main` | 0 / 0 (it was behind 2 at 01:05; the `git-hygiene` run has since pulled) | clean | `v0.10.5` at `ac7d98d8`; 2 docs-only roadmap commits (KI-TOOL-KI-CLI-139 capture) |
| `tools-mgit` | `main` | 0 / 0 at `9a30de5` | clean | `v0.17.0` at HEAD; **nothing unreleased** |
| `tools-git-almanac` | `main` | 0 / 0 at `00cc916` | clean | `v0.2.0`; 19 chore, CI and docs commits, none user-facing |
| `ki-agentic-harness` | `main` | **ahead 4** (`b4875ac1`, with `origin/main` at `45bbaea6`), behind 0 | clean | another session's unpushed `ki-pmo` and roadmap commits, not this run's |

The repositories have no stashes, no extra worktrees and no local branches beyond `main`. Remote branches `origin/fix/granola-retention-20261014` and `origin/paperclip/aligned-20260926/KIS-46-…` exist on `tools-ki`; they belong to the `git-hygiene` run.

- **Open records in scope (14, all in `tools-ki`)**, read at `origin/main` `6e9b32aa`:

| Record | Status / horizon | Project (owning thread) | Dependencies | State |
| --- | --- | --- | --- | --- |
| [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) Unavailable store breaks repair | awaiting-review / now | ways-of-working | blocks KI-TOOL-KI-CLI-131 | **Needs Kris (acceptance).** Released in `v0.10.5`; ki-principal pin is already `v0.10.5`, so the outstanding Verify 4 can run now |
| [KI-TOOL-KI-CLI-130](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-130-skill-generated-surfaces.md) Generated skill surfaces | in-progress / now | ways-of-working | harness generator (present: `ki-pmo/scripts/generate/index.ts`) | All Steps ticked but no review packet. Resume `ki-implement` to finish Verify and reach Awaiting review |
| [KI-TOOL-KI-CLI-133](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md) Retired reports come back | ready / now | none | none | **Ready.** Waiting for the owner's go-ahead to deliver |
| [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) Agent run events | draft / next | ways-of-working | KI-HARNESS-GOV-175 follows it (sequencing only) | Needs `ki-plan` |
| [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) Agent thread coordination commands | draft / next | ways-of-working | follows accepted KI-TOOL-KI-CLI-124; item 5 (link printer) first | Needs `ki-plan` |
| [KI-TOOL-KI-CLI-128](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-128-granola-retention-safeguards.md) Granola retention safeguards | draft / next | knowledge-acquisition | harness Granola acquisition wording; needs an isolated delivery checkout, because the installed `ki` runs the primary checkout | Needs `ki-plan`; owner review gate |
| [KI-TOOL-KI-CLI-125](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md) KI release contract | draft / hold | agent-host | waiting for an ARM host or the vega rebuild; review 2026-11-16 | **Held** |
| [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md) Host-absent store state | triage | none | blocked by KI-TOOL-KI-CLI-126 | Needs adoption, then `ki-plan` |
| [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md) Launch footer follows brief | triage | none | a new tier needs a matching `ki-delegation` asset in the harness | Needs adoption, then `ki-plan` |
| [KI-TOOL-KI-CLI-135](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-135-reused-agent-name-overwrites.md) Reused agent name overwrites | triage | none | none | Needs adoption, then `ki-plan` |
| [KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md) Errors suggest fixes | triage | none | overlaps KI-TOOL-KI-CLI-131; builds on KI-TOOL-KI-CLI-126 | Needs adoption, then `ki-plan` (decide whether to fold the store part into KI-TOOL-KI-CLI-131) |
| [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md) Agent run temporary home | triage | none | pairs with KI-HARNESS-GOV-195 | Needs adoption, then `ki-plan` |
| [KI-TOOL-KI-CLI-138](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-138-warn-unknown-record-fields.md) Warn unknown record fields | triage | none | its field list must agree with the harness `ki-repo-kb-streams` checker | Needs adoption, then `ki-plan` |
| [KI-TOOL-KI-CLI-139](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-139-ebu-sources-sync.md) EBU sources sync | triage | none | [HNR-PRINCIPAL-5GE-005](/Users/krisbrown/workspaces/humans-not-robots/hnr-principal/Streams/Roadmap/HNR-PRINCIPAL-5GE-005-keep-ebu-sources-aligned.md) depends on it; needs a specification change first | Needs adoption, then `ki-plan`. Not yet in the local checkout's earlier read; now present after the pull |

`tools-mgit` and `tools-git-almanac` have no open records. The `git-hygiene` run is capturing one more `tools-ki` triage record under REPO-GIT-HYGIENE. It was not yet on `origin/main` when I read, so it is not listed.

- **`ki-agentic-harness`: no record is CLI-shaped.** None delivers in the `ki` CLI and none blocks it. The Project note is right to exclude all six. Four are coupled to `tools-ki` and should be sequenced alongside, but not burned down here:
  - [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) (draft / next) waits for KI-TOOL-KI-CLI-123.
  - [KI-HARNESS-GOV-195](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-195-thread-folder-closed-list.md) (triage) pairs with KI-TOOL-KI-CLI-137.
  - [KI-HARNESS-GOV-170](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-170-keep-resolution-targets-local.md) (draft / future) will later hand `tools-ki` a work-item model change in plain language.
  - [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) (triage) names queue export and import as `tools-ki` mechanics, with no `tools-ki` record yet.
  - The other two are unrelated: [KI-HARNESS-GOV-194](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-194-review-verification-effects.md) (in-progress, blocked on audit warnings) and [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md) (awaiting-review; its `tools-ki` part, `ki acquire`, is already delivered).

- **Proposed dispatch plan.** `tools-ki` is the only delivery repository, so it runs as one chained lane: one writer, because the installed `ki` runs the primary checkout's source. Planning agents touch only record files and can be batched between deliveries.
  1. **Close out work already delivered or ready.** Run Verify 4 on KI-TOOL-KI-CLI-126 and present it for Kris's `ki-accept`. Resume `ki-implement` on KI-TOOL-KI-CLI-130 to Awaiting review, then Kris accepts. Run `ki-implement` on KI-TOOL-KI-CLI-133 once Kris gives the go-ahead.
  2. **Adopt and plan the triage records in one batch.** Run `ki-next` with Kris on KI-TOOL-KI-CLI-131, KI-TOOL-KI-CLI-134 to KI-TOOL-KI-CLI-139 and the hygiene record. Then run one `ki-plan` agent per group:
     - store and errors: KI-TOOL-KI-CLI-131, then KI-TOOL-KI-CLI-136, deciding the fold;
     - agent launcher: KI-TOOL-KI-CLI-135, KI-TOOL-KI-CLI-137, KI-TOOL-KI-CLI-134;
     - record model: KI-TOOL-KI-CLI-138;
     - drafts: KI-TOOL-KI-CLI-123, KI-TOOL-KI-CLI-127.
  3. **Deliver in dependency order, one `ki-implement` at a time.** Each record needs `ki-plan` before `ki-implement`.
     - store chain: KI-TOOL-KI-CLI-131, then KI-TOOL-KI-CLI-136, after KI-TOOL-KI-CLI-126 is accepted;
     - agent chain, all in `src/core/agent/`: KI-TOOL-KI-CLI-135, KI-TOOL-KI-CLI-137, KI-TOOL-KI-CLI-134, KI-TOOL-KI-CLI-123, then KI-TOOL-KI-CLI-127 with its link printer first;
     - then KI-TOOL-KI-CLI-138.
  4. **Owner-gated tail.** KI-TOOL-KI-CLI-128 and KI-TOOL-KI-CLI-139 go through knowledge-acquisition. KI-TOOL-KI-CLI-139 needs a specification change and its HNR consumer, and KI-TOOL-KI-CLI-128 needs an isolated checkout. KI-TOOL-KI-CLI-125 stays on Hold.
  5. **Cross-repository handoffs.**
     - Once KI-TOOL-KI-CLI-123 is planned, the harness ways-of-working thread can plan KI-HARNESS-GOV-175.
     - KI-HARNESS-GOV-195 should land with KI-TOOL-KI-CLI-137, since both name the same path.
     - KI-TOOL-KI-CLI-134's new tier waits on a `ki-delegation` asset.
     - The KI-TOOL-KI-CLI-138 field list must be agreed with the harness checker.
     - None of these is a hard `blocked_by`.
  6. **Release gate.** Cut `ki` only after Kris approves, once every deliverable `tools-ki` record is accepted. Then bump ki-principal `.github/ki-version` (and the CI pins elsewhere). `mgit` has nothing unreleased since `v0.17.0`; see MGIT-RELEASE.

## In Progress

Nothing is running in this run. The thread's `git-hygiene` run is still working in `tools-ki` (at 01:28 BST: capturing the one triage record).

Outstanding - no action requested now:

- **Carried forward from [Fnd: estate-factorisation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/platform-foundations.estate-factorisation.md), in scope:**
  - DEPS-HOLD is effectively resolved: commit `7eb3000` adopted the dev-tool updates and shipped in `v0.10.5`. The ways-of-working thread should confirm and close it.
  - STORE-REPAIR has moved from In progress to Awaiting review (see the STORE-REPAIR query).
  - KI-RELEASE continues as the release gate and RELEASE-CONTRACT below.
  - TRIAGE-OWNERS is now TRIAGE-ADOPT below, widened to KI-TOOL-KI-CLI-136 to KI-TOOL-KI-CLI-139.
- **Carried forward, out of scope, left with their owners:** HOST-GUARDS and HOST-WRITES (Techne), DOCK and RIG-REFS (Rig), ALIAS-OWNERS, RECEIVER-ROLLOUT, OBS-ACTIVATION, GOVERNANCE and PROJECT-CLOSE (Estate factorisation).
- `ki-agentic-harness` has four unpushed commits from another session on `main`. The Project note calls `b4875ac1` "as fetched", but it is a local-only HEAD. That is for the harness owner, not this thread.
- `tools-git-almanac` has 19 non-functional commits since `v0.2.0`. The Project defines no almanac release, and none is needed.
- **The Project note is stale against TOOLS-PROJECT and the current state.** Change these points (no edit made):
  - In Inventory, KI-TOOL-KI-CLI-126 is "awaiting-review", released in `v0.10.5` and pinned, with only Verify 4 and acceptance left.
  - Drop "two commits behind" for `tools-ki`; the checkout is now level.
  - Restate the harness revision as local `b4875ac1`, ahead 4 of `origin/main` `45bbaea6`.
  - Record that `tools-mgit` has no change since `v0.17.0`.
  - Add the hygiene triage record once it lands.
  - Note the four coupled harness records under Scope.
  - Say how KI-TOOL-KI-CLI-125 (Hold to 2026-11-16) squares with "every record closed, merged or rejected".

## Queries

### OWNER-LANE - who delivers ways-of-working's tools-ki records

**Context:** The ways-of-working Project owns KI-TOOL-KI-CLI-123, KI-TOOL-KI-CLI-126, KI-TOOL-KI-CLI-127 and KI-TOOL-KI-CLI-130, and its checkpoint also tracks KI-TOOL-KI-CLI-131. The Project note says this Project "burns them down with those threads rather than taking them over". Two writers in `tools-ki` would collide, because the installed `ki` runs the primary checkout.

**Query:** Should tools-burndown be the single `tools-ki` delivery lane for every in-scope record, with the owning threads keeping priority and acceptance input?

**Options:**
a) (recommended) Yes. tools-burndown runs the only `tools-ki` writer for all in-scope records. The ways-of-working and knowledge-acquisition threads are told through Messages from Master and keep priority and acceptance input.
b) No. tools-burndown delivers only unassigned records and waits on ways-of-working for its four.

### STORE-REPAIR - finish and accept KI-TOOL-KI-CLI-126

**Context:** [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) is Awaiting review, and Verify 1 to 3 have passed. Verify 4 needed a release and the ki-principal pin bump. Both are done: `v0.10.5` contains `726243d`, and `.github/ki-version` reads `v0.10.5`. The record blocks KI-TOOL-KI-CLI-131.

**Query:** May the thread run Verify 4 and then bring the record to you for `ki-accept`?

**Options:**
a) (recommended) Dispatch one agent to run Verify 4 against ki-principal's pinned `v0.10.5` and add the evidence to the record. Then Kris accepts through `ki-accept`.
b) Leave it to the ways-of-working thread.

### RETIRED-REPORTS - deliver KI-TOOL-KI-CLI-133

**Context:** [KI-TOOL-KI-CLI-133](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md) is Ready / Now with a chosen rule: Git-known paths are never re-adopted. It has three Steps and no dependencies. It was planned on 15 October "for the owner's go-ahead to deliver", and it has no Project.

**Query:** Do you give the go-ahead to deliver KI-TOOL-KI-CLI-133 under tools-burndown?

**Options:**
a) (recommended) Assign it to tools-burndown and dispatch `ki-implement` to Awaiting review, first in the `tools-ki` lane.
b) Hold it for the Techne agent-host thread that asked for it.

### TRIAGE-ADOPT - adopt the seven tools-ki triage records

**Context:** These seven records are triage with no Project:
- [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md)
- [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md)
- [KI-TOOL-KI-CLI-135](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-135-reused-agent-name-overwrites.md)
- [KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md)
- [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md)
- [KI-TOOL-KI-CLI-138](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-138-warn-unknown-record-fields.md)
- [KI-TOOL-KI-CLI-139](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-139-ebu-sources-sync.md)

Burning down to zero means each must be adopted, merged or rejected. Six are CLI corrections or small launcher capabilities. KI-TOOL-KI-CLI-139 is an acquisition capability that an HNR record depends on.

**Query:** How should the seven triage records be dispositioned?

**Options:**
a) (recommended) Adopt KI-TOOL-KI-CLI-131, KI-TOOL-KI-CLI-134, KI-TOOL-KI-CLI-135, KI-TOOL-KI-CLI-136, KI-TOOL-KI-CLI-137 and KI-TOOL-KI-CLI-138 as deliver / Next under tools-burndown through `ki-next`, letting `ki-plan` decide whether KI-TOOL-KI-CLI-136's store part folds into KI-TOOL-KI-CLI-131. Adopt KI-TOOL-KI-CLI-139 as deliver / Next under knowledge-acquisition.
b) Adopt only the corrective records (KI-TOOL-KI-CLI-131, KI-TOOL-KI-CLI-135, KI-TOOL-KI-CLI-136, KI-TOOL-KI-CLI-138), and reject or defer the capabilities.

### RELEASE-CONTRACT - KI-TOOL-KI-CLI-125 against the Project end

**Context:** [KI-TOOL-KI-CLI-125](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md) is on Hold until 2026-11-16 for an ARM host. `ki` already ships signed archives for the three platforms in use, so the `ki` release does not need this record. The Project outcome, though, says every record closed, merged or rejected.

**Query:** Does KI-TOOL-KI-CLI-125 stay outside the release gate?

**Options:**
a) (recommended) Keep it on Hold with the agent-host Project and exclude it from tools-burndown's burn-to-zero. The Project note says so, and the `ki` release proceeds without it.
b) Cancel it now and recapture it when an ARM host exists.

### MGIT-RELEASE - what "ending with the mgit release" means

**Context:** `tools-mgit` has no open records and no commit since `v0.17.0`. An mgit release would contain nothing unless REPO-GIT-HYGIENE work lands mgit changes.

**Query:** Is an mgit release still required to close the Project?

**Options:**
a) (recommended) Cut an mgit release only if mgit changes land during the Project, with your approval. Otherwise record `v0.17.0` as the Project's mgit release.
b) Always cut a fresh mgit release at the end.

```text
OWNER-LANE

tools-burndown runs the only tools-ki writer for all in-scope records; tell the ways-of-working and knowledge-acquisition threads through Messages from Master, and they keep priority and acceptance input.

---

STORE-REPAIR

Dispatch one agent to run Verify 4 of KI-TOOL-KI-CLI-126 (/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) against ki-principal's pinned v0.10.5 and add the evidence to the record; then bring it to me for ki-accept.

---

RETIRED-REPORTS

Assign KI-TOOL-KI-CLI-133 (/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md) to tools-burndown and dispatch ki-implement to Awaiting review, first in the tools-ki lane.

---

TRIAGE-ADOPT

Adopt KI-TOOL-KI-CLI-131, KI-TOOL-KI-CLI-134, KI-TOOL-KI-CLI-135, KI-TOOL-KI-CLI-136, KI-TOOL-KI-CLI-137 and KI-TOOL-KI-CLI-138 as deliver / Next under tools-burndown through ki-next, with ki-plan deciding whether KI-TOOL-KI-CLI-136's store part folds into KI-TOOL-KI-CLI-131; adopt KI-TOOL-KI-CLI-139 as deliver / Next under knowledge-acquisition.

---

RELEASE-CONTRACT

Keep KI-TOOL-KI-CLI-125 (/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md) on Hold with the agent-host Project and exclude it from tools-burndown's burn-to-zero; say so in the Project note; the ki release proceeds without it.

---

MGIT-RELEASE

Cut an mgit release only if mgit changes land during the Project, with my approval; otherwise record v0.17.0 as the Project's mgit release.
```

```text
╭─ run report · 2026-10-16T00:32:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █  █ █▀▀▀ █  █   · thread busy             │
│  █▀▀▄ █  █ ▀▀▀█  ▀█▀   · running or queued work  │
│  █▄▄▀ █▄▄█ ▄▄▄█   █    · lines below say which   │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [running] git-hygiene - REPO-GIT-HYGIENE in tools-ki, capturing its triage record
- [waiting] OWNER-LANE
- [waiting] STORE-REPAIR
- [waiting] RETIRED-REPORTS
- [waiting] TRIAGE-ADOPT
- [waiting] RELEASE-CONTRACT
- [waiting] MGIT-RELEASE
- [uncommitted] inventory.report.md, left for the thread to commit
- [held] KI-TOOL-KI-CLI-125 until 2026-11-16
