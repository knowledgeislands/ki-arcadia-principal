---
type: ki-checkpoint
thread: techne.agent-host
label: 'Techne: agent-host'
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-15T14:59:23Z
---

# techne.agent-host

2026-10-15: the state-of-play territory hold set this checkpoint's frontmatter to drained, matching the thread's own drain recorded under Current state; the next steps are those already in this checkpoint.

**Messages from Master: state-of-play** - the receiving thread acts on each line, then removes it.

- 2026-10-16 · CI-RED-PRINCIPAL · Fnd: tools-burndown, on Kris's decision of 16 October: `ki repo audit` fails these reports in `+/_THREADS/techne/`, for this thread to fix in its own folder: cli133-plan (PMO-7). PMO-7 wants every full record identifier in prose linked to its local file, or as `<ID> (pruned)` to the GitHub file at its last revision; NOTE-1a reads a report's opening `---` rules as unterminated frontmatter, which tools-burndown cleared by putting a `<!-- markdownlint-disable-file MD041 -->` line above the unchanged rules.
- 2026-10-16 · THREADS-CLEAR · KI Model: ways-of-working, on Kris's decision of 15 October: "Each owning thread clears its own folder at its next mark, moving scratch to tmp/, homing or removing tracked work products and moving briefs to the state folder, told through its inbox by this thread." Apply it to `+/_THREADS/techne/` against the closed list now in [ki-pmo's Tidying the thread folder](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md) and the ki-delegation [Run packet](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md) (ki-agentic-harness `065bbd5b`, on `origin/main`), in Kris's words: "A thread folder holds a closed list, decisions.md and <name>.report.md only; briefs live in the state folder, work products in their owning home, temporary output in the temporary location." · detail: [ways-of-working decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md)
- 2026-10-17 · PMO-7-BACKLOG · Master: state-of-play, on Kris's decision of 15 October: "Each thread relinks or deletes its own reports at its next mark under the thread-tidy rule, and the state-of-play thread tells each one so." Apply it to this thread's own folder, [`+/_THREADS/techne/`](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/techne/) · detail: [ways-of-working decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md)

## Objective

Reconstruct the `techne` coordination thread if its session is lost. Status, open records and ideas live in the [[agent-host]] Project note under the [[Initiatives/techne|Techne]] Initiative; this checkpoint copies none of them.

The thread moves agent work off the laptop onto the one agent host the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) exempts. It delivers the durability rollout of [ODR-KI-PRINCIPAL-001](../../Admin/Governance/Decisions/ODR-KI-PRINCIPAL-001-keeping-work-safe-on-the-agent-host.md) and the workstation rollout of [ADR-KI-PRINCIPAL-003](../../Admin/Governance/Decisions/ADR-KI-PRINCIPAL-003-the-agent-host-workstation-model.md). The [[baseline-rollout]] Project is separate and does not gate it. Mac Studio work belongs to the `mac-studio-bootstrap` thread.

## Current state

Mark: 2026-10-15T14:59Z

Running: nothing. State: drained on 2026-10-15 (Decision 69) for archiving on terra and resuming on sol from the repository alone; no run is unfinished and no brief is outstanding.

Thread folder: +/_THREADS/techne/

ki-pmo read at daa63224

**Thread working rules.** Re-read this block, `ki-pmo` and `ki-delegation` after any compaction; copy any agent report missing from the thread folder into it at each report.

