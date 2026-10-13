# Change management: review by Astra

**Reviewer:** Astra, ChatGPT/Codex runtime. **Date:** 2026-10-13. **Read-only:** yes, except this review and the expressly requested runtime status and report files.

## Own view

The strongest change is to give coordination one owner, `ki-pmo`, while keeping work authority in each repository. The brief is right to retain generic checkpoints and independent shaping. It is less convincing when it turns those boundaries into additional stored fields, overlapping command routes or another goal layer. Simplification should reduce the number of facts a person must keep consistent, not merely move paragraphs between skills.

I recommend six units of comprehension: Work, Coordination, Recovery, Delegation, Shaping and Model policy. Portfolio belongs inside Coordination; a session recap is an operation associated with Recovery, not another persistent management unit. Keep the existing local record model across both repository shapes. Keep Initiative direction, Project outcome and record goal, with no compulsory fourth layer of aims. Default a genuinely mechanical coordinator to `fast` at low effort, with an evidenced `standard` fallback and higher-reasoning workers for judgement, including consolidation.

The first pilot should prove that a fresh session on another machine can recover scope, live authority, outstanding Needs and the next action from repository evidence alone. A mark containing a machine-local decision number does not establish that property. Neither a checkpoint nor a process that has written `DONE` proves that a Project is active, that a deliverable succeeded or that its acceptance was authorised.

This view was formed without reading the other review. The quoted master-thread decisions were checked only against the two cited repository checkpoints; the master run's local log was not read. Decisions 1 to 9 in the authorised ways-of-working log were read. The proposed structure below is a recommendation for the owner, not an adoption or implementation grant.

## Fact check

### F1 - Roadmap adapter and shared record standard are different

Reflection 11 makes a material category error. The `roadmap` adapter is restricted to project repositories, but `ki-work-roadmap` already owns the shared record model used by Knowledge Bases. Its repository-roadmap standard explicitly permits a KB to declare the skill alongside Streams for issuing areas, components and shared record configuration. Principal does so today. Streams describes itself as owning the container and routing. Decision 5 therefore does not need to be reinterpreted as merely adopting `ki-work`, and merging the shared record semantics is not new work. What remains worth simplifying is the implementation and presentation of the container boundary. See [roadmap scope][roadmap], [Streams ownership][streams] and Principal's [configuration][principal-config].

### F2 - The Work unit has unresolved inconsistencies

The brief's statement that Work is already sound needs qualification. Streams still exposes PROPOSE, ITERATE, READY and ROLLOUT alongside the lifecycle process skills, although its description routes those actions away. Its Working rules also make readiness depend on a prerequisite being done. The work-item format instead defines dependencies as missing build prerequisites, discharged when the required thing exists. The repository-roadmap standard explains that the lifecycle gate is avoided by removing a dependency once its build prerequisite exists. This is a reconciliation problem, not evidence for retaining several procedures with different wording. See [Streams operating modes and Working rules][streams] and [dependency semantics][item].

GitHub Issues and Linear are configuration-only adapters with no process executor. Listing four adapters must not imply that all four support the delivery lifecycle today. Their own skill contracts and the preflights in `ki-plan` and `ki-next` state the stop. See [GitHub adapter][github-adapter] and [Linear adapter][linear-adapter].

### F3 - The model and effort change is already present locally

At review time, the invoked executable reports version 0.10.1 and exposes both options on launch and queue. The tools-ki checkout contains the completed change at `4a4f9707b47142e1a73a160d6f39cf5b91a404b3`. Update the brief's in-progress wording to distinguish the locally available command from a newly published release; the version number alone cannot establish which source is being executed. No release was verified or requested. The source forwards the model verbatim and leaves omitted model and effort to runtime defaults. It does not implement purpose resolution. See [agent grammar][agent-command] and [runtime adapters][runtimes].

### F4 - Several drift claims need updating or qualifying

- The ways-of-working checkpoint now links the folder-form Project note correctly. Its `updated_at` is 2026-10-13T03:20:00Z. Treat the old path as a resolved observation, not a current defect. See [[knowledge-islands-model.ways-of-working]].
- The master checkpoint still supplies a label-based opener, conflicting with Project-name resolution. The proposed shortened label remains inconsistent with the current title-based label convention. Those are confirmed issues. See [[_state-of-play]] and [checkpoint identity and label rules][checkpoint].
- The local three-Project cap and the standard's three-or-four wording differ. The master's stored active list also contains eight entries. That establishes a contradictory inventory, not eight verified live sessions: this review did not inspect runtime state. Define what counts towards the cap before enforcing it.
- The Initiative note contains downward Project links despite the registry standard forbidding such membership lists. Any migration needs to reconcile current examples as well as the standard. See [[knowledge-islands-model/knowledge-islands-model|Knowledge Islands model]] and [registry links][registry].

