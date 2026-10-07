# Keeping work safe on the agent host: merged report

**Brief:** [agent-host-durability-brief.md](agent-host-durability-brief.md) · **Reviews:** [agent-host-durability-review-fable.md](agent-host-durability-review-fable.md) (Claude Fable 5.1), [agent-host-durability-review-codex.md](agent-host-durability-review-codex.md) (GPT-6 through Codex, read-only sandbox) · **Date:** 2026-10-07

Both reviews were written independently and read-only, on different runtimes. Codex's first launch refused to start outside a Git repository. It was rerun unchanged from the Arcadia checkout, so no fallback reviewer was needed. Disputes are settled on the cited sources below. Where the evidence does not settle a question, it goes to Kris in [Decisions](#decisions).

## Summary

- **One rule.** Work on the agent host counts as safe only once it is in Git on a remote. The host's disk is disposable, but only within a stated boundary: the repositories in `repositories.txt` are protected, and a named list of other things is deliberately not.
- **Stop always works.** It reads the status quickly and warns, but never refuses. **Teardown fails closed.** It refuses while work is at risk, the host cannot be read, or the repositories found do not match the expected set. There are two deliberate overrides: one naming the repositories to discard, and one for discarding a host that cannot be read.
- **Rebuild and withdraw become separate operations.** Rebuild replaces the stack and keeps the GitHub token. Withdraw removes everything GOV-021 lists. `techne host teardown` stops doing a bare instance termination and goes through the recipe's destroy path.
- **One status contract feeds both entry points.** A versioned structured report gives clean, at-risk or unknown, with its own exit status, so the harness scripts and the CLI read the same signal.
- **Two checkouts.** One machine-neutral rule goes to both runtimes: push where you worked, then fetch and check before working elsewhere. Status gets a read-only `--fetch` option. The Mac stays the only roadmap writer for now, and the host is mechanically prevented from writing roadmap records.
- **Pins are declared** in one harness file, bumped by commits and reported for drift, not copied from the Mac at run time. **Expiries** appear in a login banner from a cached file and as a warning in `techne host status`. The review date comes from configuration.
- **The pilot is one harness record**, landed before Kris's pending rebuild so that the rebuild is its live test. The CLI follows straight after.

## Corrections to the brief

