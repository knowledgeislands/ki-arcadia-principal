---
type: ki-checkpoint
thread: state-of-play
state: active
created_at: 2026-10-06T21:07:00Z
updated_at: 2026-10-07T07:25:00Z
---

# state-of-play

## Objective

Take stock of all in-flight work across the `kis` Agora (the 21 repositories in the `knowledgeislands` workspace folder) and the chezmoi source repository, not the wider estate, before any more is started. Too much is in flight to hold in one head, and changes are starting to undo earlier changes. The review must:

1. Inventory every open roadmap record, checkpoint, batch, authorisation, handoff and unprocessed capture.
2. Group the work into a small set of cross-repository themes, so overlap, duplication and reversal become visible.
3. Check each record is specified correctly against its canonical owner (specification, skill standard or Pillar), and identify remedial work where it is not.
4. Check that each checkpoint is being handled correctly: durable facts routed to owners, no roadmap or decision content held only in a checkpoint.
5. Produce one proposed disposition per item (keep, merge, close, respecify, re-sequence) for Kris to approve, then route approved changes through `ki-next`, `ki-plan` and `ki-accept` in each owning repository.

The scope also covers the seven acquired ChatGPT captures of 2026-10-03 in `+/_ACQUIRE/chatgpt/knowledge-islands/`, which describe the target Techné footprint; they are reviewed alongside the roadmap records, not adopted by this review.

This checkpoint is the single place the review is built up. Every review step and finding is recorded here until it has been routed to its owner. It coordinates the five sibling checkpoints in this directory rather than replacing them.

## Current state

Step 0 evidence is retained below. The current queue was re-counted read-only on 2026-10-07 at 02:37 CEST; current Git and source evidence was reconciled with parallel owner work. Detailed review reports and the exact source manifest are in `~/.local/state/ki/state-of-play/`.

Open roadmap records by repository and status, re-counted with `ki repo roadmap list` on 2026-10-07 at 02:37 CEST (75 open; Done records excluded):

| Repository | Draft | Ready | In progress | Awaiting review | Total |
| --- | --- | --- | --- | --- | --- |
| `ki-agentic-harness` | 16 | 18 | 2 | 0 | 36 |
| `ki-arcadia-principal` | 6 | 12 | 0 | 0 | 18 |
| chezmoi | 10 | 0 | 0 | 0 | 10 |
| `ki-specifications` | 3 | 0 | 0 | 0 | 3 |
| `ki-website` | 2 | 0 | 0 | 0 | 2 |
| `homebrew-tap` | 2 | 0 | 0 | 0 | 2 |
| `tools-ki` | 4 | 0 | 0 | 0 | 4 |
| `ki-techne-harness` | 0 | 0 | 0 | 0 | 0 |
| 14 other `kis` repositories | 0 | 0 | 0 | 0 | 0 |
| **Total** | **43** | **30** | **2** | **0** | **75** |

The 36 open Now records are unchanged: harness 23 (18 Ready, 3 Draft, 2 In progress and paused), Arcadia 13 (12 Ready, 1 Draft). Four Done records are retained: `KI-ARCADIA-GOV-020`, `DOTFILES-UE-068`, `TECHNE-TOOLS-OPS-008` and `TECHNE-TOOLS-OPS-009`. The separate-host choice has been reconciled by OPS-008's merged disposition into OPS-009. The 6 November prototype review is now captured in Arcadia `KI-ARCADIA-GOV-021` (Draft/Triage); it is not an untracked reminder or an adopted run. Nothing is Awaiting review at this inventory point. Neither accepted tooling nor an accepted local build proves the host is deployed or connected.

