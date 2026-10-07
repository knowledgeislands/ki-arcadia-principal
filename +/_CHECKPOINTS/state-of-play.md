---
type: ki-checkpoint
thread: state-of-play
state: active
created_at: 2026-10-06T21:07:00Z
updated_at: 2026-10-07T14:10:00Z
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

This checkpoint is the single place the review is built up. Every review step and finding is recorded here until it has been routed to its owner. It coordinates the six sibling checkpoints in this directory rather than replacing them.

## Current state

From 2026-10-07 the periodic review lives in the Review section of each Initiative note in [Initiatives](../../Streams/Initiatives/Initiatives.md), and the five theme checkpoints it coordinated are retired into their Project notes.

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

- `overview`: Human, Rig, Realm and Avatar model, and a first AWS milestone (EC2, K3s, Paperclip, Kitteth, Tailscale, Telegram). `techne`. Its full-footprint proposal stays held outside the GOV-020 supervised-host subset; touches `TECHNE-TOOLS-OPS-008`, `TECHNE-TOOLS-FAB-001` and `KI-ARCADIA-GOV-020`.
- `conceptual-model`: Human, Rig, Realm and Avatar definitions, territories, Knowledge Landscapes and a Knowledge Realms registry. `territories-and-trades`. Touches `KI-ARCADIA-MOD-003` (geography model) and `KI-ARCADIA-MOD-004` (semantic conventions); vocabulary needs owner reconciliation against accepted architecture.
- `conceptual-lineage`: the real-world and fictional influences and a rule for recording future ones. Fits no thread (a finding); nearest is `KI-ARCADIA-MOD-003`. No conflict.
- `design-principles`: thirteen principles (tool-agnostic, FOSS-first, Kubernetes as contract, Realm separate from footprint, Paperclip replaceable, design for reconstruction). `techne`. Touches [[Engineering Practice]] and the Hold's second prerequisite (what Paperclip supplies); candidate substrate and principles need owner reconciliation.
- `avatar-agency-and-access`: Kitteth as Avatar, Operator and Architect authority outside Paperclip, connection modes and auditable delegation. `paperclip-bootstrap-and-recovery`. Conflicts with the Hold (remote privileged management); touches `KI-HARNESS-GOV-144` (delegation).
- `techne-and-first-footprint`: one EC2 instance with K3s, Paperclip and Kitteth as workloads, and acceptance criteria centred on work surviving the Rig disconnecting. `techne`. Conflicts with the Hold; overlaps `TECHNE-TOOLS-OPS-008` (host choice) and `TECHNE-TOOLS-FAB-001` (open TCP 443 egress); `KI-ARCADIA-GOV-020` takes only a bounded subset.
- `open-questions-and-actions`: immediate build actions, a reconstructability inventory, access-model and infrastructure questions, and explicit non-blockers. `techne`. Its immediate actions conflict with the Hold; overlaps the uncaptured "Techné cloud readiness" idea kept in `techne` and `TECHNE-TOOLS-OPS-008`.

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
| `baseline` | None; reshaped to `delta-evaluation`'s shape on 2026-10-07 | - |
| `techne` | None; split from `baseline-and-cloud` on 2026-10-07 in the same shape | - |
| `delta-evaluation` | None; Kris judges it the reference shape | - |

The territory thread's schema proposal and related items need a draft Arcadia work record before its roughly 900-word snapshot is cut. The Paperclip thread's standing constraints need the harness coordination skill or an Arcadia Decision Record; its actions need owner work records before the roughly 1,200-word snapshot gets one resumable next action. These remain proposed fixes, not enacted changes.

Gaps in the checkpoint standard and audit, raised by those threads: the audit does not warn on length, list-heavy "Next step" sections, decisions held only in the checkpoint, untracked work, or an `updated_at` later than its commit; and the standard has no position on a checkpoint used as the "single place to look" for a thread, which conflicts with the rule that checkpoints only point to owners.

**Steps 1 and 2 complete; targeted owner-contract findings.** All 36 open Now records, Done GOV-020 and all seven capture bodies were read in full. The reports are `overnight-harness-review.report.md`, `overnight-arcadia-review.report.md` and `overnight-capture-review.report.md`; `overnight-read-manifest.json` fixes the 37 roadmap source hashes, and the capture report fixes all seven file hashes. No reviewed open record has a completed delivery packet warranting acceptance or prune. Structural audits do not establish truthful readiness. The broader specification review remains step 6.

