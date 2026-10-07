# Keeping work safe on the agent host: review by GPT-6

**Reviewer:** GPT-6 (Codex) · **Date:** 2026-10-07 · **Read-only:** yes

## Own view

Protect valuable work before destruction, keep emergency stopping immediate, and distinguish rebuilding infrastructure from withdrawing authority. Git is the preferred durable store for repository work, but a local commit remains valuable before publication. A blanket rule declaring everything else disposable would conceal loss rather than prevent it.

The pilot should establish trustworthy inventory, an explicit rebuild-or-withdraw contract, and equivalent protection through both operator entry points. Checkout coordination and tool currency need separate owner decisions. Neither acquired framing nor an unadopted roadmap item establishes policy.

Paths below use these roots: `A` = `/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal`; `H` = sibling `ki-techne-harness`; `T` = sibling `tools-techne`; `K` = sibling `ki-agentic-harness`. Historical `OPS-011` references mean `H@de05a78:docs/roadmap/TECHNE-TOOLS-OPS-011-manage-the-agent-host-footprint.md`.

## Fact check

- **Revision provenance:** The harness and CLI checkout revisions match the brief. Arcadia's current checkout has advanced; the cited earlier revision exists. These establish documentary provenance, not current host state. Source: `A/Admin/Governance/Decisions/references/agent-host-durability-brief.md:27`; local Git object checks.

- **Exemption scope:** Confirmed, but the summary omits two material conditions: credential identity must be decided before agent work, and agents never accept or prune. Source: `A/Admin/Governance/Decisions/GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold.md:26` and `:29`; hereafter **GDR**.

- **Withdrawal:** Confirmed conditionally. Withdrawal requires an Enactment record followed by complete teardown. The review date does not trigger withdrawal or automatic destruction. Source: `A/Streams/Roadmap/KI-ARCADIA-GOV-021-review-the-agent-host-prototype.md:22` and `:32`; hereafter **GOV-021**.

- **Ownership:** Confirmed. Preserve the additional requirement that the repositories join through manifest and environment contracts, without assuming co-location or shared versions. Source: `A/Admin/Governance/Decisions/ADR-TECHNE-003-techne-implementation-ownership.md:38` and `:45`; hereafter **ADR**. Personal bindings belong to chezmoi at `:41`.

- **Script stop:** Confirmed with qualification: its selector includes pending instances as well as running ones, and it can stop multiple matches. There is no workspace inspection. Source: `H/operations/aws/agent-host/stop.sh:17` and `:33`. The optional status instruction is at `H/docs/guides/operator/agent-host.md:269`.

- **Script destruction:** Confirmed for the default binding. Confirmation follows the configured stack name; account and stack-tag checks precede deletion. All three parameter names are subsequently submitted for deletion. Source: `H/operations/aws/agent-host/destroy.sh:13`, `:18` and `:26`.

- **Today's rebuild:** Accepted as the supplied fact. The token-deletion behaviour is independently confirmed by `H/operations/aws/agent-host/destroy.sh:33`; the operator's actual stack-only operation was not independently inspected.

- **Volume destruction:** Confirmed for checkouts on the configured root volume. Stopping retains it; termination deletes it. The network interface setting is separate from storage durability. Source: `H/infra/aws/agent-host-stack.yaml:219`, `:228` and `:235`.

- **CLI stop and teardown:** Confirmed. Stop has no workspace inspection; teardown requires interactive typed confirmation and terminates the selected instance. Remaining resources are derived from the manifest. Source: `T/src/cli.ts:781`, `:805` and `:824`; `T/src/providers/aws/host.ts:111`; `H/recipes/direct-host/recipe.toml:18` and `:62`.

- **Rebuild blocked by retained stack:** Confirmed. Provisioning refuses an existing stack. Source: `H/operations/aws/agent-host/provision.sh:26`.

