---
type: ki-checkpoint
thread: knowledge-islands-model.knowledge-acquisition
label: 'Knowledge Islands Model: knowledge-acquisition'
role: coordination
state: active
created_at: 2026-10-08T08:35:00Z
updated_at: 2026-10-17T17:22:00Z
---

# knowledge-islands-model.knowledge-acquisition

**Pick-up - mark 2026-10-15T14:59Z (15:59 BST)**

Status: busy. Kris back 2026-10-17 18:15 BST. folder-tidy finished 18:20 BST (`356a3e5`): reports already linked, `run-decisions.md` moved to the run state folder, folder audit clean; its report deleted at this resting point. Running: `checkpoint-audit` (Sonnet), fixing the two ki-pmo audit findings on this checkpoint. Queued: nothing. The run state folder now exists on this machine and holds only the inbox; the old stale `heading-trim` entry is gone with the other machine's state.

Open queries for Kris (option a) recommended for each):

- AUDIT-GATE: accept KI-PRINCIPAL-MOD-006 as done through ki-accept (presented under AWAITING-REVIEW, 17 October), despite other sessions' audit failures. a) accept now. Detail: `mod-006.report.md`.
- ADR-HARBOUR: amend ADR-KI-PRINCIPAL-001's staging wording to match acquire. a) capture a small follow-up record.
- SEED-HOME: where a seed lives in acquire. a) `context/chatgpt/<territory-key>/seeds/<seed-slug>.md` plus an "Open seeds" line, committed in acquire from a pack staged in `-`.
- FIELD-SHAPE: return capture fields. a) accept `ki_project`, `ki_concept`, `ki_island`, `ki_seed`; CAPTURE-CHATGPT.md amended in acquire.
- FOLD-AUTHORITY: Kris's approval of a named fold-back proposal stands in for a record for an Emerging Concepts note. a) yes, except a new note, a folder restructure or `Admin/`.
- FOLD-TRIGGER: fold-back only on Kris's word. a) yes; list tagged, unfolded captures at each mark.
- BACK-LINK: the acquire side (field amendment, seeds folder, `folded` disposition) as one roadmap item in acquire, coordinated by this thread (INTAKE-ROLE). a) yes.
- PILOT-GO: build and stage the Known World seed pack on Sonnet, publishing nothing yet, once state-of-play has copied section 4 of the foundations-coherence report into its thread folder. a) yes.
- INTAKE-SCOPE: INTAKE-ROLE (16 October) returns acquisition coordination here, reversing HANDED-OFF for engineering items. a) launch a read-only stock-take of open acquisition items in acquire and the harness, reported as one list for Kris.

Detail for SEED-HOME to PILOT-GO: `loop-design.report.md`.

Held: DOTFILES-UE-035 with chezmoi. Not started: the harness side of KI-HARNESS-OPS-005. Parked: ChatGPT territory keys to kebab-case names.

Next steps: take Kris's answers, record them in `decisions.md`, then launch the authorised work: ki-accept for KI-PRINCIPAL-MOD-006, the ADR follow-up record, the acquire roadmap item, the stock-take and, once the seed prompt is copied, the seed pack.

Resume line: Resume Knowledge Islands Model: knowledge-acquisition under current ki-pmo and ki-delegation since 2026-10-15T14:59:00Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.

**Messages from Master: state-of-play** - the receiving thread acts on each line, then removes it.

## Objective

The provider-neutral acquisition lifecycle is documented in one Pillars note, AI sessions are acquired into owning repositories with verified retirement of the source, and the browser-runtime and WhatsApp spool questions are settled ([knowledge-acquisition](../../Streams/Projects/knowledge-acquisition.md), Initiative [knowledge-islands-model](../../Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md)).

## Current state

- Open records: [KI-HARNESS-OPS-005](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md) (Now, in progress), [KI-PRINCIPAL-MOD-006](../../Streams/Roadmap/KI-PRINCIPAL-MOD-006-knowledge-acquisition-lifecycle.md) (Next, ready) and [DOTFILES-UE-035](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-035-install-whatsapp-spool-refresh.md) (Hold, chezmoi).
- Run `knowledge-acquisition`: nothing running. `heading-fix` and `heading-trim` finished 2026-10-14 (REPORT-HEADING-GATE from Master: state-of-play): handoff-review.report.md now begins at its heading and is committed and pushed. A stale duplicate `heading-trim` queue entry remains; no dispatcher runs it. `spirit-move` finished 2026-10-14: the 18 Personal - Spirituality packages are in `sacred-inquiry` (acquire 9431269, ki-agentic-harness 17747064, both pushed; 334 still verify). `handoff-review` finished: KI-TOOL-KI-CLI-128 covers the reset data-loss risk in intent with two gaps.
- KI-PRINCIPAL-MOD-006's Granola evidence paths point at the private `acquire` repository (ACQ-PATHS, 2026-10-14). The browser-runtime question (KI-HARNESS-GOV-087) is merged into KI-HARNESS-OPS-005.
- ki-principal commits: the scoped gate is live; commit by explicit path.
- Thread folder tidy at the 2026-10-14T23:26:00Z mark: deleted the handoff-review, heading-fix and heading-trim reports (answered; outcomes in the decisions log, this checkpoint and commits); kept route-local-review (BINARY-HOME and BINARY-HOLD with the master) and decisions.md.
- `acquire` primary checkout is 21 commits ahead of origin with acquire-intake's own unpushed work; not this thread's.
- Token budget (Kris, 2026-10-14): Fable limit hit; until the reset, prefer mechanical work on lower models (Sonnet or Haiku) and defer drafting-heavy work.
- Messages: run inbox read to Decision 1 (INTAKE-ROLE) at 2026-10-17T17:15:00Z.
- 2026-10-17 messages acted on: OWNER-LANE (KI-TOOL-KI-CLI-128 and KI-TOOL-KI-CLI-139 delivered by tools-burndown as the single tools-ki writer; this thread gives priority and acceptance input); GOV-195-RENUMBER (keep KI-HARNESS-GOV-195, change nothing); CI-RED-PRINCIPAL, THREADS-CLEAR and PMO-7-BACKLOG (folder-tidy launched); AWAITING-REVIEW (KI-PRINCIPAL-MOD-006 presented as AUDIT-GATE).
- ki-pmo read at daa63224.
- Thread folder: +/_THREADS/knowledge-acquisition/ ([thread folder](../_THREADS/knowledge-acquisition/)).
- Mark: 2026-10-15T14:59:00Z.

