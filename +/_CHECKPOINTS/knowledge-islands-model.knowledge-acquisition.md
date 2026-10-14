---
type: ki-checkpoint
thread: knowledge-islands-model.knowledge-acquisition
label: 'Knowledge Islands Model: knowledge-acquisition'
state: active
created_at: 2026-10-08T08:35:00Z
updated_at: 2026-10-14T09:15:00Z
---

# knowledge-islands-model.knowledge-acquisition

## Objective

The provider-neutral acquisition lifecycle is documented in one Pillars note, AI sessions are acquired into owning repositories with verified retirement of the source, and the browser-runtime and WhatsApp spool questions are settled ([knowledge-acquisition](../../Streams/Projects/knowledge-acquisition.md), Initiative [knowledge-islands-model](../../Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md)).

## Current state

- Open records: [KI-HARNESS-OPS-005](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md) (Now, in progress), [KI-PRINCIPAL-MOD-006](../../Streams/Roadmap/KI-PRINCIPAL-MOD-006-knowledge-acquisition-lifecycle.md) (Next, ready) and [DOTFILES-UE-035](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-035-install-whatsapp-spool-refresh.md) (Hold, chezmoi).
- Re-bootstrapped 2026-10-12 while the master thread still lists this thread as queued behind Fnd: baseline-rollout. Run: `knowledge-acquisition`. `chatgpt-bind` (BIND, Decision 1) finished 2026-10-14: all 17 ChatGPT project identifiers bound in KI-HARNESS-OPS-005 and all 334 export conversations staged into `acquire` under `captures/<territory>/chatgpt/account-export-2026-09-22/` (21 in `_review`); the record stays `in-progress`. Nothing running.
- KI-HARNESS-OPS-005 was waiting on its 2026-10-04 question: bind the export's 17 `g-p-` project identifiers to project names. The master thread's `chatgpt-sort` agent (Decision 137) saved the cloud project list before its renames, at `~/.local/state/ki/agents/state-of-play/backups/chatgpt-sort-20261012T1043/chatgpt-cloud-projects-before.tsv`. Its 17 identifiers match the export's 17 exactly. The 17 projects now follow Decision 135 naming (`<Territory> - <Sub-area>`); the `Kit:`, `HNR:` and `<Domain>: General` names are prior names. No chats moved. The listing sits in machine-local run state only.
- The browser-runtime question (KI-HARNESS-GOV-087) is merged into KI-HARNESS-OPS-005 as its isolated-browser-trial step.
- KI-PRINCIPAL-MOD-006's Granola evidence paths now point at the private `acquire` repository (`.acquire/granola/ledger.json`, `captures/*/granola/`), which has received every Granola capture since 2026-10-10 (ACQ-PATHS, 2026-10-14).
- ki-delegation read at d4e2d8e8.
- Mark: 2026-10-14T09:15:00Z, decisions log at Decision 3.

## Decisions made

- Thread working rules (re-read after any compaction): this thread coordinates only the knowledge-acquisition Project and runs substantive work as background agents through `ki agent` in run `knowledge-acquisition`. Every report to Kris is a ki-delegation owner report (banner; What has been done; What is in progress; Outstanding queries with stable tags; closing reply block), at the quiet level: short timestamped status lines, minimal visible tool use, outcomes only, no raw output. Standing rules from the master thread (2026-10-14): burn the roadmap down and capture no new feature records; other threads' committed work may be pushed beneath ours when checks pass, naming it; connection-critical changes need a tested restore path; follow-up releases stop and ask first.
- The master thread `state-of-play` owns cross-project priorities, releases and decisions; this thread works only this Project's records.
- The lifecycle note changes `Pillars/`, so KI-PRINCIPAL-MOD-006 runs through the Enactment Process.
- 2026-10-14 (ACQ-PATHS, from the master thread): repoint KI-PRINCIPAL-MOD-006's Granola paths at the `acquire` repository. Done; reading `acquire` is read-only evidence.

## Files touched

- This checkpoint.
- [KI-PRINCIPAL-MOD-006](../../Streams/Roadmap/KI-PRINCIPAL-MOD-006-knowledge-acquisition-lifecycle.md) (Granola paths repointed).

## Open questions

- TOWER (open): The Tower Game's 15 conversations sit in `acquire` `captures/_review/`; move to `personal` or keep in `_review`.
- SPIRIT (open): Personal - Spirituality's 18 conversations are in `personal`; keep or move to `sacred-inquiry`.
- ORPHANS (open): 77 export files (about 106 MB) belong to no conversation and are listed only; stage to `_review` or leave listed.
- Whether the lifecycle note leads the remaining work depends on what KI-HARNESS-OPS-005 has learnt.
- 2026-10-11 (from island-model-and-tending, parked): ChatGPT territory keys move to kebab-case territory names (knowledge-islands, humans-not-robots, equal-remedy, valle-armonia, techmedix, legal, personal); island-model-and-tending renames the kit-principal capture folders. Use the new keys when reconciling ChatGPT captures.

## Next step

Settle TOWER, SPIRIT and ORPHANS with Kris and delegate the moves; then start KI-PRINCIPAL-MOD-006 through `ki-implement`.
