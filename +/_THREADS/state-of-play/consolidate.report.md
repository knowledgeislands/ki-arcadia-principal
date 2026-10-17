<!-- markdownlint-disable-file MD041 -->
---

---

---

# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › consolidate

**Run report at 13:36 BST · last mark 16:14 BST**

---

## Done

Read-only consolidation of Kris's intake dump of 17 October (parts 1 and 2 in the [state-of-play decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/decisions.md)) with the still-open THREADS-CHECKINS, CHURN-REMEDIES, AWAITING-REVIEW and RIG-OWNER, placed against every checkpoint in `+/_CHECKPOINTS/`, the Initiative and Project notes and the roadmaps of ki-principal, ki-agentic-harness, tools-ki, tools-mgit, tools-git-almanac, tools-rig, apps-observatory.local, chezmoi, apps-rig.midnight.ninja and apps-tower.midnight.ninja. Nothing was designed, no record was written and no checkpoint, Project or roadmap was edited. The only file written is this report.

### 1. Theme map

Initiative > Project > workstream. A workstream in **bold** is new to the Project note; everything else already exists. Items are the tags from the decisions log.

**[Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md)**

- [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) - how Kris, the threads, the agents and the `ki` tools work together. Live thread KI > Model > ways of working.
  - Thread state homes - THREAD-DURABILITY, THREADS-CHECKINS, CHURN-REMEDIES and the temp versus XDG point. Already the open STATE-AGREE query, answered in full by the thread's [state-homes report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/state-homes.report.md).
  - **Thread messaging** - THREAD-MESSAGING and ROUTING: threads pass messages to each other and re-read their own and others' checkpoints at each Summary, with the master as the routing point. The Messages block in every checkpoint is the manual version of this today.
  - **Restart prompts** - RESTART-PROMPTS: a standard shape for the prompt that restarts a thread after a hold, written once and given to every thread.
  - **Git work surface** - GIT-SURFACE: one document of the whole Git surface (Git, mgit, git-almanac, mcp-git-audit, GitHub Desktop, `ki-git`) and what Git is for in Knowledge Islands. The durable home is the Engineering Practice pillar, through the Enactment Process.
  - **Diagrams in designs** - DIAGRAMS: every design or consolidation carries diagrams. The theme-diagrams run that follows this one is the first application.
  - Vocabulary - KI-AGENTS-NAME: "agents" or "workers" for `ki agent` runs. A query by Kris's own words; the standard owns the word before the CLI does.
- [Command centre](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/command-centre.md) - the Observatory on each host as Kris's command centre and single pane of glass. Thread KI Model: command-centre, drained.
  - Single pane of glass - the Observatory point in FOCUS ("a bit of a dumping ground with lots of different views") and the "every host has an Observatory" half of LOCAL-DNS. Both already sit in the Project's reshaped Outcome of 14 October.
  - Observatory product delivery - FAVICONS for the Observatory and Headroom. Delivered for the Observatory on 15 October by the mac-studio-setup thread's [favicons report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-setup/favicons.report.md), on `origin/main` in apps-observatory.local, awaiting a service restart. Headroom cannot carry an icon locally. The Observatory: product thread has no Project note of its own and rests under this Project's Outcome.
- [Knowledge acquisition](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/knowledge-acquisition.md) - named in FOCUS only; nothing in the dump is for it. Its thread holds eight unanswered queries since 15 October.

**[Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md)**

- [Tools burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md) - burn tools-ki, tools-mgit, tools-git-almanac and the CLI-shaped harness records to zero, ending in releases. Live thread KI > Foundations > tools burndown.
  - **mgit output** - MGIT-OUTPUT: progress bar, changed-only results, sync that aborts on a rebase or merge warning, code behind it as git-almanac has.
  - **mgit escape hatch** - MGIT-ESCAPE: `--bare` to run the plain Git subcommand in each child past an mgit override, `--raw` for any shell command, clear of the physical and follow-symlinks options and of the existing `-B`.
  - Acceptance backlog - AWAITING-REVIEW: the awaiting-review and done records across the territory that only Kris can close.
  - `ki agent` CLI naming - the CLI half of KI-AGENTS-NAME, only if the word changes.

