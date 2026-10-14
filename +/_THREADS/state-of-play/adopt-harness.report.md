# adopt-harness report

Commits on `main` in ki-agentic-harness, pushed fast-forward `fb53c56c..a47f1cc5`:

- `e440152f` chore(roadmap): adopt KI-HARNESS-GOV-165, -166 and -168, defer -163
- `d1ba51a4` refactor(ki-decision-records): retire shared_record
- `a47f1cc5` refactor(ki-batch): compose identifiers from the shared grammar

Checks on the final tree: `bun run test` 1062 pass, 0 fail; `bunx tsc --noEmit` pass; `ki repo audit` for ki-skills (FAIL=0, one older LONG-3 refresh warning), ki-decision-records, ki-specs and ki-work-roadmap all pass; `ki dev skill rubric ki-decision-records` in sync.

## Done

- [KI-HARNESS-GOV-166](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-166-retire-shared-record.md): adopted, planned and implemented. `shared_record` is removed from the ki-decision-records standard, rubric (FM-7 retired), code and tests. GOV-012 is deprecated and GDR-KI-HARNESS-007 trimmed. Now awaiting-review with its review packet.
- [KI-HARNESS-GOV-165](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-165-adopt-process-identifier-grammar.md): adopted, planned and implemented. ki-accept and ki-batch now use the shared identifier grammar, so `5GE-P2`-style codes work in batches. The checker fix it waited on is now installed. Now awaiting-review with its review packet.
- [KI-HARNESS-GOV-168](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md): adopted at `next` and planned as a draft, not implemented. The plan records the bot, credentials and ruleset already on ki-agentic-harness (verified 2026-10-09), and that every further repository needs its ruleset before the bot is installed. The title is shortened to "Roll out pin receivers" to meet the four-word limit.
- [KI-HARNESS-GOV-163](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-163-bun-boundary-proof-adapter.md): deferred to `future` with your one-line reason.

## Needs the owner

- Review and accept [KI-HARNESS-GOV-166](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-166-retire-shared-record.md) and [KI-HARNESS-GOV-165](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-165-adopt-process-identifier-grammar.md).
- Approve [KI-HARNESS-GOV-168](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md)'s plan to Ready, and decide how tools-ki should take its pin: a receiver, or CI building from source.
- The push went straight to `main` through your admin bypass of the new ruleset (pull request and `build` check). Say if you want harness pushes to go through pull requests from now on.
