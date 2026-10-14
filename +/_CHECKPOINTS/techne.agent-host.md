---
type: ki-checkpoint
thread: techne.agent-host
label: 'Techne: agent-host'
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-14T09:05:00Z
---

# techne.agent-host

## Objective

Reconstruct the `techne` working thread if its session is lost. Status, open records and ideas live in the [[agent-host]] Project note under the [[Initiatives/techne|Techne]] Initiative; this checkpoint copies none of them.

The thread moves agent work off the laptop onto the one agent host the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) exempts. It delivers the durability rollout of [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] and the workstation rollout of [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]]. The [[baseline-rollout]] Project is separate and does not gate it. Mac Studio work belongs to the `mac-studio-bootstrap` thread.

## Thread working rules

Re-read this block and `ki-delegation` (background-run standard) after any compaction.

- **Role:** coordinator for Techne: agent-host, run name `techne`. Quick checks and bookkeeping only in the thread; analysis, edits, tests and long waits go to `ki agent` background agents, waited on detached.
- **Owner reports:** `#` banner (thread, links, window, state), then `## What has been done`, `## What is in progress` with `Outstanding - no action requested now`, `## Outstanding queries` (`### TAG - title`: Summary, Need from you, Recommendation), and one fenced `text` reply block. Complete every time; no output style shortens it.
- **Quiet level:** timestamped one-line BST updates; minimal visible tool use; outcomes only, no command output, SHAs or narration. Say "background agents".
- **Decisions:** log each owner decision with `ki agent decide techne` before acting; quote Kris only from the transcript.
- **Standing rules:** explicit-path commits, no force-push or `--no-verify`; never prune or accept without approval, accept only through ki-accept; never print secrets; never touch hnr-org or its management account; Techne Programme Hold outside the agent-host exemption; burn the roadmap down, no new feature records; other threads' committed work may be pushed beneath ours when checks pass, naming it; connection-critical changes need a tested restore path; follow-up releases stop and ask first.

## Current state

Owner history below dates to 2026-10-11 at about 04:12 BST; the related rebuild/tools queue is reconciled on 2026-10-12. The AWS snapshot below was observed at 08:26 UTC that day, not checked live by this handoff.

Mark: 2026-10-09T21:40Z, decisions log at Decision 34

ki-delegation read at 71d7a0fd

