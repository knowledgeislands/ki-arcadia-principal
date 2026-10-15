# Decisions

## Decision 1 (2026-10-08)

- Adopt the three Sol (100.90.130.74) host keys into the known_hosts source; they are needed.

## Decision 2 (2026-10-08)

- Ignore connector issues in this thread.

## Decision 3 (2026-10-08)

- Work this thread through ki-delegation: helpers and background agents do substantive work; the thread stays responsive.

## Decision 4 (2026-10-08)

- Commit the unattributed CodexBar CLI change and proceed with planning DOTFILES-UE-072 ('commit them and make it happen').

## Decision 5 (2026-10-08)

- Hold DOTFILES-UE-072 until the direct-host recipe (TECHNE-TOOLS-OPS-014) ships; then likely cancel.

## Decision 6 (2026-10-09)

- Fix the chezmoi failure caused by Kris moving 1Password items; Kris is reorganising vaults and expects more moves.

## Decision 7 (2026-10-09)

- Rig is the Initiative over chezmoi: chezmoi controls machine configuration files, Rig oversees it. Capture the 1Password vault reorganisation and move-robust secret references as a chezmoi roadmap record under Rig.

## Decision 8 (2026-10-09)

- Add Rig to the speech-to-text vocabulary note in communication.md, with the garbled forms found in past transcripts; resolve by context.

## Decision 9 (2026-10-09)

- Adopt the secrets approach for DOTFILES-UE-077: a dedicated automation vault outside reorganisations, one logical-name secrets map in chezmoi, and a pre-apply reference check; reject title-search fallback.

## Decision 10 (2026-10-09)

- Name the dedicated secrets vault 'Rig'.

## Decision 11 (2026-10-09)

- Hold the 1Password inventory: Kris will make some tweaks first and wants to watch progress. Capture Kris's vault purposes and precedence in DOTFILES-UE-077.

## Decision 12 (2026-10-09)

- Kris has restructured the vaults (Personal as inbox; Financial; Org - HNR; Org - Techmedix; Personal - Dating, Family (Howden Browns), Family (Retford Browns), HNR, Kids, Kris, Legal, Oliver, Side Projects; Rig) and seeded exemplars. Run the read-only inventory now and propose precedence and moves in the report.

## Decision 13 (2026-10-09)

- Extend the 1Password review: consider additional vaults, propose good vault icons and descriptions, and tidy item tagging. Proposals first; changes only after Kris approves.

## Decision 14 (2026-10-09)

- Rig holds anything Kris uses on a machine or connects to (Wi-Fi, router, device unlock codes included), not only tool-read secrets.

## Decision 15 (2026-10-09)

- Personal - Family (Howden Browns) is Kris's parents and brother (Sandra Brown / Sandra Mills, Gerald Brown, Matthew Brown); may be renamed to Parents. Kris wants a Personal - Household vault for his own household.

## Decision 16 (2026-10-09)

- Include item hygiene in the 1Password tidy-up: correct, consistent item titles; solid URLs; and follow-up tags marking items Kris must deal with.

## Decision 17 (2026-10-09)

- Retford Browns is not Kris's parents (Janet Shipley, Willow Grove, David Brown, as described).

## Decision 18 (2026-10-09)

- Item names: one consistent style; add a bracketed qualifier, e.g. 'Google (Isaac)', where Kris has several entries for the same service.

## Decision 19 (2026-10-09)

- URLs: fix without further approval; link the service's home page, not a nested or sign-up page. Kris will link related items himself.

## Decision 20 (2026-10-09)

- Precedence: Financial ranks above a person's own vault; all financial items live in Financial.

## Decision 21 (2026-10-09)

- Uncertain items go to the Personal inbox vault. The triage must be repeatable, as a recurring routine.

## Decision 22 (2026-10-09)

- Tag-then-process: tag every 1Password item ^triage first; helpers apply the changes they are confident of and remove ^triage from each item they finish; whatever still carries ^triage (or another ^ follow-up tag) is Kris's to deal with. Uncertain homes go to the Personal inbox.

