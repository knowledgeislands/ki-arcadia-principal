---
type: ki-checkpoint
thread: techne.agent-host
label: 'Techne: agent-host'
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-13T23:00:00Z
---

# techne.agent-host

## Objective

Reconstruct the `techne` working thread if its session is lost. Status, open records and ideas live in the [[agent-host]] Project note under the [[Initiatives/techne|Techne]] Initiative; this checkpoint copies none of them.

The thread moves agent work off the laptop onto the one agent host the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) exempts. It delivers the durability rollout of [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] and the workstation rollout of [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]]. The [[baseline-rollout]] Project is separate and does not gate it. Mac Studio work belongs to the `mac-studio-bootstrap` thread.

## Current state

Owner history below dates to 2026-10-11 at about 04:12 BST; the related rebuild/tools queue is reconciled on 2026-10-12. The AWS snapshot below was observed at 08:26 UTC that day, not checked live by this handoff.

Mark: 2026-10-09T21:40Z, decisions log at Decision 34

ki-delegation read at fbd11977

- **Repositories.** All touched repositories are level with origin.
- **Host patching fields.** [KI-TOOL-TECHNE-CLI-008](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-008-host-patching-fields.md) is accepted as done through ki-accept (Decision 43), kept, not pruned, and pushed. Live verification on a real host waits for the vega rebuild and is not part of acceptance.
- **Delivered and closed.** OS patching (TECHNE-TOOLS-OPS-022) and the chezmoi workstation bundle (DOTFILES-UE-073) are accepted and pruned. The workstation pilot (TECHNE-TOOLS-OPS-015) is accepted and kept, not pruned. Recipe/binding identity is `agent-host`; the old deployed names still need the owner-led vega rebuild below.
- **The host.** Earlier restart/clean-status evidence is historical. At 2026-10-12 08:26 UTC, owner readiness evidence reported account `655383751458`, profile `knowledge-islands-techne`, region `eu-west-1`, stack `ki-techne-agent-host` still `CREATE_COMPLETE`, `HostName` and `TailscaleHostname` both `ki-techne-agent-host`, selector `agent-host`, and recorded instance `i-0332d9ea05c2e929d`. Neither tagged live-instance query nor recorded-instance lookup returned an instance. This is a surviving-stack/missing-instance snapshot, not proof of clean recovery or current resource state.
- **Pins.** `recipes/agent-host/rig.toml` in the harness is the one list of host tool versions; `mise` and `codex` are raised to 2026.10.6 and 0.162.0. The Mac is no longer compared against it; TECHNE-TOOLS-OPS-024 (weekly pin bump) is planned, draft.
- **Boundary audit accepted.** Kris accepted all ten decisions of the Rig and Techne boundary audit (Decision 40). The plain-language explainer is [[Hosts, Roles and Layers]]; cross-repository handoffs go through state-of-play.
- **Rebuild delivery already closed.** The zsh/rename shell delivery is accepted and pruned in current local Harness ancestry: `ace606e` acceptance, `11adc5d` pruning. Do not restore or seek acceptance of that record. AWS baseline checks, rebuild and chezmoi work were deferred to this owner thread. TECHNE-TOOLS-OPS-024 (weekly pin bump) is ready; its tool waits for the role profile to move to a `roles/` folder.
- **Owner historical work.** TECHNE-TOOLS-OPS-016 (to be replaced by a `tools-rig` signed-release kind), TECHNE-TOOLS-OPS-018, TECHNE-TOOLS-OPS-019 and TECHNE-TOOLS-OPS-023 in the harness remain in the earlier triage snapshot; KI-HARNESS-GOV-170 (keep resolution targets local) is planned, draft, in `ki-agentic-harness`. These are outside this bounded tools sweep and are not re-audited here. The related tools queue is reconciled below.
- **The Mac.** `terra`; chezmoi `rigProfile` is `laptop`; Tailscale is up.
- **Launcher deliveries.** Launcher-held wait gates, config preservation/local relaunch and Capital stores/aliases were accepted and pruned under tools-burndown Decision 12. The historical ki 0.10.0 host pin still needs owner compatibility review before reuse; local launcher delivery does not prove that pin has changed on a host.
- **Rebuild preparation.** Decision 43 authorised a background agent (`host-names`) to update `repositories.txt`, `setup.sh` and the related scripts, recipe, tests and operator guide for the `knowledge-islands` workspace layout and current repository names, locally only. Kris will rebuild on a date still to be set. The decisions log runs to Decision 43.
- **Related tools queue.** [KI-TOOL-KI-CLI-115](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-115-enforce-roadmap-writing-checkout.md) writing-checkout guard and [KI-TOOL-TECHNE-CLI-006](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-006-guarded-host-commands.md) remain adopted draft Hold. [KI-TOOL-TECHNE-CLI-008](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-008-host-patching-fields.md) is done (Decision 43). Dock belongs to Rig; no broad agent-host or Programme Hold resume.
- **Durable procedure and inputs.** The [operator runbook](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/guides/operator/agent-host.md), [recipe manifest](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/recipes/agent-host/recipe.toml), [stack template](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/infra/aws/agent-host-stack.yaml) and `operations/aws/agent-host/` scripts own the procedure, reviewed at Harness `11adc5d625d102f808d306002916457116595264`. Re-read current sources before execution. The [prepared report](/Users/krisbrown/.local/state/ki/agents/tools-burndown/vega-rebuild-plan.report.md) and [readiness snapshot](/Users/krisbrown/.local/state/ki/agents/tools-burndown/vega-readiness.json) support this checkpoint; they are not its sole future authority.

