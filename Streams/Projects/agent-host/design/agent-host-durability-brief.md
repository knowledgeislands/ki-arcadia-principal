# Keeping work safe on the agent host: brief

**Owner:** Kris Brown · **Owning repository:** knowledgeislands/ki-arcadia-principal (Project `agent-host`, Initiative `techne`) · **Date:** 2026-10-07

## Problem

The agent host `ki-techne-agent-host` now holds a second working checkout of the 21 Knowledge Islands repositories, and agents commit there in sessions Kris opens. Nothing yet keeps that work safe or unambiguous:

- **Stop and teardown ignore unlanded work.** `stop.sh`, `destroy.sh`, `techne host stop` and `techne host teardown` act without looking at the host's repositories. Teardown destroys the root volume, so a commit that was never pushed is lost for good.
- **The teardown paths disagree.** `destroy.sh` deletes the stack and all three parameters, including the GitHub token. `techne host teardown` terminates only the instance and leaves the stack. Today's rebuild needed neither: the operator deleted only the stack to keep the token.
- **Two checkouts of one repository have no rule.** Work can sit unpushed on one machine while the other moves on. Roadmap serials have already collided once, because the roadmap standard requires one designated writing checkout per repository and none is named.
- **The host's tool pins drift.** Nothing updates them, and the `ki` pin is already behind the Mac.
- **Expiries are visible only on request.** `status.sh` reports them, but only when someone runs it, and the GitHub token expires on the day of the exemption review.

These were the follow-ups `TECHNE-TOOLS-OPS-011` left open at its acceptance. That record is pruned, so the [[agent-host]] Project note's Ideas are now their only home.

## Owner's proposal

The owner's proposal is the governing mandate together with Kris's instruction to run this loop. It sets the goal and the subject, not the shape, which is why this design loop is needed.

- [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]], Decision, Scope: "Setting up and operating the single agent host `ki-techne-agent-host`, the EC2 instance tagged `ki-agent-host-id=agent-host` in the Techne account `655383751458` in `eu-west-1`, properly and durably. This covers building, rebuilding or replacing that one host through the `ki-techne-harness` stack; its rerunnable workspace setup, updates and status; its operator commands in the `techne` CLI, acting only on that host; its account-local operator role, its `/ki/techne/agent-host/` parameters, and its tailnet tag and policy entries; and rotating its credentials."
- The same decision, Bounds: "Agents commit with explicit paths, push only when Kris asks, and never prune or accept. A kill switch and a teardown stay documented and available."
- Kris, 2026-10-07, when this subject was proposed for a design loop: "The design loop subjects are good, we need to do that".

## Established facts

Repository revisions read: `ki-techne-harness` `a3071b6`, `tools-techne` `82a5b99` and `ki-arcadia-principal` `c9b4f54`, all on 2026-10-07. `TECHNE-TOOLS-OPS-011` was read from the harness's Git history at its acceptance commit `de05a78`.

### Authority and scope

- The exemption covers rerunnable workspace setup, updates and status, the `techne` operator commands, rebuilding through the stack, the `/ki/techne/agent-host/` parameters and credential rotation for this one host. Agents run only in sessions Kris opens and push only when Kris asks. A kill switch and a teardown must stay documented and available. - GDR-KI-ARCADIA-004; `Admin/Governance/Policies/Techne Programme Hold.md`
- Withdrawing the exemption at the 2026-11-06 review means teardown: the stack, its parameters, the tailnet device and policy entries, the GitHub token, the operator role and the chezmoi entries. - `Streams/Roadmap/KI-ARCADIA-GOV-021-review-the-agent-host-prototype.md`
- `ki-techne-harness` owns the stack, scripts and runbook. `tools-techne` owns the `techne` CLI. The chezmoi source owns Kris's Mac-side tooling and personal instructions. Arcadia owns the decision. - ADR-TECHNE-003; GDR-KI-ARCADIA-004 Consequences

### Stop and teardown today

- `stop.sh` stops the tagged running instance with the operator profile. It does not look at the host's repositories. The runbook only says "If time allows, run Status first so nothing unlanded is lost". - `operations/aws/agent-host/stop.sh`; `docs/guides/operator/agent-host.md`, Kill switch
- `destroy.sh` needs `CONFIRM_DESTROY_AGENT_HOST=ki-techne-agent-host` and refuses a stack without the right tag. It then deletes the stack, waits, and deletes `tailscale-auth-key`, `github-token` and `model-api-key` under `/ki/techne/agent-host/`. It does not look at the repositories. - `operations/aws/agent-host/destroy.sh`
- Today's rebuild found that `destroy.sh` also deletes the GitHub token parameter, so the operator kept the token by deleting only the stack. - Kris's instruction for this brief, 2026-10-07
- The root volume and network interface are `DeleteOnTermination: true`. Terminating the instance or deleting the stack therefore destroys every checkout on the host, while stopping keeps the volume. - `infra/aws/agent-host-stack.yaml`, lines 228 and 235
- `techne host stop` calls the provider's `stop-instances` with no workspace check. `techne host teardown` needs an interactive terminal and the typed instance ID, then calls `terminate-instances`. It does not delete the stack, and it lists what remains: the CloudFormation stack, the SSM parameters, the operator role and profile, the tailnet device and tag, and the SSH entry. - `tools-techne` `src/cli.ts` `hostStop` and `hostTeardown`; `ki-techne-harness` `recipes/direct-host/recipe.toml` `footprint`
- `provision.sh` refuses to run while the `ki-techne-agent-host` stack exists. After a `techne host teardown`, a rebuild therefore needs the stack deleted as well. - runbook, Build
- The runbook's "Before a rebuild" step is a no-change CloudFormation change set. There is no documented rebuild sequence that keeps the parameters. - runbook, Before a rebuild and Teardown

