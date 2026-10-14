# tools-burndown inventory

Reviewed 2026-10-11 05:17 BST. Authority: [Decision 1](/Users/krisbrown/.local/state/ki/agents/tools-burndown/decisions.md). Read-only first disposition batch. No work record, checkpoint or repository file was written by this review; no lifecycle change, closure, commit, push, fetch, pull, service change or remote call was made. Only machine-local run material was written.

## Count and Git summary

All fourteen matching directories are registry-resolved; there are no matching unregistered directories. Full roadmap scans and YAML-parsed identifiers/statuses reconcile to ten open records, all `triage`: tools-ki 2, tools-rig 5, tools-techne 2, apps-observatory 1, eight MCP repositories 0, tools-git-almanac 0 and tools-mgit 0. No count discrepancy and no acceptance candidate.

Every scoped checkout is clean on `main`, with cached `origin/main` ahead/behind 0/0. These are local upstream observations, not fresh remote verification. The table records reviewed commit identifiers.

| Repository | Open | Git | Reviewed HEAD |
| --- | ---: | --- | --- |
| [apps-observatory][repo-apps-observatory] | 1 | clean; 0/0 | 5fe1235b7947bccd03dfdaebce81997eccbe6c3a |
| [mcp-acquire-whatsapp][repo-mcp-acquire-whatsapp] | 0 | clean; 0/0 | e01e1d142203406c35653d7442f10a645c45315f |
| [mcp-git-audit][repo-mcp-git-audit] | 0 | clean; 0/0 | 590b5d750a3c49d2d31c2cb64c6c23992e97f1d4 |
| [mcp-gsuite][repo-mcp-gsuite] | 0 | clean; 0/0 | a9a521727325a7c350acf9d604b7309b8eea3b2d |
| [mcp-housekeeping-chatgpt][repo-mcp-housekeeping-chatgpt] | 0 | clean; 0/0 | 0c53b5c2fe99a0cdc9453e2774aaf58b1c112ee5 |
| [mcp-housekeeping-claude][repo-mcp-housekeeping-claude] | 0 | clean; 0/0 | e9f578caf7a5713c4e06bd193e1dd7e37918a77b |
| [mcp-ki-kb-fs][repo-mcp-ki-kb-fs] | 0 | clean; 0/0 | 294faa59b0de331886fd93dd9263597aa9fb1ec6 |
| [mcp-ki-kb-notion-mirror][repo-mcp-ki-kb-notion-mirror] | 0 | clean; 0/0 | d1e16f5e020a621aeb73fd1bd9da517518efc348 |
| [mcp-m365][repo-mcp-m365] | 0 | clean; 0/0 | 4ca320b2f9e8d92102a8e92623e16bdd7a77b388 |
| [tools-git-almanac][repo-tools-git-almanac] | 0 | clean; 0/0 | 6d9463fef697bfaa09971de7ce794c57311f74b6 |
| [tools-ki][repo-tools-ki] | 2 | clean; 0/0 | 38c35150810142ef4f95b5b95f796bfca3152be5 |
| [tools-mgit][repo-tools-mgit] | 0 | clean; 0/0 | 84bccae303c1c0789cabf89d4535cefa4a07dedc |
| [tools-rig][repo-tools-rig] | 5 | clean; 0/0 | d37e38945d0e6c0b8d4664d1fc5343fd04506a46 |
| [tools-techne][repo-tools-techne] | 2 | clean; 0/0 | 684de1f32956f14a4cb823c8034ae9e46b7efbb7 |

Arcadia initially was clean at `aee25c27f14e6a1fef52214dccdf51e96c70f42e`. During the review another actor changed [platform-foundations.estate-factorisation](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/platform-foundations.estate-factorisation.md); its HEAD stayed unchanged and it ended with that one unstaged modification. The updated checkpoint was re-read: it now names tools-burndown and agrees with Decision 1. This review neither changed nor restored it. All fourteen scoped repository content hashes, file rosters, Git statuses and HEADs remained unchanged.

## Proposed dispositions

Every row links the full identifier to its absolute canonical local path. Evidence footnotes are part of the corresponding recommendation. "Finish" means retain and take through approved planning and delivery; it does not claim any triage item is Ready. Active-thread crossings go through Kris before further action.

