# coord-hard report

## Done

- Coordinator responsiveness in `ki-delegation` is now a set of hard, checkable rules covering the turn budget, what never happens in-thread, waiting, brief-writing, the self-check and owner messages (Decision 11, with Decisions 3 and 8).
- Both openers in Opening a thread now carry `Role: coordinator only - dispatch, decide with me, report; delegate all substantive work and stay responsive.` Bootstrap step 4 now has the thread state its coordinator role in its three-line report.
- RUN-3 (judgment) already reviewed coordinator behaviour, so its description and review prompt were tightened to check the new rules. `references/rubric.md` was regenerated and `references/sources.md` gained a review entry, all in the same commit.
- Commit `1fe17e23` `docs(ki-delegation): make coordinator responsiveness hard, checkable rules` touches only `skills/governance/ki-delegation/`. It was pushed to `origin/main` as a fast-forward (`1ba764b8..1fe17e23`).
- Checks: `ki repo audit --skill ki-delegation --repo .` PASS with no FAIL. `bun test skills/governance/ki-delegation` 18 pass, 0 fail. Pre-commit hooks passed: lint-staged clean, and the staged `ki-skills` audit had FAIL=0 and two pre-existing LONG-3 refresh-cadence WARNs on sources older than this change. The full `bun run test` and `bunx tsc --noEmit` were not run separately (no `.ts` type surface changed beyond two string literals).

## Final Coordinator responsiveness text

## Coordinator responsiveness

A coordinating thread - the master thread or a project thread - is a coordinator. It dispatches work, decides with the owner and reports; it hands substantive reasoning, analysis and drafting to background agents rather than doing them in-thread. Because the reasoning happens in those agents, a coordinating thread runs on the lighter model purpose `ki-tokenomics` recommends for coordination, and heavier models are reserved for the background agents.

The coordinating thread stays responsive to the owner, so the owner never has to remind it to delegate. These rules are hard and checkable from its transcript:

- **Turn budget:** a coordinator turn makes a handful of quick tool calls and returns to the owner. A step goes to a background agent if it reads more than one or two short files, writes or edits more than a checkpoint line or a decision, runs tests, audits or builds, or would take more than about a minute.
- **Never in-thread:** analysis, design, drafting prose or prompts longer than a short brief, code or document edits, multi-repository investigation, and waiting in the foreground for an agent.
- **Waiting:** always through a detached [waiter](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md#run-queue) or [monitor](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md#monitoring), never a foreground wait or sleep.
- **Brief-writing:** the coordinator writes only a short brief citing the owner's decisions. If the brief itself needs research, a background agent researches and writes it.
- **Self-check:** before each tool call, the coordinator asks whether it is a quick check or bookkeeping; if not, it delegates. When it notices it has drifted into doing work, it stops, delegates the rest and tells the owner in one line.
- **Owner messages:** a new owner message is a steering request, not a stop. The thread folds it into running and queued work - redirecting, re-queuing or recording a decision as needed - and keeps going. It stops or aborts a background agent or piece of work only when the owner expressly says to stop or abort it, naming the work. Because it is never mid-way through long work, it answers an owner message promptly.
