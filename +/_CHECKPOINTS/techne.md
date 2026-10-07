---
type: ki-checkpoint
thread: techne
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-07T17:20:00Z
---

# techne

## Objective

Reconstruct the `techne` working thread if its session is lost. Status, open records and ideas live in the [[agent-host]] Project note under the [[Initiatives/techne|Techne]] Initiative; this checkpoint copies none of them.

The thread moves agent work off the laptop onto the one agent host the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) exempts, and prepares the evidence for the 2026-11-06 review ([[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]]). The [[baseline-rollout]] Project is separate and does not gate it.

## Current state

The thread is idle with no `techne` agents running and all its work committed and pushed. Thread rules:

- Background agents run under `claude-bg` with run name `techne`; prompts in `~/.local/state/claude-bg/techne/src/`, reusing the rules footer from `~/.local/state/claude-bg/gov-020/src/rules.md`.
- Estate rules from 2026-10-07: `ki` 0.8.1; roadmap records use the v1 model (`kind`, `project`, `component`, `horizon` with a `hold` block); trades are on hold, so work is done directly or recorded in the receiving repository; `/ki-design-loop` runs for any Techne design question whose shape is still open.
- No remote agent execution or remote-environment changes outside the standing exemption. Host rebuilds start with the harness operator guide's "Before a rebuild" no-change change set.
- Commit with explicit paths only; accept only through `ki-accept` on Kris's approval; never prune without approval.
- Leave other sessions' uncommitted chezmoi changes alone.

## Decisions made

- Outside the exemption the hold stands. Only Kris can authorise, reshape or retire it.
- Kris accepted GOV-020 and widened it through GOV-023 to a standing exemption with a scheduled review (GDR-KI-ARCADIA-004).
- Operator access is an account-local role, independent of any organisation setup.
- This thread runs separately from the baseline rollout, which became the [[baseline-rollout]] Project.
- The chezmoi `techne-agent-host` helper was removed outright (UE-069).
- Agent hosts are recipes bound by per-person bindings, with providers and footprints (GOV-025, ADR-TECHNE-003); `tools-techne` has no built-in defaults, `--host` is required to change a host, and provider options are prefixed (`--aws-*`).

## Files touched

On 2026-10-07 the thread moved its status and ideas into the [[agent-host]] Project note and reduced this checkpoint to reconstruction. Canonical changes went through owning records: ADR-TECHNE-003 and Engineering Practice through GOV-025. No remote state changed through this checkpoint.

## Open questions

The Project note's Ideas and GOV-021 hold the substantive questions. Thread-level only: whether a design loop or a direct record suits the host-tools work, given UE-020's stale hold.

## Next step

See the [[agent-host]] Project note's Update. Pending Kris: the rebuild time, the approach for host tools, and which subjects go to `/ki-design-loop`.