- **Clean sheet and acceptances.** The thirteen awaiting-review records of 2026-10-06 were accepted and pruned with `KI-HARNESS-FND-027`. On 2026-10-07 `DOTFILES-UE-066`, `DOTFILES-UE-067` and `TECHNE-TOOLS-FAB-001` were accepted on Kris's approval, and Kris pruned all three. The acceptance caveats (FAB-001's open egress rule before any apply; UE-066's unraised `apps-observatory` handoff) are in `accept.report.md`.
- **Roadmap clearance and dispositions.** chezmoi, `tools-ki`, `ki-website`, `homebrew-tap`, `ki-techne-harness` and `ki-specifications` are down to waiting, triage or next records. Approved dispositions are applied: `KI-HARNESS-GOV-141` and `KI-TOOL-CLI-108` adopted into `next`; `BREW-011` and `KI-ARCADIA-GOV-010` stay open with fold notes (into `GOV-141` and `estate-factorisation`), since neither merge could close them; `KI-HARNESS-GOV-140` mapped to `estate-factorisation`; `DOTFILES-UE-063` to `waiting-for`.
- **Git.** Before this checkpoint update, all 22 primary checkouts were clean; the harness and `tools-ki` had local commits ahead of their recorded upstreams. Other primary checkouts were level with their recorded upstreams. This review does not push. The `homebrew-tap` fold branch is merged and deleted. The git-audit lane is abandoned and its worktree and branches deleted, its work having already reached `main` through the reviewed `MCP-GIT-TOOL-003`. The leftovers cleanup removed every remaining stray worktree and branch except two kept on purpose: harness `KIS-70` (reference implementation for `KI-HARNESS-GOV-115`) and `tools-ki` `KIS-46` (code for `KI-TOOL-CLI-109`). Patches and untracked drafts from the removed branches are in `~/.local/state/ki/state-of-play/salvage/`. The pushes seen at about 00:35 and 01:07 CEST were Kris's own; that question is resolved.
- **GOV-020 accepted and enacted, 2026-10-07.** Kris accepted the prototype bounds: a second, new EC2 instance `ki-techne-agent-host` beside the untouched controller `ki-techne-ops-007-primary`; acceptance and the hold amendment before any remote action, including creating the host for connection testing; GitHub and model API credential identity deferred until before agents work on the host; a 30-day term lapsing on 2026-11-06 unless renewed; and GDR-KI-ARCADIA-004. The [[Techne Programme Hold]] now carries that one exemption, in force since Arcadia `a16314a`; GOV-020 is accepted and Done. The operator tooling UE-068 and local build OPS-009 are also accepted and Done; the live rollout still has its own access and named-egress gates. The chezmoi operator tooling and the `ki-techne-harness` host build are handoff items in those repositories.
- **Agent host live; exemption made standing, 2026-10-07.** The agent host `ki-techne-agent-host` is built, running and in use. Since the GOV-020 entry above: operator access became an account-local IAM role (`ki-techne-agent-host-operator`) and the chezmoi tooling `DOTFILES-UE-068` was corrected to assume it, with Zed agent-binary fixes for the host; Arcadia `KI-ARCADIA-GOV-022` filed the concept map and rollout diagrams (accepted, Done); harness `TECHNE-TOOLS-OPS-010` diagrammed the runbook (accepted, Done) and `TECHNE-TOOLS-OPS-011` (manage the agent-host footprint: rerunnable workspace setup, updates and status, with a hand-applied PATH fix recorded) is adopted and Ready in Now; `tools-techne` captured the `techne host` command group as `TECHNE-TOOL-CLI-004` (Triage). On Kris's instruction at 08:40 CEST, `KI-ARCADIA-GOV-023` widened the hold exemption to setting up and operating this one host properly and durably, removed the automatic lapse (it stands until Kris changes or withdraws it), retitled GDR-KI-ARCADIA-004 "Standing agent-host exemption from the Techne Programme Hold" in place, and made `KI-ARCADIA-GOV-021` a scheduled review on 2026-11-06. The widened exemption is in force from Arcadia `e25a7f9`; GOV-023 is Awaiting review.
- **New Triage captures, 2026-10-07.** Harness `KI-HARNESS-GOV-147` (make the branch durable) and `GOV-148` (let senders withdraw trades). From the leftovers: harness `KI-HARNESS-GOV-145` (disclose evaluated criteria count), `GOV-146` (gate acceptance on audits), `RTP-018` (audit inside sandboxed runs), `RTP-019` (fit sandbox socket paths); `tools-ki` `KI-TOOL-CLI-109` (bound rubric publication root); `homebrew-tap` `BREW-012` (document release app operations). From the delegation capture: harness `KI-HARNESS-GOV-144` (own portable background delegation).
- **GOV-144 gate.** `KI-HARNESS-GOV-144` carries a scope decision gate in its Discussion: `ki-delegation` currently excludes routine delegation, so only Kris can choose the owning skill (widen `ki-delegation`, a separate skill, or `ki-subagents` or another owner) before it is adopted, readied or started. Until then the chezmoi interim (`dot_claude/private_delegation.md` and `claude-bg`) carries the approach; it is applied.
- **Outside scope, knock-on only.** `5GE-P2-GOV-015` in `5g-emerge-phase2` is still open (`waiting-for`) and can close, since `KI-HARNESS-GOV-124` is accepted.
- **Themes are not usable as recorded.** The `theme` field carries 16 distinct values; in the harness most records share `governance-consistency`, so the field does not discriminate, and Arcadia uses a different vocabulary. There is no shared cross-repository taxonomy.
- **Checkpoints.** Five active siblings in Arcadia; none in any other `kis` repository or chezmoi. All brought up to date for step 0.
- **Other in-flight surfaces.** `ki-website` holds spent batch `KI-WEB-BATCH-001` and superseded handoff `CLI-006-qualified-repository-declarations`, both reported for removal. Arcadia `+/_ACQUIRE/` holds 8 unprocessed captures (7 ChatGPT, 1 Granola). `ki-techne-harness/+/paperclip-as-techne-prior-art.md` is an unpromoted working analysis. The two harness trades to `tools-ki`, `TRD-8004751b` and `TRD-d03495e9`, were never received; on 2026-10-07 they were withdrawn and deleted by hand under Kris's explicit one-off exception to the trade standard (harness `9cac0452`) and are replaced by `tools-ki` Triage records `KI-TOOL-CLI-110` and `KI-TOOL-CLI-111` (mapped in `estate-factorisation`). `CLI-111` now also requires a sender-side withdraw command (`tools-ki` `ecf8037`).