- **The operator role is allowed to terminate.** Fable read the runbook's "may only start and stop" and concluded that `techne host teardown` might fail. The accepted GOV-020 policy grants `ec2:StartInstances`, `ec2:StopInstances`, `ec2:RebootInstances` and `ec2:TerminateInstances` on the tagged instance (`KI-ARCADIA-GOV-020` at `b9ddfae^`, line 266), and GOV-021 says the role carries that policy unchanged. The CLI's terminate is therefore permitted. What it lacks is the ability to delete the stack. The runbook's summary understates the role and should be corrected.
- **A rebuild cannot keep the Tailscale key.** `tailscale-auth-key` is single-use, expires after a day and is deleted after the host joins (runbook lines 78 to 82 and 193). `provision.sh` requires a fresh one (lines 32 to 40). Only `github-token` and the unused `model-api-key` can be kept. The old tailnet device must also be removed before the new one joins, or the name moves to a suffixed device (both reviews, Add; the Tailscale behaviour is a reviewer's understanding, to verify in the console).
- **The status script can fail or come back empty.** `host/status.sh` runs under `set -euo pipefail`, so one broken repository aborts the whole report. It also suppresses discovery errors, so an empty or missing workspace still reaches a normal summary (Codex: `host/status.sh` lines 4, 46 and 78). The `.git` match also finds worktree and submodule `.git` files, not only directories.
- **Status cannot be read on a stopped host or after the kill switch.** For a stopped host, `techne host status` reports the workspace as `skipped` (`tools-techne` `src/cli.ts` lines 644 to 649). The kill switch's second step takes the device off the tailnet. An unreadable status is therefore the normal state for a withdrawal, not the exception (Fable).
- **Kris's rules reach only Claude on the host.** `setup.sh` renders five `~/.claude` files. No Codex `AGENTS.md` is rendered, so a rule in Kris's instructions reaches only one of the host's two runtimes (Codex: `setup.sh` lines 17 and 37). The rendered files also carry Mac-only tooling, such as `claude-bg` in `delegation.md` (Fable).
- **Brief point 1 cited the wrong acquired principle.** "Rig is disposable" describes the laptop. The host is a footprint, so the relevant acquired principle is "a footprint should be rebuildable from durable knowledge" (Fable). Both remain unadopted.
- **The GDR's credential wording does not match practice.** GDR-KI-ARCADIA-004 says building the host and every AWS action use Kris's own credentials "through the host's account-local operator role". In practice the runbook, `provision.sh` and `destroy.sh` build and destroy under Kris's administrator SSO profile, and the recipe declares `aws.admin_profile` for this. They are still Kris's own credentials, but the GDR's text does not describe them (Codex).
- **Live destructive steps are Kris's alone.** GOV-021 says any teardown or rebuild is Kris's operation, and the runbook says "Agents prepare and review this path; only Kris runs it". Brief point 12 needs that limit (Fable).
- **The credential-identity condition is unconfirmed.** The GDR requires that "Agents work on the host only once Kris has decided which identity holds the GitHub and model API credentials". The Project note lists that identity as not yet evidenced (`KI-ARCADIA-GOV-023` review). This loop cannot settle it. It is raised under Needs Kris (Codex).
- **The Mac versions in the brief were measured.** Codex could not run commands to check them. The orchestrator ran `--version` on the Mac on 2026-10-07: `ki` 0.8.1, mise 2026.10.3, Bun 1.4.2, Node v24.21.0, Codex 0.160.1. Fable recorded Claude Code 2.1.285. Node `24` in `converge.sh` selects a major version and is not an exact pin.

## Model

### What is protected

- Work counts as safe when it is reachable from a remote branch, which may be any branch, not only `main`. The protected set is the repositories in `repositories.txt` under the workspace. The runbook states this boundary.
- The following are disposable by rule, and the runbook names them: the Claude Code and Codex sign-ins and transcripts under `~/.claude` and `~/.codex`, caches, the hand-made backups, and any checkout outside the declared set. Anything Kris wants to keep from these is moved into a repository or onto the Mac before teardown.
- Inventory fails closed. A missing workspace, an expected repository that is absent, an unexpected repository, unreadable Git state or a discovery error all count as **unknown**, which is not the same as clean.

### Status contract

`host/status.sh` produces a versioned report (`techne/host-workspace/v1`) with one entry per repository and an overall outcome of `clean`, `at-risk` or `unknown`. It exits 0 for clean, 3 for at-risk, 4 for unknown and 1 for script failure, and a failure in one repository is reported for that repository rather than aborting the report. It also gains a read-only `--fetch` option that updates remote-tracking refs before reporting. The default stays no-fetch, so the guards do not depend on GitHub. `techne host status` embeds the structured report in its existing `--json` output under a new schema version and passes the outcome through as its exit status. The CLI reads the outcome; it does not parse the text table.

### Stop

`stop.sh` and `techne host stop` read the status with a short connect timeout and print any repository at risk or unknown, then stop the host. `--now` skips the read. Stop never refuses, because the GDR requires the kill switch to stay available.

### Teardown: rebuild and withdraw

- **Two named operations**, in the harness and mirrored in the CLI. Both run under the binding's `aws.admin_profile` and go through the recipe's `destroy` path, not a bare terminate.
  - **Rebuild** deletes the stack and keeps `github-token` and `model-api-key`. It then requires a fresh Tailscale auth key and the removal of the old tailnet device before `provision.sh` runs again.
  - **Withdraw** deletes the stack and every parameter, then prints the manual footprint: the tailnet device, tag and policy, revoking the GitHub token, the operator role and profile, and the chezmoi entries.
- **Guard.** Both operations refuse unless the status is `clean`. The first override, `--discard <repo>...`, applies only when the status is readable and names exactly the repositories at risk. The second, `--discard-unreadable-host`, applies when the status is unknown or unreadable. It needs a typed confirmation and prints the recovery routes first. Immediately before deleting anything, the guard checks that the host the status was read from is the same instance as the one about to be deleted.
- **Sequences**, documented in the runbook. When work matters: start the host, read the status, land the work, then tear down. In an emergency: stop, remove the device, then tear down with the second override.
- **Recovery routes, in order.** First, push on Kris's request, under the existing bounds. Second, a verified `git bundle` copied to the Mac over SSH, which needs no push permission. Third, inside the second override only, an EBS snapshot taken by Kris, but only if Kris settles that a snapshot is within the exemption. A snapshot is never the default.
- **Idempotent.** A missing instance, a stack that is already gone or a parameter that is already deleted does not block the rest of the clean-up.
- **Who runs it.** Agents implement the operations and test them offline with stubs. Kris runs every live rebuild and withdrawal.

### Two checkouts

The rule is "push where you worked; before working elsewhere, run status with `--fetch` and be level". It is written machine-neutrally in Kris's personal instructions, and `setup.sh` renders it for both Claude and Codex on the host. Where pushing is not authorised, the session leaves a visible pending handoff in its report, and the next session on the other machine reconciles before it starts.

### Roadmap writer

For every Knowledge Islands repository, the Mac checkout is the one designated writing checkout. `converge.sh` sets a host marker. The roadmap write path in `ki` refuses on that marker, which needs a `tools-ki` change. In the meantime the rule sits in the host's rendered instructions. Host sessions report the roadmap changes they need, and a Mac session writes them. A future serialisation design goes to `ki-agentic-harness` as a separate handoff. It would make the remote's `main` the single history, and it needs a GDR bounds change for any standing push.

### Pins

One declared pin file in the harness lists exact versions for `ki`, mise, Bun, Node and Codex, and a minimum version for Claude Code. It is bumped by ordinary commits, and `ki` moves to 0.8.1 now. `converge.sh` applies the global pins and leaves each repository's own `mise.toml` alone. `status.sh` reports drift from the declared pins. When run from the Mac, it also reports drift against the Mac's versions, as a signal only. The chezmoi host profile stays with its own design loop.

### Expiries

The status run writes a cached expiry file covering the GitHub token, the Tailscale key, the review date and pin drift. An interactive login on the host prints a banner from that cache and makes no network or credential call. `techne host status` warns once anything is within 14 days. The review date moves out of `host/status.sh` into the binding as a recipe parameter. Nothing is kept by hand in Arcadia. Rotating the GitHub token so that it expires after 2026-11-06 is an operator action for Kris and is not part of any record.

## Agreement and difference

| Point | Reviews | Settlement and evidence |
| --- | --- | --- |
| 1 Remote branch is the unit | Fable Agree; Codex Differ | Kept, with a stated boundary and a named disposable list. Codex's concern is met by failing closed on the inventory and offering a bundle route; non-Git material is moved into Git or onto the Mac on purpose. GOV-147 is cited as the analogy only, since it is still in triage. Kris decides the principle: decision 1. |
| 2 Stop warns, teardown refuses | Fable Differ; Codex Differ | Both reviews found the same gaps: stop must stay immediate (a timeout and `--now`), and an unreadable status needs its own override. Adopted. |
| 3 Machine-readable status | Fable Agree; Codex Agree | Adopted, with a versioned schema, distinct exit statuses and an `unknown` outcome. |
| 4 Guard in both entry points | Fable Agree; Codex Agree | One contract in the harness, which the CLI consumes (ADR-TECHNE-003: the manifest and variables are the only contract between the two repositories). Adding status inputs to `stop` and `destroy` changes `recipe.toml` and its offline test, so the harness lands first. |
| 5 Land work, not snapshots | Fable Agree; Codex Differ | Push first, a verified bundle to the Mac second, and a snapshot only inside the second override, subject to Kris's ruling on whether it is in scope: decision 3. |
| 6 Split rebuild from withdrawal | Fable Agree; Codex Agree | Adopted as two named operations. The fresh Tailscale key and device removal are corrected (see Corrections). Deleting the parameter does not revoke the token, so withdraw keeps the manual revocation. |
| 7 CLI teardown via the recipe | Fable Agree; Codex Agree | Adopted. Fable's claim that the CLI's terminate is not permitted is corrected by the GOV-020 policy. The real gap is the stack and the profile, which is why the recipe's destroy path is used. |
| 8 Two-checkout rule | Fable Agree; Codex Differ | Must reach Codex too, be machine-neutral, and come with a read-only `--fetch` check and a pending-handoff rule. Adopted. |
| 9 Mac as roadmap writer | Fable Differ; Codex Differ | Both reviewers agree with the Mac now. Fable adds a mechanical marker. Both reject the remote-`main` design without a GDR change, because a standing push breaks the bound "push only when Kris asks". Codex adds that ledger-only commits can still be dropped on rebase. Designation scope: decision 6. |
| 10 Pins from the Mac at run time | Fable Differ; Codex Differ | Overturned. OPS-011's goal is reproducing the host by rerunning one step, `converge.sh` also runs from the host alone, and Mac executables may carry repository-local versions. Declared pins with drift reporting: decision 7. |
| 11 Expiry view | Fable Agree; Codex Agree | Adopted, with a cached file so the login banner makes no credential call, the review date coming from configuration, and freshness and unknown states shown. |
| 12 All within the GDR | Fable Differ; Codex Differ | Host maintenance is within the GDR. A standing push, any GDR wording change and the credential-identity condition are not. Live destructive steps are Kris's alone. Decisions 5 and 6, and Needs Kris. |
| 13 Pilot order | Fable Differ; Codex Differ | Fable proposes one harness record as pilot, landed before the rebuild. Codex proposes the whole operator path, harness plus CLI. Decision 8. |
| Add | Fable | Kill-switch sequencing, tailnet name on rebuild, tolerant status, a stated protection boundary, and capturing the rollout before 2026-11-06. All adopted. |
| Add | Codex | Fail-closed inventory, a same-host check before deletion, an idempotent partial clean-up, the credential-identity condition, the admin-profile versus GDR wording, offline tests for the risky, unreachable, stopped and malformed cases and for CLI and script equivalence, and pilot lessons before the wave. All adopted or raised as decisions. |

## Rollout plan

Each record is captured through `ki-next` in its owning repository, with the Decision Record in its Context. Roadmap writes happen in the Mac checkouts.

- **Pilot: one `ki-techne-harness` record.** It covers the status contract with `--fetch`, the tolerant per-repository loop and the fail-closed inventory; the stop warning with `--now`; rebuild and withdraw with the guard, both overrides, the same-host check and idempotent clean-up; the `recipe.toml` and manifest test changes; and the runbook sequences, protection boundary and corrected operator-role summary. Verification is offline with stubs covering the clean, at-risk, unknown, unreachable, stopped and malformed cases. Kris's pending rebuild is the live test, run by Kris. It is landed before the rebuild.
- **Wave 2, after the pilot's lessons are written into each brief:**
  - `tools-techne`: `techne host status` consumes the structured report and exit statuses; `host stop` warns; `host teardown` is replaced by `host rebuild` and `host withdraw` through the recipe's destroy path; equivalence tests against the harness stubs.
  - `ki-techne-harness`: the declared pin file with `ki` at 0.8.1 and a Claude Code minimum; drift reporting; the cached expiry file and login banner; the review date as a binding parameter; Codex instructions rendered by `setup.sh`; and the host marker.
  - chezmoi: the machine-neutral two-checkout rule in Kris's instructions, with a Codex counterpart.
  - `tools-ki`: refuse roadmap writes when the host marker is set.
  - `ki-agentic-harness`, a handoff that blocks nothing: where a designated writing checkout is declared, and whether to design a remote-history serialisation.
- **Arcadia:** after Kris's decisions, one Decision Record, and the Project note's Update and Ideas updated to point at it. If decision 5 chooses to amend, an Enactment record for the GDR wording.
- **Before 2026-11-06:** the pilot and the CLI record, because a withdrawal at the review would run teardown.

## Decisions

1. **What counts as safe work on the host?** Options: (a) only what is in Git on a remote is safe, the declared repositories are protected, and a named list is disposable by rule; (b) also classify and preserve selected material outside Git. Recommendation: (a). It is simpler to guard and to state, and the bundle route and the deliberate-move rule cover the edge cases.
2. **How strict are stop and teardown?** Options: (a) stop warns with a timeout and `--now` and never refuses; teardown fails closed with two overrides (named repositories, or an unreadable host with typed confirmation); (b) both only warn; (c) both refuse. Recommendation: (a). It is the only option that keeps the GDR's kill switch available and protects work.
3. **Is an EBS snapshot an allowed recovery route?** Options: (a) yes, only inside the unreadable-host override and taken by Kris; (b) no, Git push or bundle only. Recommendation: (b) for now. The GDR does not clearly cover snapshots and they keep work outside Git. Revisit at GOV-021 if a host ever becomes unreadable with work on it.
4. **Rebuild and withdraw as separate operations?** Options: (a) two named operations in the harness and CLI, both through the recipe's destroy path under the admin profile, with `techne host teardown` replaced; (b) one destroy with a keep-parameters flag. Recommendation: (a). It matches GOV-021's vocabulary and avoids today's hand workaround.
5. **The GDR's credential wording.** Build and destroy use Kris's administrator SSO profile, while the GDR says AWS actions go "through the host's account-local operator role". Options: (a) amend the GDR text through an Enactment record to say build, rebuild and destroy use Kris's administrator SSO session and operations use the operator role; (b) leave it until the GOV-021 review and note the gap there. Recommendation: (a), small and done before the pilot's live test, so that rebuild runs on text that describes it.
6. **The roadmap writing checkout.** Options: (a) the Mac checkout for every Knowledge Islands repository, declared once in this Decision Record, enforced by a host marker in `ki`, with a harness handoff on where designations live; (b) each repository declares its own; (c) work towards the remote `main` as the single history, which needs a GDR bounds change for standing pushes. Recommendation: (a) now, with (c) only as a later, separately approved design.
7. **How the host's pins stay current.** Options: (a) declared exact pins in one harness file, bumped by commits, with drift reported against the pins and the Mac; (b) the Mac's live versions read at setup time; (c) wait for the chezmoi host profile. Recommendation: (a). It is reproducible from the host alone and is what both reviewers argued for. Bump `ki` to 0.8.1 in the pilot or the first wave-2 record.
8. **The pilot's scope.** Options: (a) one harness record (status contract, guards, rebuild and withdraw), landed before Kris's rebuild, with the CLI first in wave 2; (b) harness and CLI together as one operator path. Recommendation: (a). The standard asks for one pilot before a wave, the CLI consumes the manifest the pilot changes, and the rebuild gives a real test soon.

## Changes after review

- Stop gained `--now` and a timeout, and teardown gained the unreadable-host override and documented sequences. Fable and Codex.
- Status gained the `unknown` outcome, the fail-closed inventory, per-repository tolerance and `--fetch`. Codex and Fable.
- Rebuild was corrected to need a fresh Tailscale key and device removal. Both reviews.
- The guard gained a same-host check and idempotent clean-up. Codex.
- Pins changed from the Mac's live versions to declared pins. Both reviews.
- The two-checkout rule now reaches Codex as well and includes a pending-handoff rule. Codex and Fable.
- The roadmap writer gained a host marker enforced in `ki`. The remote-`main` idea needs a GDR change. Fable and Codex.
- The expiry banner reads a cache, and the review date moves to configuration. Fable and Codex.
- New: the GDR credential-wording decision, and the credential-identity condition raised for Kris. Codex.
- Fable's claim that the operator role cannot terminate was corrected against GOV-020's policy.