### F5 - Checkpoint fields and registry consumers are overstated

The checkpoint contract allows six field names, but `label` is recommended rather than mandatory; five fields are required. There is no opener or mark field. The exact heading sequence and the prose mark convention are confirmed. The checkpoint standard also still calls Project and Initiative notes a durable home of status in its prohibited-payloads section, while its skill body and the registry standard prohibit status sections and permit only their lifecycle metadata. Resolve this wording rather than choosing one sentence silently. See [checkpoint form and prohibited payloads][checkpoint] and [checkpoint skill][checkpoint-skill].

Only the Capital owns the registry instance, but coordinating threads are not its only consumers or legitimate maintainers. Work-item validation and grouping consume it; Project leads own close-out decisions; registry entries exist without live threads. Moving its schema into PMO is sensible, but must not make registry validity depend on starting a coordinator. See [registry scope, close-out and validation][registry] and [CLI registry reader][registry-code].

### F6 - The two open commands have different behaviour

The brief correctly identifies overlap, but a direct substitution would change behaviour. Repository open includes declared external stores by default for Zed and VS Code; territory open supplies canonical roots and explicitly preserves territorial projection order and the owner root. A single replacement needs to preserve those properties through one selection and opening contract. Registry list is also not a third equivalent selector: its implementation rejects repository selectors despite the parent command advertising them. See [repository open][repo-open], [territory commands][territory-command] and [registry list][registry-list].

The assertion that the CLI has no Project view is too absolute. Grouped roadmap output already resolves Project and Initiative membership and displays Project lifecycle. It does not list Projects with no selected records, so it is not a complete portfolio view. See [roadmap rendering][roadmap-command] and [registry reader][registry-code].

### F7 - Model-purpose bindings are not an executable cross-runtime mapping

The current `model_tier_bindings` contract is a table of purpose keys to opaque, non-empty strings. It has no runtime dimension, effort field, precedence rule or capability validation. The tokenomics skill explicitly limits its own role to policy and reporting. Reflection 23 needs a new binding contract before `--purpose` can resolve reliably for Claude and Codex. See [tokenomics configuration][tokenomics] and [runtime adapters][runtimes].

The existing portable recommendation is `fast`, falling back to `standard` when needed, at low effort. Decisions 3 and 8 support testing a lean coordinator; they do not establish a particular model's reliability or a cost advantage. Reflection 24 is an alternative policy judgement, not a finding proved by the cited sources.

### F8 - Folder retention has a real standards conflict

The registry Location section ties folder-form notes to an in-progress design. The design-loop Artefact home section explicitly leaves the folder note in place after deleting the design folder. The brief states the former restriction without mentioning the latter instruction. Recommend permitting either registry-note form permanently, while continuing to reject duplicate slug definitions; moving the note twice adds no value. See [registry Location][registry] and [design artefact home][design-standard].

### F9 - Runtime completion and authority need explicit treatment

The delegation standard's five-file run packet is no longer an exhaustive description: the launcher also writes launch metadata, and queueing has its own stored request. More consequentially, a wait gate opens on `DONE`; it does not inspect the report, verification or acceptance. A failed task can legitimately finish its reporting protocol. A dependent worker must validate the required output before proceeding. See [run contract][background] and [launcher state and gates][runs].

The lowest authority footer permits local commits; it is not a read-only tier. The delegation standard also contains an unconditional pre-commit pull rule that conflicts with that footer's prohibition on remote calls. Isolation guidance needs the roadmap's designated writing-checkout exception. These are concrete reasons to include authority precedence and write ownership in the redesign rather than transplanting the current text unchanged. See [lowest authority footer][footer], [coordination rules][background] and [roadmap write locus][roadmap].

One small implementation defect was reproduced by a read-only string predicate: footer extraction searches for the first occurrence of the Rules heading text, which occurs inside the footer's introductory sentence before the real heading. This accounts for the stray introductory fragment in the supplied task. It is a bounded launcher correction, not a reason for a new management abstraction. See [footer source][footer] and `footer()` in [launcher implementation][runs].