- **Repositories.** All touched repositories are level with origin.
- **Host patching fields.** [KI-TOOL-TECHNE-CLI-008](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-008-host-patching-fields.md) is accepted as done through ki-accept (Decision 43), kept, not pruned, and pushed. Live verification on a real host waits for the vega rebuild and is not part of acceptance. Live check passed on 2026-10-14: `techne host status --host agent-host --json` against vega reports workspace `reported` with `updates` {os ubuntu, pending 73, security 50, reboot_required false, livepatch disabled}.
- **Delivered and closed.** OS patching (TECHNE-TOOLS-OPS-022) and the chezmoi workstation bundle (DOTFILES-UE-073) are accepted and pruned. The workstation pilot (TECHNE-TOOLS-OPS-015) is accepted and kept, not pruned. Recipe/binding identity is `agent-host`; the old deployed names still need the owner-led vega rebuild below.
- **The host.** vega was rebuilt on 2026-10-14 under Decision 45 (Kris present and directing each step). The old stack was deleted with `--discard-unreadable-host` after checks showed the old instance terminated on 2026-10-12 by the operator role with no surviving volumes or snapshots. The new stack `ki-techne-agent-host` runs instance `i-0cb5fa8cc1cd1d7d0` (t3.medium, 40 GB encrypted gp3, zsh, no inbound rules, OpenSSH and SSM agent inactive); OS and tailnet name `vega`; `techne` without sudo. The spent Tailscale key is deleted; the GitHub token is kept (expires 2027-01-05). `status.sh` reports 20 repositories clean, 50 security updates pending and no reboot required. The controller stack is untouched. The pre-rebuild change-set check could not apply: no running host, and the deployed template matched no tracked commit.
- **Pins.** `recipes/agent-host/rig.toml` in the harness is the one list of host tool versions; `mise` and `codex` are raised to 2026.10.6 and 0.162.0. The Mac is no longer compared against it; TECHNE-TOOLS-OPS-024 (weekly pin bump) is planned, draft.
- **Boundary audit accepted.** Kris accepted all ten decisions of the Rig and Techne boundary audit (Decision 40). The plain-language explainer is [[Hosts, Roles and Layers]], reviewed by the island-model-and-tending thread on 2026-10-14 (four wording fixes; boundary decisions recorded in ADR-KI-PRINCIPAL-003 and related Decision Records); cross-repository handoffs go through state-of-play.
- **Rebuild delivery already closed.** The zsh/rename shell delivery is accepted and pruned in current local Harness ancestry: `ace606e` acceptance, `11adc5d` pruning. Do not restore or seek acceptance of that record. AWS baseline checks, rebuild and chezmoi work were deferred to this owner thread. TECHNE-TOOLS-OPS-024 (weekly pin bump) is ready; its tool waits for the role profile to move to a `roles/` folder.
- **Owner historical work.** TECHNE-TOOLS-OPS-016 (to be replaced by a `tools-rig` signed-release kind), TECHNE-TOOLS-OPS-018, TECHNE-TOOLS-OPS-019 and TECHNE-TOOLS-OPS-023 in the harness remain in the earlier triage snapshot; KI-HARNESS-GOV-170 (keep resolution targets local) is planned, draft, in `ki-agentic-harness`. These are outside this bounded tools sweep and are not re-audited here. The related tools queue is reconciled below.
- **The Mac.** `terra`; chezmoi `rigProfile` is `laptop`; Tailscale is up.
- **Launcher deliveries.** Launcher-held wait gates, config preservation/local relaunch and Capital stores/aliases were accepted and pruned under tools-burndown Decision 12. The historical ki 0.10.0 host pin still needs owner compatibility review before reuse; local launcher delivery does not prove that pin has changed on a host.
- **Rebuild preparation.** Harness commit `bd2c0b1` (Decision 43) moved the host list, setup and guide to the `knowledge-islands` workspace layout. Setup and a second convergence ran; the second changed only four fast-forwards. One failure remains: ki-principal's OneDrive `sources` store cannot bind on vega, so its skill projections are missing there (SOURCES query). The decisions log runs to Decision 57.
- **Firewall (FYI from Rig, 2026-10-14).** KI-TOOL-RIG-CORE-047 (macOS) and KI-TOOL-RIG-CORE-051 (Linux nftables) are delivered and awaiting review, owned by `mac-studio-bootstrap`; not planned or implemented here or from tools-burndown. The agent-host handoff KI-TECHNE-OPS-026 was merged on 2026-10-14 into [KI-TECHNE-OPS-018](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-018-converge-tools-through-rig.md) (held; the vega-rebuild half of its condition is now met).
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

- **SOURCES (Decisions 53-55, 2026-10-14):** vega stays Knowledge Islands-only; cross-host sync deferred until a territory and host are named. Stopgap (empty read-only binding on vega plus runbook note) and the tools-ki missing-store defect capture are running as background agents `src-stopgap` and `src-repair`. [Research report](/Users/krisbrown/.local/state/ki/agents/techne/sources-research.report.md).
- **RIG-LINK:** `~/.local/bin/rig` links to the retired `~/workspaces/kit/knowledgeislands/tools-rig` path and is broken; it belongs to the Rig thread. (`~/.local/bin/techne` was relinked with `install.sh --link` on 2026-10-14.)
- **TS-OAUTH:** [KI-TECHNE-OPS-027](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-027-agent-host-tailscale-key-minting.md) adopted at horizon now (Decision 56); local implementation (`ts-oauth-impl`) launches after `src-stopgap`, which edits the same runbook. Kris creates the OAuth client; no remote change until then.
- **DEV-MODE:** Kris chose (a) (Decision 57): Rig owns `rig dev local|release <tool>`. Handed to the Rig thread via state-of-play on 2026-10-14; outstanding until Kris says it is done.

Owned-host exemption for the Mac Studio is handled by KI-ARCADIA-GOV-033 in the `mac-studio-bootstrap` thread.

- Parked 2026-10-09: personal harness instructions - Kris wants the Claude and Codex instructions to become skills from a personal harness, leaving thin `CLAUDE.md` and `AGENTS.md`; raise in state-of-play when picked up.

## Next step

Collect `src-stopgap` and `src-repair`, then launch `ts-oauth-impl` (prompt drafted at `~/.local/state/ki/agents/techne/ts-oauth-impl.draft.md`). vega is rebuilt and reachable as `vega`; the rebuild procedure is in the [operator runbook](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/guides/operator/agent-host.md).