## Decision 23 (2026-10-09)

- Items in the wrong 1Password category get a ^recategorise tag (with the suggested category in the change log); Kris recreates them, since 1Password cannot change an item's category.

## Decision 24 (2026-10-09)

- Apply only the vault-plan.md batches Kris ticked; unticked batches are deferred, the struck-out one is dropped. Kris's answers to Questions 1-23 given in chat (recorded in vault-answers.md).

## Decision 25 (2026-10-09)

- Kris answered vault-plan Questions 1-23: see vault-answers.md. Nothing goes to 1Password Archive; ^archive tag instead. Revert the Howden Browns rename.

## Decision 26 (2026-10-09)

- Create a secrets-hygiene Project under Rig holding DOTFILES-UE-077 and DOTFILES-UE-078.

## Decision 27 (2026-10-09)

- DOTFILES-UE-075 and 076 belong to the mac-studio-bootstrap thread.

## Decision 28 (2026-10-09)

- Do all four gated records (DOTFILES-UE-062, 071, 027, 065), DOTFILES-UE-062 first.

## Decision 29 (2026-10-09)

- 1Password approval should be asked once per helper session, not per command: run all op calls through one persistent pty-backed shell.

## Decision 30 (2026-10-09)

- Add a single-approval 1Password session (one pty-backed op session per helper or triage run) to DOTFILES-UE-077's scope.

## Decision 31 (2026-10-09)

- Add claude-swap auto-switching as a chezmoi-managed background service: cswap auto --strategy consume-first (or cswap menubar --install-service with auto-switch on). I approve this launchd exception. Follow the DOTFILES-UE-075 pattern for exceptions.

## Decision 32 (2026-10-09)

- UE-062 - yes (scoped to leave Claude, Codex, mcporter and skills untouched), but let 1Password updates finish first.

## Decision 33 (2026-10-09)

- Do the recategorising: create the items in the right category and archive the old ones.

## Decision 34 (2026-10-10)

- Switch on the claude-swap service (Kris: 'yes, can you do it').

## Decision 35 (2026-10-10)

- Push the UE-078 commits and the rig.chezmoi checkpoint.

## Decision 36 (2026-10-10)

- Kris approves CODEX: drop mcp-housekeeping-codex from dot_mgit.toml, dot_config/ki/config.toml, .chezmoidata/trusted-folders.yaml and the VS Code workspace.

## Decision 37 (2026-10-10)

- File a tools-rig record: rig apply asks for the sudo password once at the start and keeps it alive for the run.

## Decision 38 (2026-10-10)

- Note the approved Claude auto-switch exception in ADR-DOTFILES-007.

## Decision 39 (2026-10-10)

- Tangent: Kris wants to review the macos-defaults.

## Decision 40 (2026-10-10)

- Push chezmoi including the other thread's commits beneath. Lightroom Classic goes on the Dock only on sol (Mac Studio). macOS settings review is about their origin/source and refreshing from it.

## Decision 41 (2026-10-10)

- Create DOTFILES-HK-004 to refresh macOS settings from Mathias's .macos. Finder new windows open home folder (PfHm).

## Decision 42 (2026-10-11)

- Push chezmoi; fix rig doctor drift; run HK-004. Kris asked about a standalone macOS-settings tool and a defined settings list.

## Decision 43 (2026-10-11)

- Fix the Observatory drift, run HK-004, answer the macOS-settings tool question, update the checkpoint, then take Mark 2.

## Decision 44 (2026-10-11)

- DOTFILES-UE-083: accept the proposal sheet as recommended (keep all 35, add the 14 recommended). Catalogue tool is a new-repository proposal, handed to state-of-play. Push. Marks become a single moving point, no history.

## Decision 45 (2026-10-11)

- Marks: don't invent a convention; hand it to state-of-play to decide, report back to this thread, and propagate to other threads.

## Decision 46 (2026-10-11)