### F10 - Other principal claims are supported, within their stated evidence

The thirteen-skill inventory, process ownership boundaries, applicability metadata, recurring-work distinction, Pulse dispositions, recap hand-off, immutable Project slugs, upward classification, finite Project close-out, non-completing Initiatives and five-stage independent design process are supported by their cited files. Work-record Project classification is optional, however; an Initiative is used directly for projectless work where that classification is supplied. It is not a universal requirement that every record carry one of those fields. See [record classification][item].

The Capital-alias change is present in tools-ki history at `e04e5191b382812fba116dc4ae988570254242b4`; the eight aliases are recorded in [[Known Lands]]. The command-centre note supports the reported crosswalk ideas and proposed Instrument. It labels the Item comparison as an idea. The brief does not establish equivalence with legal-principal's model, which was outside this review's authorised source set. The approximate rename count is attributed to a prior perspective in [[ways-of-working/ways-of-working|Ways of working]], not independently proven here by reading that review.

## Points

Agree endorses the direction; Add retains it with a necessary qualification; Differ proposes a materially different choice. Evidence references lead to the fact checks or source contracts above.

| Point | Mark | Reason and evidence |
| --- | --- | --- |
| 1 | Add | Keep Work, but reconcile Streams procedures and unsupported remote execution first; F1-F2. |
| 2 | Add | Put registry governance in PMO, independently of active threads and without granting authority; F5. |
| 3 | Add | PMO owns coordination, with a Capital-only master and explicit checkpoint write ownership; U2. |
| 4 | Differ | Delegation governs the caller and worker, not only what the launched worker needs; [run contract][background]. |
| 5 | Differ | Keep generic checkpoints; do not store generated opener text or an unqualified decision cursor; F5, U3. |
| 6 | Add | Keep a standalone process; allow re-shaping when an unresolved design emerges after capture; U5. |
| 7 | Agree | Keep session recap and call the cross-session operation a roll-up; [recap boundary][recap]. |
| 8 | Differ | Purpose policy is not executable model resolution; keep that boundary explicit; F7, U6. |
| 9 | Add | Move Pulse to acquire; recurring-work governance remains part of Work, omitted from this list; U1. |
| 10 | Agree | Rename recurring-work governance to ki-work-recurring; its contract already distinguishes cleanup; U1. |
| 11 | Differ | KBs can already declare the shared roadmap skill; adapter restrictions do not prohibit that; F1. |
| 12 | Differ | Process, mechanics and declared scaffold are intentional layers; retain a governance scaffold owner; F2, U1. |
| 13 | Add | Prefer ki-shape, but define it by unresolved choices rather than absence of any record; U5. |
| 14 | Differ | Agent is broader than detached worker; the source distinguishes in-session subagents; [scope][background]. |
| 15 | Differ | A decision number without log identity or durable evidence is not a portable mark; F9, U3. |
| 16 | Differ | Generate openers from validated identity and current rules; stored executable prose can drift; F4-F5, U3. |
| 17 | Add | Keep direction, outcome and goal; state their evidence and closure owners together; Goal hierarchy. |
| 18 | Differ | Mandatory aims add a fourth changing layer and exclude projectless upkeep; [Initiative contract][registry]. |
| 19 | Agree | One Project per Project thread; ongoing Initiative work can remain with the master without fake Projects. |
| 20 | Add | Consolidate listing and opening only after preserving their different semantics; F6, Command surface. |
| 21 | Differ | Keep territory and use -t for selection; a second noun adds migration cost; [host contract][host-standard]. |
| 22 | Differ | Add missing views, not duplicate roadmap aliases; include empty groups and unknown evidence; F6, U3. |
| 23 | Differ | Model and effort exist; purpose resolution needs a new runtime-aware binding contract first; F3, F7. |
| 24 | Differ | Retain fast/low as the trial default with standard fallback; no comparative evidence settles more; F7. |
| 25 | Add | Escalate report synthesis and disputed evidence as well as initial decisions; [review contract][design-standard]. |
| 26 | Agree | Deliver KI definitions to command centre, which owns the crosswalk and view; Decision 5 and its Project note. |
| 27 | Differ | Treat Needs-to-Item correspondence as an unverified crosswalk, not an established identity; F10. |
| 28 | Differ | New fields and revised ownership change behaviour; pilot recovery and authority, not just extraction; F8-F9. |

