# techne run - decisions log

## Decision 1 (2026-10-07)

- Kris approved rebuilding the agent host now under the standing exemption (GDR-KI-ARCADIA-004), and deleting the OPS-011 backup files on the host. Done by the coordinator: no-change check reviewed (only the intended hostname and zsh boot-script change), stack replaced, GitHub token parameter kept, used Tailscale auth key deleted.
- Kris approved starting `/ki-design-loop` on the agent-host workstation and durability subjects, stopping at the merged report.

## Decision 2 (2026-10-07)

- Kris: "Now continue with the setup." Authorises finishing the rebuilt host's workspace setup: diagnose why `techne host setup --host agent-host` refuses with "does not answer over Tailscale" although Tailscale SSH works, fix the cause in its owning repository (tools-techne or ki-techne-harness) with tests, push those own commits fast-forward, then run `techne host setup --host agent-host` and `techne host status --host agent-host` against the host.
- Named remote calls allowed: Tailscale SSH to `techne@ki-techne-agent-host` (through the `techne` CLI or the harness setup/status scripts, and plain `ssh` for diagnosis), `tailscale status`/`tailscale ping` read-only on the Mac, `git fetch`/`git push` to origin of tools-techne and ki-techne-harness. No AWS calls, no Tailscale admin changes, no other host changes.

## Decision 3 (2026-10-07)