**[Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md)**

- [Host network](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/host-network.md) - how hosts and services are named and addressed on the tailnet. Planned Project, no thread.
  - Service names over the tailnet - LOCAL-DNS: `observatory.<something>` instead of `127.0.0.1:1675` on every host, internal only, and whether `midnight.ninja` is the identity domain. Already the Project's first listed idea ("name URLs rather than IP and port").
- [chezmoi](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/chezmoi.md) - the chezmoi source and its KB-DOTFILES-UE records. Thread Rig: chezmoi, carried by Chezmoi > misc (sol).
  - **Default openers** - TOML-OPENER: `.toml` opens in Zed, not Warp; a declared macOS default handler.
  - Catalogue rendering - the chezmoi half of RIG-CATALOGUE: how a per-tool config template reaches the host through chezmoi, and versioning or `latest`.
- [Mac Studio setup](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) - `sol` back to full capability. Thread Rig: mac-studio-setup.
  - Rig differences between `terra` and `sol` - the "differences between the two rigs" point in FOCUS. The thread's rig-diff run and its Rig notes R2 and R4 in the Project note are the existing material.
- **tools-rig burndown (new, no Project)** - tools-rig's roadmap has thirteen records and no owning Project, since Tools burndown excludes it and the Rig threads own it only by name. RIG-OWNER.
  - **Software catalogue with storage declarations** - RIG-CATALOGUE: each catalogue entry declares its config, state and cache locations, platform variations and a config template, merged progressively from Rig's defaults. tools-rig's [ADR-KI-TOOL-RIG-002](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/ADR-KI-TOOL-RIG-002-xdg-directory-contract.md) already fixes the XDG contract and the Observatory's [KI-OBSERVA-VIS-021](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/roadmap/KI-OBSERVA-VIS-021-explain-tool-storage.md) is its read side.
- **Cloud Mac (new, long term)** - MAC-CLOUD: a Mac in the cloud that Kris installs onto and uses as a terminal. Rig-focused, with a Techne [Agent host](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/agent-host/agent-host.md) and Programme Hold boundary to settle before any work.

**State of play itself** - the master thread's own rules, not a Project: ROUTING (master as routing point and coordinator of coordinators), RESTART-PROMPTS for itself, DISPATCH-ORDER, CAPTURE-ONLY, FOCUS and FABLE-CONSOLIDATE (this run).

**Outside the territory** - FAVICONS for rig.midnight.ninja and tower.midnight.ninja and the LOCAL-DNS question of `midnight.ninja` as the personal identity domain belong to the personal territory (apps-rig.midnight.ninja, apps-tower.midnight.ninja and personal-principal). This master has no write authority there.

### 2. Routing table

Checkpoints are in `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/`. Kind: query (Kris must decide), idea (capture, no work), ready (work can start once dispatched).