For point 12, the command is not a batch executor: its run operation records caller-supplied progress and its close operation records caller-proven completion. `ki-batch` still coordinates lifecycle work. Removing `ki-work`'s scaffold ownership without a replacement leaves a declared capability with no governance owner; converting the process skill into one simply to reduce a list of names is not simpler. Document the layers together and retain the existing scaffold owner. See [adapter scaffold][adapters] and [batch command][batch-command].

For point 21, retaining the current noun is a design recommendation, not an empirical finding. `land` is short but conflates a governed territory with the wider signposting meaning of Known Lands. `terr` is a recognisable abbreviation but introduces another spelling. The host contract requires explicit authority for compatibility aliases. If Kris values shorter spelling more highly, choose `terr` as an explicitly approved canonical command rename, with a separately bounded transition; do not quietly retain two indefinitely.

## Proposed structure

### U1 - Work

**Question:** What change is owned here, and what may happen to it next?

Keep `ki-work` for adapter selection and abstract vocabulary; `ki-work-roadmap` for the shared local record model; and `ki-repo-kb-streams` for placement, zone routing, Enactment and KB audit integration. A KB does not acquire a second roadmap tree. Keep `ki-next`, `ki-plan`, `ki-implement`, `ki-accept` and `ki-batch` as the lifecycle entry points. Remove the duplicative Streams process entry points once callers have moved to those owners. Remote adapters remain visibly unavailable for process execution until independently implemented.

Keep recurring definitions here, renamed `ki-work-recurring`; Activity notes remain owned by `ki-repo-kb-activities`. Recurrence creates finite runs, never another lifecycle. Retain `ki-work`'s batch scaffold and explicitly describe the batch process, record and CLI mechanics as three layers of one concern. Keep Pulse separate in `acquire`, with its existing hand-offs to knowledge, radar and Work owners.

**Boundary and hand-offs:** Work receives proposed outcomes from Coordination or Shaping, retains each repository's selection and acceptance authority, and publishes record evidence for projections. Delegation executes only the granted portion. A successful worker report returns to the governing lifecycle; it does not advance it by itself.

### U2 - Coordination

**Question:** What is Kris trying to achieve across this scope, and what needs attention now?

Create `ki-pmo` in change-management. It owns the Initiative and Project registry schema, goals vocabulary, master and Project thread roles, the active-thread cap and queue, Needs, directions, roll-ups, and opening or resting a thread. Use progressive disclosure: registry guidance need not load the full live-thread procedure. Every principal KB adopts it, as Decision 5 requires; only a declared Capital holds its territory's registry and master. A non-Capital principal must not acquire a competing registry by adopting the skill.

A master owns coordination across Projects; a Project thread owns coordination within one finite Project. An Initiative can have projectless upkeep, handled through the master and ordinary delegated work without inventing an endless Project. The current local cap is three active Project threads plus the master. Treat this as owner policy, not proof of three live processes. Define active as a coordination allocation, not checkpoint existence or PID presence.

Give each checkpoint one designated writer. A master may seed an unopened Project checkpoint; once opened, its Project coordinator owns updates. Directions from the master need a serialised hand-off and a stale-read check, not simultaneous edits to the same snapshot. The existing instruction to write into each active Project checkpoint needs this missing concurrency contract. Roadmap writes likewise remain serialised through their designated checkout even when implementation is isolated.

**Boundary and hand-offs:** PMO proposes priority and records Kris's choices, but neither territorial membership nor a Project tag grants peer write or acceptance authority. It uses Work for records, Delegation for launches, Recovery for snapshots and Model policy for role recommendations. Command centre consumes its definitions and projections; it does not become another owner of Needs or membership.

### U3 - Recovery

**Question:** Can a fresh session reconstruct the work without the old conversation or machine?

Retain `ki-checkpoint` under its current name and keep it usable without PMO. It owns identity, validation, update, resume and removal. Retain `ki-recap` as the live-session synthesis and optional checkpoint evidence supplier. PMO owns roll-up behaviour and the meaning of a mark. These are related operations, not interchangeable records.

Do not store opener prose as independent authority. Generate a short opener from a validated Capital or repository identity, exact thread or Project identity and the current bootstrap procedure. The pasted result must locate the right repository as well as the Project; labels remain presentation only. A presentation label may be freely shortened without changing identity. No runtime conversation locator is needed.

