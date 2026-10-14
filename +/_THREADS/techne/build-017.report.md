# Build TECHNE-TOOLS-OPS-017 and ready TECHNE-TOOLS-OPS-024

Repository: `ki-techne-harness`. Commits are local only and nothing was pushed.

## Done

- [TECHNE-TOOLS-OPS-017](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-017-zsh-shell-at-rebuild.md) was built as planned and is now awaiting-review. Commits: `508793e` (code, tests, guide) and `602c19b` (review packet).
  - The stack has a `Shell` parameter (zsh by default). `provision.sh` passes `AGENT_HOST_SHELL` to it, and the boot script creates `techne` with that login shell.
  - `converge.sh` no longer writes the `.bashrc` hand-off and removes any old one. It warns, without failing, when the login shell differs from the chosen shell.
  - The marker is now `# >>> ki-agent-host >>>`. Old markers are matched by pattern, so a rerun replaces them rather than adding a second block.
  - The `ki-work-item` tag is replaced by `ki-authority = GDR-KI-ARCADIA-004`. Every work-record identifier has gone from the agent-host stack, scripts, recipe, checks and guide. A new check, `tooling/checks/agent-host-record-ids.sh`, enforces this.
  - The guide and diagrams use `vega`. The guide describes the recipe as "the AWS base for a remote agentic rig", and the recipe name stays `agent-host`.
- [TECHNE-TOOLS-OPS-024](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-024-weekly-pin-bump.md) is now ready (`fb158ca`). All four decisions are recorded as accepted as recommended. A note says implementation waits until the role profile moves to a `roles/` folder (Decision 40(3a)), which state-of-play will hand off. It is not implemented.
- Checks:
  - `bun run test` passed, with mise's Python 3.12.13 first on `PATH`.
  - The plan's identifier grep found nothing.
  - A mutation test confirmed the new workspace checks fail when the behaviour regresses.
  - `ki repo audit` gave PASS=16, WARN=2, FAIL=0. Both warnings were there before this work: `ki-engineering` CI-1 (`KI_VERSION` is pinned inline in ci.yml) and `ki-repo` HOOK-1 (there is no `.githooks/pre-commit`).

## Failed

- The before-rebuild check did not run. It needs AWS: a CloudFormation change set and `validate-template`. This run's rules forbid any cloud call. I tried `bun run self:aws:validate` once at the baseline before noticing it calls AWS. It stopped locally on an expired SSO token, before reaching CloudFormation. I made no other remote call.

## Needs Kris

1. **Do not rerun setup on the current host before the rebuild.** The new `converge.sh` removes the zsh hand-off. Because the current host's login shell is `/bin/bash`, sessions would stay in bash and converge would print a warning every run.
2. Run the before-rebuild check at the last commit before this work:
   - `git -C ki-techne-harness checkout 7f1b708`, then `assume knowledge-islands-techne`.
   - Run `bun run self:aws:validate`, then the change-set command in the guide's "Before a rebuild" section at that commit.
   - Expect `No changes to deploy`. If a change set is created, delete it without executing it.
   - Return to `main`.
3. On `main`, run `bun run self:aws:validate` to accept the new template.
4. Rebuild:
   - Run `CONFIRM_DESTROY_AGENT_HOST=ki-techne-agent-host bash operations/aws/agent-host/destroy.sh rebuild`.
   - In the Tailscale admin console, remove the old `ki-techne-agent-host` device.
   - Store a fresh Tailscale auth key in `/ki/techne/agent-host/tailscale-auth-key`.
   - Run `AGENT_HOST_NAME=vega AGENT_HOST_TAILSCALE_NAME=vega bash operations/aws/agent-host/provision.sh`. The shell defaults to zsh.
   - Run `setup.sh` with `AGENT_HOST_TAILSCALE_NAME=vega` and your profile payload.
5. In chezmoi (handoff, not blocking):
   - Set the binding's `AGENT_HOST_NAME` and `AGENT_HOST_TAILSCALE_NAME` to `vega`.
   - Set the payload manifest's `target_host` to `vega`.
   - Rename the SSH alias to `vega` and drop the old `known_hosts` entry once the host is up.
6. After the rebuild:
   - `ssh vega 'getent passwd techne'` should show zsh.
   - `.bashrc` should have one `# >>> ki-agent-host >>>` block and no hand-off.
   - `status.sh` should report no drift.
   - Then review TECHNE-TOOLS-OPS-017 for acceptance.