| Item | Receiving thread · checkpoint | Existing record or evidence | Kind |
| --- | --- | --- | --- |
| THREAD-MESSAGING | KI > Model > ways of working · [knowledge-islands-model.ways-of-working.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md) | None for messaging. Adjacent: [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) and [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) (run events), [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) (live threads) | ready, as a `ki-pmo` rule first |
| THREAD-DURABILITY | KI > Model > ways of working · same checkpoint | Open STATE-AGREE query and [state-homes report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/state-homes.report.md); [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md), [KI-HARNESS-GOV-196](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-196-scratch-output-in-temp.md), [KI-HARNESS-GOV-200](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-200-thread-folder-closed-list.md), [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md) | query: Kris answers STATE-AGREE |
| THREADS-CHECKINS | KI > Model > ways of working · same checkpoint (dispatched 16 October) | Same as THREAD-DURABILITY; the "excessive check-ins" half is the churn the state-homes report measures | folds into STATE-AGREE |
| CHURN-REMEDIES | KI > Model > ways of working · same checkpoint (dispatched 16 October, approved) | Remedies 3 and 5 landed; 1, 2 and 4 are folded into STATE-AGREE's option a) | ready, inside STATE-AGREE |
| RESTART-PROMPTS | KI > Model > ways of working · same checkpoint; this thread and tools burndown receive the result | None. The hold and resume lines in `ki-pmo` and [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) are the nearest | ready |
| ROUTING | This thread · [_state-of-play.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/_state-of-play.md); the rule itself to KI > Model > ways of working | The checkpoint's Objective already says it; `ki-pmo` does not yet | ready, a one-line rule |
| GIT-SURFACE | KI > Model > ways of working · same checkpoint; home in [Engineering Practice](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Pillars/Engineering Practice/Engineering Practice.md>) through Enactment | None. [KI-HARNESS-GOV-203](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-203-git-clean-down-criteria.md) and [KI-TOOL-KI-CLI-140](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-140-git-hygiene-estate-audit.md) touch the surface | idea |
| DIAGRAMS | KI > Model > ways of working · same checkpoint, for `ki-pmo-design` and `ki-diagrams`; theme-diagrams run already queued behind this one | None | ready |
| KI-AGENTS-NAME | KI > Model > ways of working · same checkpoint (standard); KI > Foundations > tools burndown · [platform-foundations.tools-burndown.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/platform-foundations.tools-burndown.md) only if renamed | None | query |
| MGIT-OUTPUT | KI > Foundations > tools burndown · same checkpoint | None in tools-mgit; only [KI-TOOL-MGIT-CLI-017](/Users/krisbrown/workspaces/knowledge-islands/tools-mgit/docs/roadmap/KI-TOOL-MGIT-CLI-017-unified-external-members.md) is open, awaiting review | ready (Kris asked, so the burn rule allows it) |
| MGIT-ESCAPE | KI > Foundations > tools burndown · same checkpoint | None; `-B` exists today | ready |
| AWAITING-REVIEW | Kris, through KI > Foundations > tools burndown for tools-ki and tools-mgit; the owning threads for the rest | Sixteen awaiting-review and two done records, listed in the query below | query |
| RIG-OWNER | Kris; no live thread. Belongs to the Rig Initiative | Thirteen tools-rig records, [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) awaiting review | query |
| TOML-OPENER | Rig: chezmoi (Chezmoi > misc (sol)) · [rig.chezmoi.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.chezmoi.md) | None. Nearest: the macOS settings file in Rig's `conf.d` and [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) | ready, small |
| RIG-CATALOGUE | No live thread until RIG-OWNER; chezmoi half to Rig: chezmoi · [rig.chezmoi.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.chezmoi.md) | [ADR-KI-TOOL-RIG-002](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/ADR-KI-TOOL-RIG-002-xdg-directory-contract.md), [KI-OBSERVA-VIS-021](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/roadmap/KI-OBSERVA-VIS-021-explain-tool-storage.md) (triage), [KB-DOTFILES-UE-027](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-027-honest-rationales-per-tool.md) (per-tool fields) | idea until RIG-OWNER |
| MAC-CLOUD | No live thread; Rig Initiative Notes | None | idea, long term |
| LOCAL-DNS | No live thread; [Host network](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/host-network.md) Project (observatory names); personal territory (identity domain) | Host network Notes already carry the idea; [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) is the connection-critical pattern | query: whether to open the thread now |
| FAVICONS (Observatory, Headroom) | Observatory: product · [knowledge-islands-model.observatory.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.observatory.md), for the restart; nothing new to build | Done on `origin/main` of apps-observatory.local; open OBS-RESTART and HEADROOM-ICON in the [favicons report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-setup/favicons.report.md) | query: answer OBS-RESTART and HEADROOM-ICON |
| FAVICONS (rig and tower sites) | Personal territory; no Knowledge Islands thread | None in [apps-rig.midnight.ninja](/Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja/docs/roadmap) or [apps-tower.midnight.ninja](/Users/krisbrown/workspaces/personal/apps-tower.midnight.ninja/docs/roadmap) | idea, Kris carries it across |
| FOCUS | This thread · [_state-of-play.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/_state-of-play.md) | The checkpoint's Active threads line is the previous focus list | ready: rewrite the focus line |
| CAPTURE-ONLY, DISPATCH-ORDER, FABLE-CONSOLIDATE | This thread · same checkpoint | This report and the theme-diagrams run | done by this run |