A structured mark is useful only after its evidence contract is fixed. An optional mark timestamp can belong to the checkpoint schema. Any decision cursor must identify its evidence source as well as its number, and that evidence must survive loss of local state. In-force authority is consolidated into its durable owner before checkpoint publication; historical roll-ups use repository history and retained outcomes, with an explicit coverage limitation if local reports are gone. Do not make all generic checkpoints depend on a PMO decision log, and do not create a second append-only journal merely to implement the cursor.

Separate the following observations: checkpoint exists; thread allocated active attention; a session is currently reachable; a worker is running on this machine; a worker finished reporting; delivery passed review; Project closed. The present checkpoint schema has only active records, so its state cannot supply all these distinctions. A projection must say unavailable when it cannot observe another machine, rather than infer nothing is running.

**Boundary and hand-offs:** A checkpoint references current work and authority without becoming their only owner. Session recaps supply evidence; PMO interprets coordination state; runtime adapters supply optional local observations. Removal never accepts work or closes a Project.

### U4 - Delegation

**Question:** What exactly has this worker been asked and authorised to do, and what must it return?

Keep `ki-delegation`. Move owner-facing thread practices to PMO, but retain both sides of the delegation contract: caller preparation, prompt and authority, dispatch, monitoring, gates, worker reporting, result reconciliation, and durable high-risk packets. A worker-only definition would orphan the very launch and return obligations that make delegation safe.

Define session as one runtime conversation; thread as a human-named line of work that can span sessions; run as one machine-local execution grouping; and worker as one bounded execution assignment. An agent is the general actor, including in-session subagents. The shared glossary should reference these respective owners rather than put every definition under PMO. Fresh launches should use territory-qualified run names consistently rather than discovering collisions only after another territory has reused a Project name.

Maintain three distinct gates: the predecessor finished reporting; the required artefact or verification is sufficient; the next action is authorised. `DONE` provides only the first. Keep scope, allowed paths, remote operations, commit, acceptance, prune and release permissions explicit. General footer text cannot expand a narrower task grant. The policy does not become technical sandbox enforcement merely because the CLI appends it.

**Boundary and hand-offs:** `ki agent` implements the execution protocol, including native runtime flags. Delegation returns evidence to PMO or the calling process. Work owns lifecycle and acceptance. A read-only reviewer has only its expressly named output exceptions, irrespective of the lowest footer's general local-commit permission.

### U5 - Shaping

**Question:** Which design should the owner choose before delivery becomes concrete?

Rename `ki-design-loop` to `ki-shape` and retain it as an independent invocation-only process in change-management. It owns the brief, independent reviews, evidence-led consolidation, owner decisions and pilot hand-off. PMO may invoke it; repositories without PMO may also use it.

Replace the absolute before-any-record-exists restriction with a material-unresolved-design test. New subjects need no premature execution record, but an existing record can reveal a costly unmade choice and return to shaping. The record pauses or is replanned under its existing owner; shaping neither duplicates it nor grants implementation authority. This preserves the boundary with `ki-plan`, which makes selected work executable once the governing choice is settled.

Preserve the five stages and independent high-reasoning review. Permit folder-form registry notes after artefact retirement. Consolidate changed decisions into the proper durable owners before deleting temporary design material. This reviewer does not perform that retirement or acceptance.

**Boundary and hand-offs:** Shaping receives an owner proposal and scope, returns a decision-ready model, then passes approved rollout outcomes to `ki-next` and `ki-plan`. The owner alone settles residual preferences and grants authority.

### U6 - Model policy

**Question:** What capability does this role require, and how is that chosen on this runtime?

Keep portable purposes, effort recommendations and role policy in `ki-tokenomics`. PMO and Delegation reference that policy instead of each restating a model choice. Keep effective model observation and provider validation with runtime adapters, and execution with tools-ki.

My recommended default coordinator is the `fast` purpose at low reasoning effort, for mechanical routing and bookkeeping only. If it cannot reliably preserve authority, scope, decisions and hand-offs, use `standard` at low effort. Substantive analysis, prompt design for ambiguous work, independent review and evidence reconciliation go to `reasoning` or `frontier` workers at the effort their task requires. A coordinator may present their conclusions; it must not perform an unacknowledged low-effort merge of disputed reports.