- Durability design loop: Kris, verbatim: "Durability decisions - all agreed with the following changes/notes: - The GDR's credential wording - don't mention me directly, what should be the right approach here?" Kris then chose the coordinator's role-based wording for decision 5: building, rebuilding and tearing down the host use the binding owner's administrator session in the Techne account; day-to-day operation (start, stop, status) uses the host's account-local operator role; no agent holds AWS credentials of its own. All other report decisions (1-4, 6-8) are agreed as recommended. Decision 8's "land the pilot before the pending rebuild" is overtaken: the rebuild happened on 2026-10-07 (stack-only delete kept the GitHub token; setup re-converged), so the pilot proceeds as the first record without that timing.
- Credential identity (GDR-KI-ARCADIA-004 condition): Kris chose "Mine, for now" - the host's GitHub token and Claude login are Kris's own identities, because only Kris opens sessions there; a machine identity is revisited when unattended agents arrive, which stays held.
- KI-ARCADIA-GOV-021: Kris chose "Decide 'keep' now" - `direct-host` stays as a recipe; the review is decided early as keep, and no evidence pack is needed.
- The GitHub token is rotated with a 90-day expiry; the operator guide's 30-day guidance changes to 90 days.
- Authority: write the durability decisions file and its Decision Record, amend GDR-KI-ARCADIA-004 through an Enactment record (role-based wording, identity decision, GOV-021 keep), record the keep on KI-ARCADIA-GOV-021 and take it to awaiting-review, update the agent-host Project note, capture the rollout records through `ki-next` and select the pilot. Commit locally in Arcadia; do not push (Arcadia main carries another session's unpushed commits). No acceptance or pruning: Kris approves those separately.

## Decision 4 (2026-10-07)

- Owner direction for the workstation design loop, Kris verbatim: "I'm guessing a lot will be informed from chezmoi (becoming cheztoi as a play on the subject)". The merged report must treat chezmoi as the main source of the host's personal configuration, with Cheztoi as its counterpart for hosts Kris does not own; the coordinator checks this before relaying the decisions.

## Decision 5 (2026-10-07)

- Further owner direction for the workstation design loop, Kris verbatim: "it could also be rig based as part of the recipe? that way we are more focused on tools and skills?" The merged report must present, as a real option with a recommendation, the recipe naming a tools-rig profile (tools, skills, managed resources) for the host, with chezmoi/Cheztoi carrying only the binding owner's personal layer, and say what that means for host/converge.sh's tool installs. The coordinator checks this before relaying the decisions.

## Decision 6 (2026-10-07)

- Kris approved accepting KI-ARCADIA-GOV-029 and KI-ARCADIA-GOV-021 through ki-accept and pruning both once accepted.
- The standing agent-host exemption has no fixed review date: it stands until Kris changes it and is revisited when the hold is reshaped. Remove the review date from GDR-KI-ARCADIA-004, the hold, the Project note and the records that cite it; TECHNE-TOOLS-OPS-014 and host status stop showing a review date.
- Kris approved: (a) writing the remaining durability captures that ODR-KI-ARCADIA-001 calls for in chezmoi, tools-ki and ki-agentic-harness; (b) rewording GDR-KI-ARCADIA-004's Context and Bounds by role too, not naming Kris where a role serves; (c) updating the Agent Host Prototype Rollout note to drop the 6 November review and re-rendering its diagram.
- Push: this thread's own commits, fast-forward only, in every repository touched; never push another session's unpushed commits.

## Decision 7 (2026-10-08)

- Workstation design loop: Kris accepted all seven decisions of the revised merged report as recommended (Kris: "all"): (1) capture a fresh chezmoi Cheztoi record now and keep the name; (2) staged Rig - the recipe's pin file becomes a Rig `direct-host` profile observed for drift via TECHNE-TOOLS-OPS-014, the pilot installs Kris's personal tools (mgit first) through a Rig fragment delivered by Cheztoi, and converge.sh's own installs move to `rig apply` once Rig can install ki's signed release and the drift check has run clean through one pin bump; (3) a small harness provider wraps ki's signed installer for Rig; (4) guarded bash-to-zsh hand-off now, zsh set in the stack at the next rebuild; (5) a host version of the delegation instructions without detached agents until KI-HARNESS-GOV-144 settles supervision; (6) no `techne` or chezmoi binaries on the host, Rig the only new binary; (7) pilot is one harness record plus one paired Cheztoi record, after the durability pilot and stage 1.
- Authority: write the workstation decisions file and Decision Record in Arcadia, capture the rollout records through ki-next in their owning repositories (ki-techne-harness, chezmoi, tools-rig if needed), fold the Rig profile change into TECHNE-TOOLS-OPS-014, select the pilot, update the Project note. Commit locally; push only repositories with no other session's unpushed commits ahead. No acceptance or pruning.

## Decision 8 (2026-10-08)

- Design folder: Kris said "Design folder - yes, you can deleted". Delete Streams/Projects/agent-host/design/ in Arcadia in one commit now that ODR-KI-ARCADIA-001 and ADR-KI-ARCADIA-003 carry both loops, keeping the agent-host Project note (folder note) and switching its Notes to link the Decision Records; push own commits fast-forward. Kris pushed Arcadia.

## Decision 9 (2026-10-08)

- Safety pilot TECHNE-TOOLS-OPS-013: Kris chose "Plan and deliver" - ready it through ki-plan against ODR-KI-ARCADIA-001, then deliver through ki-implement locally to awaiting-review in ki-techne-harness; no host, AWS or Tailscale change; push own commits fast-forward; no acceptance.

## Decision 10 (2026-10-08)

- Direction on the agent-host recipe (Kris, 2026-10-08): "I think the idea of an agent host recipe is that it can feel like it's running locally, but running on another machine. In this case it's a hosted instance, but it could also be in the future something like my Mac Studio. Also, of course, this is a general project. It's not my specific setup project, so we need to be mindful of just how much is tailored towards me versus how much makes sense from a generic standpoint." Authorises a read-only review of the agent-host decisions and records against this, producing proposed changes for Kris to approve.

## Decision 11 (2026-10-08)

- Generic-review proposals (report: generic-review.report.md). Kris chose "Yes, add them" for P1 and P2 on TECHNE-TOOLS-OPS-013 (neutral host.id field; remove leftover review date and Mac wording from the guide and destroy.sh), and "Yes, all recommended" for P4-P9 with the note "yes, all recommended, but zsh please, not bash" - so the interactive shell is a per-binding choice whose recipe default is zsh. P10-P12 not yet decided; P13 noted only.

## Decision 12 (2026-10-08)

- Kris approved: "Accept KI-ARCADIA-GOV-031, Accept TECHNE-TOOLS-OPS-013" (accept through ki-accept and prune both); "Yes, fold it in" (remove "the review date" from ODR-KI-ARCADIA-001 Expiries within KI-ARCADIA-GOV-031 before acceptance); "Capture both" (P10 split the operator guide; P11 owned-host provider, paired harness and tools-techne triage records, with P12 folded in). Push own commits.

## Decision 13 (2026-10-08)

- TECHNE-TOOLS-OPS-014: Kris chose "Plan and deliver" - ready through ki-plan against ODR-KI-ARCADIA-001 and ADR-KI-ARCADIA-003 (as amended by KI-ARCADIA-GOV-031), deliver through ki-implement locally to awaiting-review; no host, AWS, Tailscale or GitHub API call; push own commits; no acceptance. On owned-host governance Kris said "I approve it, so its ok" - scope to be confirmed before any record changes.

## Decision 14 (2026-10-08)

- Mac Studio (Kris, 2026-10-08): "I approve that we can run agents on a Mac Studio and consider them as a remote host, like we have for the Agent host, and also there's no need to raise anything on the state of play. I'm approving that this is not part of the hold that's on Techne." Kris also asked to get the Mac Studio reachable over Tailscale for remote administration as top priority. To be recorded through an Arcadia Enactment record amending the exemption, for Kris to review.

## Decision 15 (2026-10-08)

- Mac Studio follow-up (Kris left the house; "I disabled key expiry already"): coordinator states plan to write the governance record (Decision 14) and prepare a remote bootstrap runbook; nothing on the Mac Studio changes until Kris says so.

## Decision 16 (2026-10-08)

- Mac Studio installs: Kris said "yes please" to the coordinator running the password-free installs over SSH on sol (krisbrown@100.90.130.74): Homebrew tap tools (rig, ki, mgit) and previews (rig apply --dry-run, chezmoi diff); no sudo, no 1Password, no chezmoi apply, no rig apply, no change to Tailscale.

## Decision 17 (2026-10-08)

- Thread scope (Kris, 2026-10-08): "I've handed that off, so clean up this thread focused on agent-host". Mac Studio (sol) work, KI-ARCADIA-GOV-033 and the Rig Tailscale exception move to the mac-studio-bootstrap thread (run mac-studio-bootstrap, checkpoint +/_CHECKPOINTS/mac-studio-bootstrap.md). This thread brings the agent-host checkpoint up to date and keeps it agent-host only; commit locally, no push.

## Decision 18 (2026-10-08)

- Rerun host setup (Kris, 2026-10-08): "sounds good, can you rerun setup?" Authorises the coordinator to run operations/aws/agent-host/setup.sh from the Mac against the agent host (techne@100.123.162.21, SSH only, within the GDR-KI-ARCADIA-004 exemption), the first live run of TECHNE-TOOLS-OPS-014, then the host status check. Acceptance of TECHNE-TOOLS-OPS-014 is still to be confirmed by Kris after the run.

## Decision 19 (2026-10-08)

- Accept TECHNE-TOOLS-OPS-014 (Kris, 2026-10-08): confirmed "yes, it was" that "sounds good" approved accepting TECHNE-TOOLS-OPS-014 through ki-accept and the host-marker path ~/.config/ki/host-marker. Coordinator accepts once the first live setup run (setup-rerun) comes back clean; if it surfaces a defect, Kris is asked again before accepting.

## Decision 20 (2026-10-08)

- Kris, 2026-10-08, answering the coordinator's five asks: "1. yes, prune 2. yes, raise 3. yes, pull 4. yes, plan it 5. I just pushed". (1) prune TECHNE-TOOLS-OPS-014; (2) raise the direct-host ki pin 0.9.0 -> 0.10.0 and rerun agent-host setup --pull with status (SSH only, exempt host); (3) make converge.sh suggest --pull when ki repo --estate repair fails, and the guide recommend --pull on reruns; (4) plan the workstation pilot TECHNE-TOOLS-OPS-015 with DOTFILES-UE-073 through ki-plan, bringing the plan back for approval before delivery; (5) harness and Arcadia pushed by Kris.

## Decision 21 (2026-10-09)

- Checkpoint handover (Kris, 2026-10-09): "Can you put any outstanding situation or questions into the checkpoint? I'm going to ask the master checkpoint to reassess where we are on some things and maybe redivide the work." Update +/_CHECKPOINTS/agent-host.md with all outstanding state and open questions; commit locally, no push.

## Decision 22 (2026-10-09)

- Host OS updates (Kris, 2026-10-09): "yes, it's absolutely fine to do the Ubuntu updates and restart. Once it's back up and running, make sure you can connect." Authorises apt updates and a reboot of the agent host over SSH (exempt host), then reconnect and verify.

## Decision 23 (2026-10-09)

- Host patching (Kris, 2026-10-09): "Yes, we definitely need a recipe for host patching. That needs to be part of the recipe, I think." Capture a ki-techne-harness record making OS patching part of the direct-host recipe. Context: the 2026-10-09 update attempt stopped (techne has no sudo by design; SSM agent inactive), so the host keeps 26 pending updates and a reboot-required flag. Whether to rebuild now or wait for the planned rebuild is still open.

## Decision 24 (2026-10-09)

- Kris, 2026-10-09, on the bundle, TECHNE-TOOLS-OPS-019, restarts and needs-you: (a) workstation bundle approved in principle; Claude/Codex instructions in the bundle acceptable for now, long term they should come as skills from a personal harness (not yet designed) - park as a tangent. (b) Cheztoi manifest capability: a per-target-host manifest of what to share, ideally not a new tool - could live in skills/environment/ki-binding-chezmoi or as a Rig extension for chezmoi usage; to be weighed in the walkthrough before DOTFILES-UE-073 is approved. (c) TECHNE-TOOLS-OPS-019: "Good" - take the chezmoi cat removal out of its scope (TECHNE-TOOLS-OPS-015 owns it). (d) Restarts: happy; "Progress TECHNE-TOOLS-OPS-022 so we have capability going forwards" - adopt and plan it including unattended security updates, Livepatch and scheduled reboots. (e) Tailscale back on; walkthrough yes; restart the agent host through AWS (operator stop/start) yes, then reconnect and verify.

## Decision 25 (2026-10-09)

- Restart now (Kris, 2026-10-09): "do it now, I'm here" - restart the agent host now rather than after the 10 October unattended run; Kris completed the AWS SSO login in the browser.

## Decision 26 (2026-10-09)

- Decision 26 (2026-10-09) - Kris, 2026-10-09: (a) Workstation bundle walkthrough accepted, including the chezmoi-native per-host manifest recommendation (chezmoi archive + --override-data, cheztoi-render as thin wrapper, optional target_host checked against host.id). Update DOTFILES-UE-073 and TECHNE-TOOLS-OPS-015 plans to match and present them for approval. (b) TECHNE-TOOLS-OPS-022 decisions, all as recommended: 1 no automatic reboot by default, a binding may set a window (reboot only when required and nobody logged in); 2 Livepatch is an opt-in binding field, Kris does not attach Ubuntu Pro - he is happy to restart; 3 unattended scope is security only; 4 updates and reboot-required never change the status outcome; 5 no rebuild, current host gets reporting at next setup; 6 window form is weekday plus local time, e.g. Sun 04:00, host time zone. (c) The 2026-10-10 kernel update and the stop/start it needs are fine.

## Decision 27 (2026-10-09)

- Decision 27 (2026-10-09) - Kris, 2026-10-09, on TECHNE-TOOLS-OPS-022: "I don't mind when it happens, any day at 04:00 is fine." Amends Decision 26(b)6: the reboot window is a daily local time (Kris: 04:00), not a weekday. Prefer the native unattended-upgrades reboot (Automatic-Reboot-Time, Automatic-Reboot-WithUsers false) over a custom systemd timer if that meets the rule of rebooting only when required and nobody is logged in. Plan stays draft; not yet approved to ready.

## Decision 28 (2026-10-09)

- Decision 28 (2026-10-09) - Kris, 2026-10-09: TECHNE-TOOLS-OPS-022 plan approved, including the daily 04:00 restart timer; DOTFILES-UE-073 plan approved; TECHNE-TOOLS-OPS-015 plan approved. target_host is checked against the host name (e.g. ki-techne-agent-host), not the AWS instance ID. Move all three to ready via ki-plan. Kris is also considering a new host name for the agent host in his celestial convention (sol = Mac Studio; luna and phobos = its external drives); the recipe name agent-host stays generic.

## Decision 29 (2026-10-09)

- Decision 29 (2026-10-09) - Kris, 2026-10-09: (a) Naming convention: physical machines are our solar system (sol = Mac Studio, terra = laptop), peripherals are moons (luna, phobos); a non-physical host gets its own star system. The AWS agent host is to be named vega; the laptop terra. (b) direct-host vs agent-host: one thing must have one name, used consistently everywhere; no record needed, just do it once the name is chosen (Kris floated direct-agent-host; undecided). (c) "go": implement TECHNE-TOOLS-OPS-022, DOTFILES-UE-073 and TECHNE-TOOLS-OPS-015 via ki-implement, including SSH to the agent host for the live checks those plans name (agent host is exempt from the programme hold). No push; if a live step needs pushed commits, stop and report.

## Decision 30 (2026-10-09)

- Decision 30 (2026-10-09) - Kris, 2026-10-09: "let's just call it agent-host". One name, agent-host, replaces direct-host everywhere it means the same thing; no record needed. Kris renamed the laptop to terra himself.

## Decision 31 (2026-10-09)

- Decision 31 (2026-10-09) - Kris, 2026-10-09: "Push your unpushed ki-techne-harness commits so TECHNE-TOOLS-OPS-022 can be accepted - Kris has approved its acceptance. Then accept it and prune it." Harness was already in sync with origin (db399b8). Authority: run setup --pull on the agent host to complete the open live-verification step, then accept TECHNE-TOOLS-OPS-022 via ki-accept and prune it, and push the resulting harness commits.

## Decision 32 (2026-10-09)

- Decision 32 (2026-10-09) - Kris, 2026-10-09: "recheck everything because a lot of stuff has changed and a lot of stuff is now fixed." On the two TECHNE-TOOL-CLI-008 links to TECHNE-TOOLS-OPS-022: "I'm not sure why anything's referencing back to roadmap IDs because we try to avoid that." Authority: remove the record links from TECHNE-TOOL-CLI-008 (state the need in plain terms, pointing at durable harness docs instead), then prune TECHNE-TOOLS-OPS-022 via ki-accept and push ki-techne-harness. Do a fresh read-only recheck of the whole agent-host state and bring the checkpoint current.

## Decision 33 (2026-10-09)

- Decision 33 (2026-10-09) - Kris, 2026-10-09: "you understand what I think it should be, so make the necessary changes so that that happens." Change the cross-repository choreography rule so handoffs do not reference or link another repository's roadmap records or IDs: a handoff names the originating repository and states the need (and whether it blocks) in plain terms, linking only durable docs such as guides or specs. Apply in every repository that carries the rule and in any shared skill or audit that requires the old form; clean existing cross-repository record links in open records.

## Decision 34 (2026-10-09)

- MARK A (2026-10-09 22:40 BST) - Kris asked for a mark: on return, summarise everything from here. In flight at the mark: recheck (fresh state check, CLI-008 links, prune TECHNE-TOOLS-OPS-022, checkpoint rewrite) then handoff-rule (Decision 33).

## Decision 35 (2026-10-10)

- Decision 35 (2026-10-10) - Kris, 2026-10-10: (1) TECHNE-TOOLS-OPS-015 approved: accept via ki-accept (no prune yet). (2) Keep ki-accept's cross-repository link preflight and ki-delegation's full-ID citation in checkpoints. (3) Yes: raise a tools-ki record for the ki agent --wait-for bug, then give Kris details. (4) Yes: strip TECHNE-TOOLS-OPS-022 IDs from harness code comments and the guide (record pruned). (5) Adopt KI-HARNESS-GOV-170 now, via a helper. (6) Kris asked pros and cons of re-pinning mise and codex; no action yet.

## Decision 36 (2026-10-10)

- Decision 36 (2026-10-10) - Kris, 2026-10-10: "do all the recommendations now". (1) Stop and start the agent host through the provider now (reboot flag set after the 7.0.0-1014 kernel), then reconnect and verify. (2) Fold the remaining live record identifiers (TECHNE-TOOLS-OPS-011 bashrc marker, TECHNE-TOOLS-OPS-022 user data, KI-ARCADIA-GOV-020 and KI-ARCADIA-GOV-023 tags, description, recipe, guide) into TECHNE-TOOLS-OPS-017. (3) KI-HARNESS-GOV-170: add ki-accept's acceptance standard to scope; cross-repository duplicates recorded in plain words naming the repository, no identifier. (4) Raise the recipe pins for mise and codex to what the Mac runs (mise 2026.10.6, codex 0.162.0). (5) Adopt and plan TECHNE-TOOLS-OPS-017 (leave draft for approval). (6) Hand the machine-naming convention (Decision 29(a)) to the rig.mac-studio-bootstrap thread.

## Decision 37 (2026-10-11)

- Decision 37 (2026-10-11) - Kris, 2026-10-11, TECHNE-TOOLS-OPS-017 plan: (1) "whatever you recommend": replace the ki-work-item tag with ki-authority = GDR-KI-ARCADIA-004; (2) asked for a recommendation; coordinator recommends removing the .bashrc hand-off outright once the provider sets the login shell, with converge warning if the login shell differs; (3) "yes, clean them all up": remove every record identifier from agent-host code, recipe, checks and guide, add a check enforcing it, capture the other stacks' ki-work-item tags as a separate triage item; (4) yes, guide uses vega, recipe defaults neutral; (5) yes, run the before-rebuild check at the last commit before this work lands. Plan approved on these terms: move to ready. Kris handles pushes.

## Decision 38 (2026-10-11)

- Decision 38 (2026-10-11) - Kris, 2026-10-11: agreed removing the .bashrc hand-off outright. Pins: "option 1 for now" - capture and plan a ki-techne-harness record for a weekly pin-bump housekeeping job (check new releases of the tools pinned in recipes/agent-host/rig.toml, raise the pins, run the tests, leave the change for Kris's review; host picks it up at next setup), and stop comparing the Mac against the host's pins (Mac governed by Homebrew/Rig, not the recipe). Leave the record draft for approval.

## Decision 39 (2026-10-11)

- Decision 39 (2026-10-11) - Kris, 2026-10-11: questions the Rig/Techne boundary. Rig so far = macOS personal setups (profiles terra, sol). Techne = tooling for running Knowledge Islands in environments. vega (Ubuntu now, likely Omarchy later) is really a "remote agentic rig", similar in purpose to sol; Kris also wants other host kinds, e.g. a simpler host that runs a Paperclip environment rather than a remote desktop. Cheztoi stays as the chezmoi variant for less-trusted environments. Rig must cope with packaging for things running in environments; Techne takes a host as far as base and ready, Rig then rigs it up for use. KI tools have a Homebrew tap but need a packaging strategy beyond macOS package managers. Asked for sense-making and an audit across Rig and Techne, then likely back to state-of-play. Authority: read-only audit and one written assessment in Arcadia; no record changes. Hold TECHNE-TOOLS-OPS-017 build and TECHNE-TOOLS-OPS-024 approval until the audit reports.

## Decision 40 (2026-10-11)

- Kris, 2026-10-11: Rig and Techne boundary audit - all ten decisions as recommended: (1) four layers plus workspace; (2a) keep recipe name agent-host, describe as AWS base for a remote agentic rig; (3a) role profile moves to a recipe-independent roles/ folder in ki-techne-harness; (4) exact pins for rebuildable hosts, Homebrew newest for workstations, role declares minimums; (5) signed-release install kind in tools-rig replaces TECHNE-TOOLS-OPS-016 provider, amending ADR-KI-ARCADIA-003 decision 3; (6) one KI release contract, Homebrew tap, Rig kind and installer as channels, defer apt/AUR/Nix; (7a+c) vega stays Ubuntu LTS, Omarchy kept for a future owned Linux workstation; (8) release holds: build TECHNE-TOOLS-OPS-017 as planned, move TECHNE-TOOLS-OPS-024 to ready but hold its pin-bump tool until the roles/ move lands; (9) record appliance as a third role, no recipe while the hold stands; (10) hand to state-of-play for cross-repository handoffs. Also: write the understanding into the Arcadia knowledge base in a form digestible by Kris (explicit owner instruction stands in for a record), then hand off to the Knowledge Islands model Initiative to check it all makes sense. Kris asked for repos to be pushed and pulled into sync.

## Decision 41 (2026-10-12)

- From state-of-play (Kris, 2026-10-12): KI-TOOL-TECHNE-CLI-008 local implementation approved in parallel without vega evidence (record moved to ready by state-of-play/triage-apply); deliver it locally within the hold. KI-TOOL-TECHNE-CLI-006: bring its plan to Kris for review after 008.

## Decision 42 (2026-10-12)

- Kris, 2026-10-12 (handover from state-of-play Decision 142): KI-TOOL-TECHNE-CLI-008 (host patching fields) - plan already approved (tools-burndown Decision 15); Kris now explicitly approves parallel local implementation before the vega rebuild, lifting the host-first ordering gate for local work only. Move to Ready and implement locally in tools-techne with stubbed tests; stop at awaiting-review. No AWS, SSH, Tailscale or host action; live verification waits for the owner-led vega rebuild. Techne Programme Hold otherwise unchanged.

## Decision 43 (2026-10-13)

- Kris, 2026-10-13: (CLI008-REVIEW) accept KI-TOOL-TECHNE-CLI-008 via ki-accept, no prune. (REBUILD) launch a background agent to update the agent-host repository list and setup for the new workspace layout and repository names, local only; Kris will rebuild vega on a date not yet given. (SOP-HAND, KIM-HAND) restate both handoffs for Kris to resend, each asking the receiver to say so and not process it again if already received recently. (NAMES) closed: the rig.mac-studio-bootstrap thread can read the naming convention in Hosts, Roles and Layers.

## Decision 44 (2026-10-13)

- From state-of-play (2026-10-13): Rig and Techne boundary audit handoff received (first receipt; recorded as state-of-play Decision 154). Agent boundary-handoffs is capturing triage items in ki-techne-harness, tools-rig, tools-ki and tools-techne and amending ki-principal (Initiative wording, ADR-KI-PRINCIPAL-003 decision 3, direct-host rename).

## Decision 45 (2026-10-14)

- Kris (2026-10-14): "I am happy for you to rebuild Vega, so we can get on with that now." Authorises this thread to carry out the owner-led vega rebuild in-session with Kris present, following the Decision 14 plan and the operator runbook: AWS sign-in, pre-checks, removal of only the verified old agent-host footprint, provision of one host named vega, setup and convergence. Interactive steps (AWS browser sign-in, Tailscale key, Claude/Codex sign-ins) stay with Kris. Stop and ask on any contradiction, unexpected resource or recoverable work. No hnr-org changes; no other remote environments.

## Decision 46 (2026-10-14)

- From Master: state-of-play (Decision 158, Kris 2026-10-14): the roadmap has grown about 50% since last measured. Standing focus: burn it down. Create no new feature records and do not widen scope; capture only blockers, defects or items Kris asks for, and prefer closing, merging or rejecting existing records.

## Decision 47 (2026-10-14)

- Rebuild outcome (2026-10-14): vega rebuilt under Decision 45; instance i-0cb5fa8cc1cd1d7d0; workspace clean; open: CHEZMOI, SOURCES, SHIM, SIGN-IN, TS-OAUTH.

## Decision 48 (2026-10-14)

- Kris (2026-10-14): "SIGN-IN - done / CHEZMOI - make the edits / SHIM - fix it". Authorises editing the chezmoi source for the agent-host binding (host_name/tailscale_name vega), the SSH Host entry and the Zed SSH host, committing those paths only for Kris to review with chezmoi diff before apply; and fixing the local ~/.local/bin/techne shim path. SOURCES asked a question, no decision yet.

## Decision 49 (2026-10-14)

- Kris (2026-10-14): "I guess we can defer that bit about just getting the machine built out as much as possible." SOURCES deferred; recommendation on record is route 1 (Syncthing sol to vega over Tailscale, receive-only on vega, design first). Priority is vega built out as far as possible without it.

## Decision 50 (2026-10-14)

- Kris (2026-10-14): "TS-OAUTH - capture as work". Authorises capturing an unadopted draft roadmap record in ki-techne-harness for a Tailscale OAuth client that lets provision.sh mint the single-use tag:ki-techne-agent-host auth key at each build; capture only, no implementation, no push.

## Decision 51 (2026-10-14)

- Kris (2026-10-14): "SOURCES - Can you do some research into what options we have here so we can be more effective in maintaining any related sources, store items. Also I'm wondering what the impact surface is of this because I suspect it's not very important for knowledge islands but it could be a lot more important for other territories." Authorises read-only research: options for making declared source stores available on non-Mac hosts (vega, sol, future), and the impact surface across all territories. Report only; no changes.

## Decision 52 (2026-10-14)

- Re-bootstrap request from Master: state-of-play, on Kris's instruction (2026-10-14). Kris has seen threads regress after compaction (lost owner report, tool chatter) and the Headroom proxy was down 08:49-09:46 BST, so messages may have failed with "connection refused".

1. Re-read the ki-delegation skill (owner report, quiet level, background runs) and your own checkpoint now.
2. Add a short "Thread working rules" block to your own checkpoint (role, owner-report shape, quiet level, minimal visible tool use and outcomes only, standing rules) and re-read it after any compaction. Touch no other thread's checkpoint.
3. Recover anything missed: review your user messages since 08:45 BST and your run's decisions log, and act on anything unanswered or interrupted.
4. Standing rules now in force: burn the roadmap down, no new feature records (Decision 158); you may push other threads' committed work beneath yours when checks pass, naming it (Decision 165); connection-critical changes need a tested restore path (Decision 169); follow-up releases stop and ask first.
5. Then give Kris one owner report.

## Decision 53 (2026-10-14)

- Kris (2026-10-14): "SRC-STOPGAP - approved". Authorises binding ki-principal sources role on vega to an empty read-only local directory, rerunning ki repo repair there, and noting the step in the agent-host runbook in ki-techne-harness.

## Decision 54 (2026-10-14)

- Kris (2026-10-14): "SRC-REPAIR - approved". Authorises capturing one unadopted defect record in tools-ki: repair still projects skills when a declared store is unavailable, open and the VS Code workspace degrade with a warning, and the machine-local registry can mark a store absent on a host. Capture only.

## Decision 55 (2026-10-14)

- Kris (2026-10-14): "SRC-SCOPE - keep vega KI-only for now". vega carries Knowledge Islands repositories only; cross-host source sync is deferred until a territory and host are named.

## Decision 56 (2026-10-14)

- Kris (2026-10-14): "TS-OAUTH-ADOPT - now". Adopts KI-TECHNE-OPS-027 at horizon now: local implementation in ki-techne-harness may proceed; creating the Tailscale OAuth client and any live rebuild stay with Kris.

## Decision 57 (2026-10-14)

- Kris (2026-10-14): "DEV-MODE - a". Rig owns rig dev local|release <tool>, each tool keeps install.sh --link as its hook, checkouts found through ki registry, per tool by default with an all option and a mixed-mode warning; handed to the Rig thread via state-of-play.

## Decision 58 (2026-10-14T19:00:39Z)

- Master: state-of-play (2026-10-14, REBOOT-ALL on Kris word): resume under current ki-pmo and ki-delegation (report shape frozen at harness b81bcfa3); conform +/_CHECKPOINTS/techne.agent-host.md to the six-section checkpoint schema (fails RECORD-2); rewrite its KI-TOOL-KI-CLI-115 link as bare text "cancelled and pruned 2026-10-14"; ki-principal commits blocked until mac-studio-bootstrap fixes its Project note from sol.

## Decision 59 (2026-10-14T20:20:52Z)

- Owner instruction 2026-10-14 21:1x BST (re-bootstrap under ki-pmo daa63224): commit everything the thread does or oversees by explicit path; at each report and resting point check every finished agent is committed and pushed and commit the checkpoint and thread folder, naming any uncommitted or unpushed work; at this and every mark delete by explicit path every report whose queries are all answered and whose outcome has a durable home, keeping decisions.md and reports with open queries, and commit the deletions; heartbeat: while dispatched work runs wake at least every 5 minutes or when an agent finishes, with a one-to-two-line timed update naming each running agent step, none at rest; ki-principal caveat: the pre-commit gate fails on STREAM-9 in the mac-studio-bootstrap Project note, so ki-principal changes stay uncommitted (never --no-verify) until the scoped ki repo audit --staged gate lands, then commit through a private index by explicit path at the next mark. Class: practice.

## Decision 60 (2026-10-14T20:28:31Z)

- Owner instruction 2026-10-14 21:2x BST: token limits are close and the Fable limit is already hit; until a reset, prioritise mechanical work and launch background agents on a lower model level (Sonnet or Haiku, never Fable) to conserve what is left. Class: practice.

## Decision 61 (2026-10-14T21:28:16Z)

- TS-OAUTH-LIVE (Kris, 2026-10-14): created the tag-scoped Tailscale OAuth client and 1Password item; mint-tailscale-key.sh --check printed "Tailscale accepted the OAuth client (scope: auth_keys); no key was minted". Passed. Thread to offer ki-accept for KI-TECHNE-OPS-027 (needs Kris approval). Class: operational.

## Decision 62 (2026-10-14T21:29:22Z)

- OPS-027-ACCEPT (Kris, 2026-10-14), as received: "Accept KI-TECHNE-OPS-027 through ki-accept now, without pruning, then commit and push". Class: operational.

## Decision 63 (2026-10-14T21:29:22Z)

- TS-OAUTH-HANDOFF (Kris, 2026-10-14), as received: "b) and do it now" - hand the optional tailscale_oauth_item binding field to tools-techne now as a roadmap item, overriding the burn-down hold for this one item. Class: operational.

## Decision 64 (2026-10-14T22:22:30Z)

- CLI-009-ADOPT (Kris, 2026-10-14), as received: "Adopt KI-TOOL-TECHNE-CLI-009 in tools-techne as kind deliver at horizon next, planned after the current burn-down work". Class: operational.

## Decision 65 (2026-10-14T22:22:30Z)

- REPORT-RECOPY (Kris, 2026-10-14), as received: "Capture the ki agent report re-copy defect in tools-ki as a triage record via a Sonnet agent, and tell state-of-play. I also feel that this needs some prioritization to it, because it is clearly a defect that would be good to get out of the way quickly." Thread reads this as approval to adopt the defect at horizon now after capture. Class: operational.

## Decision 66 (2026-10-14T22:22:30Z)

- MARK (Kris, 2026-10-14), as received: "Take a mark at this point and then handle the responses. So we have a strong baseline for future summarization." Class: operational.

## Decision 67 (2026-10-14T22:58:45Z)

- CLI-133-PLAN (Kris, 2026-10-14), as received: "Plan KI-TOOL-KI-CLI-133 now with ki-plan on Sonnet, reproduction against the installed ki first, then report it Ready for my delivery go-ahead". Class: operational.

## Decision 68 (2026-10-15T09:49:27Z)

- DRAIN FOR SOL (Kris, 15 October 2026), as received: "I am moving working to sol next. Bring this thread to a clean, recoverable rest now. Do not start new work and do not launch new background agents." Class: operational.