**Themes agreed, 2026-10-07.** Kris accepted twelve themes: the six checkpoint threads, four new working themes and two parked buckets. Theme mappings are review buckets and confer no canonical ownership. A new theme gets a checkpoint only when a thread starts; until then it is recorded here. The map in `~/.local/state/ki/state-of-play/theme-map.json` covers the 79 records open at 11:16 CEST, corrected by Kris's decisions below. Since then `TECHNE-TOOLS-OPS-011` has been accepted Done and `KI-ARCADIA-GOV-025` adopted into Now, so 78 remain open. Open records by theme and horizon:

| Theme | Checkpoint | now | next | soon | triage | waiting-for | future | parked | Open |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `baseline` | yes | 5 | - | - | - | - | - | - | 5 |
| `techne` | yes | 2 | - | - | 1 | 1 | - | - | 4 |
| `estate-factorisation` | yes | 3 | 1 | - | 4 | - | 1 | - | 9 |
| `paperclip-bootstrap-and-recovery` | yes | 7 | - | 1 | 3 | - | - | - | 11 |
| `territories-and-trades` | yes | - | - | - | 2 | - | - | - | 2 |
| `delta-evaluation` | yes | - | - | - | - | - | - | - | 0 |
| `standards-upkeep` | not yet | 10 | 1 | - | 4 | - | - | - | 15 |
| `island-model-and-tending` | not yet | 8 | 2 | - | 1 | - | 1 | - | 12 |
| `knowledge-acquisition` | not yet | 3 | - | - | - | 1 | - | - | 4 |
| `workstation-hygiene` | not yet | - | - | - | - | 7 | - | 1 | 8 |
| `specifications` | parked | - | - | - | - | - | - | 3 | 3 |
| `website` | parked | - | - | - | - | - | - | 2 | 2 |
| `none` | - | - | - | - | - | 1 | - | 2 | 3 |
| **All** | | **38** | **4** | **1** | **15** | **10** | **2** | **8** | **78** |

The new themes:

- `standards-upkeep`: absorb downstream evidence into the shared harness standards and the `ki` CLI as small, independent refinements; neither factorisation nor baseline-gating.
- `island-model-and-tending`: keep Arcadia's own knowledge model, conventions and Tending activities coherent and current.
- `knowledge-acquisition`: acquire AI sessions and other captures into islands faithfully under ADR-KI-ARCADIA-001.
- `workstation-hygiene`: keep the personal workstation (Rig, launchd, mcporter, secrets, Claude state) truthful and tidy.
- `specifications` and `website`: parked buckets with no live thread.
- `none`: three harness records waiting or parked with no owning thread.

Every mapped record follows, with the step 1 proposed disposition for the 36 Now records read in full. Dispositions are proposals, not lifecycle or horizon changes:

| Record | Horizon / status | Theme | Proposed disposition |
| --- | --- | --- | --- |
| [KI-HARNESS-FND-026](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-FND-026-complete-conform-activation.md>) - Complete conform activation | now / ready | `baseline` | Keep; bounded conform-activation delivery |
| [KI-HARNESS-GOV-109](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-109-fail-when-commit-gates-absent.md>) - Enforce commit gates | now / ready | `baseline` | Respecify hook binding to preserve boundary-toolchain activation |
| [KI-HARNESS-GOV-117](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-117-govern-hooks-beyond-packages.md>) - Govern hooks beyond packages | now / draft | `baseline` | Keep Draft; genuinely waits on GOV-109 |
| [KI-HARNESS-GOV-127](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-127-adopt-dependency-cruiser-estatewide.md>) - Adopt Dependency Cruiser estatewide | now / in-progress | `baseline` | Re-plan residual work against existing DESIGN-2 evidence |
| [KI-HARNESS-REV-011](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-REV-011-review-harness-automation-coverage.md>) - Review harness automation | now / ready | `baseline` | Verify actual criterion coverage; remove predetermined self-conformance |
| [KI-ARCADIA-GOV-025](<../../Streams/Roadmap/KI-ARCADIA-GOV-025-model-agent-hosts-as-recipes-and-bindings.md>) - Model agent hosts as recipes and bindings | now / draft | `techne` | - |
| [TECHNE-TOOL-CLI-004](<../../../tools-techne/docs/roadmap/TECHNE-TOOL-CLI-004-host-command-group.md>) - Add host command group | now / awaiting-review | `techne` | - |
| [TECHNE-TOOLS-OPS-011](<../../../ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-011-manage-the-agent-host-footprint.md>) - Manage agent-host footprint | now / done | `techne` | - |
| [KI-ARCADIA-GOV-021](<../../Streams/Roadmap/KI-ARCADIA-GOV-021-review-the-agent-host-prototype.md>) - Review the agent-host prototype | triage / draft | `techne` | - |
| [DOTFILES-UE-020](<../../../../../../.local/share/chezmoi/docs/roadmap/DOTFILES-UE-020-implement-cheztoi-profile.md>) - Implement Cheztoi profile | waiting-for / draft | `techne` | - |
| [KI-ARCADIA-ECO-009](<../../Streams/Roadmap/KI-ARCADIA-ECO-009-legacy-serve-fallback-policy.md>) - Gather evidence for a legacy serve fallback policy | now / ready | `estate-factorisation` | Keep narrow client-evidence matrix; retain fallback until proven safe |
| [KI-ARCADIA-GOV-018](<../../Streams/Roadmap/KI-ARCADIA-GOV-018-ci-policy-principle.md>) - CI policy principle | now / draft | `estate-factorisation` | Plan remaining CI rationale against the already-established audit gate |
| [KI-HARNESS-GOV-134](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-134-align-mcp-recovery-and-dry-run-contracts.md>) - Align MCP safety contracts | now / ready | `estate-factorisation` | Decide protected-state effects versus disposable preview writes |
| [KI-HARNESS-GOV-141](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-141-auto-bump-released-ki-pin.md>) - Auto-bump released ki pin | next / draft | `estate-factorisation` | - |
| [BREW-011](<../../../homebrew-tap/docs/roadmap/BREW-011-register-ki-pin-consumers.md>) - Register ki pin consumers | triage / draft | `estate-factorisation` | - |
| [BREW-012](<../../../homebrew-tap/docs/roadmap/BREW-012-document-release-app-operations.md>) - Document release app operations | triage / draft | `estate-factorisation` | - |
| [KI-HARNESS-GOV-140](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-140-define-mcp-release-procedure.md>) - Define MCP release procedure | triage / draft | `estate-factorisation` | - |
| [KI-TOOL-CLI-110](<../../../tools-ki/docs/roadmap/KI-TOOL-CLI-110-report-dangling-projection-links.md>) - Report dangling projection links | triage / draft | `estate-factorisation` | - |
| [KI-ARCADIA-GOV-010](<../../Streams/Roadmap/KI-ARCADIA-GOV-010-assess-estate-tooling-commonality.md>) - Assess estate-wide tooling commonality | future / draft | `estate-factorisation` | - |
| [KI-HARNESS-GOV-102](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-102-decide-role-record-serialization.md>) - Decide role record serialization | now / ready | `paperclip-bootstrap-and-recovery` | Respecify the README edit versus verification contradiction |
| [KI-HARNESS-GOV-103](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-103-cite-coordination-rules-once.md>) - Cite coordination rules once | now / draft | `paperclip-bootstrap-and-recovery` | Keep Draft; settle runtime-step versus closure boundary |
| [KI-HARNESS-GOV-107](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-107-make-coordination-audit-mechanical.md>) - Make coordination audit mechanical | now / ready | `paperclip-bootstrap-and-recovery` | Keep; clarify baseline and backlink fixture semantics |
| [KI-HARNESS-GOV-108](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-108-decide-coordination-declaration-scope.md>) - Decide coordination declaration scope | now / ready | `paperclip-bootstrap-and-recovery` | Keep; small declaration-scope clarification |
| [KI-HARNESS-GOV-114](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-114-surface-held-workspaces.md>) - Surface held workspaces | now / ready | `paperclip-bootstrap-and-recovery` | Keep; report held candidates without inferring live verdicts |
| [KI-HARNESS-GOV-115](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-115-require-a-current-base-for-a-coordinated-worktree.md>) - Require current worktree base | now / ready | `paperclip-bootstrap-and-recovery` | Resolve retained delivery ownership, occupied code and missing host handoff |
| [KI-HARNESS-RTP-015](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-RTP-015-verify-run-mcp-connection.md>) - Verify run MCP connection | now / ready | `paperclip-bootstrap-and-recovery` | Keep; re-ground and bound separately authorised live verification |
| [DOTFILES-UE-055](<../../../../../../.local/share/chezmoi/docs/roadmap/DOTFILES-UE-055-provision-hnr-agent-audits.md>) - Provision HNR agent audits | soon / draft | `paperclip-bootstrap-and-recovery` | - |
| [KI-HARNESS-GOV-147](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-147-make-the-branch-durable.md>) - Make the branch durable | triage / draft | `paperclip-bootstrap-and-recovery` | - |
| [KI-HARNESS-RTP-018](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-RTP-018-audit-inside-sandboxed-runs.md>) - Audit inside sandboxed runs | triage / draft | `paperclip-bootstrap-and-recovery` | - |
| [KI-HARNESS-RTP-019](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-RTP-019-fit-sandbox-socket-paths.md>) - Fit sandbox socket paths | triage / draft | `paperclip-bootstrap-and-recovery` | - |
| [KI-HARNESS-GOV-148](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-148-let-senders-withdraw-trades.md>) - Let senders withdraw trades | triage / draft | `territories-and-trades` | - |
| [KI-TOOL-CLI-111](<../../../tools-ki/docs/roadmap/KI-TOOL-CLI-111-surface-undeliverable-trades.md>) - Surface undeliverable trades | triage / draft | `territories-and-trades` | - |
| [KI-ARCADIA-EXT-003](<../../Streams/Roadmap/KI-ARCADIA-EXT-003-ki-skill-extractions.md>) - KI skill extractions | now / ready | `standards-upkeep` | Keep coverage reconciliation; trade only genuine gaps |
| [KI-ARCADIA-OPS-003](<../../Streams/Roadmap/KI-ARCADIA-OPS-003-page-registry.md>) - Page registry | now / ready | `standards-upkeep` | Keep a reproduced ambiguity handoff; receiver chooses the solution |
| [KI-HARNESS-GOV-091](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-091-guide-opening-and-deferral.md>) - Guide opening and deferral | now / ready | `standards-upkeep` | Respecify occupied GUIDE-5 code |
| [KI-HARNESS-GOV-094](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-094-check-constraint-reach.md>) - Check constraint reach | now / ready | `standards-upkeep` | Keep; clarify allowed copy inventory before GOV-125 |
| [KI-HARNESS-GOV-097](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-097-extract-format-readers.md>) - Extract format readers | now / ready | `standards-upkeep` | Keep; small documentation delivery |
| [KI-HARNESS-GOV-099](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-099-decide-decision-serial-gaps.md>) - Decide decision serial gaps | now / ready | `standards-upkeep` | Keep; clarify serial high-water evidence |
| [KI-HARNESS-GOV-123](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-123-review-unsettled-source-readings.md>) - Review unsettled-source readings | now / ready | `standards-upkeep` | Keep; small review-prompt delivery |
| [KI-HARNESS-GOV-125](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-125-share-batch-identifier-grammar.md>) - Share batch identifier grammar | now / draft | `standards-upkeep` | Keep Draft; genuinely waits on GOV-094 |
| [KI-HARNESS-GOV-131](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-131-govern-living-diagrams.md>) - Govern living diagrams | now / ready | `standards-upkeep` | Resolve manifest, viewer, privacy and export-determinism choices |
| [KI-HARNESS-GOV-135](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-135-review-governance-date-provenance.md>) - Review governance date provenance | now / ready | `standards-upkeep` | Keep; small review-prompt delivery |
| [KI-TOOL-CLI-108](<../../../tools-ki/docs/roadmap/KI-TOOL-CLI-108-roadmap-list-structural-validity.md>) - Roadmap list structural validity | next / draft | `standards-upkeep` | - |
| [KI-HARNESS-GOV-144](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-144-own-portable-background-delegation.md>) - Own portable background delegation | triage / draft | `standards-upkeep` | - |
| [KI-HARNESS-GOV-145](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-145-disclose-evaluated-criteria-count.md>) - Disclose evaluated criteria count | triage / draft | `standards-upkeep` | - |
| [KI-HARNESS-GOV-146](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-146-gate-acceptance-on-audits.md>) - Gate acceptance on audits | triage / draft | `standards-upkeep` | - |
| [KI-TOOL-CLI-109](<../../../tools-ki/docs/roadmap/KI-TOOL-CLI-109-bound-rubric-publication-root.md>) - Bound rubric publication root | triage / draft | `standards-upkeep` | - |
| [KI-ARCADIA-GOV-005](<../../Streams/Roadmap/KI-ARCADIA-GOV-005-automated-proposal-pipeline.md>) - Automated proposal pipeline | now / ready | `island-model-and-tending` | Re-sequence optional research activity after existing Tending repairs |
| [KI-ARCADIA-MOD-004](<../../Streams/Roadmap/KI-ARCADIA-MOD-004-semantic-conventions.md>) - Semantic conventions | now / ready | `island-model-and-tending` | Re-sequence bounded semantic experiment after queue dispositions |
| [KI-ARCADIA-MOD-005](<../../Streams/Roadmap/KI-ARCADIA-MOD-005-intention.md>) - Intention | now / ready | `island-model-and-tending` | Correct freshness step; keep the small Intention prose change if selected |
| [KI-ARCADIA-OPS-004](<../../Streams/Roadmap/KI-ARCADIA-OPS-004-bullet-journal-support.md>) - Bullet Journal support | now / ready | `island-model-and-tending` | Respecify generated-note and rendering checks; re-sequence optional templates |
| [KI-ARCADIA-OPS-006](<../../Streams/Roadmap/KI-ARCADIA-OPS-006-workflow-integrations.md>) - Workflow integrations | now / ready | `island-model-and-tending` | Re-sequence optional workflow assessment; clarify recommendation wording |
| [KI-ARCADIA-OPS-007](<../../Streams/Roadmap/KI-ARCADIA-OPS-007-agent-session-improvements.md>) - Agent session improvements | now / ready | `island-model-and-tending` | Retire covered ideas; hand off only an evidenced portable purpose-mapping gap |
| [KI-ARCADIA-OPS-008](<../../Streams/Roadmap/KI-ARCADIA-OPS-008-scheduled-automations.md>) - Scheduled automations | now / ready | `island-model-and-tending` | Respecify complete loader repair and truthful early-exit checks |
| [KI-ARCADIA-OPS-009](<../../Streams/Roadmap/KI-ARCADIA-OPS-009-token-economics.md>) - Token economics | now / ready | `island-model-and-tending` | Keep measured local practice; correct pre-invocation and context claims |
| [KI-ARCADIA-GOV-001](<../../Streams/Roadmap/KI-ARCADIA-GOV-001-boundary-rules.md>) - Boundary rules | next / draft | `island-model-and-tending` | - |
| [KI-ARCADIA-OPS-002](<../../Streams/Roadmap/KI-ARCADIA-OPS-002-tooling-rollout.md>) - Tooling rollout | next / draft | `island-model-and-tending` | - |
| [KI-ARCADIA-GOV-024](<../../Streams/Roadmap/KI-ARCADIA-GOV-024-review-the-enactment-threshold.md>) - Review the enactment threshold | triage / draft | `island-model-and-tending` | - |
| [KI-ARCADIA-MOD-003](<../../Streams/Roadmap/KI-ARCADIA-MOD-003-island-visualisation.md>) - Geography model and tiles | future / draft | `island-model-and-tending` | - |
| [KI-ARCADIA-MOD-006](<../../Streams/Roadmap/KI-ARCADIA-MOD-006-knowledge-acquisition-lifecycle.md>) - Knowledge acquisition lifecycle | now / ready | `knowledge-acquisition` | Keep operational description; separate any architectural amendment |
| [KI-HARNESS-GOV-087](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-087-evaluate-obscura-browser-runtime.md>) - Evaluate Obscura browser runtime | now / ready | `knowledge-acquisition` | Keep gated on local build feasibility and an authenticated evaluation slot |
| [KI-HARNESS-OPS-005](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md>) - Acquire AI sessions | now / in-progress | `knowledge-acquisition` | Reconcile acquisition contract and plan a first faithful import |
| [DOTFILES-UE-035](<../../../../../../.local/share/chezmoi/docs/roadmap/DOTFILES-UE-035-install-whatsapp-spool-refresh.md>) - Install WhatsApp spool refresh | waiting-for / draft | `knowledge-acquisition` | - |
| [DOTFILES-UE-027](<../../../../../../.local/share/chezmoi/docs/roadmap/DOTFILES-UE-027-honest-rationales-per-tool.md>) - Honest Rig rationales | waiting-for / draft | `workstation-hygiene` | - |
| [DOTFILES-UE-028](<../../../../../../.local/share/chezmoi/docs/roadmap/DOTFILES-UE-028-tidy-remnants-of-retired-software.md>) - Tidy retired software remnants | waiting-for / draft | `workstation-hygiene` | - |
| [DOTFILES-UE-056](<../../../../../../.local/share/chezmoi/docs/roadmap/DOTFILES-UE-056-review-host-claude-cleanup.md>) - Review host Claude cleanup | waiting-for / draft | `workstation-hygiene` | - |
| [DOTFILES-UE-062](<../../../../../../.local/share/chezmoi/docs/roadmap/DOTFILES-UE-062-measure-the-live-apply.md>) - Measure the live apply | waiting-for / draft | `workstation-hygiene` | - |
| [DOTFILES-UE-063](<../../../../../../.local/share/chezmoi/docs/roadmap/DOTFILES-UE-063-bind-qmd-search-daemon.md>) - Bind qmd search daemon | waiting-for / draft | `workstation-hygiene` | - |
| [DOTFILES-UE-065](<../../../../../../.local/share/chezmoi/docs/roadmap/DOTFILES-UE-065-diagnose-same-boot-mcporter-stall.md>) - Diagnose same-boot mcporter stall | waiting-for / draft | `workstation-hygiene` | - |
| [KI-HARNESS-OPS-001](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-001-complete-claude-state-cleanup.md>) - Complete Claude-state cleanup | waiting-for / draft | `workstation-hygiene` | - |
| [DOTFILES-UE-043](<../../../../../../.local/share/chezmoi/docs/roadmap/DOTFILES-UE-043-audit-1password-secret-hygiene.md>) - Audit 1Password secret hygiene | parked / draft | `workstation-hygiene` | - |
| [KI-SPEC-KIN-001](<../../../ki-specifications/docs/roadmap/KI-SPEC-KIN-001-assess-kbep-extraction-protocol.md>) - Assess KBEP extraction protocol | parked / draft | `specifications` | - |
| [KI-SPEC-KIN-002](<../../../ki-specifications/docs/roadmap/KI-SPEC-KIN-002-assess-kbip-ingress-protocol.md>) - Assess KBIP ingress protocol | parked / draft | `specifications` | - |
| [KI-SPEC-RGV-001](<../../../ki-specifications/docs/roadmap/KI-SPEC-RGV-001-review-specifications-repository.md>) - Review KI Specifications | parked / draft | `specifications` | - |
| [KI-WEB-SITE-001](<../../../ki-website/docs/roadmap/KI-WEB-SITE-001-interactive-island-geography-diagram.md>) - Interactive island diagram | parked / draft | `website` | - |
| [KI-WEB-SITE-039](<../../../ki-website/docs/roadmap/KI-WEB-SITE-039-decide-the-landing-pages.md>) - Decide the landing pages | parked / draft | `website` | - |
| [KI-HARNESS-FND-014](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-FND-014-implement-remote-adapters.md>) - Implement remote adapter execution | waiting-for / draft | `none` | - |
| [KI-HARNESS-OPS-003](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-003-define-otlp-observability.md>) - Define OTLP observability | parked / draft | `none` | - |
| [KI-HARNESS-RTP-002](<../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-RTP-002-reach-cowork-mcp-servers.md>) - Reach Cowork MCP servers | parked / draft | `none` | - |