This is a trial policy grounded in the owner's stated preference and the current standard, not a benchmark result. No cited evidence establishes a best concrete provider model ID for both runtimes. Bind one explicitly per runtime and test cold bootstrap, a changed instruction, conflicting reports, a failed predecessor and an unavailable source. Evaluate missed constraints, owner corrections, response delay and total task effort, not only coordinator token volume. One missed authority boundary is grounds to stop that binding and use the fallback.

For a concrete first Codex trial, I nominate GPT-6 Luna at low effort, with GPT-6.1 Sol at low effort as the fallback. The [local radar snapshot][model-radar] records both models, but its adopted Codex default route is Sol and it records no equivalent Luna route; this nomination is therefore a trial proposal, not an assertion that Luna is already adopted or verified in the user's client. The snapshot likewise does not establish a qualified fast Claude coordination route or its effort support. Keep that binding as an explicit owner choice rather than inventing cross-provider equivalence. No model or client setting is changed by this recommendation.

Before adding purpose selection to the CLI, define runtime-qualified bindings for model and default effort, explicit overrides, unsupported combinations and provenance. Unknown or absent bindings must stop; omitted options must not silently substitute a supposedly equivalent purpose. The current opaque string table cannot deliver this contract. A per-runtime user binding is appropriate for installed product IDs; a repository declares purpose policy. Do not make the local launcher read a private settings store to guess a binding.

### Goal hierarchy

Use one shared question, what is this for, with three answers that preserve their different closure rules.

| Level | Intent | Evidence and closure |
| --- | --- | --- |
| Initiative | A continuing direction and boundary | Accountable lead reviews relevance; pause or retire, never complete. |
| Project | One finite outcome with a test | Lead assesses delivery against the outcome, then completes or cancels. |
| Record | One bounded change, finding or decision | Repository-owned verification and explicit lifecycle closure. |

Keep direction, outcome and goal as the established field family. A Project's outcome can expand into bounded acceptance conditions without introducing an aims registry. A record goal can take the existing one-to-three sentences. Initiative review can discuss current emphasis in ordinary prose, but mandatory three-to-five aims with their own Project coverage would create another changing membership structure. The current evidence does not justify that cost.

The hierarchy is not compulsory nesting for every activity. Projectless recurring work serves an Initiative directly, and locally unclassified records remain possible under the existing optional classification contract. If Kris wants universal classification, make that a separate explicit decision with a migration rule. No finite Project is created just to give continuing work a thread.

### Command surface and naming

Preserve object boundaries and remove duplicate routes. The proposed grammar below is a target, not a claim that these additions exist.

- **Repository selection and operations:** keep `ki repo` as the route to a selected set. Add repository listing and machine-readable roots here. Consolidate opening here only after preserving territorial ordering, owner-root behaviour and explicit store inclusion. Use the same selector validation throughout; do not advertise selectors on a child that rejects them.
- **Territorial governance and portfolio:** keep `ki territory` for Capitals, membership and territorial audit. Add `projects` as a registry-led view that includes Initiatives and Projects with zero records, and `threads` as a projection of checkpoints plus explicitly scoped local execution observations. Preserve generic checkpoint inspection and generated openers under `ki repo checkpoint`; they must work without a Capital. Avoid another top-level PMO or thread command.
- **Roadmap evidence:** retain one route under repository operations for listing, summary and statistics. Remove the proposed territory roadmap aliases. A territory selector already expresses the scope. Grouped output is not a complete Project inventory; the new portfolio view must start from registry entries. Require machine-readable output, source coverage and diagnostics before Observatory consumes it. Current grouped roadmap output is text-only.
- **Execution:** keep `ki agent` and its existing launch, queue and monitoring vocabulary. Retain explicit runtime, model and effort. Add purpose only after U6's binding decision. Add structured status evidence before automating cross-source views. Distinguish completion of the reporting protocol from success and acceptance. A watcher must not render an exited worker as a successful delivery.
- **Machine registration and layout:** retain `ki registry` for local identity and path registration, and `ki estate converge` for checkout layout changes. They describe different objects and authority. Their names do not need to collapse into territory merely because all can mention repositories.
- **Other command families:** retain acquisition, KB retrieval, harness installation, user skill activation, development and support surfaces. User skill activation and repository skill declaration intentionally differ. Do not rename them as collateral cleanup. The broader grammar does expose inconsistent preview switches and mutation defaults across repair, store, trade and estate commands; make help describe effects precisely and settle a convention before changing existing scripts.

