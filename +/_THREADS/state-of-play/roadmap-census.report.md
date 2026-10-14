# Roadmap census and burn-down proposal

`roadmap-census`, state-of-play, 2026-10-14 ~11:50 BST, read-only under Decision 179. Nothing was changed in any repository.

## What has been done

- **The 42 explained.** There are 36 open records across the Knowledge Islands roadmaps, plus 6 that are `done` but not yet pruned: 42 in total. On 2026-10-12 there were 19 open. The triage-apply-2 run counted 33 at 07:54 BST today.
- **Census by repository.** The open count excludes `done`. No record is `cancelled`. Holds are counted by their horizon.

| Repository | Triage | Draft next | Draft future | Ready next | In progress | Awaiting review | Hold | Open | Done, unpruned |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| ki-agentic-harness | - | 4 | 2 | - | 2 | 1 | 1 | 10 | 5 |
| ki-principal | - | 1 | - | 2 | 1 | - | 1 | 5 | - |
| ki-techne-harness | - | 1 | 1 | - | - | 1 | 2 | 5 | - |
| tools-ki | 1 | 2 | - | - | - | - | 2 | 5 | - |
| tools-rig | 1 | - | - | 1 | - | 2 | 5 | 9 | - |
| tools-techne | - | 1 | - | - | - | - | - | 1 | 1 |
| ki-specifications | - | - | - | - | - | - | 1 | 1 | - |
| 13 others † | - | - | - | - | - | - | - | 0 | - |
| **Total** | **2** | **9** | **3** | **3** | **3** | **4** | **12** | **36** | **6** |

† apps-knowledgeislands.info, apps-observatory.local, homebrew-tap, the seven mcp repositories, tools-git-almanac and tools-mgit have empty roadmaps. kw-website and paperclip have no roadmap at all.

- **Growth.** The 13 October burst took the count from 19 to 33. It came from boundary-handoffs (tools-ki and tools-rig release and vega records), the tools-rig firewall pair, the ways-of-working delegation and durability records, and the Live Artifact spec. Ten records have been created since 2026-10-14T00:00Z; Git history shows who made each:

| Record | Repository | Thread or run | Why |
| --- | --- | --- | --- |
| [KI-HARNESS-GOV-181](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md) | ki-agentic-harness | ways-of-working | Kris: "EXPORT-ROUTE - (a) reuse Archify's Chrome route; open deliver record" |
| [KI-HARNESS-GOV-182](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-182-wave-e-skill-renames.md) | ki-agentic-harness | ways-of-working, Wave E sibling agent | Kris's SKILLS-PARALLEL; now `done` |
| [KI-HARNESS-GOV-183](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-183-generated-skill-map.md) | ki-agentic-harness | ways-of-working | Kris asked for the skill graph to show groupings and shapes again |
| [KI-HARNESS-GOV-184](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-184-working-area-marks.md) | ki-agentic-harness | ways-of-working, mark-tidy | Kris: "MARK-RULE - yes, that reading; capture as a harness deliver record at next" |
| [KI-HARNESS-GOV-185](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-185-ki-pmo-extraction.md) | ki-agentic-harness | ways-of-working, PMO pilot | Harness half of the pilot after "PILOT-GRANT - granted" |
| [KI-TECHNE-OPS-027](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-027-agent-host-tailscale-key-minting.md) | ki-techne-harness | techne, ts-oauth run | Rebuilds should not need a hand-made Tailscale key |
| [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) | tools-ki | tools-burndown, rebootstrap-oct14 | Defect: `ki repo repair` fails on vega without the `sources` store |
| [KI-TOOL-RIG-CLI-026](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CLI-026-per-tool-development-mode-switch.md) | tools-rig | mac-studio-bootstrap, records run | Kris's DEV-MODE (Decision 170): capture and hold |
| [KI-TOOL-RIG-DIST-011](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-DIST-011-stale-terra-rig-link.md) | tools-rig | mac-studio-bootstrap, records run | Kris's RIG-LINK (Decision 170): capture and hold |
| [KI-TOOL-RIG-CORE-052](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-052-doctor-service-launch-prerequisites.md) | tools-rig | mac-studio-bootstrap, sol-layout | Defect: doctor misreported the Observatory being down on sol |

Seven of the ten came from Kris's own answers or from defects. The ways-of-working thread is the largest single source, with five.

- **Paperclip.** No open record belongs to the Paperclip Project, so nothing needs folding into the Paperclip reshape.

### Proposed dispositions

"Park" means cancel the record as deferred and carry its substance into the named Project note, following the KI-HARNESS-GOV-162 precedent. Git keeps the full record.