**Duplicate outcomes, 2026-10-07.** Kris confirmed four. None could be carried out under `ki-accept` and `ki-next`, so each record's Discussion now holds the approved intent and the route the skills allow; nothing was closed or pruned:

| Record | Approved outcome | Why not carried out | Route the skills allow |
| --- | --- | --- | --- |
| [BREW-011](<../../../homebrew-tap/docs/roadmap/BREW-011-register-ki-pin-consumers.md>) | Fold into `KI-HARNESS-GOV-141` | A `merged` target must resolve in the same roadmap | Kris approves a `rejected` Triage disposition citing GOV-141, or it stays in Triage until GOV-141's plan places the tap-side work |
| [KI-ARCADIA-OPS-002](../../Streams/Roadmap/KI-ARCADIA-OPS-002-tooling-rollout.md) | Close as obsolete | Adopted in Next; only Triage takes an intake disposition | Kris approves moving it to Triage, then a `rejected` disposition through `ki-accept` |
| [KI-ARCADIA-GOV-010](../../Streams/Roadmap/KI-ARCADIA-GOV-010-assess-estate-tooling-commonality.md) | Fold into `estate-factorisation` | Adopted in Future; the thread has no work record to merge into | Capture FND-5 as an Arcadia work record, then Kris approves moving GOV-010 to Triage and a `merged` disposition naming it |
| [KI-HARNESS-OPS-001](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-001-complete-claude-state-cleanup.md) | Fold into `DOTFILES-UE-056` | Adopted in Waiting for; the target is in the chezmoi roadmap | Kris approves moving it to Triage, then a `rejected` disposition citing UE-056 |

