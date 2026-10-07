---
note_type: streams/project
slug: skill-refresh
title: Skill refresh
outcome: Every Knowledge Islands skill is kept current and still relevant, prompted as part of the repository audit rather than found stale after the fact.
initiative: platform-foundations
lifecycle: planned
lead: Kris Brown
target: null
updated: 2026-10-07T17:45:00Z
author: Written with Claude
---

# Skill Refresh

## Outcome

Every skill in `ki-agentic-harness` is kept current and still earns its place. The test: `ki repo audit` prompts each skill's REFRESH mode when it falls due, every REFRESH asks whether the skill should be kept, merged or retired, one master checklist covers updating and double-checking every skill, and every skill has a `sources.md`.

This Project sits in [[platform-foundations|Platform foundations]]. Kris agreed it on 2026-10-07 (decisions 12 and 13 of the state-of-play design).

---

## Update

**2026-10-07.** Created as `planned`. The scope comes from section 5 of the GOV-020 state-of-play survey.

- **Health.** Not started. Nothing blocks the first step.
- **What exists.** The `ki-skills` rubric carries four longevity criteria. LONG-1 and LONG-2 are judgement checks for a refresh path and a declared cadence. LONG-3 warns when the stalest `last reviewed` date in `sources.md` is past cadence plus 14 days. LONG-4 checks the `**Refresh:**` marker. Every skill has a REFRESH mode (KI-SHAPE-12) that states its ownership precondition (KI-SHAPE-14).
- **The gap.** Nothing prompts every skill's REFRESH. LONG-3 only warns after the fact, and only when someone runs an audit. No REFRESH asks whether the skill should still exist. Housekeeping template HK-001 checks source freshness only for skills that changed.
- **State on 2026-10-07.** Of 61 skills, 21 are `canonical · on-change` and the rest have an external cadence. `ki-repo-mcp` is past due (LONG-3 WARN); five more are close to due.

### Scope

- **Master checklist.** One checklist for updating and double-checking every skill, kept in the harness beside the `ki-skills` standard.
- **Prompting mechanism.** Every REFRESH mode is prompted as part of the repository audit (`ki repo audit`), not only as a LONG-3 WARN after the fact.
- **Relevance question.** Every REFRESH asks keep, merge or retire, and records the answer.
- **Missing sources.** Five skills have no `sources.md`: `ki-next`, `ki-plan`, `ki-pulse`, `ki-trade` and `ki-repo-kb-principal`.
- **Trades hold review, due 2026-10-14.** Re-enable trades and bring them up to date, or renew the hold. The `ki-trades` HOLD-1 check now warns once the date passes.

### Decision

How the audit prompts a REFRESH: a new criterion that fails or warns when a skill is due, a separate audit section, or a `ki` command the audit calls. The test: the choice is recorded in the design loop's report.

### Next step

Kris runs `/ki-design-loop start skill-refresh` to shape the Project and its first records.

---

## Open records

Membership is classification, not authority. Status lives in each record.

None yet. The design loop creates the first records.

---

## Ideas

- `KI-ARCADIA-EXT-003` (cancelled and pruned on 2026-10-07) mapped six Arcadia patterns against harness skills. Its keep, merge or retire question belongs to the relevance check here.
- HK-001 could walk every due skill instead of only the changed ones.

---

## Sources

- GOV-020 state-of-play survey, section 5 (`~/.local/state/claude-bg/gov-020/survey.report.md`), 2026-10-07.
- Decisions 12 and 13 in the state-of-play design (`~/.local/state/ki/state-of-play/design/decisions.md`).