- **Missing parameter-preserving rebuild procedure:** Confirmed. The pre-rebuild section checks template correspondence; the teardown section deletes parameters. Neither provides the proposed preservation sequence. Source: `H/docs/guides/operator/agent-host.md:279` and `:295`.

- **Repository status:** Confirmed as an inspection of local Git state and cached remote-tracking refs. Successful completion returns zero despite risks. It does not prove that commits still exist on a live remote. Source: `H/operations/aws/agent-host/host/status.sh:28`, `:31` and `:78`.

- **Discovery limited to `.git` directories:** Incorrect. Discovery matches entries named `.git` without restricting their type, so it also finds `.git` files, including linked-worktree markers. Depth and workspace restrictions remain. Source: `H/operations/aws/agent-host/host/status.sh:46`. Ignored files, deeper repositories and non-workspace material remain outside the report.

- **CLI handling of risk:** Confirmed. Workspace output remains text, including inside the CLI's existing JSON envelope; risk counts are not interpreted. Stopped hosts skip workspace reporting altogether. Source: `T/src/cli.ts:640`, `:666` and `:718`.

- **Expiry reporting:** Confirmed, but the report is not wholly offline: it obtains GitHub expiry through an authenticated API request. Unknown expiry is possible. Source: `H/operations/aws/agent-host/host/status.sh:11`, `:54`, `:58` and `:66`.

- **Observed token and node-key expiry:** Confirmed as historical acceptance evidence, not today's independently verified state. Source: `OPS-011:137`.

- **Roadmap write locus:** Confirmed. It governs every roadmap write, including shaping, lifecycle changes and acceptance, rather than serial allocation alone. Source: `K/skills/change-management/ki-work-roadmap/references/standards-repository-roadmaps.md:244`; hereafter **Roadmap standard**.

- **Identifier collision:** Confirmed, including the identical ledger advance being dropped during rebase. Source: `OPS-011:198`.

- **Two-checkout working rule:** Confirmed as a proposal in Discussion, not an adopted rule. Source: `OPS-011:171`.

- **Personal instructions reach both machines:** Partly confirmed. Setup renders the named Claude files and convergence installs them. It does not render Codex's personal `AGENTS.md`, so placing a rule in only the Claude surface does not cover both runtimes. Source: `H/operations/aws/agent-host/setup.sh:17` and `:37`; `H/operations/aws/agent-host/host/converge.sh:339`.

- **GOV-147:** Its goal and Project association are confirmed, but it remains triage. It proposes branch durability for coordinated worktrees and does not itself require publication to a remote. Source: `K/docs/roadmap/KI-HARNESS-GOV-147-make-the-branch-durable.md:5`, `:8`, `:20`, `:37` and `:43`. The whole-machine analogy is confirmed at `OPS-011:27`.

- **Tool pins and Mac versions:** The declared harness values are confirmed. Node `24` is a major-version selector, not an exact reproducible pin. The checkpoint confirms the estate's `ki` 0.8.1 rule; the other claimed live Mac versions have no captured evidence in the supplied sources and remain unverified. Source: `H/operations/aws/agent-host/host/converge.sh:9` and `:172`; `A/+/_CHECKPOINTS/techne.md:22`.

- **Git identity passed from Mac:** Confirmed. Source: `H/operations/aws/agent-host/setup.sh:30`.

- **Claude installation:** Confirmed as boot-time native installation with no version argument. Convergence checks its presence but neither pins nor updates it. This does not establish that Claude never updates through another mechanism. Source: `H/infra/aws/agent-host-stack.yaml:282`; `H/operations/aws/agent-host/host/converge.sh:361`.

- **Currency and host-profile follow-ups:** Confirmed as unresolved alternatives and a separate Project idea. Source: `OPS-011:46`; `A/Streams/Projects/agent-host.md:43` and `:51`.