### 3. Opinion

**Five of the items are one concern, and it is already answered.** THREAD-MESSAGING, THREAD-DURABILITY, THREADS-CHECKINS, CHURN-REMEDIES and the temp versus XDG point are all the question "what is durable, what is state, what is scratch, and how do threads tell each other". The state-homes report answers the durability half in full and waits on Kris's STATE-AGREE. The messaging half is small on top of it: the Messages block already exists in every checkpoint; the missing rule is that a thread re-reads its own previous checkpoint and every Messages line addressed to it at each Summary and at bootstrap, and that any coordination thread may write a line to any other. RESTART-PROMPTS is the same rule seen from the restart side. Merge all five into STATE-AGREE plus one messaging rule, and close THREADS-CHECKINS by name.

**RIG-CATALOGUE is the Rig side of a concern the estate has met twice.** The Observatory's tool-storage record and chezmoi's per-tool rationale record both want each tool to say where its config, state and cache live. tools-rig already owns the XDG contract. The catalogue is the natural home and the Observatory the natural reader. It cannot move until RIG-OWNER is answered, because nobody owns tools-rig's roadmap.

**LOCAL-DNS, FAVICONS and the single pane of glass are one front door.** Command centre's Outcome is already "the Observatory on each host". A name instead of a port, an icon on the tab and one view instead of many are three faces of making that front door usable. The icon is done bar a restart. The name is a Host network decision and every change there is connection-critical. The single pane is Command centre's next step once ways-of-working lands. Keep the three in two Projects (Host network for the name, Command centre for the rest) but sequence them together.

**MGIT-OUTPUT and MGIT-ESCAPE are the feature bounty Kris named.** They are the only genuinely new tool features in the dump. The Tools burndown rule allows "items Kris asks for", so no rule changes; the mgit release then follows MGIT-RELEASE. The "code behind it like git-almanac" idea is a design question for the thread, not for now.

**Suggested priority, following Kris's focus list and DISPATCH-ORDER.**

1. State of play dispatches every line in the routing table and the theme-diagrams run draws it. Kris answers the queries below.
2. Ways of working takes STATE-AGREE with the messaging and restart-prompt rules, decides the critical set, and reports "ready" to Kris and to this thread.
3. Tools burndown: the tools-ki push and the acceptance backlog first, then the mgit bounty.
4. Mac Studio setup and Rig: chezmoi in parallel: `sol` queries, FW-DECLARE then SEAT-HOSTS, TOML-OPENER, and the rig-differences lane.
5. RIG-OWNER answered, then RIG-CATALOGUE as the first tools-rig idea.
6. Host network opens for LOCAL-DNS, with a tested restore path.
7. Command centre for the single pane, once ways-of-working's outcome lands.
8. MAC-CLOUD stays an idea.

**Missing or contradictory.**