Acquired ChatGPT captures of 2026-10-03 (`+/_ACQUIRE/chatgpt/knowledge-islands/`), read in full, untouched and not adopted. These are seven focused authored files, not demonstrated complete-conversation acquisition or source-retirement evidence. The held full footprint conflicts below exclude the separately authorised GOV-020 supervised-host subset. Theme mappings are review buckets and confer no canonical ownership:

- `overview`: Human, Rig, Realm and Avatar model, and a first AWS milestone (EC2, K3s, Paperclip, Kitteth, Tailscale, Telegram). `baseline-and-cloud`. Its full-footprint proposal stays held outside the GOV-020 supervised-host subset; touches `TECHNE-TOOLS-OPS-008`, `TECHNE-TOOLS-FAB-001` and `KI-ARCADIA-GOV-020`.
- `conceptual-model`: Human, Rig, Realm and Avatar definitions, territories, Knowledge Landscapes and a Knowledge Realms registry. `territories-and-trades`. Touches `KI-ARCADIA-MOD-003` (geography model) and `KI-ARCADIA-MOD-004` (semantic conventions); vocabulary needs owner reconciliation against accepted architecture.
- `conceptual-lineage`: the real-world and fictional influences and a rule for recording future ones. Fits no thread (a finding); nearest is `KI-ARCADIA-MOD-003`. No conflict.
- `design-principles`: thirteen principles (tool-agnostic, FOSS-first, Kubernetes as contract, Realm separate from footprint, Paperclip replaceable, design for reconstruction). `baseline-and-cloud`. Touches [[Engineering Practice]] and the Hold's second prerequisite (what Paperclip supplies); candidate substrate and principles need owner reconciliation.
- `avatar-agency-and-access`: Kitteth as Avatar, Operator and Architect authority outside Paperclip, connection modes and auditable delegation. `paperclip-bootstrap-and-recovery`. Conflicts with the Hold (remote privileged management); touches `KI-HARNESS-GOV-144` (delegation).
- `techne-and-first-footprint`: one EC2 instance with K3s, Paperclip and Kitteth as workloads, and acceptance criteria centred on work surviving the Rig disconnecting. `baseline-and-cloud`. Conflicts with the Hold; overlaps `TECHNE-TOOLS-OPS-008` (host choice) and `TECHNE-TOOLS-FAB-001` (open TCP 443 egress); `KI-ARCADIA-GOV-020` takes only a bounded subset.
- `open-questions-and-actions`: immediate build actions, a reconstructability inventory, access-model and infrastructure questions, and explicit non-blockers. `baseline-and-cloud`. Its immediate actions conflict with the Hold; overlaps the uncaptured "Techné cloud readiness" record proposed in `baseline-and-cloud` and `TECHNE-TOOLS-OPS-008`.