Thread rules:

- Background agents run through `ki agent` under run name `techne`, with status, reports and the decisions log in `~/.local/state/ki/agents/techne/`.
- Estate rules from 2026-10-07: roadmap records use the v1 model (`kind`, `project`, `component`, `horizon` with a `hold` block); trades are on hold, so work is done directly or recorded in the receiving repository; `/ki-design-loop` runs for any Techne design question whose shape is still open.
- No remote agent execution or remote-environment changes outside the standing exemption. Each live host run needs Kris's SSH grant. Live rebuilds and withdrawals are the binding owner's alone.
- Commit with explicit paths only.

## Decisions made

- **Scoped owner handoff, tools-burndown Decision 14 (2026-10-12).** Kris replied "ok - but before that, whats the command to kill the notification center so it restarts" to the prepared bounded VEGA-REBUILD recommendation, then "fixed it. whats left except the vega build? maybe that can be handed off to the Techne: agent-host thread?". Together these approve carrying that owner-led plan here, including missing-host/unreadable discard, preserving credentials/controller and requiring fresh enrolment. This handoff originates in Principal estate-factorisation and gates its requested host-first patching order. The actual binding owner must recheck footprint, recovery obligations, key and access before action; the grant stays inside the one host stack and reviewed local inputs. It grants no autonomous remote agents, wider environment change, held CLI-115/006 release or patching implementation. Normal owner roles and Programme Hold still govern.
- Outside the exemption the hold stands. Only Kris can authorise, reshape or retire it.
- The exemption is standing and kept, with no fixed review date; it is revisited if the hold is reshaped (GDR-KI-ARCADIA-004).
- Credentials by stated role: the binding owner's administrator session builds and tears down, the operator role operates, and the GitHub token and Claude login are the binding owner's own until unattended agents arrive.
- Work on the host is safe only once it is on a remote; the durability model and its rollout follow ODR-KI-ARCADIA-001, one harness pilot before a wave.
- Agent hosts are recipes bound by per-person bindings, providers and footprints (ADR-KI-ARCADIA-006).
- The host becomes the binding owner's working machine through the recipe's Rig profile and the owner's profile payload (for Kris, Cheztoi), with zsh as the default shell and no detached delegation yet (ADR-KI-ARCADIA-003).
- The design is general across owners and targets; the recipe carries the two-checkout and writing-checkout rules (Decisions 10 and 11).
- The host-marker path is `~/.config/ki/host-marker`, and ki is pinned at 0.10.0 (Decisions 19 and 20).
- `target_host` is checked against the host name, not the provider's `host.id`; the recipe name `agent-host` stays generic (Decision 28).
- Patching: no automatic reboot by default, an optional daily host-local reboot window, Livepatch opt-in, security-only unattended scope, and updates never changing the status outcome (Decisions 26 and 27).
- Naming: the AWS agent host becomes `vega` at its rebuild; the laptop is `terra`; one name, `agent-host`, for the recipe and everything that meant `direct-host` (Decisions 29 and 30).
- References avoid roadmap record identifiers that will not last (Decision 32). Its durable owner is the cross-repository choreography rule in each repository's `AGENTS.md` and the `ki-work-roadmap` skill: a handoff names the originating repository, states the need and whether it blocks in plain terms, and links only durable documentation, never another repository's roadmap records (Decision 33). Code, checks and guides describe behaviour rather than cite pruned records. Checkpoints still cite records by full identifier, and `ki-accept` keeps its cross-repository link check before pruning (Decision 35).

## Files touched

This handoff unit changes only this checkpoint and the estate-factorisation checkpoint. Historical owner work touched ODR-KI-ARCADIA-001, ADR-KI-ARCADIA-003 and the agent-host Project note. Outside Arcadia, historical work touched: `recipes/agent-host/` and `operations/aws/agent-host/` in `ki-techne-harness`, the open records listed above, and the Techne host settings in chezmoi.

## Open questions

For Kris:

- **REBUILD:** Decision 14 resolves plan approval; actual owner execution/readiness remains. Revalidate unexpected resources or recoverable work before destruction, stop on contradiction/deletion failure, and escalate anything outside the approved one-host footprint. Do not infer missing means safe or widen discard to unrelated data/resources.
- **KIM-HAND:** the [[Hosts, Roles and Layers]] review request. Its original target thread, `knowledge-islands-model.island-model-and-tending`, was retired on 2026-10-12 with its Project left dormant; recommended route is state-of-play. The handoff text asks the receiver to say "already received" and not reprocess it.