**Captured too early.** Candidates for returning to a checkpoint until they mature. No action taken; nothing moved or pruned:

- [KI-ARCADIA-GOV-025](../../Streams/Roadmap/KI-ARCADIA-GOV-025-model-agent-hosts-as-recipes-and-bindings.md): open questions on recipe location, binding ownership, ADR and hold authority, and a second binding is not authorised; better held in `techne` until the GOV-021 review. It has since been adopted and planned into Now (Arcadia `ccfae8a`).
- [KI-ARCADIA-GOV-010](../../Streams/Roadmap/KI-ARCADIA-GOV-010-assess-estate-tooling-commonality.md) and [KI-ARCADIA-OPS-002](../../Streams/Roadmap/KI-ARCADIA-OPS-002-tooling-rollout.md): covered by the duplicate outcomes above.
- [KI-ARCADIA-MOD-003](../../Streams/Roadmap/KI-ARCADIA-MOD-003-island-visualisation.md): Future, and its downstream website work is parked; fine as Future, or an `island-model-and-tending` checkpoint note if one opens.
- [KI-HARNESS-FND-014](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-FND-014-implement-remote-adapters.md), [KI-HARNESS-RTP-002](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-RTP-002-reach-cowork-mcp-servers.md) and [KI-HARNESS-OPS-003](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-003-define-otlp-observability.md): waiting or parked with no owning thread or trigger.
- [DOTFILES-UE-020](<../../../../../../.local/share/chezmoi/docs/roadmap/DOTFILES-UE-020-implement-cheztoi-profile.md>): waits on two upstream contracts that do not yet exist; better in `techne`.
- [DOTFILES-UE-063](<../../../../../../.local/share/chezmoi/docs/roadmap/DOTFILES-UE-063-bind-qmd-search-daemon.md>): its own Goal and Boundary are stale pending the search-route decision; better as an open question here.
- [KI-HARNESS-GOV-145](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-145-disclose-evaluated-criteria-count.md) and [KI-HARNESS-GOV-146](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-146-gate-acceptance-on-audits.md): one line of evidence each; could stay in Triage and be planned with REV-011.
- [KI-SPEC-KIN-001](<../../../ki-specifications/docs/roadmap/KI-SPEC-KIN-001-assess-kbep-extraction-protocol.md>) and [KI-SPEC-KIN-002](<../../../ki-specifications/docs/roadmap/KI-SPEC-KIN-002-assess-kbip-ingress-protocol.md>): parked with the specifications; no action today.

