---
note_type: streams/project
slug: skill-refresh
title: Skill refresh
outcome: Every Knowledge Islands skill is kept current and still relevant, prompted as part of the repository audit rather than found stale after the fact.
initiative: platform-foundations
lifecycle: planned
lead: Kris Brown
target: null
updated: 2026-10-07T19:00:00Z
author: Written with Claude
---

# Skill Refresh

## Outcome

Every skill in `ki-agentic-harness` is kept current and still earns its place. The test: `ki repo audit` prompts each skill's REFRESH mode when it falls due, every REFRESH asks whether the skill should be kept, merged or retired, one master checklist covers updating and double-checking every skill, and every skill has a `sources.md`.

This Project sits in [[platform-foundations|Platform foundations]]. Kris agreed it on 2026-10-07 (decisions 12 and 13 of the state-of-play design).

---

## Notes

- **What exists.** The `ki-skills` rubric carries four longevity criteria. LONG-1 and LONG-2 are judgement checks for a refresh path and a declared cadence. LONG-3 warns when the stalest `last reviewed` date in `sources.md` is past cadence plus 14 days. LONG-4 checks the `**Refresh:**` marker. Every skill has a REFRESH mode that states its ownership precondition.
- **The gap.** Nothing prompts every skill's REFRESH. LONG-3 only warns after the fact, and only when someone runs an audit. No REFRESH asks whether the skill should still exist. The housekeeping template checks source freshness only for skills that changed; it could walk every due skill instead.
- **Scope.** One master checklist for updating and double-checking every skill, kept in the harness beside the `ki-skills` standard; every REFRESH prompted as part of `ki repo audit`; every REFRESH asking keep, merge or retire and recording the answer; and a `sources.md` for the five skills without one (`ki-next`, `ki-plan`, `ki-pulse`, `ki-trade` and `ki-repo-kb-principal`).
- **Trades hold review, due 2026-10-14.** Re-enable trades and bring them up to date, or renew the hold. The `ki-trades` HOLD-1 check warns once the date passes.
- **Open choice.** How the audit prompts a REFRESH: a new criterion that fails or warns when a skill is due, a separate audit section, or a `ki` command the audit calls. A design loop (`/ki-design-loop start skill-refresh`) shapes the Project and its first records.
- An earlier Arcadia mapping of six Arcadia patterns against harness skills was cancelled; its keep, merge or retire question belongs to the relevance check here.
- The scope comes from section 5 of the state-of-play survey (`~/.local/state/claude-bg/gov-020/survey.report.md`) and decisions 12 and 13 of the state-of-play design.