| Record | Repository | Status | Created | Proposed | Reason |
| --- | --- | --- | --- | --- | --- |
| [KI-HARNESS-GOV-176](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-176-explicit-skill-dependency-graph.md), [177](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-177-browser-free-svg-extractor.md), [178](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-178-repair-checkpoint-configuration.md), [180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md), [182](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-182-wave-e-skill-renames.md) | ki-agentic-harness | done | 10-13/14 | prune | Accepted; still counted in the 42 |
| [KI-HARNESS-GOV-183](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-183-generated-skill-map.md) | ki-agentic-harness | awaiting-review | 10-14 | accept | Tests 1112/0, audits FAIL=0, sync check passes; the page-length concern is a follow-on, not a defect |
| [KI-HARNESS-GOV-184](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-184-working-area-marks.md) | ki-agentic-harness | draft next | 10-14 | merge into KI-HARNESS-GOV-175 | Both are wording edits to the `ki-delegation` run standard about what a run writes |
| [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) | ki-agentic-harness | draft next | 10-13 | keep | Run events and marks in one standard edit, after tools-ki lands the mechanics |
| [KI-HARNESS-GOV-179](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-179-diagram-html-commit-opt-in.md) | ki-agentic-harness | draft hold | 10-13 | park in ways-of-working | Its own hold says nothing depends on it before the burn-down ends |
| [KI-HARNESS-GOV-181](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md) | ki-agentic-harness | draft next | 10-14 | keep | Kris opened it; removes the Playwright prerequisite |
| [KI-HARNESS-GOV-185](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-185-ki-pmo-extraction.md) | ki-agentic-harness | in-progress | 10-14 | keep | Pilot under way on `pilot/ki-pmo` |
| [KI-HARNESS-GOV-170](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-170-keep-resolution-targets-local.md) | ki-agentic-harness | draft future | 10-09 | keep | Small; puts into the audit the no-cross-repository-ID rule threads already follow |
| [KI-HARNESS-GOV-171](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-171-standing-surface-design-rules.md) | ki-agentic-harness | draft next | 10-10 | park in skill-refresh | Guidance improvement from an Arcadia handoff; not a blocker or defect (Decision 158) |
| [KI-HARNESS-GOV-168](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md) | ki-agentic-harness | draft future | 10-09 | park in baseline-rollout | A 19-repository sweep gated on App installs; already proposed on 2026-10-12 |
| [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md) | ki-agentic-harness | in-progress | 08-22 | keep, then rescope and submit | Narrow to the delivered adapters and move the retirement steps into the knowledge-acquisition Project |
| [KI-PRINCIPAL-ECO-012](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md) | ki-principal | draft next | 10-13 | park in ways-of-working | An umbrella over phases owned elsewhere; phase 1 lives in the harness and tools-ki records |
| [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) | ki-principal | ready next | 10-13 | keep | Granted; should move to in-progress, since the harness half has started |
| [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md) | ki-principal | in-progress | 10-13 | keep | Citation sweep done in four repositories; the run-folder sweep waits for `ki agent close` |
| [KI-PRINCIPAL-MOD-006](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-006-knowledge-acquisition-lifecycle.md) | ki-principal | ready next | 08-23 | keep | Ready; one Pillars note alongside KI-HARNESS-OPS-005 |
| [KI-PRINCIPAL-MOD-008](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-008-whole-philosophy-coherence-review.md) | ki-principal | draft hold | 10-11 | hold to 2026-10-16 | The intended residual, run once the roadmaps are near zero |
| [KI-SPEC-KIN-003](/Users/krisbrown/workspaces/knowledge-islands/ki-specifications/docs/roadmap/KI-SPEC-KIN-003-portable-live-artifact-contract.md) | ki-specifications | draft hold | 10-13 | park in specification-review | Held to 2027-01-04 behind the v1 boundary review |
| [KI-TECHNE-OPS-027](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-027-agent-host-tailscale-key-minting.md) | ki-techne-harness | awaiting-review | 10-14 | accept after Kris's live check | Offline tests and leak sweep pass; the hand route is the restore path |
| [KI-TECHNE-OPS-018](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-018-converge-tools-through-rig.md) | ki-techne-harness | draft hold | 10-08 | hold to 2026-11-12 | Carries approved agent-host design |
| [KI-TECHNE-OPS-024](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-024-weekly-pin-bump.md) | ki-techne-harness | ready hold | 10-11 | hold to 2026-11-12 | Plan is Ready; no action |
| [KI-TECHNE-OPS-019](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-019-person-neutral-recipe-defaults.md) | ki-techne-harness | draft next | 10-08 | park in agent-host | Wrongly at Next while agent-host is on hold; there is no second binding owner |
| [KI-TECHNE-OPS-023](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-023-controller-target-stack-tags.md) | ki-techne-harness | draft future | 10-11 | park in agent-host | Needs a remote tag change the programme hold bars |
| [KI-TOOL-TECHNE-CLI-008](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-008-host-patching-fields.md) | tools-techne | done | 10-09 | prune | Accepted |
| [KI-TOOL-TECHNE-CLI-006](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-006-guarded-host-commands.md) | tools-techne | draft next | 10-07 | hold to 2026-11-12 | Agent-host is on hold; the record carries design substance |
| [KI-TOOL-KI-CLI-115](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-115-enforce-roadmap-writing-checkout.md) | tools-ki | draft hold | 10-08 | park in agent-host | The marker's shape is unsettled; the hold has no review date |
| [KI-TOOL-KI-CLI-125](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md) | tools-ki | draft hold | 10-13 | hold to 2026-11-16 | The canonical release contract; waits for an ARM host or vega |
| [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) | tools-ki | draft next | 10-13 | keep | Kris set "tools-ki first" for run events |
| [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md) | tools-ki | draft next | 10-13 | keep | Kris queued it; unblocks the KI-PRINCIPAL-ECO-014 folder sweep |
| [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) | tools-ki | triage | 10-14 | keep (adopt) | Defect |
| [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) | tools-rig | awaiting-review | 10-13 | accept after an attended live check | 528/528 tests on fixtures; a firewall change is connection-critical, so the live check needs a tested restore path (Decision 169) |
| [KI-TOOL-RIG-CORE-051](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-051-linux-tailnet-only-firewall.md) | tools-rig | awaiting-review | 10-13 | accept on fixture evidence | 538/538 tests; the only Linux host is held, so the live check moves to the techne adoption record |
| [KI-TOOL-RIG-CORE-049](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-049-shared-agentic-rig-role.md) | tools-rig | draft hold | 10-13 | merge into KI-TOOL-RIG-CORE-048 | Same trigger (vega rebuilt); the shared role is how the signed install reaches both hosts |
| [KI-TOOL-RIG-CORE-048](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-048-signed-release-install-kind.md) | tools-rig | draft hold | 10-13 | hold to 2026-11-16 | Pairs with the ki release contract |
| [KI-TOOL-RIG-CORE-046](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-046-remote-access-and-continuity.md) | tools-rig | draft hold | 10-13 | park in mac-studio-bootstrap | Speculative trigger ("a further machine"), held to 2027 |
| [KI-TOOL-RIG-CLI-026](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CLI-026-per-tool-development-mode-switch.md) | tools-rig | draft hold | 10-14 | hold to 2026-11-16 | Kris asked for it (Decision 170) |
| [KI-TOOL-RIG-DIST-011](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-DIST-011-stale-terra-rig-link.md) | tools-rig | draft hold | 10-14 | hold to 2026-11-16 | Kris asked for it (Decision 170) |
| [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md) | tools-rig | ready next | 10-09 | keep | Ready, and mac-studio-bootstrap is active again |
| [KI-TOOL-RIG-CORE-052](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-052-doctor-service-launch-prerequisites.md) | tools-rig | triage | 10-14 | keep (adopt) | Defect |

