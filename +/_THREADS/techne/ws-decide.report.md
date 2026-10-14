# ws-decide - report

Authority: Decision 7 in `/Users/krisbrown/.local/state/ki/agents/techne/decisions.md`. Kris's words, verbatim: "all, but can you show me them or state what they are at least".

## Done

- **Decisions file written.** It lists all seven decisions, each with Kris's words verbatim and the option they accept, so it also answers the "show me them" part of Kris's reply. It also records the authority grant and the push scope. File: `/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/agent-host/design/agent-host-workstation-decisions.md`. The `design.md` index is updated. Commit `951540c`.
- **New Decision Record: ADR-KI-ARCADIA-003, "The agent host workstation model".** File: `/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Admin/Governance/Decisions/ADR-KI-ARCADIA-003-the-agent-host-workstation-model.md`. It is added to the Decisions index as item 17. It states the consolidated model and does not cite the design papers. I made it a new record because no existing record owns the workstation concern. ADR-TECHNE-003 owns implementation ownership and ODR-KI-ARCADIA-001 owns durability, and neither is clean anyway. Commit `9437f34`.
- **Rollout records captured in ki-techne-harness** (`/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/`):
  - **TECHNE-TOOLS-OPS-015, Agent-host workstation pilot** (`TECHNE-TOOLS-OPS-015-agent-host-workstation-pilot.md`). Selected as the pilot: `draft`, horizon `next`, `kind: deliver`. It is paired with DOTFILES-UE-073 and blocked by TECHNE-TOOLS-OPS-013 and TECHNE-TOOLS-OPS-014. It includes the guarded zsh hand-off, because Decision 7 puts the zsh route in the pilot.
  - **TECHNE-TOOLS-OPS-016, Rig provider for ki** (`TECHNE-TOOLS-OPS-016-rig-provider-for-ki.md`), triage. It wraps ki's signed installer.
  - **TECHNE-TOOLS-OPS-017, Zsh shell at rebuild** (`TECHNE-TOOLS-OPS-017-zsh-shell-at-rebuild.md`), triage. This is the rest of decision 4: the stack sets `--shell /bin/zsh` at the next rebuild and the hand-off is retired.
  - **TECHNE-TOOLS-OPS-018, Converge tools through Rig** (`TECHNE-TOOLS-OPS-018-converge-tools-through-rig.md`), triage. This is the single stage-3 record, gated on both of its conditions.
  - **TECHNE-TOOLS-OPS-014** (`TECHNE-TOOLS-OPS-014-agent-host-pins-and-expiries.md`) now includes the Rig `direct-host` profile in its scope (stage 1). It cites ADR-KI-ARCADIA-003 and covers Rig's first real-host proof.
  - TECHNE-TOOLS-OPS-013 gains `blocks: [TECHNE-TOOLS-OPS-015]` so the dependency is recorded on both records.
  - Commits `1a36b45` (number reservation) and `abd5280`.
- **Rollout records captured in chezmoi** (`/Users/krisbrown/.local/share/chezmoi/docs/roadmap/`):
  - **DOTFILES-UE-073, Cheztoi host profile** (`DOTFILES-UE-073-cheztoi-host-profile.md`). This is the paired pilot record: `draft`, horizon `next`. It covers the allowlist and renderer, the minimal zsh profile, the Claude and Codex instructions including the host delegation variant, the Linux `mgit` catalogue entry, and the personal Rig fragment.
  - **DOTFILES-UE-074, Host detached delegation** (`DOTFILES-UE-074-host-detached-delegation.md`), triage. It revisits detached delegation once KI-HARNESS-GOV-144 settles.
  - Commits `e7f6817` (number reservation) and `c051722`.
- **Project note and checkpoint updated.** The Project note `Streams/Projects/agent-host/agent-host.md` links ADR-KI-ARCADIA-003 and describes the rollout and pilot. `+/_CHECKPOINTS/techne.md` is brought to current state. Commit `628e06c`.
- **Checks:** `ki repo audit --repo .` PASS in Arcadia (24 skills) and ki-techne-harness (18 skills). In chezmoi: PASS=19 WARN=2 FAIL=0. Its 19 warnings were already there: Decision Record links outside the collection, and the unavailable `ki-arcadia-principal` territory registry.
- **Pushed** fast-forward, after `git pull --ff-only`, with only my own commits ahead:
  - ki-techne-harness: `bfd624a..abd5280`
  - chezmoi: `0c68174..c051722`

## Failed

- **Project note does not list records by identifier.** The Streams audit (STREAM-9) fails when a registry note lists work records. The note describes the records without identifiers instead; the identifiers are in this report and in the checkpoint.
- **No tools-rig record.** The report calls for one only if decision 3 chose a release-archive kind in tools-rig, and Kris chose the harness provider. The Linux catalogue entries live in Kris's chezmoi catalogue (DOTFILES-UE-073). The first real-host Rig proof is stage 1, in TECHNE-TOOLS-OPS-014. tools-rig is unchanged.
- **Zsh hand-off and delegation variant are not standalone records.** Decision 7 puts both inside the pilot pair, so each sits there. The separate records carry what is left of each decision: TECHNE-TOOLS-OPS-017 for zsh and DOTFILES-UE-074 for delegation.

## Needs Kris

- **Arcadia is not pushed, as briefed.** My three commits (`951540c`, `9437f34`, `628e06c`) sit on top of the close run's commits and another session's `118007d`. The nine uncommitted Decision Record changes from the other session are untouched.
- **tools-techne record.** Wave 2 of the report expects `techne host setup` to pass the profile and `techne host status` to show personal-tool drift. Decision 7 did not authorise tools-techne, so nothing is captured there. TECHNE-TOOLS-OPS-015 settles whether the record is needed when it is planned.
- **Design folder.** Both loops' outcomes are now consolidated in ODR-KI-ARCADIA-001 and ADR-KI-ARCADIA-003, so the design standard says to delete the folder. It is kept, as briefed, until you approve deleting it.
- **Adopting the triage records.** TECHNE-TOOLS-OPS-016, OPS-017, OPS-018 and DOTFILES-UE-074 stay in triage until you adopt them.