- Part 2 of the dump appears twice in the decisions log, under "final now" and "final for now"; the first copy lacks FABLE-CONSOLIDATE. The file is uncommitted in the working tree from the thread's own session, so this run left it alone.
- AWAITING-REVIEW and RIG-OWNER are named in the pick-up block but their Context is written nowhere in the repository; it lived only in the thread's last Summary. They are restated in full below.
- FOCUS names knowledge acquisition, but the dump has nothing for it and its thread has eight queries unanswered since 15 October. The restart order below places it; Kris may prefer to leave it parked.
- LOCAL-DNS says "sooner rather than later" while Host network is a planned Project with no thread and a connection-critical rule on every change. One cannot be true without the other giving way.
- Tools burndown excludes tools-rig, yet tools-rig holds the territory's largest open roadmap after tools-ki. RIG-OWNER has been open since 16 October.
- The Observatory: product thread has no Project note, while Command centre's Outcome is the Observatory on each host. Two threads with one Outcome will collide when the single pane starts; ways-of-working's SHAPE-AGREE migration is the moment to fold one into the other.
- The awaiting-review count has grown from eleven on 16 October to sixteen today, four of them harness records that no burndown lane names.

### 4. Restart order

Matching DISPATCH-ORDER: nothing restarts until this thread has dispatched.

1. **Master: state-of-play** ([_state-of-play.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/_state-of-play.md)) - first step: write one Messages line per routed item into the receiving checkpoints, the Rig and Host network ideas into their notes, rewrite its own focus line, then let the theme-diagrams run draw it.
2. **KI > Model > ways of working** ([knowledge-islands-model.ways-of-working.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md)) - first step: re-bootstrap, act on its Messages block, put STATE-AGREE with the messaging and restart-prompt rules to Kris as one decision, then tell Kris and this thread when the other threads may start.
3. **KI > Foundations > tools burndown** ([platform-foundations.tools-burndown.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/platform-foundations.tools-burndown.md)) - first step: the tools-ki replay and push under PUSH-REBASE-CODE and TOOLS-PUSH, then the acceptance backlog with Kris, then MGIT-OUTPUT and MGIT-ESCAPE as the bounty.
4. **Rig: mac-studio-setup** ([rig.mac-studio-setup.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.mac-studio-setup.md)) and **Rig: chezmoi** ([rig.chezmoi.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.chezmoi.md)), in parallel - first steps: the `sol` queries SOL-APPLY, SOL-CLT and TERRA-READ to Kris; FW-DECLARE as a source commit, then SEAT-HOSTS with SEAT-CHANGE, then TOML-OPENER.
5. **KI > Model > knowledge acquisition** ([knowledge-islands-model.knowledge-acquisition.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.knowledge-acquisition.md)) - first step: Kris's answers to its eight queries, starting with AUDIT-GATE on [KI-PRINCIPAL-MOD-006](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-006-knowledge-acquisition-lifecycle.md).
6. **Host network** (no checkpoint; Project [host-network.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/host-network.md)) - opens only on HOST-NETWORK-THREAD below; first step: a decision paper on service names over the tailnet with its restore path.
7. **KI Model: command-centre** ([knowledge-islands-model.command-centre.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.command-centre.md)) - after ways-of-working reports ready; first step: its own Next step, the cheapest pilot of the single pane as an Observatory Instrument.
8. **Observatory: product** ([knowledge-islands-model.observatory.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.observatory.md)) - stays at rest; the restart of the service for the icon is an interactive step on `sol`.

## In Progress

Nothing is running from this run. The theme-diagrams run is held in the state-of-play queue until this report lands, and draws from it.

Outstanding - no action requested now:

- The duplicate part 2 entry in the [state-of-play decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/decisions.md) is the thread's own uncommitted edit to tidy at its next commit.
- `+/_THREADS/desk-kit/setup-note.report.md` is untracked and belongs to another session; already named in the checkpoint's THREADS-ORPHANS line.

## Queries

### RIG-OWNER - who burns down tools-rig

