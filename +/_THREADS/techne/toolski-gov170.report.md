# toolski-gov170 report

## Done

- **tools-ki:** captured triage record [KI-TOOL-CLI-116](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/docs/roadmap/KI-TOOL-CLI-116-launcher-held-wait-gates.md), "Launcher-held wait gates", for the `ki agent launch --wait-for` bug. Commits `87539a3` (reserve number) and `0e2664c` (record). `ki repo audit`: PASS=20 WARN=2 FAIL=0. Both warnings were already there: the CI pin is set inline, and there is no committed pre-commit gate.
- **ki-agentic-harness:** adopted [KI-HARNESS-GOV-170](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-170-keep-resolution-targets-local.md) from triage to `draft` at horizon **Next**, with `kind: deliver`, `purpose: governance` and `component: change-management`. Next is the right horizon because the work is bounded and understood, it follows Decision 35, and it can be planned straight away. The repository's other bounded work, KI-HARNESS-GOV-168 and KI-HARNESS-GOV-169, is also at Next. Adopted records must have the full section set, so I added Current state, Steps, Files touched, Verify, Dependencies, Documentation impact and Discussion. Commit `97293f1e`. `ki repo audit`: PASS=30 WARN=2 FAIL=0. The 7 warning findings were already there: stale review dates in the model radar and in the skills sources.
- Nothing was pushed. Every commit used explicit paths only.

## The wait bug, in plain terms

- **What happens:** an agent launched to wait for another agent sometimes stops while it waits and never starts its real work. The run then shows it as "exited without DONE". On 2026-10-09 this happened in a chain: `naming` stopped within a minute of starting to wait, and `naming2` passed its wait to a background watcher and ended at 19:21. `build-015b` finished at 19:28, but nothing woke `naming2`. `rename-agent-host2` was waiting for `naming2`, so it could never start, and it gave up at about 19:52.
- **Why:** in `ki` 0.10.0, `--wait-for` only adds a paragraph to the prompt asking the agent to keep checking. This has not changed since `ki agent` arrived in 0.8.4. `ki` starts the agent at once. Background agents run in one-shot mode, where the session ends as soon as the agent stops its turn. If the agent hands the wait to something else or simply stops, nothing can bring it back. There is a Claude setting meant to prevent this, and it did not prevent it. Codex has no guard at all.
- **How often it bites:** any time `--wait-for` is used behind a long-running agent. That happened three times out of three on 2026-10-09. One failure also strands every agent queued behind it.
- **The fix:** make `ki` itself hold the waiting agent and start it only once every named agent has written DONE. One way is a small holding process, like the existing dispatcher. Another is to let the dispatcher honour wait conditions on queued agents. If an agent it waits for ends without DONE, the held agent should stop with a clear message.
- **Workaround until then:** don't use `--wait-for`. Launch the dependent agent yourself once the first one reports. Or queue the agents in order with `ki agent queue` and run `ki agent dispatch <run> --max 1`, so each one starts only after the one before it has finished.

## Needs the owner

- Confirm two scope points on KI-HARNESS-GOV-170 that came up while adopting it. First, the rubric file path in its Boundary was wrong; I corrected it to `skills/change-management/ki-work-roadmap/scripts/rubric/contexts/roadmap-evidence.ts`. Second, the `ki-accept` acceptance standard also allows cross-repository targets and will need the same change. The record also leaves one question for planning: once targets must be in the same repository, how should a duplicate or merge into another repository's work be recorded?