### Projected count after approval

| Step | Removes | Total left |
| --- | --- | --- |
| Today | - | 42 (36 open and 6 done) |
| Prune the 6 done records | 6 | 36 |
| Accept 4, then prune them | 4 | 32 |
| Merge 2 | 2 | 30 |
| Park 9 | 9 | **21** |

That leaves 21 records: 13 active and 8 dated holds.

- **Active (13).** In the harness: KI-HARNESS-GOV-170, KI-HARNESS-GOV-175, KI-HARNESS-GOV-181, KI-HARNESS-GOV-185 and KI-HARNESS-OPS-005. In ki-principal: KI-PRINCIPAL-ECO-013, KI-PRINCIPAL-ECO-014 and KI-PRINCIPAL-MOD-006. In tools-ki: KI-TOOL-KI-CLI-123, KI-TOOL-KI-CLI-124 and KI-TOOL-KI-CLI-126. In tools-rig: KI-TOOL-RIG-CORE-042 and KI-TOOL-RIG-CORE-052.
- **Dated holds (8).** KI-PRINCIPAL-MOD-008, KI-TECHNE-OPS-018, KI-TECHNE-OPS-024, KI-TOOL-TECHNE-CLI-006, KI-TOOL-KI-CLI-125, KI-TOOL-RIG-CORE-048, KI-TOOL-RIG-CLI-026 and KI-TOOL-RIG-DIST-011.