### Status

- `host/status.sh` reads, for each repository under the workspace, the branch, uncommitted files (including untracked ones), commits that no remote-tracking ref contains, stashes, and ahead and behind against the last fetch. It flags each risky repository `AT RISK` and ends `summary: REPOSITORIES=n AT_RISK=m`. It changes and fetches nothing, and it exits 0 whether or not work is at risk. - `operations/aws/agent-host/host/status.sh`
- It only finds `.git` directories under the workspace, at depth 2 to 4. Anything else on the host, such as `~/.claude` session state or files outside the workspace, is not reported. - same
- `techne host status` runs the recipe's status script and prints its text. The run counts as failed only when the script itself fails, so `AT_RISK` is not read. - `tools-techne` `src/cli.ts` `statusOf` and `printHostStatus`
- The status also reports three expiries: the GitHub token's expiry (from GitHub's `github-authentication-token-expiration` header), the Tailscale node key's expiry and the exemption review date. The review date is hard-coded as `2026-11-06`. - `host/status.sh`
- At OPS-011's verification, the GitHub token expired on 2026-11-06, the day of the review, and the Tailscale key did not expire. - OPS-011 Review, Verification

### Two checkouts and the roadmap

- The roadmap standard says every write under the roadmap directory is "serialised through one designated writing checkout per repository". A coordination plane may name which checkout that is, but the standard only requires that exactly one is. The reason it gives: "A committed advance only reserves a number if every writer commits to the same history." - `ki-agentic-harness` `skills/change-management/ki-work-roadmap/references/standards-repository-roadmaps.md`, Roadmap write locus
- The collision has already happened. OPS-011 was first pushed from the host as `TECHNE-TOOLS-OPS-010`, which clashed with the `OPS-010` the Mac had already reserved and pushed. The rebase dropped the host's ledger commit as already applied and raised no conflict. - OPS-011 Discussion, Identifier collision
- OPS-011's Discussion proposed this working rule: "push where you worked, and pull before working elsewhere". It wanted the rule written where both sides see it, and ideally checked by a prompt or session-start hook. - OPS-011 Discussion, Two checkouts
- `setup.sh` renders Kris's `~/.claude` `CLAUDE.md`, `communication.md`, `delegation.md`, `memory-scope.md` and `markdown.md` from chezmoi onto the host. A rule placed there therefore reaches both machines. - `operations/aws/agent-host/setup.sh`
- `KI-HARNESS-GOV-147` (triage, Project `paperclip-bootstrap-and-recovery`) makes the branch, not the worktree, the durable unit, so that removing a checkout is always safe. OPS-011 calls the agent host "that problem at the scale of a whole machine". - `ki-agentic-harness` `docs/roadmap/KI-HARNESS-GOV-147-make-the-branch-durable.md`; OPS-011 Context

### Pins

- `converge.sh` pins `ki` 0.7.1, mise 2026.10.3, Bun 1.4.2, Node 24 and Codex CLI 0.160.1. On the Mac today they are `ki` 0.8.1, mise 2026.10.3, Bun 1.4.2, Node v24.21.0 and Codex 0.160.1. The estate rule is `ki` 0.8.1. - `operations/aws/agent-host/host/converge.sh` lines 9 to 13; local `--version` output; `+/_CHECKPOINTS/techne.md`
- `setup.sh` already passes the Mac's live Git name and email to the host at run time. - `setup.sh`
- The boot script installs Claude Code once through its native installer, and setup does not pin or update it. - `infra/aws/agent-host-stack.yaml` line 282
- OPS-011 left currency open: "a shared chezmoi host profile or an update routine is a separate choice". The Project note treats the chezmoi host profile, the first slice of `DOTFILES-UE-020`, as a separate idea, "Host usable like Kris's machine", and a candidate for its own design loop. - OPS-011 Boundary; `Streams/Projects/agent-host.md` Ideas

### Acquired framing (not adopted)

- The ChatGPT captures say that "a Rig should be disposable from the perspective of ongoing work" and that "a footprint should be rebuildable from durable knowledge, configuration and governed state rather than depending on irreplaceable runtime mutation". They also name Git as "a core distributed backbone". These notes are acquired material that nobody has adopted, so they are cited for framing only. - `+/_ACQUIRE/chatgpt/knowledge-islands/2026-10-03-design-principles.md`, `2026-10-03-conceptual-model.md`

### Out of this subject