Still pending from the roadmap-delivery hand-over of 2026-10-06, approved and waiting for Kris's go:

1. Ledger tidy-up: audit each Agora and, where ROAD-7 reports a superseded ledger form, conform `_ISSUES.md` only. chezmoi still warns; `homebrew-tap` and `ki-website` need auto-merge pull requests.
2. Slim-down 1: move communication levels, report shape and the timestamped-update rule into a portable skill through a harness record (related to `GOV-144`).
3. Slim-downs 2 and 3: reduce `dot_codex/private_AGENTS.md` to user-level content (depends on `RTP-013`), and remove duplicated progress-update text from repository `AGENTS.md` files.

Also from that hand-over: the updated Conformance scheduled task needs a Cowork or Desktop session ([[Scheduled Task Audit]]); `TMX-CO-006` ICO fee is due 16 October; Linear, Strava, TickTick and Xero need re-authorising and Telegram failed to connect; possible stray bootstrap files in `~/.claude` or `~/.agents`.

Checkpoint conformance, reported by each owning thread on 2026-10-06. All pass `ki repo audit --skill ki-checkpoint` mechanically; three fail on judgement, and no mechanical check catches those failures:

| Checkpoint | Judgement failures | Owning thread's proposed fix (not done) |
| --- | --- | --- |
| `territories-and-trades` | Long; proposal and related work held only here | Route proposal and work; shorten snapshot |
| `estate-factorisation` | 13 untracked items make it a work tracker | Capture through `ki-next` with each owner |
| `paperclip-bootstrap-and-recovery` | Long; constraints and 11 actions held only here | Route constraints and actions |
| `baseline-and-cloud` | None outstanding | - |
| `delta-evaluation` | None; Kris judges it the reference shape | - |

The territory thread's schema proposal and related items need a draft Arcadia work record before its roughly 900-word snapshot is cut. The Paperclip thread's standing constraints need the harness coordination skill or an Arcadia Decision Record; its actions need owner work records before the roughly 1,200-word snapshot gets one resumable next action. These remain proposed fixes, not enacted changes.

Gaps in the checkpoint standard and audit, raised by those threads: the audit does not warn on length, list-heavy "Next step" sections, decisions held only in the checkpoint, untracked work, or an `updated_at` later than its commit; and the standard has no position on a checkpoint used as the "single place to look" for a thread, which conflicts with the rule that checkpoints only point to owners.

**Steps 1 and 2 complete; targeted owner-contract findings.** All 36 open Now records, Done GOV-020 and all seven capture bodies were read in full. The reports are `overnight-harness-review.report.md`, `overnight-arcadia-review.report.md` and `overnight-capture-review.report.md`; `overnight-read-manifest.json` fixes the 37 roadmap source hashes, and the capture report fixes all seven file hashes. No reviewed open record has a completed delivery packet warranting acceptance or prune. Structural audits do not establish truthful readiness. The broader specification review remains step 6.

The following are proposed dispositions, not lifecycle or horizon changes. B = `baseline-and-cloud`; E = `estate-factorisation`; P = `paperclip-bootstrap-and-recovery`; T = `territories-and-trades`; X = no clean fit. A loose mapping to E or T needs an owner decision about theme scope. X does not create a sixth checkpoint.