Material findings for owner review:

- **Quick plan repairs.** GUIDE-5 is already occupied by audience-folder placement; GOV-102 requires a `subagents/README.md` edit but Verify 4 forbids all `subagents/` changes; GOV-109's prepare proposal must preserve the supported boundary install. GOV-115's COORD-10 is occupied and its retained task ownership and missing `tools-ki` handoff remain real gates. Eight Arcadia Ready records still carry retired `candidate: true`; that is metadata drift, not completion evidence.
- **Avoid duplicate enforcement.** GOV-127 already acknowledges overlap with DESIGN-2 and requires re-planning before adding DESIGN-3. GOV-018's premise that CI lacks an audit gate is stale. EXT-003 and OPS-007 should retire covered proposals instead of manufacturing new portable capability; native model fields do not prove a portable role-purpose contract exists.
- **Repair existing Tending before adding to it.** OPS-008's locator-only plan leaves downstream loads broken. Canonical Meta Notes lists 15 paths, 14 absent; Health Check has an empty repository-path substitution and loads an absent Island Skill. Canonical-list repair needs an explicitly scoped owner proposal. An in-prompt exit occurs after invocation; Git quietness cannot justify skipping ageing or external scheduled-task checks. OPS-009 should establish truthful practice before revised OPS-008 consumes it.
- **Contract choices remain choices.** GOV-134's temporary-write wording conflicts with the cited accepted Git Audit preview's disposable index unless the effect boundary is clarified. OPS-005's browser-incremental proposal conflicts with the current acquisition contract; GOV-087 can evaluate feasibility without silently adopting it. REV-011 must demonstrate current applicable-criterion coverage rather than infer it from a historical run anchor.
- **Captures do not widen prototype authority.** Keep the existing supervised-host subset; re-sequence held Paperclip, Kitteth, Telegram and unattended continuity. Merge only actual design-principle deltas into existing Engineering Practice; Kubernetes is a candidate mapping, not an automatically adopted portable contract. Reconcile provisional Avatar/Realm vocabulary with ADR-TECHNE-002; multiple manifestations are an ambiguity, not a proven architectural conflict. Lineage fits no existing thread cleanly and has a Philosophy owner, not cloud-readiness ownership.
- **Do not grow a duplicate backlog.** Reconstruction, privileged access, event attribution, conceptual vocabulary and lineage are proposal seams to merge into precise owners if selected. Registry, federation, historical traversal and multicloud speculation remain later candidates. No new generic cloud-readiness item is needed for the already-owned host subset. OPS-008's host-choice disposition and the GOV-021 dated follow-up are now resolved owner work.
- **Checkpoint drift remains visible.** `baseline-and-cloud`'s stale queue and host-choice snapshots were resolved by its 2026-10-07 split into `baseline` and `techne`. Delta is installed and Rig-declared; the Delta checkpoint's absence claim is stale, while no KI trial or repository connection follows and its 13 October re-evaluation decision remains. The territory proposal's wildcard would grant future members new routes, so it is an authority change requiring approval. Several island-model and Tending records fitted none of the six themes; they now form `island-model-and-tending` rather than expanding the Paperclip thread.