- **Role:** coordination thread for Techne: agent-host under `ki-pmo`, the coordinating-thread standard; run name `techne`. Quick checks and bookkeeping only in the thread; analysis, edits, tests and long waits go to detached `ki agent` background agents, with status, reports and the decisions log in `~/.local/state/ki/agents/techne/`.
- **Owner reports:** the `ki-pmo` report heading and footer banner around `## Done`, `## In Progress` (with `Outstanding - no action requested now`) and `## Queries` (`### TAG - title` with Context, Query and Options), then one fenced `text` reply block; `ki-pmo` and `ki-delegation` own the exact shape. Complete every time; no output style shortens it. A saved report file omits the three opening `---` rules and starts at the `#` heading; every brief says so.
- **Commit everything:** commit, by explicit path, all work the thread does or oversees; at each report and resting point check every finished agent's work is committed and pushed in its repository, commit the checkpoint and thread folder, and name any uncommitted or unpushed work in the report. ki-principal's pre-commit gate audits the whole tree and fails on STREAM-9 in the `mac-studio-bootstrap` Project note: until the scoped `ki repo audit --staged` gate lands, leave ki-principal changes uncommitted and say so, never use `--no-verify`, then commit them through a private index by explicit path at the next mark (Decision 59).
- **Tidy at each mark:** delete by explicit path every report in `+/_THREADS/techne/` whose queries are all answered and whose outcome has a durable home; keep `decisions.md` and reports with open queries; commit the deletions.
- **Heartbeat:** while dispatched work runs, a background check exits when any agent finishes or after 5 minutes and is re-armed; each wake gives a one-to-two-line timed update naming each running agent's step from `ki agent status`. No heartbeat at rest.
- **Quiet level:** timestamped one-line local-time updates; outcomes only, no command output, SHAs or narration. Say "background agents".
- **Decisions:** log each owner decision with `ki agent decide techne` before acting; quote Kris only from the transcript.
- **Standing rules:** explicit-path commits, no force-push or `--no-verify`; accept only through ki-accept and never prune or accept without approval; never print secrets; never touch hnr-org or its management account; Techne Programme Hold outside the agent-host exemption; burn the roadmap down, no new feature records; other threads' committed work may be pushed beneath ours when checks pass, naming it; connection-critical changes need a tested restore path; follow-up releases stop and ask first.
- **Estate rules (2026-10-07):** roadmap records use the v1 model (`kind`, `project`, `component`, `horizon` with a `hold` block); trades are on hold, so work is done directly or recorded in the receiving repository; `/ki-design-loop` runs for any Techne design question whose shape is still open.
- **Remote work:** none outside the standing exemption. Each live host run needs Kris's SSH grant; live rebuilds and withdrawals are the binding owner's alone.

**State.**