Owned-host exemption for the Mac Studio is handled by KI-ARCADIA-GOV-033 in the `mac-studio-bootstrap` thread.

- Parked 2026-10-09: personal harness instructions - Kris wants the Claude and Codex instructions to become skills from a personal harness, leaving thin `CLAUDE.md` and `AGENTS.md`; raise in state-of-play when picked up.

## Next step

The binding owner takes the scoped Decision 14 plan through these gates; this documentary handoff executes none of them:

1. Reconcile inventory and local inputs before setup. [repositories.txt](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/operations/aws/agent-host/host/repositories.txt) still names `apps-observatory` and `ki-website`; current estate names are `apps-observatory.local` and `apps-knowledgeislands.info`. Inventory and [converge.sh](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/operations/aws/agent-host/host/converge.sh) still imply `~/workspaces/kit/knowledgeislands/...` and the old Harness path, while local estate paths are `~/workspaces/knowledge-islands/...`. Owner chooses/reconciles host layout, inventory and `harness_path` together. Through [Rig: chezmoi](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.chezmoi.md), review managed `agent-host` binding, SSH and Zed old-name targets and Cheztoi payload `target_host=vega`; review `chezmoi diff` before apply and validate payload with `host/profile-check.py` without resolving secrets. The binding currently lacks hostname overrides and the payload lacks `target_host`; runbook wording claiming these are already set is ahead of local reality. Recheck pinned ki/Rig installer/runtime compatibility rather than silently upgrading.
2. Recheck owner account/region, stack tags/outputs, actual instance absence, remaining resources/volumes, recovery obligations and access. If reachable, obtain OLD-host status/recovery using `ki-techne-agent-host`, not vega. Missing/unreadable status is unknown. Validate only the agent-host template: `self:aws:validate` also covers held controller/target templates. For the deferred baseline comparison use `7f1b70807950e3e6c0cd7270356d8a8b6b2592ed` and deployed OLD-name parameters, not vega; inspect any change set, never execute it, and delete only that unexecuted check set. No-change does not establish absence of drift.
3. Remove only the verified old host footprint via [destroy.sh](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/operations/aws/agent-host/destroy.sh) in `rebuild`, never `withdraw`, with `CONFIRM_DESTROY_AGENT_HOST=ki-techne-agent-host`. Decision 14 carries the approved missing-host/unreadable discard choice: if revalidation still warrants it, the owner uses `--discard-unreadable-host` and types `discard ki-techne-agent-host`; this skips report/same-host verification and may lose unreadable work. Recover newly discovered work first or stop for owner review. Wait for deletion completion; no blanket orphan deletion or second stack. Preserve GitHub/model/Pro credential parameters, operator role/profile, tailnet policy and controller `ki-techne-ops-007-primary`/its stack.
4. Remove only the verified obsolete agent-host tailnet node; any stale vega collision must be proven to belong to this host. Owner obtains a fresh single-use, non-ephemeral, appropriately approved shortest-build-expiry key carrying only `tag:ki-techne-agent-host`, overwriting the spent enrolment key securely. Recreate exactly one host with [provision.sh](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/operations/aws/agent-host/provision.sh), explicit `AGENT_HOST_NAME=vega` and `AGENT_HOST_TAILSCALE_NAME=vega`. Keep binding/recipe/selector `agent-host`, stack `ki-techne-agent-host`, prefix `/ki/techne/agent-host`, tag and operator identities. Use admin build/rebuild access and operator day-to-day access; retain default zsh, t3.medium/40 GiB, no reboot window and Livepatch false. No agent AWS credentials.
5. Owner verifies console `ki-agent-host bootstrap complete`, exactly one tagged instance, OS/Tailscale names vega and same-host identity/access, non-root `techne` without sudo, zsh and non-interactive tools, encrypted volume and no public SSH/SSM access. Then owner performs reviewed [setup](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/operations/aws/agent-host/setup.sh) and convergence rerun, including reviewed payload/inventory; second convergence must say `no changes`. Claude/Codex sign-ins are interactive owner actions, never copied credentials. Delete only the spent tailscale-auth-key after successful enrolment; preserve other credentials and all controller boundaries. Each live-host run stays within the named owner SSH/setup scope; no autonomous remote agents or held tooling.
6. Retain dated text and `techne/host-workspace/v1` JSON readiness evidence with matching same-host ID and outcome/exit (clean 0, at-risk 3, unknown 4; failure/unreachable refuses readiness), complete inventory, no unlanded work or tool/profile drift. Verify security-only daily unattended upgrades, Automatic-Reboot false, no reboot timer/Pro attachment for defaults, accurate pending/security counts, reboot flag/age/packages and Livepatch state; null is unknown and updates never change safety outcome. A restart needs its own bounded stop/start grant and renewed status. Only after owner readiness return to the separate CLI-008 plan/implementation decision; never seek acceptance of the already-pruned shell/rename record.