Proposed first delivery window after Kris releases the review pause: repair the small plans, then complete harness GOV-097, GOV-123, GOV-135 and GOV-108 serially; run Arcadia ECO-009, EXT-003 and OPS-007 as bounded evidence and reconciliation work. Keep FND-026/GOV-109/GOV-117 and GOV-094/GOV-125 as their own dependency chains. Do not include owner-gated live work or the full captured cloud footprint implicitly. The table and sequence require Kris's approval before routing or implementation.

## Decisions made

- Kris decided on 2026-10-06 to pause and take stock across the Knowledge Islands repositories, building the review in this single checkpoint. For the review's duration it deliberately aggregates in-flight inventory and findings, which checkpoints normally avoid; it stays derived from the owning records and is never their only copy.
- Other work across the Knowledge Islands repositories is paused while the review runs.
- Every prune request needs Kris's express authorisation per group.
- chezmoi joins the review scope alongside the `kis` Agora. Linear and TickTick are out of scope.
- Kris decided on 2026-10-07 to split `baseline-and-cloud` into `baseline` (the rollout baseline) and `techne` (the move into the Techné footprint). `delta-evaluation` is the reference shape for a well-organised checkpoint.
- The review's themes started as the six checkpoint threads. On 2026-10-07 Kris accepted four more working themes, `standards-upkeep`, `island-model-and-tending`, `knowledge-acquisition` and `workstation-hygiene`, and two parked buckets, `specifications` and `website`. Every open record maps to one theme or is listed as unthemed. A new theme gets a checkpoint only when its thread starts; until then it is recorded here.
- On 2026-10-07 Kris confirmed narrowing `baseline` to FND-026, GOV-109, GOV-117, GOV-127 and REV-011: GOV-115 and RTP-015 move to `paperclip-bootstrap-and-recovery`, OPS-008 to `island-model-and-tending`, EXT-003 to `standards-upkeep` and ECO-009 to `estate-factorisation`. Kris also confirmed the four duplicate outcomes above, carried as far as the skills allow.
- On 2026-10-07 Kris decided there is no cap on the number of records in Now: "there doesn't have to be a rule, it's about intent." The other horizon and status questions stay open below.
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
- `KI-ARCADIA-GOV-023` amended the hold, GDR-KI-ARCADIA-004 (retitled and renamed), the Decisions, Policies and MEMORY entries, the rollout and concept-map diagrams, GOV-021, and this record and `baseline-and-cloud` (since split into `baseline` and `techne`).
- This review updates only this checkpoint, with no push, roadmap disposition, sibling reshaping or live mutation.
- Theme decisions, 2026-10-07: this record; `baseline` narrowed to its five records; the approved intent and route in the Discussion of Arcadia OPS-002 and GOV-010, harness OPS-001 and `homebrew-tap` BREW-011; and Arcadia GOV-020 and GOV-023 now name the `techne` checkpoint instead of `baseline-and-cloud`. Local commits only.