- **The host.** vega was rebuilt on 2026-10-14 under Decision 45, Kris directing each step. The new stack `ki-techne-agent-host` runs instance `i-0cb5fa8cc1cd1d7d0` (t3.medium, 40 GB encrypted gp3, zsh, no inbound rules, OpenSSH and SSM agent inactive); OS and tailnet name `vega`; `techne` without sudo. The spent Tailscale key is deleted; the GitHub token is kept (expires 2027-01-05). `status.sh` reports 20 repositories clean, 50 security updates pending and no reboot required. The controller stack is untouched.
- **Host patching.** KI-TOOL-TECHNE-CLI-008 (accepted and pruned 2026-10-14) delivered the patching fields; the live check passed on 2026-10-14 against vega (`updates`: os ubuntu, pending 73, security 50, reboot_required false, livepatch disabled). OS patching (TECHNE-TOOLS-OPS-022) and the chezmoi workstation bundle (DOTFILES-UE-073) are accepted and pruned; the workstation pilot (TECHNE-TOOLS-OPS-015) is accepted and kept.
- **Sources.** Done (Decisions 53-55): vega's ki-principal `sources` role is bound to an empty read-only stand-in, `ki repo --estate repair` passes (20 healthy) and `converge.sh` binds the stand-in on rebuild (runbook section "Sources stand-in"). The lasting fix is [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) (triage). vega stays Knowledge Islands-only; cross-host sync waits until a territory and host are named. tools-ki may already carry the CLI-126 fix (a commit on 2026-10-14 makes repair warn on an unavailable store); confirm, then retire the vega stand-in once vega runs it.
- **Tailscale key minting.** [KI-TECHNE-OPS-027](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-027-agent-host-tailscale-key-minting.md) is adopted at horizon now (Decision 56) and implemented (`mint-tailscale-key.sh`, guide section "Key minting"), awaiting review; it waits on TS-OAUTH-LIVE. Kris passed the live `--check` on 2026-10-14 and it was accepted done through ki-accept, not pruned (Decisions 61 and 62).
- **Pins.** `recipes/agent-host/rig.toml` in the harness is the one list of host tool versions (`mise` 2026.10.6, `codex` 0.162.0); the Mac is no longer compared against it. TECHNE-TOOLS-OPS-024 (weekly pin bump) is ready; its tool waits for the role profile to move to a `roles/` folder. The historical ki 0.10.0 host pin needs owner compatibility review before reuse.
- **Boundary audit.** Kris accepted all ten Rig and Techne boundary decisions (Decision 40). The explainer is [[Hosts, Roles and Layers]], reviewed by the island-model-and-tending thread on 2026-10-14; cross-repository handoffs go through state-of-play.
- **Related tools queue.** KI-TOOL-KI-CLI-115 (cancelled and pruned 2026-10-14). [KI-TOOL-TECHNE-CLI-006](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-006-guarded-host-commands.md) guarded host commands remains adopted draft Hold. [KI-TECHNE-OPS-018](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-018-converge-tools-through-rig.md) is held, absorbing the agent-host firewall handoff; the vega-rebuild half of its condition is met. Dock belongs to Rig; no broad agent-host or Programme Hold resume.
- **Other harness work, not re-audited here.** TECHNE-TOOLS-OPS-016 (to be replaced by a `tools-rig` signed-release kind), TECHNE-TOOLS-OPS-018, TECHNE-TOOLS-OPS-019 and TECHNE-TOOLS-OPS-023 sit in triage; KI-HARNESS-GOV-170 (keep resolution targets local) is planned, draft, in `ki-agentic-harness`.
- **The Mac.** `terra`; chezmoi `rigProfile` is `laptop`; Tailscale is up. `~/.local/bin/techne` was relinked with `install.sh --link` on 2026-10-14.
- **Procedure.** The [operator runbook](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/guides/operator/agent-host.md), [recipe manifest](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/recipes/agent-host/recipe.toml), [stack template](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/infra/aws/agent-host-stack.yaml) and `operations/aws/agent-host/` scripts own the procedure; re-read current sources before execution. The [vega rebuild plan](/Users/krisbrown/.local/state/ki/agents/tools-burndown/vega-rebuild-plan.report.md) and [readiness snapshot](/Users/krisbrown/.local/state/ki/agents/tools-burndown/vega-readiness.json) are supporting evidence only.
- **Decisions log.** Runs to Decision 69, committed in `+/_THREADS/techne/decisions.md`. `~/.local/state/ki/agents/techne/` stays on terra; everything needed to resume is in the thread folder and this checkpoint. The vega rebuild plan and readiness snapshot linked under Procedure are terra-local evidence only.

## Decisions made

- **Scoped owner handoff (tools-burndown Decision 14, 2026-10-12).** Kris approved carrying the owner-led vega rebuild here, including missing-host/unreadable discard, preserving credentials and controller and requiring fresh enrolment. It grants no autonomous remote agents, wider environment change, held KI-TOOL-TECHNE-CLI-006 release or patching implementation; normal owner roles and the Programme Hold still govern.
- Outside the exemption the hold stands; only Kris can authorise, reshape or retire it. The exemption is standing, with no fixed review date, and is revisited if the hold is reshaped ([GDR-KI-PRINCIPAL-004](../../Admin/Governance/Decisions/GDR-KI-PRINCIPAL-004-standing-agent-host-exemption-from-the-techne-programme-hold.md)).
- Credentials by stated role: the binding owner's administrator session builds and tears down, the operator role operates, and the GitHub token and Claude login are the binding owner's own until unattended agents arrive.
- Work on the host is safe only once it is on a remote; the durability model and its rollout follow ODR-KI-PRINCIPAL-001, one harness pilot before a wave.
- Agent hosts are recipes bound by per-person bindings, providers and footprints (ADR-KI-ARCADIA-006).
- The host becomes the binding owner's working machine through the recipe's Rig profile and the owner's profile payload (for Kris, chezmoi), with zsh as the default shell and no detached delegation yet (ADR-KI-PRINCIPAL-003).
- The design is general across owners and targets; the recipe carries the two-checkout and writing-checkout rules (Decisions 10 and 11).
- The host-marker path is `~/.config/ki/host-marker`, and ki is pinned at 0.10.0 (Decisions 19 and 20).
- `target_host` is checked against the host name, not the provider's `host.id`; the recipe name `agent-host` stays generic (Decision 28).
- Patching: no automatic reboot by default, an optional daily host-local reboot window, Livepatch opt-in, security-only unattended scope, and updates never change the status outcome (Decisions 26 and 27).
- Naming: the AWS agent host is `vega`; the laptop is `terra`; one name, `agent-host`, for the recipe and everything that meant `direct-host` (Decisions 29 and 30).
- References avoid roadmap record identifiers that will not last (Decision 32). A cross-repository handoff names the originating repository, states the need and whether it blocks in plain terms, and links only durable documentation, never another repository's roadmap records (Decision 33). Code, checks and guides describe behaviour rather than cite pruned records; checkpoints cite records by full identifier, and `ki-accept` keeps its cross-repository link check before pruning (Decision 35).
- DEV-MODE: Rig owns `rig dev local|release <tool>` (Decision 57).