Keep `territory` in prose and as the command name. `-t` already abbreviates its frequent selection use, and short handles already reduce typing. If Kris selects `terr`, treat it as one approved command migration, preserving governed handle semantics. Reject `land`: Known Lands includes external signposting as well as governed internal membership. Neither command naming nor an alias changes jurisdiction.

I would remove stored opener prose, mandatory Initiative aims, duplicate roadmap aliases, duplicate Streams lifecycle modes, the named-estate-area loophole for Project threads, stale-path refresh instructions tied to one skill directory, and the need to move registry notes back after design retirement. I would not remove generic checkpoints, the distinction between a session and a thread, explicit acceptance, or the separation of declaration, process and executable mechanics.

### Pilot and hand-offs

Pilot one master and one Project thread after resolving the evidence and authority contracts. Deliver PMO extraction with reciprocal off-ramps and updated bootstrap references, the shared-record correction, and a consistent single-writer rule. Do not call the pilot behaviour-preserving if it changes checkpoint fields, thread labels or default models.

The acceptance demonstration is a cold reconstruction with local run material unavailable: recover current authority and Needs, generate a correct opener, preserve outstanding work across a new mark, detect a failed predecessor, and show unknown remote-machine execution honestly. Also test a generic repository checkpoint without PMO, and a Project that has no records. This is a proposed verification plan, not testing performed by this review.

Once that passes, route bounded work to each owning repository for schema or CLI changes and command-centre projections. Skills, checker, assets, installed-name projections, catalogue, help, completion and manual must agree at each renamed interface. Keep decisions and definitions at their canonical owners, with a single consolidated hand-off to command centre. Decision 6 means that hand-off stays outstanding until Kris expressly acknowledges it; producing this review does not complete it.

## Owner decisions

### D1 - How broad is the first adoption?

**Options:** extract thread guidance only; or adopt the six-unit structure and reconcile the evidenced contract conflicts in the same bounded pilot. **Recommendation:** the latter, with generic checkpoint recovery and repository authority as acceptance conditions. Moving text alone leaves the important contradictions intact. This does not authorise implementation until Kris approves the scope.

### D2 - What is the default coordinator model?

**Options:** fast/low with a qualification gate and standard/low fallback; standard/low from the outset; or one high-reasoning session doing both coordination and analysis. **Recommendation:** fast/low for the deliberately mechanical role, with explicit concrete bindings per runtime and higher-reasoning synthesis delegated. The evidence cannot choose the provider IDs or prove savings; Kris must choose the trial bindings and acceptable correction burden.

### D3 - How much checkpoint structure is worth maintaining?

**Options:** retain prose marks and manual openers; introduce a minimal portable mark plus generated openers; or persist full opener text and local decision cursors. **Recommendation:** the middle option, with durable evidence references and honest coverage limits. Do not accept a cursor design that requires the original run directory. Decide whether exact historical roll-up coverage is required or a clearly bounded summary is sufficient.

### D4 - Should goals gain another level?

**Options:** retain the three-level hierarchy; allow optional untracked Initiative emphasis prose; or require a bounded, mapped aims list. **Recommendation:** retain the hierarchy and allow emphasis prose without identifiers or completion state. Mandatory aims need a demonstrated decision that cannot be made from direction, outcome and goal. Likewise, requiring every record to be classified would be a new policy, not a factual correction.

### D5 - Which names should change?

**Options:** keep all names and improve descriptions; rename the two misleading skills while keeping territory; or also shorten the CLI noun to terr or land. **Recommendation:** adopt `ki-pmo`, rename the design process to `ki-shape` and housekeeping governance to `ki-work-recurring`, keep `ki-checkpoint`, `ki-delegation` and `territory`. Approve any compatibility period explicitly; do not accumulate permanent aliases by default.

### D6 - How rigid is the coordinator topology?

**Options:** enforce three active Project threads plus the master; make the cap configurable per Capital; or remove it and treat counts as advisory. **Recommendation:** retain Kris's current cap of three for this pilot, define allocation separately from runtime liveness, and reconcile the master's stored list. Keep Project threads finite and let the master coordinate Initiative upkeep. No automatic claim that another principal has the same capacity follows from adopting PMO.

### D7 - What launch authority should be machine-readable?