| Record / absolute path | Lifecycle | Ownership | Recommendation | Evidence |
| --- | --- | --- | --- | --- |
| [KI-TOOL-CLI-115][KI-TOOL-CLI-115] | triage | agent-host | Finish via Kris | † |
| [KI-TOOL-CLI-116][KI-TOOL-CLI-116] | triage | agent-host | Finish via Kris | ‡ |
| [RIG-CORE-041][RIG-CORE-041] | triage | Rig handoff | Finish via Kris | § |
| [RIG-CORE-042][RIG-CORE-042] | triage | Rig/Dock crossing | Finish via Kris | ¶ |
| [RIG-CORE-043][RIG-CORE-043] | triage | Rig/chezmoi crossing | Finish via Kris | ‖ |
| [RIG-CORE-044][RIG-CORE-044] | triage | Rig/chezmoi crossing | Finish via Kris | †† |
| [RIG-CORE-045][RIG-CORE-045] | triage | Rig/Studio crossing | Finish via Kris | ‡‡ |
| [TECHNE-TOOL-CLI-006][TECHNE-TOOL-CLI-006] | triage | agent-host | Finish via Kris | §§ |
| [TECHNE-TOOL-CLI-008][TECHNE-TOOL-CLI-008] | triage | agent-host | Finish via Kris | ¶¶ |
| [KI-OBS-APP-041][KI-OBS-APP-041] | triage | tools-burndown | Plan; approval gate | ‖‖ |

† **HOST-WRITES - KI-TOOL-CLI-115:** The harness writes ~/.config/ki/host-marker (host/converge.sh:556); tools-ki/src contains no marker guard. The agent-host Project owns this record even though its checkpoint does not list it among triage. Marker location is settled in that checkpoint, so the record's uncertainty is stale. Plan the writing-checkout declaration and all write entry points with that thread; do not reopen the absorbed harness record or design remote-main serialisation here.

‡ **HOST-GATES - KI-TOOL-CLI-116:** src/core/agent/runs.ts:164 still adds only a prompt gate and launchAgent at line 196 starts the runtime immediately; dispatchRun:350 dequeues without inspecting dependencies. The active agent-host checkpoint explicitly carries this record. It is a real reliability defect, not complete work. Route planning of launcher-held gates and dead-gate behaviour to that thread; retain its manual sequencing workaround until verified.

§ **RIG-REMOVE - RIG-CORE-041:** The declaration registry still makes retired-application observation-only (src/rig/05-declarations.bash:20); unmanaged collection is opt-in in 22-observation.bash. No explicit package removal contract is implemented. Mac Studio has handed this capability to the Rig Initiative; chezmoi owns the private removal list and current software choices. Agree declaration, severity and dry-run boundary before delivery. Coordinate classification with RIG-CORE-043; do not merge their different actions.

¶ **RIG-DOCK - RIG-CORE-042:** Dock fields remain kind/path/view/display, with no tool membership (10-configuration.bash:273); preflight fails on an absent item path (20-orchestration.bash:1158). Mac Studio handed the engine feature on; its profile/Dock choices and chezmoi's studio-only Lightroom placement remain external consumers. Recommend the proposed tool link, stable declared order and profile/platform filtering, subject to the owners settling dependency ordering. No personal Dock edits here.

‖ **RIG-UPDATES - RIG-CORE-043:** The native lifecycle tests still expect brew upgrade --cask tasks (tests/rig-lifecycle.bats:223); no self-update declaration appears in runtime source. Source mismatch and artifact satisfaction need implementation and isolated proof. The Mac Studio handoff is with Rig; chezmoi's DOTFILES-UE-086 owns machine install-route alignment. Keep the generic feature separate from personal catalogue fixes and RIG-CORE-041 removal. Resolve metadata determinism and informational versus unhealthy mismatch before delivery.

†† **RIG-SUDO - RIG-CORE-044:** Runtime source has no sudo keepalive implementation; the record is a concrete non-blocking handoff from active Rig: chezmoi. Keep the engine work separate from that thread's gated configuration work. Agree privilege detection or an explicit option, tty behaviour, refusal handling and cleanup before implementation. Acceptance needs isolated prompt/keepalive/interrupt tests; no live sudo experiment was made.

‡‡ **RIG-HANDLERS - RIG-CORE-045:** The runtime declaration registry (05-declarations.bash:12) has no default-application kind and source has no duti or Launch Services handler adapter. A manual laptop change is not portable delivery. Mac Studio's checkpoint hands this feature to Rig and keeps the screen-only sol choice with Kris. Plan the supported mechanism, UTI/extension/scheme identity, roles and install ordering; retain this concrete feature rather than demote it to an idea. No Obsidian removal in this record.