ki-specifications ends at zero. Rescoping KI-HARNESS-OPS-005 and submitting it would bring the total to 20.

## What is in progress

Nothing from this run. Other threads have uncommitted work that this run left alone: five modified or untracked paths in the `ki-agentic-harness` primary checkout (`.ki.toml`, `docs/diagrams/diagrams.toml`, `skills/README.md`, the `ki-delegation` rubric and `+/diagrams/`). The ways-of-working PMO pilot is running on `pilot/ki-pmo`.

## Outstanding queries

### RC-HARNESS - ki-agentic-harness, 15 to 5

**Summary:** Prune KI-HARNESS-GOV-176, KI-HARNESS-GOV-177, KI-HARNESS-GOV-178, KI-HARNESS-GOV-180 and KI-HARNESS-GOV-182. Accept KI-HARNESS-GOV-183. Merge KI-HARNESS-GOV-184 into KI-HARNESS-GOV-175. Park KI-HARNESS-GOV-179 and KI-HARNESS-GOV-171 in their Projects, and KI-HARNESS-GOV-168 in baseline-rollout. **Need from you:** Approval. The acceptance and prunes need your go under `ki-accept`. **Recommendation:** Approve. Have the ways-of-working thread apply it, because that thread owns the harness stack and would otherwise collide with the PMO pilot.

### RC-PRINCIPAL - ki-principal, 5 to 4

**Summary:** Park KI-PRINCIPAL-ECO-012 in the ways-of-working Project, carrying its owner decisions and phase plan. Move KI-PRINCIPAL-ECO-013 to in-progress, which tidies its status without changing the count. Keep the rest. **Need from you:** Approval. **Recommendation:** Approve.

### RC-TECHNE - ki-techne-harness, 5 to 2

**Summary:** Accept KI-TECHNE-OPS-027 once you have created the OAuth client and run `mint-tailscale-key.sh --check`. Park KI-TECHNE-OPS-019 and KI-TECHNE-OPS-023 in agent-host. **Need from you:** Approval, and the live check when convenient. The hand route remains the restore path. **Recommendation:** Approve the parks now. Accept KI-TECHNE-OPS-027 after the check.

### RC-TOOLS-TECHNE - tools-techne, 2 to 1

**Summary:** Prune KI-TOOL-TECHNE-CLI-008. Set a formal hold to 2026-11-12 on KI-TOOL-TECHNE-CLI-006. **Need from you:** Approval. **Recommendation:** Approve.

### RC-TOOLS-KI - tools-ki, 5 to 4

**Summary:** Park KI-TOOL-KI-CLI-115 in agent-host. Keep KI-TOOL-KI-CLI-123, KI-TOOL-KI-CLI-124 and KI-TOOL-KI-CLI-126. Hold KI-TOOL-KI-CLI-125. **Need from you:** Approval. **Recommendation:** Approve.

### RC-RIG - tools-rig, 9 to 6

**Summary:** Accept KI-TOOL-RIG-CORE-051 on its fixture evidence. Accept KI-TOOL-RIG-CORE-047 after an attended live check with a tested restore path. Merge KI-TOOL-RIG-CORE-049 into KI-TOOL-RIG-CORE-048. Park KI-TOOL-RIG-CORE-046 in mac-studio-bootstrap. **Need from you:** Approval. For KI-TOOL-RIG-CORE-047, also whether its live check runs on this Mac now or waits for sol. **Recommendation:** Approve. Run the KI-TOOL-RIG-CORE-047 live check on sol as part of mac-studio-bootstrap, with the restore path written first.

### RC-SPECS - ki-specifications, 1 to 0

**Summary:** Park KI-SPEC-KIN-003 in the specification-review Project. **Need from you:** Approval. **Recommendation:** Approve.

### RC-OPS-005 - optional rescope

**Summary:** KI-HARNESS-OPS-005 has been in progress since 22 August. Narrow it to the delivered adapters and submit it. The ten unfinished steps, including the destructive retirement gate, move into the knowledge-acquisition Project. **Need from you:** Choose whether to rescope now or leave it with the knowledge-acquisition thread. **Recommendation:** Rescope now. That takes the total to 20.

```text
ROADMAP-CENSUS
RC-HARNESS - approve / amend:
RC-PRINCIPAL - approve / amend:
RC-TECHNE - approve / amend:
RC-TOOLS-TECHNE - approve / amend:
RC-TOOLS-KI - approve / amend:
RC-RIG - approve; CORE-047 live check on sol / this Mac / amend:
RC-SPECS - approve / amend:
RC-OPS-005 - rescope now / leave with knowledge-acquisition:
```