| Owner record | Theme | Proposed disposition |
| --- | --- | --- |
| Harness FND-026 | B | Keep; bounded conform-activation delivery |
| Harness GOV-087 | E | Keep gated on local build feasibility and an authenticated evaluation slot |
| Harness GOV-091 | E | Respecify occupied GUIDE-5 code |
| Harness GOV-094 | E | Keep; clarify allowed copy inventory before GOV-125 |
| Harness GOV-097 | E | Keep; small documentation delivery |
| Harness GOV-099 | E | Keep; clarify serial high-water evidence |
| Harness GOV-102 | P | Respecify the README edit versus verification contradiction |
| Harness GOV-103 | P | Keep Draft; settle runtime-step versus closure boundary |
| Harness GOV-107 | P | Keep; clarify baseline and backlink fixture semantics |
| Harness GOV-108 | P | Keep; small declaration-scope clarification |
| Harness GOV-109 | B | Respecify hook binding to preserve boundary-toolchain activation |
| Harness GOV-114 | P | Keep; report held candidates without inferring live verdicts |
| Harness GOV-115 | P | Resolve retained delivery ownership, occupied code and missing host handoff |
| Harness GOV-117 | B | Keep Draft; genuinely waits on GOV-109 |
| Harness GOV-123 | E | Keep; small review-prompt delivery |
| Harness GOV-125 | E | Keep Draft; genuinely waits on GOV-094 |
| Harness GOV-127 | B | Re-plan residual work against existing DESIGN-2 evidence |
| Harness GOV-131 | E | Resolve manifest, viewer, privacy and export-determinism choices |
| Harness GOV-134 | E | Decide protected-state effects versus disposable preview writes |
| Harness GOV-135 | E | Keep; small review-prompt delivery |
| Harness REV-011 | B | Verify actual criterion coverage; remove predetermined self-conformance |
| Harness RTP-015 | P | Keep; re-ground and bound separately authorised live verification |
| Harness OPS-005 | E | Reconcile acquisition contract and plan a first faithful import |
| Arcadia ECO-009 | E | Keep narrow client-evidence matrix; retain fallback until proven safe |
| Arcadia EXT-003 | E | Keep coverage reconciliation; trade only genuine gaps |
| Arcadia GOV-005 | X | Re-sequence optional research activity after existing Tending repairs |
| Arcadia GOV-018 | E | Plan remaining CI rationale against the already-established audit gate |
| Arcadia MOD-004 | X | Re-sequence bounded semantic experiment after queue dispositions |
| Arcadia MOD-005 | T | Correct freshness step; keep the small Intention prose change if selected |
| Arcadia MOD-006 | E | Keep operational description; separate any architectural amendment |
| Arcadia OPS-003 | E | Keep a reproduced ambiguity handoff; receiver chooses the solution |
| Arcadia OPS-004 | X | Respecify generated-note and rendering checks; re-sequence optional templates |
| Arcadia OPS-006 | X | Re-sequence optional workflow assessment; clarify recommendation wording |
| Arcadia OPS-007 | E | Retire covered ideas; hand off only an evidenced portable purpose-mapping gap |
| Arcadia OPS-008 | B | Respecify complete loader repair and truthful early-exit checks |
| Arcadia OPS-009 | X | Keep measured local practice; correct pre-invocation and context claims |

Material findings for owner review:

- **Quick plan repairs.** GUIDE-5 is already occupied by audience-folder placement; GOV-102 requires a `subagents/README.md` edit but Verify 4 forbids all `subagents/` changes; GOV-109's prepare proposal must preserve the supported boundary install. GOV-115's COORD-10 is occupied and its retained task ownership and missing `tools-ki` handoff remain real gates. Eight Arcadia Ready records still carry retired `candidate: true`; that is metadata drift, not completion evidence.
- **Avoid duplicate enforcement.** GOV-127 already acknowledges overlap with DESIGN-2 and requires re-planning before adding DESIGN-3. GOV-018's premise that CI lacks an audit gate is stale. EXT-003 and OPS-007 should retire covered proposals instead of manufacturing new portable capability; native model fields do not prove a portable role-purpose contract exists.
- **Repair existing Tending before adding to it.** OPS-008's locator-only plan leaves downstream loads broken. Canonical Meta Notes lists 15 paths, 14 absent; Health Check has an empty repository-path substitution and loads an absent Island Skill. Canonical-list repair needs an explicitly scoped owner proposal. An in-prompt exit occurs after invocation; Git quietness cannot justify skipping ageing or external scheduled-task checks. OPS-009 should establish truthful practice before revised OPS-008 consumes it.
- **Contract choices remain choices.** GOV-134's temporary-write wording conflicts with the cited accepted Git Audit preview's disposable index unless the effect boundary is clarified. OPS-005's browser-incremental proposal conflicts with the current acquisition contract; GOV-087 can evaluate feasibility without silently adopting it. REV-011 must demonstrate current applicable-criterion coverage rather than infer it from a historical run anchor.
- **Captures do not widen prototype authority.** Keep the existing supervised-host subset; re-sequence held Paperclip, Kitteth, Telegram and unattended continuity. Merge only actual design-principle deltas into existing Engineering Practice; Kubernetes is a candidate mapping, not an automatically adopted portable contract. Reconcile provisional Avatar/Realm vocabulary with ADR-TECHNE-002; multiple manifestations are an ambiguity, not a proven architectural conflict. Lineage fits no existing thread cleanly and has a Philosophy owner, not cloud-readiness ownership.
- **Do not grow a duplicate backlog.** Reconstruction, privileged access, event attribution, conceptual vocabulary and lineage are proposal seams to merge into precise owners if selected. Registry, federation, historical traversal and multicloud speculation remain later candidates. No new generic cloud-readiness item is needed for the already-owned host subset. OPS-008's host-choice disposition and the GOV-021 dated follow-up are now resolved owner work.
- **Checkpoint drift remains visible.** `baseline-and-cloud` already records the exemption correctly, but its queue and unresolved host-choice snapshots are stale. Delta is installed and Rig-declared; the Delta checkpoint's absence claim is stale, while no KI trial or repository connection follows and its 13 October re-evaluation decision remains. The territory proposal's wildcard would grant future members new routes, so it is an authority change requiring approval. Several island-model and Tending records fit none of the five themes; do not silently expand the Paperclip thread to contain them.

