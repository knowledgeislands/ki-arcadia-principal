# WT-RULE and COORD-MODEL report

## Done

- Worktree location rule added to the background-run standard's Isolation rule (Decision 2).
- Run-folder retention rule added under the Decisions log section, where run-state consolidation already lives (Decision 2).
- Coordinator rule added at the head of Coordinator responsiveness, pointing to `ki-tokenomics` for the model (Decision 3).
- `ki-tokenomics` model-purpose policy now recommends a fast, low-effort model for coordinating threads, cross-referencing `ki-delegation`; SKILL.md carries a one-line pointer (Decision 3).
- Both skills' `references/sources.md` source reviews updated in the same commits. Rubrics unchanged: RUN-3 already reviews coordinator behaviour, and POL-2's four-type taxonomy is untouched.
- Commits: `c6850675` docs(ki-delegation), `1ba764b8` docs(ki-tokenomics). Fast-forward pushed to `origin/main` (8817b32c..1ba764b8).

Checks: `ki repo audit --skill ki-delegation --repo .` PASS, 0 FAIL (same as baseline); `ki repo audit --skill ki-tokenomics --repo .` PASS, 0 FAIL (same as baseline); `bun run test` 1072 pass, 0 fail; `bunx tsc --noEmit` clean; pre-commit hooks passed (the hook's `ki-skills` audit showed 2 existing LONG-3 refresh-cadence WARNs, no FAIL). Diff touches only the two skills (5 files).

## Rule text

**1. Worktree location** (`skills/governance/ki-delegation/references/standards-background-runs.md`, Coordination > Isolation):

> A background run's worktrees go under `~/.local/state/ki/agents/<run>/worktrees/<repo>`. Before it reports `DONE`, the agent removes each worktree it created with `git worktree remove` and deletes its branch once merged.

**2. Run-folder retention** (same file, Decisions log):

> Once a thread or run has closed and its in-force decisions are consolidated into their durable owners, archive or delete its `~/.local/state/ki/agents/<run>/` folder; `ki agent` writes the run there.

**3. Coordinator model** - in `ki-delegation` (same file, Coordinator responsiveness, first paragraph):

> A coordinating thread - the master thread or a project thread - is a coordinator. It dispatches work, decides with the owner and reports; it hands substantive reasoning, analysis and drafting to background agents rather than doing them in-thread. Because the reasoning happens in those agents, a coordinating thread runs on the lighter model purpose `ki-tokenomics` recommends for coordination, and heavier models are reserved for the background agents.

In `ki-tokenomics` (`references/standards-tokenomics.md`, Model purpose):

> Coordination is a purpose of its own. A coordinating thread, as defined in the `ki-delegation` background-run standard, dispatches, decides with the owner and reports, so it should run on `fast`, or `standard` where `fast` is too weak to follow the run contract reliably, at low reasoning effort. Reserve `reasoning` and `frontier` for the background agents that do the substantive reasoning, analysis and drafting. This is a recommendation for choosing a session's model; it adds no `preferred_model_type` value.

And in `ki-tokenomics/SKILL.md`:

> A coordinating thread runs on a fast, low-effort model and hands heavy reasoning to background agents, under the standard.

## Needs Kris

- **COORD-WORDING:** review the coordinator wording above. I mapped "coordinator purpose" onto the existing `fast` type (with `standard` as a fallback) rather than adding a fifth model type, because the four types are validated config values (`preferred_model_type`, POL-2, ADR-KI-HARNESS-009). Recommendation: keep it as a recommendation, not a new config value.