§§ **HOST-GUARDS - TECHNE-TOOL-CLI-006:** src/cli.ts:781 stops without the requested warning; line 805 retains direct teardown/termination. The local harness manifest already declares structured status and guarded rebuild/withdraw operations, and destroy.sh:100 uses the status guard. The active thread owns pilot lessons and adapter planning. No acceptance: CLI parity, outcome propagation, override equivalence, documentation and stubbed tests are missing. No live rebuild or withdrawal is authorised.

¶¶ **HOST-PATCHING - TECHNE-TOOL-CLI-008:** src/bindings.ts:16 still excludes reboot_window and livepatch from NEUTRAL_FIELDS; the local recipe.toml declares both optional fields and the additive updates report. The active agent-host checkpoint explicitly owns this triage item. Plan validators, environment mapping and status rendering there; coordinate shared status parsing with TECHNE-TOOL-CLI-006 without merging away the independent patching scope. Live Ubuntu Pro or reboot work is excluded.

‖‖ **OBS-PLAN - KI-OBS-APP-041:** packages/evidence/src/ki.ts:209 invokes removed ki agora list. Installed ki is 0.10.0 and that invocation fails with exit 2. Contracts, evidence and site still carry Agora. Adoption/planning is approved but not written by this review; delivery waits for plan approval. The proposal below identifies a missing territory discovery machine contract as an explicit decision gate. KI Model has completed the retirement and handed this consumer change on; do not expand into philosophy or membership changes.

No cancellation, merger closure, idea demotion or acceptance is recommended: these are distinct, concrete consumer failures or missing capabilities. Shared status parsing and shared Rig classification are coordination opportunities, not duplicate deliverables. None has a completed plan, immutable delivery baseline or complete acceptance packet.

## Observatory proposed plan

**Scope choice:** keep one selected territory at a time, retaining estate and current-repository scopes. Keep `--scope <territory-handle>` rather than adding a second selection grammar. Accept only currently discovered handles; an old Agora name gets actionable territory-selection guidance, with no silent alias or fallback to estate. This is a proposed design for Kris to approve.

**Local findings:** installed `ki --version` is 0.10.0. `ki territory list` discovers seven Capitals, including handle `ki`; `ki territory roots --null -t ki` succeeds with 20 roots and the estate form with 41. Buffer the complete NUL-delimited output and require successful exit before consuming it. `ki territory list --format json` fails with exit 2; list/show are terminal trees, while roots is the documented machine surface. Do not invent `ki territory paths` or a territory JSON option. Registry list does supply `ki/registry/v1` JSON. The local territory-selection guide describes roots and the fail-closed selection rules.

**Contract decision before delivery:** recommend a minimal versioned territory-list/selection machine projection owned by tools-ki so Observatory never scrapes tree output or duplicates membership resolution. This is an additional cross-repository change requiring the master thread to settle its bounded authority and sequencing; no new record is created here. An interim bounded parser for discovery is an alternative only if Kris explicitly approves that compromise. The membership half can already use roots; the discovery half cannot yet satisfy the stable-machine-contract requirement on its own. The plan is therefore reviewable but not Ready until this gate is settled.

**Change scope in apps-observatory:** replace the Agora types/parsers and exports in `packages/contracts/src/agora.ts`, `scope.ts`, `scope-option.ts`, `envelope.ts` and dependent answer contracts; update `packages/evidence/src/ki.ts`, `scope.ts` and all scoped instrument loaders; update site server, picker, page and startup messages; replace fixtures and tests; align operator guides, diagrams, PDR-KI-OBS-001 and affected accepted specs. Bump Observatory schema versions where enum/contract changes are incompatible, including persisted history handling. Keep CLI/process/filesystem access behind typed backend ports, redact paths from browser answers, and leave membership policy with ki. No Rig, chezmoi, Capital membership, philosophy or remote operations in this delivery.

**Acceptance checks:**