- **Acquired framing:** The cited concepts are present and are supplied as unadopted material. The Rig passage concerns preserving agency when an access device disconnects; it does not authorise discarding host-only knowledge. Source: `A/+/_ACQUIRE/chatgpt/knowledge-islands/2026-10-03-conceptual-model.md:15` and `:19`; `2026-10-03-design-principles.md:7` and `:79`.

- **Excluded subjects:** Confirmed as identified concerns, but some lack a live owning record. MCP configuration and the three `ki` fixes are still Project Ideas. Credential identity is also an execution prerequisite, so excluding its design does not waive the gate. Source: `A/Streams/Projects/agent-host.md:32` and `:52`; **GDR:29**; **GOV-021:39**.

- **Follow-ups after pruning:** Confirmed as the Project's current operational home. Historical evidence still exists in Git; pruning did not make the Project note their only evidential source. Source: `A/Streams/Projects/agent-host.md:52`; `OPS-011:229`.

## Points

| Point | Mark | Reason and evidence |
| --- | --- | --- |
| 1 | Differ | Valuable work exists before publication. Classify what must survive; do not declare host-only knowledge worthless. † |
| 2 | Differ | Keep emergency stop immediate. Bound or bypass inspection; provide an override for unknown inventory as well. ‡ |
| 3 | Agree | Use a versioned structured report with distinct clean, risky and unknown outcomes. Existing CLI JSON wraps text. ‡ |
| 4 | Agree | Protect both entry points through one shared contract and equivalent checks, avoiding duplicated policy. ‡ |
| 5 | Differ | Prefer Git, but offer a verified transfer to the Mac when push is unavailable. Snapshot authority is unsettled. † |
| 6 | Agree | Separate rebuild from withdrawal explicitly. Prefer named modes over silently changing destruction semantics. ‡ |
| 7 | Agree | Stack-managed teardown should use the recipe's destroy contract, with explicit mode and remaining-footprint output. ‡ |
| 8 | Differ | Personal instructions suit the rule, but cover Codex too. Define handoff when pushing is not authorised. § |
| 9 | Differ | Mac designation needs each repository's agreement. Pushed ledger commits alone do not prevent identical reservations. § |
| 10 | Differ | Use reviewed desired versions, not incidental Mac executables. Preserve repository pins and Linux compatibility. ¶ |
| 11 | Agree | Surface expiry and drift with freshness and unknown states. Read the review date from canonical governance. ¶ |
| 12 | Differ | Host maintenance fits the exemption; wider policy and push changes do not inherit authority from it. ‖ |
| 13 | Differ | Pilot the complete guarded operator path before a wave. Reconcile the roadmap-write rule before capturing rollout. ‖ |
| - | Add | Fail closed on missing workspace, zero unexpected repositories, unreadable Git state or incomplete discovery. † |
| - | Add | Quiesce writers before the final check; bind inspection and deletion to the same verified host identity. ‡ |
| - | Add | Resolve the credential-identity prerequisite before further agent execution. Exclusion is not satisfaction. ‖ |
| - | Add | Rebuild needs a fresh Tailscale enrolment key and device handling, not merely preserved parameter names. ‡ |
| - | Add | Specify idempotent recovery after partial stack or parameter deletion; an absent instance must not block cleanup. ‡ |
| - | Add | Reconcile admin-profile destruction with the GDR's operator-role wording before approving live operations. ‖ |
| - | Add | Test risky, unreachable, stopped and malformed cases, emergency-stop timing, and CLI/script equivalence offline. ‡ |
| - | Add | Record pilot lessons, immutable interface compatibility and owner approval before parallel rollout. ‖ |