## Decisions made

- Thread working rules (re-read after any compaction): this thread coordinates only the knowledge-acquisition Project and runs substantive work as background agents through `ki agent` in run `knowledge-acquisition`. Coordination follows ki-pmo (three rules: never do substantive work in-thread, every unit goes to a detached background agent, an owner message never pre-empts work in flight; at most five tool calls per turn). Every report to Kris is a ki-delegation owner report (banner; What has been done; What is in progress; Outstanding queries with stable tags; closing reply block), at the quiet level: short timestamped status lines, minimal visible tool use, outcomes only, no raw output, and decisions described by what was decided and when, never by number. Standing rules from the master thread (2026-10-14): burn the roadmap down and capture no new feature records; other threads' committed work may be pushed beneath ours when checks pass, naming it; connection-critical changes need a tested restore path; follow-up releases stop and ask first.
- The master thread `state-of-play` owns cross-project priorities, releases and decisions; this thread works only this Project's records.
- The lifecycle note changes `Pillars/`, so KI-PRINCIPAL-MOD-006 runs through the Enactment Process.
- 2026-10-14 (ACQ-PATHS, from the master thread): repoint KI-PRINCIPAL-MOD-006's Granola paths at the `acquire` repository. Done; reading `acquire` is read-only evidence.
- 2026-10-14: TOWER, move to `personal` (done by `tower-move`); SPIRIT, look more closely first (`spirit-review` done).
- 2026-10-14 (Kris, reply block): SPIRIT move all 18 to `sacred-inquiry`; TOWER-RECORDS keep the routing checkpoint as authority; ORPHANS list only; ACQ-HANDOFF launch handoff-review; GRANOLA-PLAN and GRANOLA-CARRIER close once handoff-review confirms KI-TOOL-KI-CLI-128 covers the reset data-loss risk; BINARY-PROOF closed as accepted, iPhone check with Kris; START-MOD-006 queued behind the scoped gate and the token reset; DIAGRAMS asked of ways-of-working.
- 2026-10-14 (Kris): mark; RESET-FIRST safe reset first, state_root conditional, GRANOLA-PLAN and GRANOLA-CARRIER closed; CHATGPT-OWNER inventory line asked of acquire-intake; HEADING-AUDIT heading-fix launched, reconciliation message pasted to ways-of-working.
- 2026-10-14 (Kris): mark at 2026-10-14T23:26:00Z; handoff-review, heading-fix and heading-trim reports deleted.
- 2026-10-14 (Kris): commit everything this thread does or oversees by explicit path and check finished agents' work is committed and pushed at each report; tidy the thread folder at every mark; 5-minute heartbeat while work runs; ki-principal commits wait for the scoped gate.

## Files touched

- This checkpoint.
- [KI-PRINCIPAL-MOD-006](../../Streams/Roadmap/KI-PRINCIPAL-MOD-006-knowledge-acquisition-lifecycle.md) (Granola paths repointed).

## Open questions

- START-MOD-006 (Kris, 2026-10-15): mod-006 (Sonnet) delivered KI-PRINCIPAL-MOD-006, Acquisition Process note, pushed 600d4d4e, record awaiting-review; queries ADR-HARBOUR and AUDIT-GATE open. loop-design (Sonnet) drafted the seed-and-return loop in loop-design.report.md; queries SEED-HOME, FIELD-SHAPE, FOLD-AUTHORITY open. Nothing running.
- Handed off (HANDED-OFF, Kris, 2026-10-15): acquire-intake owns all acquire work (ACQ-FINISH, RESIZE-RULE, the .acquire/chatgpt/ inventory line, the KI-TOOL-KI-CLI-128 refusal step, BINARY-HOME and BINARY-HOLD); ways-of-working owns DIAGRAMS and the report-heading fix. Not tracked here. Next mark: delete route-local-review, acquire-route and acquire-resize reports.
- START-MOD-006 (held): launch KI-PRINCIPAL-MOD-006 through `ki-implement` once the scoped gate has landed in ki-principal and the token reset has happened.
- Whether the lifecycle note leads the remaining work depends on what KI-HARNESS-OPS-005 has learnt.
- Parked 2026-10-11: ChatGPT territory keys move to kebab-case territory names; island-model-and-tending renames the kit-principal capture folders.

## Next step

Settle the open queries with Kris and delegate what he authorises; commit the ki-principal changes once the scoped gate lands.
