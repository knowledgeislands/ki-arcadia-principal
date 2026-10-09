---
type: ki-checkpoint
thread: territory-rollout
state: active
created_at: 2026-10-09T07:05:00Z
updated_at: 2026-10-09T07:05:00Z
---

# territory-rollout

## Objective

Roll the Knowledge Islands shape out to Kris's other territories, so that each repository in the registry follows the same model of Initiatives, Projects, roadmap and audit as the knowledgeislands territory. The territories are kit (personal and legal), hnr (including 5g-emerge), equalremedy, vallearmonia, infoschematics, techmedix and any others in `ki registry list`. This checkpoint gathers what that rollout needs; it is not yet a Project.

## Current state

- **Not active, no thread.** There is no Project or roadmap record yet. Kris deferred other territories' Initiatives in the GOV-020 decisions log (Decision 5, 2026-10-09) and asked for this checkpoint to collect what the rollout needs.
- **Recurring work with no Initiative registry.** kit-legal (24 active Activities) and kit-midnight.ninja (MIDNIGHT-HK-001 and MIDNIGHT-HK-002) have recurring work but no Initiative registry to home it, so `ki-repo-kb-activities` ACT-F-5 warns (gov-020 `streams-homes-r`).
- **Audit state from registered paths** (gov-020 `dr-after-r` and `drscope`, 2026-10-08):
  - PASS: vallearmonia-principal. kit-techmedix gave PASS=19 WARN=1 and kit-legal gave PASS=20 WARN=2 (`streams-homes-r`).
  - vallearmonia-website: Decision Records now pass. Pre-existing `ki-work-roadmap` failures remain (8 ITEM-1, 14 ITEM-2, ROAD-6, ROAD-7), as do 3 `ki-guides` GUIDE-6 failures.
  - 5g-emerge-demos: pre-existing ROAD-6 (retired themes), ROAD-7 (`_ISSUES.md` `last_id`), and ITEM-1 and ITEM-2 on 5GE-DEMO-DBD-027.
  - kit-hnr: fails the new `ki-repo-kb` LINK-1 check, with ambiguous `[[Integrations]]` and `[[Linear]]` in 27 July 2026 Calendar session notes. It also held 3 unpushed Phase 3 commits from another thread.
  - kit-principal: fails the new LINK-1 check.
  - hnr-shared has no `.ki.toml`, so `ki repo audit` does not apply.
  - Not yet audited for this rollout: the other 5g-emerge repositories, er-research, er-agentic-harness, dafacts-website, hnr-agentic-harness, infoschematics, kit-kris.me.uk, kit-midnight.ninja and mark-markhowarth.com.
- **Retired Agora declarations.** `streams-homes-r` found that kit-hnr, er-research, kit-legal, kit-techmedix, kit-principal and vallearmonia-principal still declared `[skills.ki-agora]`, which stopped `ki repo audit` in kit-hnr. Check whether this has since been cleared.

## Decisions made

- The master thread `state-of-play` owns priorities and decisions; this checkpoint only gathers the evidence.
- Each island keeps its own source access, canonical acceptance and product ownership. The territory confers no cross-repository write authority (Arcadia `AGENTS.md`).

## Files touched

None yet. Evidence is in `~/.local/state/ki/agents/gov-020/` (`dr-after-r.report.md`, `drscope.report.md`, `streams-homes-r.report.md`).

## Open questions

- Which territory goes first, and does each territory get its own Initiative registry or Projects homed in its principal island?
- Whether to fix the pre-existing audit failures before the rollout or as part of it.

## Next step

When Kris activates this thread, run `ki repo audit` from every registered path outside knowledgeislands, then propose a Project, its home and its first records to `state-of-play`.