† **Durability and coverage.** `K/docs/roadmap/KI-HARNESS-GOV-147-make-the-branch-durable.md:8` establishes that the proposal is unadopted; `:37` requires committing, while `:43` leaves remote-branch policy elsewhere. `H/operations/aws/agent-host/host/status.sh:29` and `:31` inspect ordinary visible changes and commits reachable from HEAD or local branches, not every valuable artefact. Discovery errors are suppressed at `:46`, allowing an empty inventory to reach the normal summary at `:78`. Require an expected repository inventory, explicit exclusions and preservation or deliberate disposal of valuable non-Git material. Cached refs are insufficient evidence of current remote retention. A verified local Git bundle or file transfer is a possible recovery route without granting push permission. Snapshot scope is not explicitly settled by **GDR:26**; nor does the brief substantiate its claim that snapshots are never reviewed.

‡ **Operator safety and rebuild mechanics.** `H/operations/aws/agent-host/status.sh:16` has no explicit SSH deadline, and its host script performs an additional network request at `host/status.sh:58`. Mandatory status-first stopping could therefore delay the kill switch required by **GDR:27**. Keep a direct emergency path. For destruction, distinguish unknown inventory from known risky repositories: an unreachable host cannot supply repository names for the proposed override. Require explicit acknowledgement of that uncertainty. Prevent writes between the final inspection and deletion, and verify that the SSH target and selected instance are the same host. `T/src/cli.ts:812` currently requires an instance even for teardown, which prevents cleanup after bare termination. `H/docs/guides/operator/agent-host.md:78`, `:82` and `:193` specify a single-use, short-lived enrolment key that is deleted after joining; preserving parameters cannot make that key reusable. Full withdrawal also requires the manual steps at `:305`. Both entry points should consume the same versioned status semantics and destruction mode.

§ **Checkout coordination.** The personal-rule delivery currently covers Claude files only: `H/operations/aws/agent-host/setup.sh:17`. **GDR:27** prevents treating a handoff rule as standing push authority. When publication is unavailable or unauthorised, leave a visible pending handoff and prevent the next checkout from proceeding without reconciliation. **Roadmap standard:248** requires all roadmap writes to queue in one designated checkout. The collision at `OPS-011:200` demonstrates why identical ledger-only commits can be dropped during rebase; a rejected-push retry policy needs protection against that case, not merely publication. Designate and serialise a checkout per repository now. Treat any future allocation redesign as a separately approved harness change.

¶ **Currency and visibility.** `H/operations/aws/agent-host/host/converge.sh:249` applies repository-specific tool configuration as well as global defaults. Reading whatever versions happen to resolve on the Mac risks selecting a repository override and imposing it globally. Keep a durable desired-version manifest with exact versions where required, compatibility checks and rollback; Mac parity can be a validation signal. Claude convergence currently checks presence only at `:361`. `host/status.sh:54` accesses credentials and `:58` calls GitHub, so do not run the complete report synchronously on every shell startup. Display bounded, timestamped cached evidence, refreshed during an operator session. The canonical review date remains in **GDR:30** and **GOV-021:22**; configuration should project that authority rather than replace it.

‖ **Authority, ownership and sequencing.** **GDR:27-31** limits execution, publication, acceptance and environment scope. **GOV-021:33** reserves teardown and rebuild to Kris. Credential identity remains unevidenced in `A/Streams/Projects/agent-host.md:32`, while **GDR:29** makes its decision a prerequisite. There is also a documentary mismatch: **GDR:29** names the account-local operator role for every AWS action, but `H/docs/guides/operator/agent-host.md:15` and `H/recipes/direct-host/recipe.toml:87` require an administrator profile for destruction. Resolve the intended credential contract rather than silently widening privileges.

The design-loop standard at `/Users/krisbrown/.claude/skills/ki-design-loop/references/standards-design-loop.md:35` requires the owner's decisions and explicit authority scope; `:36` requires a completed pilot and lessons before a parallel wave. Capture rollout through the designated writing checkout. Make the pilot span the shared report contract, harness destruction modes and CLI integration, using immutable interfaces as **ADR:40**, `:45` and `:53` require. Its acceptance must demonstrate an operator can rebuild safely and withdraw completely, while emergency stopping remains available.