**Context:** tools-rig holds thirteen open records, [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) awaiting review among them, and RIG-CATALOGUE would be its next idea. Tools burndown excludes tools-rig by Kris's TOOLS-PROJECT decision of 16 October, and the Rig threads own it only by name. Without an owner nothing from the dump can reach it.

**Query:** Which thread owns the tools-rig roadmap?

**Options:** a) (recommended) Rig: mac-studio-setup takes tools-rig as its burndown lane once its `sol` queries are answered, under the Rig Initiative, and RIG-CATALOGUE goes to it as an idea. b) Widen Tools burndown to include tools-rig, amending its Scope. c) Open a new Rig: tools-rig coordination thread with its own checkpoint.

### AWAITING-REVIEW - the acceptance backlog only Kris can close

**Context:** Sixteen records are awaiting review and two are done but not pruned. tools-ki: [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md), [KI-TOOL-KI-CLI-130](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-130-skill-generated-surfaces.md), [KI-TOOL-KI-CLI-133](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md), [KI-TOOL-KI-CLI-141](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-141-granola-screenshots-markers.md). tools-mgit: [KI-TOOL-MGIT-CLI-017](/Users/krisbrown/workspaces/knowledge-islands/tools-mgit/docs/roadmap/KI-TOOL-MGIT-CLI-017-unified-external-members.md). tools-rig: [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md). ki-agentic-harness: [KI-HARNESS-GOV-195](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-195-granola-screenshots-markers.md), [KI-HARNESS-GOV-198](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-198-reply-forms.md), [KI-HARNESS-GOV-203](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-203-git-clean-down-criteria.md), [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md). ki-principal: [KI-PRINCIPAL-MOD-006](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-006-knowledge-acquisition-lifecycle.md). Personal territory: [KB-MIDNIGHT-RIG-SITE-001](/Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja/docs/roadmap/KB-MIDNIGHT-RIG-SITE-001-show-hosts-per-tool.md), [KB-MIDNIGHT-TOWER-SITE-003](/Users/krisbrown/workspaces/personal/apps-tower.midnight.ninja/docs/roadmap/KB-MIDNIGHT-TOWER-SITE-003-update-lab-progression-evidence.md), [KB-MIDNIGHT-TOWER-SITE-004](/Users/krisbrown/workspaces/personal/apps-tower.midnight.ninja/docs/roadmap/KB-MIDNIGHT-TOWER-SITE-004-complete-module-content.md), [KB-MIDNIGHT-TOWER-SITE-005](/Users/krisbrown/workspaces/personal/apps-tower.midnight.ninja/docs/roadmap/KB-MIDNIGHT-TOWER-SITE-005-refine-lab-roles-and-module-cards.md), [KB-MIDNIGHT-TOWER-SITE-006](/Users/krisbrown/workspaces/personal/apps-tower.midnight.ninja/docs/roadmap/KB-MIDNIGHT-TOWER-SITE-006-correct-refresh-curation.md). Done, awaiting prune: [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md) and [KI-TOOL-RIG-CORE-059](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md). Acceptance needs Kris's word through `ki-accept`; the tools-ki four also wait on the tools-ki push.

**Query:** How does Kris want to clear the backlog?

**Options:** a) (recommended) One review sitting per repository group: the tools burndown thread presents the tools-ki and tools-mgit records for `ki-accept` after the push; ways-of-working presents the harness records; knowledge acquisition presents MOD-006; the personal records wait for the personal master thread; the two done records are pruned by their owning threads. b) Accept everything in one pass now from this thread, each record read in turn. c) Leave the backlog until each owning thread restarts and raises its own records.

### HOST-NETWORK-THREAD - when LOCAL-DNS gets a thread

**Context:** Kris wants `observatory.<name>` on every host over the tailnet "sooner rather than later". [Host network](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/host-network.md) is a planned Project with no thread, and every change there is connection-critical and needs a tested restore path. DISPATCH-ORDER puts ways of working and tools burndown first.

**Query:** When does Host network get its thread?

