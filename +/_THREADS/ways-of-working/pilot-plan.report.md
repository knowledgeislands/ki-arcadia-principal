# Owner report - pilot-plan (ways-of-working)

Run `ways-of-working`, agent `pilot-plan`, Project thread KI Model: ways-of-working, Initiative knowledge-islands-model. Repository `ki-principal`, branch `main`.

## What has been done

- Planned [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) to the Ready shape under `ki-plan`: Current state, Steps by repository, Files touched, Verify, Dependencies / blocks, Delegation and Documentation impact, with Discussion last. Status stays `draft`: `ki-plan` sets `ready` only after your explicit approval of the plan, and your words were "review before grant". Every Ready section is complete; the only gap is your approval.
- Committed and pushed fast-forward as one Conventional Commit, staged by explicit path. The pre-commit audits pass with the same two pre-existing warnings as before the change (Projects `paperclip-bootstrap-and-recovery` and `website` lack close-out assessments), which are unrelated and untouched.
- Resolved both open questions in the record. `claude -p` runs hooks, shown by the coord-hook agent's live trial. A project-level `outputStyle` overrides the user-level one: the installed Claude Code 2.1.287 lists its settings sources as user, project, local, flag and policy and resolves a key from the last source back, and its own `/output-style` command writes to the project's local settings file with `outputStyle` as the one allowed key. Evidence came from the runtime's strings and the shipped settings schema, with no setting changed. The record states this and the caveat that it is binary evidence, so Verify includes a live "style is active" check.
- Replaced every decision-number citation in the record with your words, as the durability rule requires.

### The plan in plain language

One pilot, coordinated from the `ways-of-working` Project thread, with every unit a detached background agent.

1. **Harness, one agent in a worktree.** Create `ki-pmo` in `change-management` and move the thread material out of the `ki-delegation` standard without changing it: coordinator responsiveness and the turn budget, coordinating-thread practices and the three report forms, project threads, the master thread, opening, bootstrap, directions and the thread working rules. The owner report and Needs tags stay in `ki-delegation` and `ki-pmo` adopts them by link. Add the off-ramps in `ki-delegation`, `ki-checkpoint`, `ki-tokenomics` and `ki-recap` ("RECAP-AWARE - (c)"), re-point `ki-checkpoint` and the refresh rule, refine the two SKILLS Decision Records in place, write the glossary and rubric. Make `ki-pmo` the hook's owner and switch its signal from `+/_CHECKPOINTS/` to a `[skills.ki-pmo]` declaration ("HOOK-OWNER - (a)"), with tests. Ship one output-style file carrying the three responsiveness rules and the owner-report shape, selected by `outputStyle` in the harness's tracked settings ("COORD-STYLE - (c) in the pilot; (a) now."). Regenerate the skill graph and map. Baseline includes the skill-renames agent's commits.
2. **Chezmoi, one agent.** Deploy that style file to `~/.claude/output-styles/` as a managed file sourced from the harness checkout, so a repository-level setting can resolve it. `Concise` stays the user default. No hook change.
3. **This island, one agent.** Declare `[skills.ki-pmo]` in `.ki.toml`, set `outputStyle` in the tracked `.claude/settings.json`, run the audits, then acceptance test 1 (rebuild the master and Project thread from the checkpoint alone, run folder renamed aside) and a generic-checkpoint audit in a repository without `ki-pmo`.
4. **You and the thread, after the Headroom restart.** Acceptance tests 2 and 3: three owner messages while an agent runs, one after a compaction, answered within one turn of at most five tool calls with no subagent; the hook line verbatim on Claude Code and Codex and absent in a `ki agent` launch. Scored from the transcripts by a background agent; lessons written into the record for the waves.

Dependencies: nothing blocks the pilot; `blocked_by` is empty. Tests 2 and 3 wait for your Headroom restart ("RESTART-PROXY"); test 1 and the unit tests do not. Risks in the record: the precedence evidence is binary-derived, a stray `.claude/settings.local.json` written by `/output-style` would silently override the tracked style, open threads need a restart to pick up the hook, and the sibling renames agent is in the same skill area so the harness agent starts from a baseline that includes its commits.

## What is in progress

Nothing. No delivery work was started, no Wave records were created, no grant was assumed.

## Outstanding queries

### PLAN-APPROVE - approve the plan so the record can go Ready

The plan is shaped and committed as `draft`. Your "approve" lets the thread set `status: ready` under `ki-plan`; "change" with a note returns it for replanning. Recommendation: approve as written, then grant delivery separately.

### CAPITALS - which Capitals declare ki-pmo in the pilot

With the hook's signal moving to the declaration, a Capital that does not declare `ki-pmo` loses the reminder on its master thread. Options: (a) this island and the harness only, the other six territories wait for Wave F; (b) every Capital now by a one-line handoff. Recommendation: (a), one failure mode and clean lessons.

### STYLE-NAME - name of the shipped output style

The plan holds `ki-coordinator` as the default so the per-turn style reminder reads as "coordinator style active". The harness may choose another; say if you want a different name now.

## Summary

- [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) is fully planned, committed and pushed; status `draft` pending your approval.
- Both open checks are resolved and recorded with evidence: `claude -p` runs hooks; project `outputStyle` overrides user.
- No delivery, no grant, no Wave records.

## Need you

Answers to `PLAN-APPROVE`, `CAPITALS` and `STYLE-NAME`.

## Recommendation

Approve the plan, choose `CAPITALS` (a), keep `ki-coordinator`, then grant delivery to the `ways-of-working` thread once the Headroom restart is done.

```text
PLAN-APPROVE - approve | change: <note>
CAPITALS - (a) | (b)
STYLE-NAME - ki-coordinator | <other>
```