## Open questions

- `KI-HARNESS-GOV-144`: which skill owns routine background delegation? Only Kris can clear the gate.
- Horizon and status design, part of this workstream and not yet a roadmap item: may the holds (`waiting-for`, `parked`) carry paused `ready` or `in-progress` work, given the checker fails any non-draft record outside Now or Next? Should hold conditions be structured fields? Should this be raised as a harness roadmap item? The Now cap is settled: none.
- Duplicate outcomes: which route does Kris approve for each of BREW-011, OPS-002, GOV-010 and harness OPS-001?
- Captured too early: should any of the listed candidates return to a checkpoint?
- Agent host: it is deployed and in use, but Arcadia holds no evidence that the named-destination egress bound and the GitHub and model API credential identity are settled; confirm them in the owning records. GOV-021 is the scheduled 6 November review of the standing exemption.
- `BREW-012` and `KI-TOOL-CLI-109`: adopt, and when? `KIS-46` still needs rebase, re-verification and review.
- `DOTFILES-UE-065`: approve a bounded, sanitised live trace of the mcporter bridge (no restart) once `techne` settles?
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
2. **Map to themes.** Done: Kris agreed twelve themes on 2026-10-07 and every open record is mapped above; themes do not change canonical ownership. Duplicates, reversal risks and untracked proposal seams are distinguished from current work.
3. **Specification check.** Targeted owner-contract checks are complete for this set. Review the identified contract questions and remedial scopes with Kris; the later full specification review is not claimed complete.
4. **Checkpoint remediation.** Bring the four checkpoints into `delta-evaluation`'s shape, applying the owning threads' proposed fixes once Kris approves them, and capture the standard and audit gaps as a harness record.
5. **Dispositions.** The four duplicate outcomes are approved and recorded as far as the skills allow; each needs Kris to choose its route. Bring the remaining proposed dispositions to Kris; route only approved changes through the owning repositories.
6. **Specification review.** With Kris, review and discuss every specification across the projects to confirm each does what Kris intends; record remedial work in the owning repositories.