- Discover current handles and resolve the exact ki territory, estate and current-repository sets using injected CLI fixtures; counts include Capitals and contain no duplicated identity. Validate machine schema/exit status and NUL framing; spaces and line feeds in paths survive.
- Unknown or old Agora handles, missing registration, unavailable selected roots, malformed/partial output and contract drift fail visibly without a narrower successful set or estate fallback. Selection semantics stay in ki.
- Every scoped instrument, repository operation plan and receipt respects the selected identity set. Mutation confirmation and scope checks remain intact; observation grants no mutation authority.
- Picker/start option, navigation, refresh, Beacon, history and degraded-operation behaviour work with one territory; browser receives no filesystem/process access or private path leakage. Old persisted scope schemas fail or migrate explicitly rather than being relabelled.
- No live `ki agora` command, Agora scope kind or stale operator guidance remains in the delivered surfaces. Run `bun run test`, `bun run self:typecheck`, `bun run build`, Biome and Markdown checks, `ki repo audit --repo .` and `ki repo diag --repo .`; run the browser smoke gate when its existing Chromium is available, reporting any skip. Preserve the mechanical-first degraded suite.

Delivery starts only after Kris approves the plan and contract decision. A later background delivery reports any service restart due; it does not restart the live Observatory itself.

## Master-thread crossings

- **HOST-ROUTE:** [Techne: agent-host][cp-host] owns KI-TOOL-CLI-115 by Project, KI-TOOL-CLI-116 explicitly, and both tools-techne records. Its accepted local pilot/patching groundwork is relevant evidence, not acceptance of these four consumers. Kris routes plans there; no host connection or exemption use is allowed in this run.
- **RIG-ROUTE:** [Rig: mac-studio-bootstrap][cp-studio] handed generic Rig follow-ups to the Rig Initiative and retains the restart test. Coordinate RIG-CORE-041, RIG-CORE-042, RIG-CORE-043 and RIG-CORE-045 through Kris; do not duplicate personal profile, Dock, software or screen-only changes. [Rig: chezmoi][cp-chezmoi] owns the private source and install-route decisions and originated RIG-CORE-044. Its Lightroom placement waits on the Dock engine feature. The two checkpoints differ in some older record references; current work should use the handed-on boundaries.
- **MODEL-BOUNDARY:** [KI Model: island-model-and-tending][cp-model] has completed Agora retirement and handed Observatory selection on. Philosophy coherence, Great Library wording and territory-key acquisition questions remain with that thread. Observatory consumer repair does not reopen those decisions.
- **MASTER-STATE:** [_state-of-play][cp-master] still says `kis` Agora, names older CLI state and queues KI Model whereas its own checkpoint is active. Reconcile those stale coordination pointers when the master next updates its checkpoint. The previous factorisation phase/Project-close question remains parked; this burndown grants no FND-5 capture or phase approval.

## Verification and limitations

PASS: every expected identifier was YAML-parsed, filename-checked and read in full; all scoped AGENTS.md and .ki.toml were read, with TOML parsing; fourteen registry roots reconcile with fourteen matching local directories; all ten statuses are exactly triage. Relevant implementation literals were verified with exact source predicates after transformed tool output. Local help/CLI probes confirmed the absent Agora command and absent territory JSON option. No delivery test suite or broad repository audit was run or claimed: this survey assesses unfinished work and never installs dependencies or changes environments.

Recovered survey errors: the initial registry parser wrongly expected grouped display output (actual stdout is one absolute path per line); a TOML-print expression had an extra parenthesis; some guessed implementation/definition-of-done paths were absent and were replaced by discovered source paths and CONTRIBUTING.md. An exploratory `territory paths` help probe correctly failed because that command does not exist. These failures did not mutate repository files and left no missing required evidence.

The unchanged-estate predicate failed for Arcadia alone because of the concurrent checkpoint edit above. Its cause is outside this review; no whole-estate unchanged claim is made. Cached upstream information cannot establish current remote synchronisation without the forbidden fetch.

## Done

- Reviewed fourteen scoped repositories and all ten open records; counts reconcile, with zero-count repositories included.
- Produced one tagged disposition batch and a concrete Observatory plan; closed and changed no work.
- Verified all scoped repositories unchanged and level with cached upstream; isolated the concurrent Arcadia checkpoint change.

## Failed

- Whole-estate unchanged verification: Arcadia acquired one concurrent checkpoint modification; all scoped product repositories passed.
- A complete Observatory stable discovery machine contract is unavailable in installed ki 0.10.0; delivery readiness awaits the contract decision.

## Needs Kris

