---
type: ki-checkpoint
thread: state-of-play
state: active
created_at: 2026-10-06T21:07:00Z
updated_at: 2026-10-07T19:15:00Z
---

# state-of-play

## Objective

Reduce all in-flight work across the `kis` Agora and chezmoi to a short list of Projects that Kris chooses between, with Now reflecting real intent.

## Current state

- **Roadmap model v1** is live and enforced across the Agora ([GDR-KI-ARCADIA-005](../../Admin/Governance/Decisions/GDR-KI-ARCADIA-005-the-roadmap-model.md)). Links point upwards only: records name their Project and Projects their Initiative. Project notes in [Projects](../../Streams/Projects/Projects.md) carry only an outcome and notes; status lives in the records and each note's `lifecycle`, and `ki` produces the views.
- **Load:** the Agora has 26 Now, 3 Next, 1 Future, 7 Hold and 13 triage records; chezmoi adds 1 Soon, 9 Hold and 1 triage. Now is still overloaded. No horizon has moved yet.
- **Running:** the `tidy` agent is applying the `.ki.toml` layout rules and bare trades tables across the Agora. Until it commits, `ki repo audit` fails FILES-10 in Arcadia, the harness and `tools-ki`, and BIO-1 in the harness. Check `claude-bg status gov-020` before assuming it is live.
- **What's left:**
  - Choose the focus and move the surplus Now records to Next - Kris decides, using `focus.md`.
  - Finish the `.ki.toml` tidy and get audits green - the `tidy` agent, then [baseline-rollout](../../Streams/Projects/baseline-rollout.md).
  - Release `tools-ki` v0.8.2, which carries `summary --by project` and the combined Now and Next view - Kris decides (see open questions); [roadmap-model](../../Streams/Projects/roadmap-model.md) closes once it ships.
  - Baseline rollout: [KI-HARNESS-GOV-127](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-127-adopt-dependency-cruiser-estatewide.md), [KI-HARNESS-FND-026](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-FND-026-complete-conform-activation.md) and [KI-HARNESS-GOV-109](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-109-fail-when-commit-gates-absent.md) - [baseline-rollout](../../Streams/Projects/baseline-rollout.md).
  - Run the design loop and the trades hold review, due 2026-10-14 - [skill-refresh](../../Streams/Projects/skill-refresh.md).
  - Finish session acquisition: [KI-HARNESS-OPS-005](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md), [KI-ARCADIA-MOD-006](../../Streams/Roadmap/KI-ARCADIA-MOD-006-knowledge-acquisition-lifecycle.md) and [KI-HARNESS-GOV-087](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-087-evaluate-obscura-browser-runtime.md) - [knowledge-acquisition](../../Streams/Projects/knowledge-acquisition.md).
  - Capture FND-5 as a work record - [estate-factorisation](../../Streams/Projects/estate-factorisation.md).
  - Answer the two decision cards that gate seven Now records - Kris decides, under [paperclip-bootstrap-and-recovery](../../Streams/Projects/paperclip-bootstrap-and-recovery.md).
  - Pick the first repository to review - Kris decides, under [specification-review](../../Streams/Projects/specification-review.md).
  - Review the agent-host prototype on 2026-11-06 and choose a time for the host rebuild - [KI-ARCADIA-GOV-021](../../Streams/Roadmap/KI-ARCADIA-GOV-021-review-the-agent-host-prototype.md), [agent-host](../../Streams/Projects/agent-host.md).
  - Decide on a Delta trial on or after 2026-10-13 - Kris decides, under [delta-evaluation](../../Streams/Projects/delta-evaluation.md).
  - Decide who owns routine background delegation - Kris decides, [KI-HARNESS-GOV-144](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-144-own-portable-background-delegation.md).
  - Map kit-hnr's `[skills.ki-work-roadmap].areas` codes to titles - Kris decides (kit-hnr is outside the Agora).
  - Remove the stale `~/.local/bin/ki` 0.7.1, which shadows the Homebrew `ki` 0.8.1 on PATH - Kris decides.
  - Push or drop chezmoi's unpushed local commits from other threads (`ebc6a19`, `c05815b`, `9c58e46`) - Kris decides.
- **Other thread:** [techne](techne.md) is the separate, paused Techne thread.

## Decisions made

The decisions still in force for the remaining work (full text in `decisions.md`, see Files touched):

- Trades are on hold: send no new trades; do the work directly or record it in the receiving repository.
- Commit minor rollout changes directly, with no work record. Cite records by full identifier.
- Pushing this rollout's own commits is authorised, fast-forward only.
- Awaiting-review and obsolete records may be closed or cancelled and pruned.
- Focus is chosen by Project; Kris makes the choice.

## Files touched

- Design and decisions: `/Users/krisbrown/.local/state/ki/state-of-play/design/` (`decisions.md`, `roadmap-model.md`).
- Agent prompts, statuses and reports: `/Users/krisbrown/.local/state/claude-bg/gov-020/`; `focus.md` there is the per-Project focus view with the recommended Now-to-Next moves.
- Project and Initiative notes: [Projects](../../Streams/Projects/Projects.md) and [Initiatives](../../Streams/Initiatives/Initiatives.md).
- Roadmap model rationale: [GDR-KI-ARCADIA-005](../../Admin/Governance/Decisions/GDR-KI-ARCADIA-005-the-roadmap-model.md).

## Open questions

- **Focus:** which two or three Projects get Now, and are the 19 Now-to-Next moves in `focus.md` approved? It recommends baseline-rollout, skill-refresh and knowledge-acquisition.
- **`tools-ki` v0.8.2 release:** authorise one read-only download of the harness `703f3d66` archive to compute the pin digest, or release on the existing `a27bbb6` pin.
- **Trades hold, by 2026-10-14:** re-enable trades or renew the hold. HOLD-1 warns from 2026-10-15.
- **Paperclip:** answer the two decision cards.
- **Specification review:** which repository first? `tools-ki` is suggested.
- **`KI-HARNESS-GOV-144`:** which skill owns routine background delegation?

## Next step

1. Kris picks the focus Projects from `focus.md` and approves the Now-to-Next moves; apply them in each owning repository.
2. Once the `tidy` agent reports DONE, rerun `ki repo audit` in Arcadia, the harness and `tools-ki` and fix what remains.
3. Kris settles the `tools-ki` v0.8.2 pin question; then release and close the roadmap-model Project.
4. Start `/ki-design-loop start skill-refresh` and settle the trades hold before 2026-10-14.
5. Work the chosen Projects from their records and `ki` views.
