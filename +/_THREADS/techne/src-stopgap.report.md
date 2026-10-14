# SRC-STOPGAP: owner report

## Done

- **vega repaired.** Made the empty directory `~/.local/share/ki/stores/ki-principal-sources-absent` (mode 0555, no marker needed) and bound ki-principal's `sources` role to it with `ki repo store bind sources <dir> --write`. `ki repo --estate repair` now passes (`REPOSITORIES=20 RESULT=PASS`). `diag` reports `HEALTHY=20 REPAIRABLE=0 UNREPAIRABLE=0`, and the store list shows both roles bound. Skills are projected into ki-principal, whose checkout stays clean. Nothing else on vega was changed.
- **Runbook.** `docs/guides/operator/agent-host.md` has a new "Sources stand-in" section under Workspace setup. It covers why the stand-in is needed, the commands, and how to remove it once ki can mark a store absent on a host. The ki bullet in the converge list links to it.
- **converge.sh.** I made the small change. Before repair, it binds any declared repository whose `sources` role is unbound to an empty 0555 stand-in, named `<repo>-sources-absent`. The step does nothing once a role is bound, so a rebuilt host repairs without a manual step. It was not run end to end on vega, because that would have touched more than this one change. The skip path was checked against vega's live store list.
- **Checks.** shellcheck and rumdl pass, and the pre-commit hooks passed on commit. Run as `AGENT_HOST_TAILSCALE_NAME=vega bash operations/aws/agent-host/status.sh`, status reports `REPOSITORIES=20 AT_RISK=0 UNKNOWN=0 OUTCOME=clean`. Without that variable it falls back to the default name `ki-techne-agent-host`, which does not resolve.
- **Commit.** `c77c7d9 fix(agent-host): bind an empty read-only sources stand-in on the host` in ki-techne-harness, staged by explicit path. There were no other uncommitted files in the tree.

## In progress

- **Not pushed.** ki-techne-harness `main` on this Mac is 1 commit ahead of origin, so it is not yet level with origin. The brief contradicted itself: step 3 said to pull and push, but its Rules said never push and no Git fetch. I followed the stricter rule.

## Queries

- **Needs PUSH:** May I run `git pull --rebase` and push `c77c7d9` to ki-techne-harness origin/main? Until then, the commit is unpushed on this Mac, branch `main`.
- **Needs CONVERGE-RUN:** Should the new converge step be exercised on vega with a full `setup.sh --pull` run? With the stand-in already bound, the step would make no change. Or should that wait for the next routine setup run?

```text
PUSH: yes | no
CONVERGE-RUN: now | next routine run
```