- **DISPOSITIONS:** approve or revise the ten recommendations above. Nothing closes under this review.
- **HOST-ROUTE:** route [KI-TOOL-CLI-115][KI-TOOL-CLI-115], [KI-TOOL-CLI-116][KI-TOOL-CLI-116], [TECHNE-TOOL-CLI-006][TECHNE-TOOL-CLI-006] and [TECHNE-TOOL-CLI-008][TECHNE-TOOL-CLI-008] through the active agent-host thread; retain its ownership.
- **RIG-ROUTE:** settle the receiving owner and planning order for [RIG-CORE-041][RIG-CORE-041], [RIG-CORE-042][RIG-CORE-042], [RIG-CORE-043][RIG-CORE-043], [RIG-CORE-044][RIG-CORE-044] and [RIG-CORE-045][RIG-CORE-045], preserving active-thread personal changes.
- **OBS-PLAN:** approve or revise the proposed plan for [KI-OBS-APP-041][KI-OBS-APP-041]; adoption/planning is already authorised, delivery is not.
- **TERRITORY-CONTRACT:** recommend the minimal tools-ki machine projection prerequisite; alternatively explicitly approve interim discovery parsing. Master thread owns the crossing and authority.
- **MASTER-STATE:** reconcile stale master-thread pointers and the concurrent checkpoint change; leave factorisation phases parked.

[repo-apps-observatory]: /Users/krisbrown/workspaces/kit/knowledgeislands/apps-observatory
[repo-mcp-acquire-whatsapp]: /Users/krisbrown/workspaces/kit/knowledgeislands/mcp-acquire-whatsapp
[repo-mcp-git-audit]: /Users/krisbrown/workspaces/kit/knowledgeislands/mcp-git-audit
[repo-mcp-gsuite]: /Users/krisbrown/workspaces/kit/knowledgeislands/mcp-gsuite
[repo-mcp-housekeeping-chatgpt]: /Users/krisbrown/workspaces/kit/knowledgeislands/mcp-housekeeping-chatgpt
[repo-mcp-housekeeping-claude]: /Users/krisbrown/workspaces/kit/knowledgeislands/mcp-housekeeping-claude
[repo-mcp-ki-kb-fs]: /Users/krisbrown/workspaces/kit/knowledgeislands/mcp-ki-kb-fs
[repo-mcp-ki-kb-notion-mirror]: /Users/krisbrown/workspaces/kit/knowledgeislands/mcp-ki-kb-notion-mirror
[repo-mcp-m365]: /Users/krisbrown/workspaces/kit/knowledgeislands/mcp-m365
[repo-tools-git-almanac]: /Users/krisbrown/workspaces/kit/knowledgeislands/tools-git-almanac
[repo-tools-ki]: /Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki
[repo-tools-mgit]: /Users/krisbrown/workspaces/kit/knowledgeislands/tools-mgit
[repo-tools-rig]: /Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig
[repo-tools-techne]: /Users/krisbrown/workspaces/kit/knowledgeislands/tools-techne
[KI-TOOL-CLI-115]: /Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/docs/roadmap/KI-TOOL-CLI-115-enforce-roadmap-writing-checkout.md
[KI-TOOL-CLI-116]: /Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/docs/roadmap/KI-TOOL-CLI-116-launcher-held-wait-gates.md
[RIG-CORE-041]: /Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md
[RIG-CORE-042]: /Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md
[RIG-CORE-043]: /Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-043-self-updating-applications.md
[RIG-CORE-044]: /Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-044-single-sudo-prompt.md
[RIG-CORE-045]: /Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-045-default-applications.md
[TECHNE-TOOL-CLI-006]: /Users/krisbrown/workspaces/kit/knowledgeislands/tools-techne/docs/roadmap/TECHNE-TOOL-CLI-006-guarded-host-commands.md
[TECHNE-TOOL-CLI-008]: /Users/krisbrown/workspaces/kit/knowledgeislands/tools-techne/docs/roadmap/TECHNE-TOOL-CLI-008-host-patching-fields.md
[KI-OBS-APP-041]: /Users/krisbrown/workspaces/kit/knowledgeislands/apps-observatory/docs/roadmap/KI-OBS-APP-041-adopt-territory-selection.md
[cp-host]: /Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/techne.agent-host.md
[cp-studio]: /Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/rig.mac-studio-bootstrap.md
[cp-chezmoi]: /Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/rig.chezmoi.md
[cp-model]: /Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/knowledge-islands-model.island-model-and-tending.md
[cp-master]: /Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/_state-of-play.md