- Each of these is homed elsewhere: the MCP source for the host (the 21 `BIND-2` failures), the three `ki` behaviour fixes for `tools-ki`, the chezmoi host profile, egress limits, the credential identity question and the renewal decision itself. - Project note Ideas; GOV-021; GOV-023

## Reflection

1. **One principle governs all five topics.** On the host, work counts only once it is on a remote branch. The host's disk is disposable by rule: anything outside a pushed Git branch, including session transcripts and scratch files, is lost on teardown and nobody promises otherwise. This applies GOV-147's principle to the whole machine and matches the acquired "Rig is disposable" framing.
2. **Stop and teardown need different guards.** Stop keeps the volume and is the kill switch the GDR requires to "stay available", so it must never be blocked. It should run the status first, print any repository at risk, and stop anyway. If the host cannot be reached it should say so and still stop. Teardown destroys the volume, so it should refuse while the status reports `AT_RISK > 0` or cannot be read. The only way past is a separate, deliberate override that names the repositories being discarded.
3. **The status must be machine-readable before anything can gate on it.** `host/status.sh` should give a distinct exit status, or a JSON line, when work is at risk. `techne host status` should surface that as a warning or a non-zero exit, so that people and the CLI read the same signal and nobody parses the text table.
4. **Enforce the guard in both places.** `techne host` is the primary operator surface and should hold the guard. The harness scripts are the recipe contract and the documented fallback, and they should hold the same guard, so the rule does not depend on which entry point Kris uses.
5. **Recover by landing work, not by snapshots.** Before a guarded teardown, the remedy is to start the host if needed, push or deliberately discard the unlanded work, and run the teardown again. Kris requests that push under the existing bounds. An EBS snapshot before termination is the alternative. It is within the exemption, but it traps work in AWS outside Git, costs money and is never reviewed. It should not be the default.
6. **Split rebuild from withdrawal.** A rebuild replaces the instance through the stack and keeps the parameters: the GitHub token and the stored keys. Withdrawal is the full teardown GOV-021 describes, including the parameters. `destroy.sh` should keep the parameters by default and delete them only with an explicit flag, or two named commands should replace it. Today's rebuild shows the current default is wrong for the common case.
7. **`techne host teardown` should remove what the recipe built.** For an AWS host built by a CloudFormation stack, terminating only the instance leaves the stack behind and blocks the next `provision.sh`. Teardown should delete the stack, through the recipe's `destroy` path rather than a bare terminate. The rebuild-or-withdraw choice from point 6 should carry through to the CLI.
8. **The two-checkout rule belongs in Kris's personal instructions.** The rule is "push where you worked; fetch and check you are level before working elsewhere". It is a cross-project personal working rule, so it belongs in Kris's chezmoi-managed instructions, which `setup.sh` already renders onto the host. Both machines then carry the same text. A visible check, such as a session-start or prompt indicator of unpushed and behind state, comes second.
9. **Name the Mac as the roadmap writing checkout for now.** Until the roadmap standard says otherwise, the Mac checkout is the designated writing checkout for every repository. Host sessions can deliver code and docs, but they do not reserve serials, capture records or change lifecycle state. They report what should be written, and Kris or a Mac session writes it. Longer term, the cleaner fix is to make the remote's `main` the single history: a reservation is real only once it is pushed, and a rejected push means allocate again. That changes the harness standard and needs a standing push permission for reservation commits on the host, so it goes to `ki-agentic-harness` as a handoff.
10. **The Mac's live versions should drive the host's pins.** Pins already drift: `ki` 0.7.1 on the host against 0.8.1 on the Mac. `setup.sh` could read the Mac's `ki`, mise, Bun, Node and Codex versions at run time, as it already reads the Git identity, and apply them, with Claude Code added to the converged set. `status.sh` would then report any drift between the host and the last applied versions. This keeps the host "like Kris's machine" with no second list to maintain. The chezmoi host profile stays with its own design loop.
11. **Expiries should be shown, not just available on request.** The three expiries and the pin drift should appear where Kris already looks: a login banner on the host, written by `converge.sh` into the interactive part of `env.sh` with no `sudo` needed, and a warning in `techne host status` once anything is within 14 days. The review date should come from one place that can be configured, not be hard-coded. Nothing should be hand-kept in Arcadia. Separately, the GitHub token should be rotated before 2026-11-06, so it does not expire on the day of the review.
12. **Everything here is within GDR-KI-ARCADIA-004.** The work is workspace setup, updates and status, the operator commands, rebuilding through the stack and credential rotation. It needs no new hold authority. Local implementation follows each repository's normal rules. Live runs happen in sessions Kris opens, and any push only on Kris's request.
13. **The teardown guard comes first.** It is the pilot, because a withdrawal on 2026-11-06 would run teardown. The pilot is the machine-readable status plus the rebuild and withdrawal split in `ki-techne-harness`, followed by the CLI guard in `tools-techne`. A second wave covers the two-checkout rule (chezmoi), the roadmap handoff (`ki-agentic-harness`), pin currency and the expiry view. Each lands as an ordinary record in its owning repository, with the Decision Record in its Context.