Proposed first delivery window after Kris releases the review pause: repair the small plans, then complete harness GOV-097, GOV-123, GOV-135 and GOV-108 serially; run Arcadia ECO-009, EXT-003 and OPS-007 as bounded evidence and reconciliation work. Keep FND-026/GOV-109/GOV-117 and GOV-094/GOV-125 as their own dependency chains. Do not include owner-gated live work or the full captured cloud footprint implicitly. The table and sequence require Kris's approval before routing or implementation.

## Decisions made

- Kris decided on 2026-10-06 to pause and take stock across the Knowledge Islands repositories, building the review in this single checkpoint. For the review's duration it deliberately aggregates in-flight inventory and findings, which checkpoints normally avoid; it stays derived from the owning records and is never their only copy.
- Other work across the Knowledge Islands repositories is paused while the review runs.
- Every prune request needs Kris's express authorisation per group.
- chezmoi joins the review scope alongside the `kis` Agora. Linear and TickTick are out of scope.
- `baseline-and-cloud` keeps its name. `delta-evaluation` is the reference shape for a well-organised checkpoint.
- The review's themes are the checkpoint threads: `baseline-and-cloud`, `delta-evaluation`, `estate-factorisation`, `paperclip-bootstrap-and-recovery` and `territories-and-trades`. Every open record maps to one of them; a record that fits none is itself a finding.
- The six smaller roadmaps were cleared first (deliver what was deliverable, defer what waits on this review, report captures without adopting), so only the harness and Arcadia remain for the detailed review. Kris approved the dispositions of records outside `now` and the git cleanup of merged, clean state on 2026-10-06.
- After the roadmaps are down, every specification across the projects is reviewed with Kris to confirm it does what Kris intends.
- On 2026-10-07 Kris accepted `DOTFILES-UE-066`, `DOTFILES-UE-067` and `TECHNE-TOOLS-FAB-001`, then pruned them himself; abandoned the git-audit lane; approved the leftovers cleanup keeping only harness `KIS-70` and `tools-ki` `KIS-46`; and approved capturing the background-delegation approach as a chezmoi interim plus `KI-HARNESS-GOV-144`. Kris handles the chezmoi interim's review and apply himself, and the `GOV-144` scope decision is reserved to him.
- Kris approved step 0 on 2026-10-07: bring every checkpoint up to date before any other review step, changing only stale facts in the five siblings; reshaping them waits for step 4 and Kris's approval.
- Kris widened the review's remit on 2026-10-07 to the seven acquired ChatGPT captures: same remit, reviewed alongside the roadmap records, not adopted by this review.
- Kris decided on 2026-10-07 to lift the Techne Programme Hold up to an expressly limited remote prototype defined in this review, enacted through `KI-ARCADIA-GOV-020`. Kris accepted its bounds on 2026-10-07 and authorised the enactment, and the same day widened it through `KI-ARCADIA-GOV-023`: the Hold carries one standing exemption for setting up and operating the single agent host, with no automatic lapse, until Kris changes or withdraws it, and a scheduled review on 2026-11-06 (GDR-KI-ARCADIA-004).