**Options:** retain cumulative footer tiers with explicit task exceptions; or introduce a bounded grant separating reads, writes, commits, remote calls, acceptance, prune and release. **Recommendation:** make the separate capabilities the target and preserve readable prompts as their presentation. A read-only job should be representable without a generally commit-capable footer. This needs owner policy and a small host contract, not a second work lifecycle; correctness of the current task still follows its narrower explicit instruction.

### D8 - How far should the first CLI and view delivery go?

**Options:** owner-facing grammar cleanup only; a small source-labelled Project/thread projection and generated opener; or the complete command-centre attention model. **Recommendation:** the small projection, keeping one roadmap route and deferring attention taxonomy to command centre. Decide the required coverage across machines before any view labels agents idle or Needs resolved. The sources establish ownership, not how much latency or missing evidence Kris will tolerate.

## Verification and evidence boundary

The cited brief, its cited local standards and skill bodies, the two named repository checkpoints, the Initiative and Project notes, Charter, Known Lands and the authorised decisions log were read. All public command declarations under `tools-ki/src/commands/` were inspected; the relevant agent, territory, repository opening, registry, roadmap, batch and supporting command handlers were read in detail, with additional core reads for launches, gates and registry grouping. This is a design and source review, not a full implementation audit of every CLI domain.

Read-only CLI checks covered root and subcommand help, including agent launch and queue, repository selection, territory selection and opening, registry, roadmap list and summary, batch and estate. They confirmed the locally available grammar. The footer-start defect was reproduced without running a worker. No launch, network call, integration, acceptance, migration or benchmark was performed. No other review was read. Review source baselines were Principal `d9474f382768aec47ad46b47fcc0040044c6b171`, Harness `1ba764b80149a9bb1bf6357fd7a4838de978c720`, and tools-ki `4a4f9707b47142e1a73a160d6f39cf5b91a404b3`; contemporary working copies take precedence over the brief's earlier observations where noted.

[adapters]: ../../../../../ki-agentic-harness/skills/change-management/ki-work/references/standards-change-management-adapters.md
[agent-command]: ../../../../../tools-ki/src/commands/agent/index.ts
[background]: ../../../../../ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md
[batch-command]: ../../../../../tools-ki/src/commands/batch/index.ts
[checkpoint]: ../../../../../ki-agentic-harness/skills/governance/ki-checkpoint/references/standards-checkpoints.md
[checkpoint-skill]: ../../../../../ki-agentic-harness/skills/governance/ki-checkpoint/SKILL.md
[design-standard]: ../../../../../ki-agentic-harness/skills/change-management/ki-design-loop/references/standards-design-loop.md
[footer]: ../../../../../ki-agentic-harness/skills/governance/ki-delegation/assets/rules-none.md
[github-adapter]: ../../../../../ki-agentic-harness/skills/change-management/ki-work-github-issues/SKILL.md
[host-standard]: ../../../../../tools-ki/.agents/skills/ki-self/references/standards-product-engineering.md
[item]: ../../../../../ki-agentic-harness/skills/change-management/ki-work-roadmap/references/standards-work-item-format.md
[linear-adapter]: ../../../../../ki-agentic-harness/skills/change-management/ki-work-linear/SKILL.md
[model-radar]: ../../../../../ki-agentic-harness/skills/governance/ki-model-radar/references/radar.toml
[principal-config]: ../../../../.ki.toml
[recap]: ../../../../../ki-agentic-harness/skills/change-management/ki-recap/SKILL.md
[registry]: ../../../../../ki-agentic-harness/skills/change-management/ki-work/references/standards-project-registry.md
[registry-code]: ../../../../../tools-ki/src/core/work/registry.ts
[registry-list]: ../../../../../tools-ki/src/commands/registry/list.ts
[repo-open]: ../../../../../tools-ki/src/commands/repo/open.ts
[roadmap]: ../../../../../ki-agentic-harness/skills/change-management/ki-work-roadmap/references/standards-repository-roadmaps.md
[roadmap-command]: ../../../../../tools-ki/src/commands/repo/roadmap.ts
[runs]: ../../../../../tools-ki/src/core/agent/runs.ts
[runtimes]: ../../../../../tools-ki/src/core/agent/runtimes.ts
[streams]: ../../../../../ki-agentic-harness/skills/repo-structure/ki-repo-kb-streams/SKILL.md
[territory-command]: ../../../../../tools-ki/src/commands/territory/index.ts
[tokenomics]: ../../../../../ki-agentic-harness/skills/environment/ki-tokenomics/references/standards-tokenomics.md
