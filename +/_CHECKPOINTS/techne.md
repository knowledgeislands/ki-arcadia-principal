---
type: ki-checkpoint
thread: techne
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-07T20:53:00Z
---

# techne

## Objective

Reconstruct the `techne` working thread if its session is lost. Status, open records and ideas live in the [[agent-host]] Project note under the [[Initiatives/techne|Techne]] Initiative; this checkpoint copies none of them.

The thread moves agent work off the laptop onto the one agent host the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) exempts, and now delivers the durability rollout of [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]]. The [[baseline-rollout]] Project is separate and does not gate it.

## Current state

The host was rebuilt on 2026-10-07 by a stack-only delete that kept the GitHub token; workspace setup re-converged with no changes on a second run and status shows 21 repositories, none at risk. The GitHub token was rotated with a 90-day expiry. Claude and Codex are not yet signed in on the host. The durability decisions, their Decision Record, the GDR-KI-ARCADIA-004 amendment (KI-ARCADIA-GOV-029) and the early keep on KI-ARCADIA-GOV-021 are committed locally in Arcadia, unpushed, with both records awaiting Kris's review. The rollout pilot and wave records are captured, unpushed, in `ki-techne-harness` and `tools-techne`. No `techne` agents are running.

Thread rules:

- Background agents run under `claude-bg` with run name `techne`; prompts in `~/.local/state/claude-bg/techne/src/`, reusing the rules footer from `~/.local/state/claude-bg/gov-020/src/rules.md`.
- Estate rules from 2026-10-07: roadmap records use the v1 model (`kind`, `project`, `component`, `horizon` with a `hold` block); trades are on hold, so work is done directly or recorded in the receiving repository; `/ki-design-loop` runs for any Techne design question whose shape is still open.
- No remote agent execution or remote-environment changes outside the standing exemption. Live rebuilds and withdrawals are the binding owner's alone.
- Commit with explicit paths only; accept only through `ki-accept` on Kris's approval; never prune without approval.
- Leave other sessions' uncommitted changes alone.

## Decisions made

- Outside the exemption the hold stands. Only Kris can authorise, reshape or retire it.
- The exemption is standing and kept: the prototype review was decided early as keep, and `direct-host` stays a recipe (GDR-KI-ARCADIA-004).
- Credentials are stated by role: the binding owner's administrator session builds and tears down, the operator role operates, and the GitHub token and Claude login are the binding owner's own until unattended agents arrive.
- Work on the host is safe only once it is on a remote; the durability model and its rollout follow ODR-KI-ARCADIA-001, with one harness pilot before a wave.
- Agent hosts are recipes bound by per-person bindings, with providers and footprints (ADR-TECHNE-003).

## Files touched

The durability decisions file, ODR-KI-ARCADIA-001 and the Decisions index; GDR-KI-ARCADIA-004, the hold and `Admin/MEMORY.md` through KI-ARCADIA-GOV-029; KI-ARCADIA-GOV-021; the agent-host Project note; and the roadmap ledgers and new records in `ki-techne-harness` and `tools-techne`. No remote state changed.

## Open questions

Thread-level only: whether any later review date replaces the decided 2026-11-06 review, and whether the remaining durability captures (chezmoi, `tools-ki`, `ki-agentic-harness`) are written by this thread.

## Next step

Kris reviews KI-ARCADIA-GOV-029 and KI-ARCADIA-GOV-021 through `ki-accept`, pushes the local commits when ready, signs Claude (and optionally Codex) in on the host, and then the harness pilot is planned through `ki-plan`.
