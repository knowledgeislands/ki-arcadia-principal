# pilot - KI-PRINCIPAL-ECO-013 ki-pmo extraction pilot

Run `pilot` under the `ways-of-working` Project thread, 2026-10-14. Authority: Kris's grant "PILOT-GRANT - granted", within "PILOT-SCOPE - (a) ki-pmo move only, with the rebuild-from-checkpoint test." and "CAPITALS - (a)." (this island and the harness only).

## What has been done

- [KI-HARNESS-GOV-185](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-185-ki-pmo-extraction.md>) opened, delivered and set to `awaiting-review` on harness `main`, pushed fast-forward as seven commits from baseline `6d3e2f34` to `418df4a0`: the ledger advance, the record, a `ki-skills` reader fix, the extraction, a `ki-pmo` rubric fix, the declaration with regenerated publications, and the review packet.
- `ki-pmo` exists at `skills/change-management/ki-pmo/` with SKILL.md, the coordinating-thread standard opening on Kris's responsiveness words of 2026-10-13, sources, rubric items PMO-1 to PMO-6 with tests, and the generated rubric. `ki-delegation` keeps the run contract, owner report, Needs tags and decisions log and points to `ki-pmo` for the thread. Off-ramps added in `ki-checkpoint`, `ki-recap` and `ki-tokenomics`.
- The coordinator reminder hook now fires on `[skills.ki-pmo]` in the checkout's top-level `.ki.toml`, per "HOOK-OWNER - (a). A repository that doesn't delegate then never gets the hook, and removing ki-pmo disables it."; checkpoints without the declaration are silent. Tests, README, HARN-012 updated, HARN-013 added, ADR-KI-HARNESS-SKILLS-005 and -006 refined in place. The `ki-coordinator` output style ships at `output-styles/ki-coordinator.md`, per "COORD-STYLE" and "STYLE-NAME".
- Harness gates on the pushed tree: suite by skill group with hooks and evals 1128 pass and 0 fail, `bunx tsc --noEmit` clean, skill-graph check in sync, hook tests 12 pass; audits for `ki-skills`, `ki-delegation`, `ki-checkpoint`, `ki-pmo`, `ki-repo`, `ki-repo-harness`, `ki-diagrams` and `ki-work-roadmap` with no failures, only the two pre-existing `ki-skills` cadence warnings. Anchor search finds only the record.
- Two corrections along the way, both committed: the `ki-skills` Operating-modes reader stopped at a hyphen so `full-summary` raised a false warning; and the `ki-pmo` rubric family handed every item the merged outcomes, so PMO-1 reported a label finding. The second was caught by the live island audit, not the harness tests.
- Pre-existing layout fault fixed in the harness `.ki.toml`: `[skills.ki-diagrams]` sat after `[skills.ki-trades]`, which the `ki-repo` layout rule requires last.
- [KI-PRINCIPAL-ECO-013](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md>) moved to `in-progress` with `horizon: now` and baseline `984d950`; nine of its Steps ticked; `## Current state` rewritten; the pilot lessons for Waves A to D and F written under Discussion. Island `.ki.toml` declares `[skills.ki-delegation]` and `[skills.ki-pmo]`, and `.claude/settings.json` selects `ki-coordinator`. Committed by explicit path as `2e52c75` and pushed fast-forward.
- Island gates: `ki-pmo` family WARN=4 FAIL=0 (the live estate disagrees with the standard: nine active checkpoints against the cap of four, the `observatory` label and Project and the `rig.chezmoi` Project unregistered); `ki-delegation`, `ki-repo` and `ki-work-roadmap` pass; `ki-repo-kb-streams` carries two pre-existing STREAM-10 warnings; `ki-checkpoint` FAIL=5, all pre-existing (RECORD-2 on `platform-foundations.estate-factorisation`, `rig.mac-studio-bootstrap` and `techne.agent-host`; LIFECYCLE-1 on `knowledge-islands-model.observatory` with `state: resting`; BOUNDARY-1 on `knowledge-islands-model.ways-of-working`). No checkpoint, Admin, Pillars or Resources file was edited.
- Acceptance test 1 rehearsed from the checkpoints and the standard alone: the derived opener is `Bootstrap as the ways-of-working project thread under ki-pmo.`; the fresh-session runs on each runtime are left to the thread.
- Limitation: a single full `bun run test` in the primary checkout ran twenty minutes at full load without output while another session's coverage run shared the checkout; it was stopped and the suite run by group passed in about thirty seconds. Cause not established; recorded as a lesson.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- Receiver-owned: chezmoi deployment of `output-styles/ki-coordinator.md` to `~/.claude/output-styles/` (ECO-013 Steps under chezmoi); acceptance test 1 fresh-session runs, and tests 2 and 3 after the Headroom restart, from the `ways-of-working` thread; scoring and the hand to `ki-accept`. ECO-013 therefore stays `in-progress` rather than `awaiting-review`.
- Receiver-owned: each coordinating checkpoint replaces its `ki-delegation read at` line with `ki-pmo read at` at its next update, and the master's opener still reads `under ki-delegation`; [KI-HARNESS-GOV-180](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md>) and [KI-HARNESS-GOV-175](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md>) re-point to `ki-pmo` in their own deliveries; `tools-rig` doctor and website follow-ons unchanged.
- Wave F: the other Capitals need `[skills.ki-delegation]` and `[skills.ki-pmo]` together, since the `ki-pmo` audit refuses a declaration whose dependency is undeclared; the state vocabulary (`resting`, the active cap) and the five pre-existing `ki-checkpoint` failures above are Wave F's to settle, not this pilot's.
- Verification limitations: the diagram SVGs under `docs/diagrams/` were not re-exported (viewer tooling unavailable); `ki-recap` carries no optional dependency edge on `ki-pmo` because it would close a cycle the forest layout cannot draw, per "RECAP-AWARE - (c) ki-recap detects coordinating thread and hands ki-pmo's forms." the off-ramp is prose; Biome warns on one non-null assertion in `ki-pmo`'s `pmo.test.ts`.
- Retained material: worktree `/Users/krisbrown/.local/state/ki/agents/ways-of-working/worktrees/ki-agentic-harness` on branch `pilot/ki-pmo` is now behind `main` and can be removed by the thread; the harness primary's untracked `+/diagrams/` belongs to another session and was not touched.

## Outstanding queries

No outstanding queries. The follow-up release question the Master's standing rule reserves ("follow-up releases ask first") does not arise: no `tools-ki` release was needed, and none was made.

```text
No reply needed. KI-HARNESS-GOV-185 (/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-185-ki-pmo-extraction.md) is awaiting review; KI-PRINCIPAL-ECO-013 (/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) stays in-progress for the chezmoi deployment and acceptance tests.
```