- Push the DOTFILES-UE-083 acceptance, prune the record, move the mark. Leave `run_after_copy_github_ssh_key.sh` as it is (it runs on every apply by design; the mac-studio-bootstrap thread owns it).

## Decision 47 (2026-10-11)

- From state-of-play, Kris approved: rename the checkpoint heading to "Decisions made" and push; finish the CODEX retirement on this machine; cancel and prune DOTFILES-UE-065, DOTFILES-UE-074 and DOTFILES-UE-078 as ideas (Rig Initiative, agent-host and secrets-hygiene); merge DOTFILES-UE-079 into RIG-CORE-041; do DOTFILES-UE-072 now; keep DOTFILES-UE-027 and DOTFILES-UE-071; marks follow KI-HARNESS-GOV-169 (mark in the checkpoint, only Kris moves it; marks.md deleted); push other verified commits. Earlier the same session: the mac-studio-bootstrap handover (copy-key script, op_cache race) is captured as DOTFILES-UE-085, plan pending with Kris.

## Decision 48 (2026-10-11)

- Kris: UE072-REVIEW agreed - push, accept DOTFILES-UE-072, apply the two instruction files on the laptop and on sol. UE085-PLAN yes - build DOTFILES-UE-085 as planned (copy-key script renders empty once both key files exist; op_cache unique mktemp temp file and atomic move; tests; verify on laptop and sol). UE079-MERGE: Kris wants more context; wants it all recorded in Rig, asks whether Rig can keep something private; not actioned.

## Decision 49 (2026-10-11)

- Kris: UE079-PLAN yes - declare DOTFILES-UE-079's "declare" items in the private Rig configuration now; keep the removal list in DOTFILES-UE-079 until RIG-CORE-041 exists; add a one-line note to RIG-CORE-041. UE072-PRUNE yes. Kris has asked state-of-play to move the tools roadmap items forward.

## Decision 50 (2026-10-11)

- Kris: RIG-PUSH and UE079-PUSH yes - push tools-rig and chezmoi. Reconcile chezmoi where out of date. Kris is running `rig apply` on the laptop to install Google Drive. Move DOTFILES-UE-079's remaining items (the four open questions and what is still to do) to a new record and accept DOTFILES-UE-079 so it is not reconsidered. SOL-ALIGN yes, widened: install 1Password, Telegram and Tailscale the same way on the laptop and sol, with no variants.

## Decision 51 (2026-10-11)

- From the master (state-of-play Decisions 49 and 50): territory and OneDrive source-store names change to the territory names (e.g. `knowledge-islands`, `sources-personal`). Hold off editing any `.ki.toml` and the chezmoi paths for the ki registry, trusted folders, workspace files and Claude and Codex trust entries; expect a master commit touching only those. Once it lands, pull, fix this thread's builds and old-name references; the master will send a list.

## Decision 52 (2026-10-12)

- From state-of-play (Kris, 2026-10-12): KB-DOTFILES-UE-027 rationales - bring Kris the 10 proposals and entries in small batches. Triage dispositions for KB-DOTFILES-UE-071/076/077/082/084/086 are being applied by state-of-play/triage-apply; pull before editing those records.

## Decision 53 (2026-10-13)

- From mac-studio-bootstrap (Kris approved KEYCHAIN-SSH, 2026-10-13): make the Automation service-account token readable on sol from a non-GUI (SSH) session, keeping it out of logs and caches, and update the chezmoi guide's Service account section and the macOS workstation guide's Keychain-over-SSH note. Not blocking mac-studio-bootstrap. Method to be agreed with Kris.

## Decision 54 (2026-10-13)

- Kris: KEYCHAIN-SSH yes - token file on every Mac, retire the Keychain lookup, update both guides. UE079-OPEN: remove Clockology and Prime Video, keep maturin; Mercury left unanswered. SOL-ALIGN yes, as recommended in KB-DOTFILES-UE-086.

## Decision 55 (2026-10-13)