## Files touched

This update changes only this checkpoint and `+/_THREADS/techne/`. Earlier thread work touched ODR-KI-PRINCIPAL-001, ADR-KI-PRINCIPAL-003 and the agent-host Project note; outside the Capital, `recipes/agent-host/` and `operations/aws/agent-host/` in `ki-techne-harness`, the records listed above and the Techne host settings in chezmoi.

## Open questions

For Kris:

- **CLI-133-DELIVER:** [KI-TOOL-KI-CLI-133](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md) is Ready (reproduced against the installed `ki`; fix: adopt a state file only if Git has never held that path in the thread folder). Recommended: deliver on Sonnet through ki-implement, stop at Awaiting review, commit and push, no release. Report: `+/_THREADS/techne/cli133-plan.report.md`. [KI-TOOL-TECHNE-CLI-009](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-009-tailscale-oauth-binding-field.md) is adopted as deliver at horizon next (Decision 64).

Handoffs:

**STORE-REPAIR (with tools-burndown):** Kris approved planning for [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md). The record is already Ready / Now in ways-of-working under CI-STORE. Please confirm the current ways-of-working tools-ki writer, or name the agreed writer and slot. Tools-burndown will preserve the current record and remain read-only until agreement; no rollback, duplicate planner, implementation or host operation is requested.

- **DEV-MODE** (with state-of-play): Kris chose that Rig owns `rig dev local|release <tool>`; handed to state-of-play on 2026-10-14, which holds it with RIG-LINK for Kris's decision under the burn-down rule.
- **RIG-LINK** (with state-of-play): `~/.local/bin/rig` links to the retired `~/workspaces/kit/knowledgeislands/tools-rig` path and is broken; it belongs to the Rig thread.
- **Firewall** (with `mac-studio-bootstrap`): KI-TOOL-RIG-CORE-047 (macOS) and KI-TOOL-RIG-CORE-051 (Linux nftables) are delivered and awaiting review there; nothing is planned or implemented here. The Mac Studio owned-host exemption is KI-ARCADIA-GOV-033 in that thread.

Held:

- [KI-TECHNE-OPS-018](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-018-converge-tools-through-rig.md) (converge host tools through Rig): on hold per its record until Kris releases it.
- The vega host name in `status.sh`: held until Kris releases it.

Parked:

- Parked 2026-10-09: personal harness instructions - Kris wants the Claude and Codex instructions to become skills from a personal harness, leaving thin `CLAUDE.md` and `AGENTS.md`; raise in state-of-play when picked up.

## Next step

On sol: re-bootstrap from this checkpoint, then wait on Kris for CLI-133-DELIVER. Until KI-TOOL-KI-CLI-133 is fixed, remove re-copied retired reports by explicit path after any `ki agent decide`. Once KI-TOOL-TECHNE-CLI-009 is delivered, ki-techne-harness adds the matching optional recipe parameter. Resume line: `Resume Techne: agent-host on sol from its checkpoint under current ki-pmo and ki-delegation since 2026-10-15T14:59Z: re-bootstrap, read the parked queries, take stock, restart authorised work, then banner.`