## Files touched

- This record and four sibling checkpoints (step 0 refresh); `delta-evaluation` was checked and needed no change.
- Acceptance, prune, clearance, disposition and capture commits in `ki-agentic-harness`, `ki-arcadia-principal`, `ki-website`, `ki-specifications`, `ki-techne-harness`, `tools-ki`, `homebrew-tap` and chezmoi, all pushed.
- GOV-020 enactment and acceptance, its hold and GDR owners, and the GOV-021 reservation and Triage capture reached the owning repository. Parallel owner work also accepted UE-068 and OPS-009 and closed OPS-008 as merged; all four Done records are retained.
- `KI-ARCADIA-GOV-023` amended the hold, GDR-KI-ARCADIA-004 (retitled and renamed), the Decisions, Policies and MEMORY entries, the rollout and concept-map diagrams, GOV-021, and this record and `baseline-and-cloud`.
- This review updates only this checkpoint, with no push, roadmap disposition, sibling reshaping or live mutation.

## Open questions

- `KI-HARNESS-GOV-144`: which skill owns routine background delegation? Only Kris can clear the gate.
- Agent host: it is deployed and in use, but Arcadia holds no evidence that the named-destination egress bound and the GitHub and model API credential identity are settled; confirm them in the owning records. GOV-021 is the scheduled 6 November review of the standing exemption.
- `BREW-012` and `KI-TOOL-CLI-109`: adopt, and when? `KIS-46` still needs rebase, re-verification and review.
- `DOTFILES-UE-065`: approve a bounded, sanitised live trace of the mcporter bridge (no restart) once `baseline-and-cloud` settles?
- `DOTFILES-UE-066`: raise the consumer handoff to `apps-observatory` for its unscoped reads?
- `KI-WEB-SITE-039`: confirm or change the landing-page choices taken under delegated autonomy.
- `KI-SPEC-RGV-001`: confirm the delegated-autonomy choices; split the broken manifest validation command into its own small record now?
- `KI-SPEC-KIN-001` and `KIN-002`: once `KI-ARCADIA-MOD-006` settles, do KBEP and KBIP belong in `ki-specifications`?
- Should the checkpoint standard allow the "single place to look" use, or should the audit warn on length, list-heavy "Next step" sections and checkpoint-only decisions? This needs a harness record either way.
- Once the review completes, should the sibling checkpoints be folded into this one or each be removed as its scope is routed?

## Next step

Steps 0, 1 and 2 are complete, with targeted canonical-owner checks recorded above. Bring the proposed dispositions and first delivery window to Kris before routing them or releasing the implementation pause. The separate prototype rollout continues only within its accepted access, egress and reviewed-apply gates.

0. **Historical checkpoint refresh.** Completed before this detailed review on 2026-10-07. Subsequent baseline and Delta snapshot drift is recorded above and awaits the approved remediation boundary.
1. **Per-record read.** Done: all 36 open Now records, Done GOV-020 and seven focused captures, with outcomes, owners, dependencies, overlap and truthful readiness assessed in the reports.
2. **Map to themes.** Done: proposed mappings and uncovered items are recorded above; loose buckets do not change canonical ownership. Duplicates, reversal risks and untracked proposal seams are distinguished from current work.
3. **Specification check.** Targeted owner-contract checks are complete for this set. Review the identified contract questions and remedial scopes with Kris; the later full specification review is not claimed complete.
4. **Checkpoint remediation.** Bring the four checkpoints into `delta-evaluation`'s shape, applying the owning threads' proposed fixes once Kris approves them, and capture the standard and audit gaps as a harness record.
5. **Dispositions.** Bring one table of proposed dispositions to Kris; route only approved changes through the owning repositories.
6. **Specification review.** With Kris, review and discuss every specification across the projects to confirm each does what Kris intends; record remedial work in the owning repositories.