- Kris: MERCURY - remove (Mercury Weather joins the KB-DOTFILES-UE-086 removal list, laptop).

## Decision 56 (2026-10-14)

- Kris: TOKEN-MIGRATE - check now whether sol can read the token over SSH; if not, give Kris the command to run. PUSH yes - push the three chezmoi commits. PAPERCLIP-DRIFT - defer for now. RIG-MISE-LOCATOR yes - hand off to tools-rig. DEFAULTS kept (hand the ITEM-2 initiative-handle warning to ki-agentic-harness). SVG-HANDLER unanswered.

## Decision 57 (2026-10-14)

- Kris: TOKEN-SOL done (token file copied to sol). SVG-HANDLER - Kris sets Chrome by hand on the laptop; ask state-of-play for a Rig release and declare it in core.

## Decision 58 (2026-10-14)

- From Master: state-of-play (Decision 158, Kris 2026-10-14): the roadmap has grown about 50% since last measured. Standing focus: burn it down. Create no new feature records and do not widen scope; capture only blockers, defects or items Kris asks for, and prefer closing, merging or rejecting existing records.

## Decision 59 (2026-10-14)

- Kris: PUSH-2 yes - push tools-rig 4de347b and 3ee6fa8 and chezmoi 647e137. RELEASE-ASK - Kris passes the release request to state-of-play.

## Decision 60 (2026-10-14)

- From Master: state-of-play (Decision 160): tools-rig v0.6.1 is released through the KI tap and installed on this Mac (brew upgrade knowledgeislands/tap/rig). Require Rig >= 0.6.1 for default applications: 0.6.0 is broken (handler read as [object Ref]). Declaration shape and notes: ~/.local/state/ki/agents/state-of-play/rig-release.report.md, section 'What chezmoi needs to know'. Your SVG -> Chrome declaration can proceed.

## Decision 61 (2026-10-14)