**Options:** a) (recommended) Capture LOCAL-DNS now as the Project's first decision item in its Notes, and open the thread at position 6 of the restart order, after tools burndown and the Rig threads, with a decision paper and restore path as its first step. b) Open the Host network thread now, in parallel with ways of working. c) Give LOCAL-DNS to Rig: mac-studio-setup as a `sol`-first step and open Host network later.

### KI-AGENTS-NAME - agents or workers

**Context:** Kris asked whether `ki agent` runs should be "KI workers" rather than agents, and leaned towards keeping agents because "it doesn't always have to be AI". A rename touches the `ki agent` command, the `ki-delegation` standard, the state folder paths and every brief and report, during the tools burndown.

**Query:** Does the word stay as agents?

**Options:** a) (recommended) Keep "agents"; ways-of-working records the decision in its decisions log and nothing is renamed. b) Rename to "workers" after the tools burndown, as a record in tools-ki paired with a `ki-delegation` change.

### FAVICON-FOLLOWUPS - the two open favicon queries

**Context:** The Observatory icon is committed and on `origin/main` in apps-observatory.local but the running service on `sol` has not been restarted, so the tab still shows no icon; the mac-studio-setup thread's [favicons report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-setup/favicons.report.md) left OBS-RESTART and HEADROOM-ICON open on 15 October. Headroom deliberately serves no icon and a local patch would be lost on upgrade and touch a connection-critical service. The rig and tower site icons are personal territory.

**Query:** What happens to the three favicon strands?

**Options:** a) (recommended) Kris restarts the Observatory service in an interactive session on `sol` and checks the tab; the Headroom feature request is filed by Kris upstream with the concept icon from the report; the rig and tower icons are carried by Kris to the personal master thread as one line. b) Leave Headroom and the personal sites, restart the Observatory only.

```text
RIG-OWNER

Rig: mac-studio-setup takes tools-rig as its burndown lane once its sol queries (SOL-APPLY, SOL-CLT, TERRA-READ) are answered, under the Rig Initiative; RIG-CATALOGUE goes to it as an idea, with ADR-KI-TOOL-RIG-002 and KI-OBSERVA-VIS-021 as its existing material.

---

AWAITING-REVIEW

Clear the backlog one repository group at a time: tools burndown presents the tools-ki four (KI-TOOL-KI-CLI-126, -130, -133, -141) and KI-TOOL-MGIT-CLI-017 for ki-accept after the tools-ki push; ways-of-working presents KI-HARNESS-GOV-195, -198, -203 and KI-HARNESS-OPS-005; knowledge acquisition presents KI-PRINCIPAL-MOD-006; the five personal records wait for the personal master thread; the owning threads prune KI-PRINCIPAL-ECO-014 and KI-TOOL-RIG-CORE-059.

---

HOST-NETWORK-THREAD

Capture LOCAL-DNS now as the first decision item in the Host network Project note's Notes, and open the Host network thread at position 6 of the restart order, after tools burndown and the Rig threads, with a decision paper on tailnet service names and a tested restore path as its first step.

---

KI-AGENTS-NAME

Keep "agents"; ways-of-working logs the decision in its decisions log and nothing is renamed.

---

FAVICON-FOLLOWUPS

Kris restarts the Observatory service in an interactive session on sol and checks the tab shows the dome; Kris files the Headroom feature request upstream with the concept icon from the favicons report; Kris carries the rig.midnight.ninja and tower.midnight.ninja icon wishes to the personal master thread as one line.
```

```text
╭─ run report · 2026-10-17T12:36:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued from this run; theme-diagrams held in the thread's queue until this report lands
- [waiting] RIG-OWNER
- [waiting] AWAITING-REVIEW
- [waiting] HOST-NETWORK-THREAD
- [waiting] KI-AGENTS-NAME
- [waiting] FAVICON-FOLLOWUPS
- [committed] this report, by explicit path
