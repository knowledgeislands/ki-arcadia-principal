# ops013-tweaks report: TECHNE-TOOLS-OPS-013 review tweaks P1 and P2

Record: [TECHNE-TOOLS-OPS-013](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-013-guard-agent-host-work.md), still `awaiting-review`. Authority: Decision 11.

## Done

- P1: the host status report now names the machine as `host.id` instead of `host.instance_id`. The guide and the record describe it as a provider-defined identity: the cloud-init instance ID on AWS, and a hardware or install UUID on owned hardware. The schema stays at v1. The AWS `destroy.sh` still checks that the report comes from the host it is about to delete. The status script, `destroy.sh`, the stubbed check fixtures and the guide were updated.
- `tools-techne` does not read `instance_id` from this report. Its `instanceId` comes from AWS. Nothing there needed reporting or changing.
- P2: the guide's opening paragraph no longer gives the 2026-11-06 review date. The recovery route in the guide and in `destroy.sh` now says bundles are "copied to the operator's machine". No "scheduled review" wording was left in the guide.
- The record's body notes both changes under Review → Delivered and in the Change Summary.
- Commit `6fa3235` fix(agent-host): name the host by a provider-defined host.id. It was pushed fast-forward to `origin/main` (`921de5f..6fa3235`), and only that commit was pushed.
- Checks: `bun run test` passed, including the stubbed agent-host workspace, AWS-script and recipe-manifest checks. `ki repo audit --repo .` passed (PASS=17, FAIL=0, plus one existing warning about a missing pre-commit hook). rumdl found no issues. The status script ran only through the stubbed checks. Nothing contacted the host, AWS, Tailscale, SSM or the GitHub API.

## Failed

- None.

## Needs Kris

- Review and accept TECHNE-TOOLS-OPS-013. I did not accept it.
- Scope note: I limited the "the Mac" → "the operator's machine" wording to the recovery route. The guide still mentions the Mac in other places, such as setup, sign-in, the status command and the diagrams. Those belong to P4 or later work.
- The status output still prints the exemption review line with 2026-11-06, and the guide's Status section still describes it. TECHNE-TOOLS-OPS-014 removes both, as planned.
