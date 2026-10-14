---
note_type: streams/project
slug: skill-refresh
title: Skill refresh
outcome: Every Knowledge Islands skill is kept current and still relevant, prompted as part of the repository audit rather than found stale after the fact.
initiative: platform-foundations
lifecycle: planned
lead: Kris Brown
target: null
updated: 2026-10-14T13:49:14Z
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
- **Trades hold review, due 2026-10-21.** Re-enable trades and bring them up to date, or renew the hold. The `ki-trades` HOLD-1 check warns once the date passes.
- **Open choice.** How the audit prompts a REFRESH: a new criterion that fails or warns when a skill is due, a separate audit section, or a `ki` command the audit calls. A design loop (`/ki-pmo-design start skill-refresh`) shapes the Project and its first records.
- An earlier Knowledge Islands Principal mapping of six Knowledge Islands Principal patterns against harness skills was cancelled; its keep, merge or retire question belongs to the relevance check here.
- The scope comes from section 5 of the state-of-play survey (`~/.local/state/claude-bg/gov-020/survey.report.md`) and decisions 12 and 13 of the state-of-play design.
- **Idea: standing-surface design rules in `ki-tokenomics`.** `ki-tokenomics` would tell repository owners how to keep always-loaded instructions small, not only how large they may be: one routing authority per repository (a skill defers to the root instructions rather than restating them); resolved lessons carried in repository guidance (root `AGENTS.md`, the owning skill or the knowledge base) rather than in a runtime's path memory or a load-time note, following Kris's instruction of 12 October 2026 in the state-of-play run to 'move path memory into KBs/projects/AGENTS.md, stop relying on path memory'; review the instructions file as it nears the 2,500-token `instructions` budget; and ask before adding a permanent always-loaded section. A Claude adapter note (merged from a former harness record) would have `ki-tokenomics-claude` explain which Claude context layers load every time and which only on demand, confirmed against current Claude Code behaviour, so a rule meant to hold every time lands in an always-on layer. The first two points may suit the standard or a judgement criterion and the last two educate-mode guidance; a non-blocking handoff from Arcadia Principal, whose source notes are already retired. Kept as an idea on 2026-10-14 in place of a cancelled harness work record: Kris approved the state-of-play thread's roadmap census on 2026-10-14 ('RC-ALL: approve all'), which parked it; whether `ki-tokenomics` takes the points belongs to this Project's keep, merge or retire check.
