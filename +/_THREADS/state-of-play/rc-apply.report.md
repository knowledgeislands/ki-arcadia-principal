# rc-apply: roadmap census burn-down outside the harness

Owner report for the Master: state-of-play thread, under Decision 183. Written 2026-10-14.

## Done

The approved census is applied in all five repositories, and each is pushed fast-forward and level with `origin/main`. Every record was re-read first. A park cancels the record as `rejected` with a `## Cancelled` note, following the KI-HARNESS-GOV-162 precedent, and carries its substance into the Project note. The cancellation commit always lands before the prune-only commit. Cancellation notes quote Kris's words ('RC-ALL: approve all') rather than citing a decision number, which matches the citation sweep in KI-PRINCIPAL-ECO-014.

| Repository | Before | After | What changed |
| --- | --- | --- | --- |
| ki-techne-harness | 5 | 3 | KI-TECHNE-OPS-019 and KI-TECHNE-OPS-023 parked in agent-host, then pruned. KI-TECHNE-OPS-027 left awaiting review. |
| tools-techne | 1 † | 1 | [KI-TOOL-TECHNE-CLI-006](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-006-guarded-host-commands.md) held to 2026-11-12 (`waiting-for`, until agent-host work resumes). Its link to the pruned patching record now points to a pinned history copy. |
| tools-ki | 5 | 5 | [KI-TOOL-KI-CLI-115](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-115-enforce-roadmap-writing-checkout.md) parked in agent-host and kept as a cancelled record ‡. KI-TOOL-KI-CLI-125 was already held to 2026-11-16, so it needed no change. KI-TOOL-KI-CLI-123, 124 and 126 untouched. |
| tools-rig | 9 | 6 | KI-TOOL-RIG-CORE-051 accepted as done on its fixture evidence (20 of 20 firewall tests re-run green, audit passes), then pruned. KI-TOOL-RIG-CORE-049 cancelled as merged into [KI-TOOL-RIG-CORE-048](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-048-signed-release-install-kind.md), whose Boundary and Discussion now carry its Goal and Boundary, then pruned. KI-TOOL-RIG-CORE-046 parked in mac-studio-bootstrap, then pruned. KI-TOOL-RIG-CORE-047's links to the pruned records now point to pinned history copies. KI-TOOL-RIG-CORE-047 left awaiting review. |
| ki-specifications | 1 | 0 | KI-SPEC-KIN-003 parked in specification-review, then pruned. |
| Total | 21 | 15 | |

† The census counted 2 here. Another thread had already pruned KI-TOOL-TECHNE-CLI-008 in local commit `5ae3684`, which was unpushed. Its committed `done` state came first, and the repository's typecheck, 101 of 101 tests and the audit passed, so I pushed it with my commits under Decision 165.

‡ Not pruned: in-progress [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md) links to its file twice, and ways-of-working owns that record.

Project notes in ki-principal (commit `430a9ed`, staged by explicit path): new ideas in [agent-host](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/agent-host/agent-host.md) (person-neutral recipe defaults, no record identifier in stack tags, `ki` refusing roadmap writes on the host), [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) (remote access and continuity in Rig) and [specification-review](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/specification-review.md) (portable live-artifact contract).

Checks: `ki repo audit` shows FAIL=0 in ki-techne-harness, tools-techne, tools-rig and ki-specifications. Two other results are failures I did not cause:

- tools-ki: DEPS-1 fails because vitest, @vitest/coverage-v8 and knip updates are past the 14-day window. Its roadmap audit passes.
- ki-principal: the Markdown gate fails on another thread's untracked `+/_THREADS/knowledge-acquisition/route-local-review.report.md`, and four checkpoint schema failures belong to other threads' checkpoints. My three Project-note files pass `rumdl`, the commit hook's scoped audit passes (FAIL=0), and a STREAM-9 failure my first draft caused is fixed.

## In progress

- **ki-principal is committed but not pushed.** It is 2 ahead and 2 behind `origin/main`. Another thread's work blocks `git pull --rebase`: an uncommitted change to `+/_THREADS/ways-of-working/decisions.md`, and an untracked `+/_THREADS/chezmoi/` folder that clashes with incoming tracked files of the same names. I left that work alone. The unpushed commits are mine, `430a9ed`, and another thread's `7e5759b` (checkpoint: receive acquire-intake handoffs and launch review).

## Needs the owner

- **RCA-PRINCIPAL-PUSH.** ki-principal needs pulling and pushing once the chezmoi and ways-of-working threads commit or move their files. Recommendation: the master thread pushes it then, or asks ways-of-working to push it with its own work.
- **RCA-CLI115-PRUNE.** KI-TOOL-KI-CLI-115 is cancelled but kept, because in-progress KI-PRINCIPAL-ECO-014 links to it. Recommendation: once ways-of-working closes KI-PRINCIPAL-ECO-014 or changes the link to bare text, prune KI-TOOL-KI-CLI-115 in a prune-only commit.
- **RCA-RIG-ADR010.** ADR-KI-TOOL-RIG-010 (Linux firewall through a Rig-owned nftables table) is still `proposed`, although KI-TOOL-RIG-CORE-051, which delivered it, is now done. The census did not cover the ADR. Recommendation: accept it alongside KI-TOOL-RIG-CORE-047's ADR after Kris's live check, or now if Kris prefers.
- **RCA-KI-DEPS.** tools-ki fails DEPS-1. Recommendation: no action from this run. It is upkeep for the tools-ki owner and does not block roadmap work.

```text
RCA-PRINCIPAL-PUSH - master pushes later / ask ways-of-working / other:
RCA-CLI115-PRUNE - prune after ECO-014 closes / other:
RCA-RIG-ADR010 - accept with CORE-047 / accept now / other:
RCA-KI-DEPS - leave to the tools-ki owner / other:
```