- From Master: state-of-play (Kris approved 2026-10-14, TRIAGE-BURNDOWN): KB-DOTFILES-UE-087 reject (the Headroom guide's install command is the declaration; Kris finds 'headroom' not on PATH, which a master agent is fixing in the guide). KB-DOTFILES-UE-088 adopt, Next, deliver. Apply with ki-next / ki-accept in chezmoi.

## Decision 62 (2026-10-14)

- Kris: take a mark. DEFAULTS kept - declare SVG to Chrome in core, verify with rig doctor and push; then launch an agent on section A of KB-DOTFILES-UE-086, no live changes.

## Decision 63 (2026-10-14)

- From Master: state-of-play: 5 dotfiles tests fail on origin/main (SSH/Zed techne, vega.toml, config-fragments, ki-self-skill, derived-host SSH entry); a master agent pushed 06857f5 (yours, rig mise toolchain) beneath its guide commit 138adea under Decision 165. Please triage the failures. Your uncommitted dot_config/rig/conf.d/private_40-macos.toml was left untouched.

## Decision 64 (2026-10-14)

- Re-bootstrap request from Master: state-of-play, on Kris's instruction (2026-10-14). Kris has seen threads regress after compaction (lost owner report, tool chatter) and the Headroom proxy was down 08:49-09:46 BST, so messages may have failed with "connection refused".

1. Re-read the ki-delegation skill (owner report, quiet level, background runs) and your own checkpoint now.
2. Add a short "Thread working rules" block to your own checkpoint (role, owner-report shape, quiet level, minimal visible tool use and outcomes only, standing rules) and re-read it after any compaction. Touch no other thread's checkpoint.
3. Recover anything missed: review your user messages since 08:45 BST and your run's decisions log, and act on anything unanswered or interrupted.
4. Standing rules now in force: burn the roadmap down, no new feature records (Decision 158); you may push other threads' committed work beneath yours when checks pass, naming it (Decision 165); connection-critical changes need a tested restore path (Decision 169); follow-up releases stop and ask first.
5. Then give Kris one owner report.

## Decision 65 (2026-10-14)

- Kris: RIG-CASKS - yes, hand the Rig 0.6.1 cask metadata defect to state-of-play as blocking; hold rig apply on both Macs until a fixed release is installed. Master (state-of-play) re-bootstrap request: add Thread working rules block to own checkpoint; standing rules - burn down, no new feature records, may push other threads' committed work beneath ours when checks pass (naming it), connection-critical changes need a tested restore path, follow-up releases stop and ask first.

## Decision 66 (2026-10-14)

- From Master (state-of-play): RIG-CASKS received; a tools-rig fix agent is launched; the fix ships as 0.6.3 after 0.6.2 (KI-TOOL-RIG-CORE-050) and waits for Kris's release approval. Keep rig apply held until state-of-play says a fixed release is installable.

## Decision 67 (2026-10-14)

- Kris (ways-of-working recovery banner, 10:12 BST): re-bootstrap ki-delegation - re-read checkpoint and Thread working rules, set a mark, re-output the summary, take stock of coordination, restart any new work, end with a fresh banner. Mark set at 2026-10-14T09:11Z.

## Decision 68 (2026-10-14)

- From Master (state-of-play): Rig 0.6.2 released and installed; install.executables works. 0.6.3 (RIG-CASKS fix) waits for Kris; keep rig apply held. Suggests a chezmoi task for Kris: review chezmoi diff and apply the mise config (live has only node and bun), then declare rust (install.executables rustc, cargo) and each cargo: tool by binary name in the Rig catalogue, keeping them in the mise config. Put to Kris as B-START and RUST-DECLARE.

## Decision 69 (2026-10-14T10:57:09Z)

- Kris, 2026-10-14 10:56Z: resume under current ki-pmo and ki-delegation - re-bootstrap, mark (struck at 2026-10-14T10:56Z), fresh summary with carried-forward open points, take stock, restart authorised work, then banner.

## Decision 70 (2026-10-14T12:51:26Z)

- Kris, 2026-10-14: handoff from ways-of-working (KI-PRINCIPAL-ECO-013, KI-HARNESS-GOV-186) - deploy the harness output style ki-agentic-harness/output-styles/ki-coordinator.md to ~/.claude/output-styles/ki-coordinator.md through chezmoi, as the pilot record's chezmoi Steps say; review chezmoi diff before applying.

## Decision 71 (2026-10-14T20:18:54Z)

- Kris, 2026-10-14: re-bootstrap under current ki-pmo and ki-delegation (harness at daa63224 or later); take a new mark; give a fresh full summary with every open query and the full stacked reply block. Commit everything the thread does or oversees, by explicit path, and name anything uncommitted or unpushed. At this mark and every one after, delete answered reports whose outcome has a durable home from +/_THREADS/<run>/. Heartbeat: wake at least every 5 minutes while work runs. ki-principal: its pre-commit gate fails on STREAM-9 (mac-studio-bootstrap), so leave ki-principal changes uncommitted, never use --no-verify, and commit through a private index at the next mark after the gate switches. Other repositories commit and push as normal.

## Decision 72 (2026-10-14T20:28:25Z)

- Kris, 2026-10-14 21:3x BST: 'we are getting close to our token limits and we have already hit the limit on fable. try to prioritise work that is more mechanical and on a lower model level to optimise what we have left until a reset.'

## Decision 73 (2026-10-14T21:12:08Z)

- Kris, 2026-10-14 ~21:45 BST, answering the full summary's reply block (all option a): APPLY - "I run rig doctor, chezmoi apply and rig doctor on the laptop, then tell this thread the findings." RIGTEST - "A Sonnet background agent updates both Paperclip expectations in tests/rig-catalogue.test.mjs to match the catalogue, reruns the tests, then commits and pushes." B-START - "After APPLY, I run mise install on the laptop to fetch the 15 pins; a Sonnet background agent then checks rig doctor for any tool still missing and reports." RIG-DECLARE - "A Sonnet background agent declares rust (rustc, cargo) and the eight cargo tools by binary name in the Rig catalogue, kept in the mise config, as a source change in KB-DOTFILES-UE-086; it runs the tests, then commits and pushes." PUBLIC-VIEW - "A Sonnet background agent adds python to public to match uv, keeps actionlint and zig in core only, then commits and pushes." FORM - "Keep ~/.claude/output-styles/ki-coordinator.md as a chezmoi link to the harness checkout, and delete the coord-style report at the next mark." VAULT-LEFTOVERS - "Add the vault-apply-3 items (the in-app moves, the Howden Browns Google and Retford Browns Microsoft owners, the Directline business item, deferred sections 3 and 2c) and the Telegram bot and signing-key checks to the repeatable-triage idea in the secrets-hygiene Project, then delete the vault-apply-3 report at the next mark." PROJECT-REG - "Hand state-of-play a non-blocking request to register a chezmoi Project note under the Rig Initiative; link this thread's heading to it once it exists."

## Decision 74 (2026-10-14T21:20:37Z)

- Kris, 2026-10-14: 'I can't stress this enough and I'll be saying this to every single thread, but it's absolutely imperative that you commit your work.'

## Decision 75 (2026-10-14T23:06:29Z)

- 2026-10-15, Kris: 'I did the steps in apply and b-start' - APPLY and B-START done on the laptop; rig doctor after mise install: healthy, findings=0, present=165, catalogue-only=21, incompatible-platform=0. No tool is missing, so the follow-up rig doctor check agent is not needed. Kris was unsure whether PROJECT-REG was handed to state-of-play; the thread re-issued the paste block.

## Decision 76 (2026-10-14T23:11:36Z)

- 2026-10-15, Kris: BURN-ORDER - 'Now, a Sonnet agent at low effort reads the 13 open KB-DOTFILES-UE records in the chezmoi source, read-only. It reports which are done in practice and ready for my acceptance (starting with KB-DOTFILES-UE-086 and KB-DOTFILES-UE-077), which of the five triage records (KB-DOTFILES-UE-087 to KB-DOTFILES-UE-091) to adopt or close, and a burn-down order. Nothing changes until I answer.'

## Decision 77 (2026-10-14T23:17:20Z)

- 2026-10-15, Kris: TRIAGE - 'A Sonnet agent adopts KB-DOTFILES-UE-087, KB-DOTFILES-UE-088, KB-DOTFILES-UE-090 and KB-DOTFILES-UE-091 at Next, and KB-DOTFILES-UE-089 at Future, then commits locally.' BURN-START - 'After TRIAGE, Sonnet agents at low effort work through, in order: KB-DOTFILES-UE-082; the small source step of KB-DOTFILES-UE-086 (declaring Adobe, Keynote, Numbers, Pages and DaVinci); a read-only check of KB-DOTFILES-UE-077's nine 1Password references and the old cache; KB-DOTFILES-UE-088 in the source only; and the source-only parts of KB-DOTFILES-UE-090 and KB-DOTFILES-UE-091. Each plans the record if it isn't Ready, delivers source changes only with the tests passing, and commits locally; the coordinator pushes. No chezmoi apply or rig apply. Anything that needs design or a decision from me stops and comes back as a query.'

## Decision 78 (2026-10-15T09:49:00Z)

- 2026-10-15, Kris: DRAIN FOR SOL - 'I am moving working to sol next. Bring this thread to a clean, recoverable rest now. Do not start new work and do not launch new background agents.' Done: nothing was running; the checkpoint was updated and pushed; the thread folder tidy is left for sol.

## Decision 79 (2026-10-15T14:59:00Z)

- 2026-10-15, Kris: DRAIN CHECK - 'A drain is a mark plus stopping all work, so that the thread can be archived on terra and resumed on sol from the repository alone.' Mark struck at 2026-10-15T14:59Z; checkpoint state set to drained, with the open queries, held, parked and waiting-on items and the next step parked in it.
