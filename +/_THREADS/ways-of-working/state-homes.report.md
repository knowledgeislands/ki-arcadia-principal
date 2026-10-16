# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › state-homes

**Run report at 22:26 BST · last mark 16:09 BST**

---

## Done

- Read-only review of where thread and run material lives, against the XDG Base Directory meanings, under Kris's STATE-HOMES words of 16 October: "the thing that's really bugging me the most is the use of this `+/_THREADS` and how it all sits with XDG and what is durable state vs temporary "caache"". Nothing was changed except this report, committed locally in ki-principal by explicit path; the brief forbids push.
- Evidence read: the `ki-delegation` [background-run standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md) (Run packet, Decisions log), the `ki-pmo` [standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md) (thread folder, tidy, hold), the `ki-checkpoint` [standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-checkpoint/references/standards-checkpoints.md), the `ki-repo` [working-areas contract](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/keystone/ki-repo/references/standards-repository.md), tools-ki's `src/core/paths.ts` and `src/core/agent/`, [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md), the [session-identity report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/session-identity.report.md) and the [registry-shape report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/registry-shape.report.md), plus a survey of every checkout under `~/workspaces` and of `~/.local/state/ki`, `~/.config/ki`, `~/.local/share/ki` and `~/.cache/ki`.
- Limitation: client stores were inspected only by listing; no transcript, credential or `auth.json` content was read.

### Findings in brief

1. **The one real confusion is the decisions log.** The two standards disagree about what it is. `ki-delegation` calls `+/_THREADS/<run>/` "the thread's working record between consolidations", deleted when the thread closes, with "Nothing durable may exist only in the thread folder". `ki-pmo` calls `decisions.md` "the Project's one decisions list for its whole life", shared by successive threads. A lifetime record sitting in `+/`, which `ki-repo` defines as "temporary inputs to further repository work ... Keep either only while useful", is exactly the mismatch that is bugging you. There are 17 such logs, about 4,400 lines, the largest being the KI state-of-play log at 1,015 lines and this Project's at 741 (68 KB).
2. **Agent reports do fit `+/`.** A report with an open query is an input waiting for the owner, and the tidy removes it once it is answered and homed. The cost is churn: in ki-principal, 584 reports have been added under `+/_THREADS` and 417 deleted, and 329 of the 383 commits since 13 October touch `+/_THREADS` or `+/_CHECKPOINTS`. That churn is the price of your rule that knowledge is "safe only once it is in Git on a remote". It is not a homing error.
3. **Almost nothing in the system is cache.** XDG cache means "non-essential data that can be deleted and regenerated". The only KI cache today is the KB search model under `paths.cache`; `~/.cache/ki` does not exist on this host. What feels like "temporary cache" is really one of two things: runtime state (pids, logs, status, launch records), which is correctly in XDG state, or scratch, which belongs in `tmp/`. No agent material should move to `~/.cache`.
4. **The state folder is mostly right, but under-documented and leaky.** The run-packet table lists 8 entries. The launcher also writes `<name>.md`, `<name>.queued.md` (byte-identical duplicates in this run), `<name>.draft.md`, `thread.json`, `thread.status`, `inbox.md`, `events.jsonl`, `events.state.json` and `_archive/`. Knowledge has leaked into state: `mac-studio-setup` holds 106 `report.md` files and about 15 evidence files, `desk-kit` holds 3 reports, and `ways-of-working` holds a `.patch` work product.
5. **`+/_THREADS` breaks the closed list across the estate and has no declared owner.** Unlike `+/_CHECKPOINTS`, it has no README scaffold and no declaring capability. Files outside the closed list: hnr-principal `fourth-white-paper` 164 (evidence folders) and `Build architecture` 26 (and a folder name with a space); ki-agentic-harness `skill-reviews` 52 (`scratch/`, old PNGs); personal-principal `personal-tower` 11; ki-principal `mac-studio-setup` 8, `tools-burndown` 6 and `knowledge-acquisition` 1; acquire `acquire-intake` 5 (`binary-probe/`); hnr-principal `5g-emerge-phase3` 1. ki-principal also has an empty, untracked `mac-studio-bootstrap/`. The hold procedure causes some of this: it says to "copy into the thread folder what resuming needs from the run's state folder", and the copies are files outside the closed list.
6. **`tmp/` has two meanings.** `ki-repo` says `tmp/` holds only material "safe to delete and rebuildable from committed sources ... material that must survive, or be handed on, belongs in a directional working area or its owning collection". THREADS-TMP-HOME matches that. In practice, though, `ki-agentic-harness/tmp/registry-model/patch/registry-model.patch` is a parked work product, and `ki-principal/tmp/digest-churn/` sits outside `tmp/<run>/<name>/`. tools-ki neither creates nor removes the folder yet ([KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md), draft).
7. **[KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) is stale against the restart model.** Its step 3 moves the decisions log and reports out of state, but they have been tracked since 14 October. Its notes have "the checkpoint names the host holding the live decisions log" and a DONE frame that "points to the host that took over". Both conflict with the hold rule that "no thread state or resume line names a host".
8. **tools-ki's XDG handling is correct and minimal.** `resolveKiPaths` gives `KI_*_HOME`, then `XDG_*_HOME`, then the standard fallback, each with `/ki` appended. Run state is `state/agents/<run>/` and the registry is `state/registry.toml`. Thread knowledge paths are hard-coded as `+/_THREADS/<run>` in `src/core/agent/thread.ts`. No KI code writes to `~/.cache/ki` apart from the KB search projection.

### Inventory and classification

| Place | What is in it | Writer | Committed | Survives a host move | Rule that put it there | Class under the model | Mismatch |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `+/_THREADS/<run>/decisions.md` | Owner decisions in their words, numbered, classified at the mark | `ki agent decide`; the thread commits | Yes | Yes, through Git | THREADS-CONTENT; 14 October split ("tracked +/_THREADS/<thread>/ for the decisions log and agent reports"); `ki-pmo` "one decisions list for its whole life" | Durable and portable (Git), in an owning collection | A lifetime record in a `+` staging area; `ki-delegation` and `ki-pmo` disagree on whether it is a working record or the Project's log |
| `+/_THREADS/<run>/<name>.report.md` | Agent owner reports: outcomes, findings, open queries | The agent, through the launcher path; the thread commits | Yes, then deleted when homed | Yes, through Git | THREADS-CONTENT, THREAD-TIDY, THREADS-TRIM (tidy at every resting point) | Durable and portable while open; a transient input, which fits `+/` | High churn (584 added and 417 deleted in ki-principal); none otherwise |
| Other files in `+/_THREADS/<run>/` | Evidence folders, scratch, PNGs, briefs, patches | Agents and threads before the closed list | Mostly | Yes | None; contrary to THREADS-CONTENT and THREADS-CLEAR | Each to its own home: work product to its owning collection, scratch to `tmp/`, brief to state | About 274 files across 9 folders in 6 repositories; `+/_THREADS` has no README or declared owner |
| `+/_CHECKPOINTS/<thread>.md` | Active-thread restart record: pick-up block, queue, parked queries, mark | The thread | Yes | Yes, and it is the move vehicle | `ki-checkpoint`; `ki-repo` names checkpoints as a `+` input | Durable and portable (Git); transient per thread, which fits `+/` | None; it should also carry queued briefs at a hold (KI-HARNESS-GOV-189 step 2) |
| `~/.local/state/ki/agents/<run>/` `*.prompt.md`, `*.launch.json`, `*.pid`, `*.status`, `*.log`, `thread.status`, `dispatch.*`, `seen`, `queue.jsonl`, `events.jsonl`, `events.state.json` | Launched prompt, launch record, process id, status line, runtime output, queue, event log and snapshot | `ki agent`, the agent, the thread | No | No, and they need not | 14 October split ("state folder keeps runtime only"); Run packet | Machine-local state (XDG state: logs, history, current application state); pid and status are XDG runtime in spirit, but macOS has no `XDG_RUNTIME_DIR`, so state is right | Seven launcher files are missing from the packet table |
| `~/.local/state/ki/agents/<run>/<name>.md`, `.queued.md`, `.draft.md`, `_common-*.md` | Briefs: drafted, queued and shared | The thread, `ki agent queue` | No | No | THREADS-CONTENT ("briefs live in the state folder") | Machine-local state; regenerable from the decisions log and checkpoint | `.md` and `.queued.md` are duplicates; a queued brief is the only copy of pending authorised work until a hold writes it to the checkpoint |
| `~/.local/state/ki/agents/<run>/<name>.work/` | Machine-only scratch with no repository home | The agent | No | No | THREADS-TMP-HOME | Scratch; state is acceptable when no repository applies | None |
| `~/.local/state/ki/agents/<run>/worktrees/` | Parallel agents' Git worktrees | The agent | Branches until merged | No | Coordination rule | Machine-local state, removed before `DONE` | Unpushed commits there are durable work in state, so the removal rule must hold |
| `~/.local/state/ki/agents/<run>/inbox.md` | Messages from other threads | `ki agent decide --log` | No | No | `ki-pmo` messages | Machine-local state; its effects go to the decisions log | `ki-pmo` still says "the inbox once it moves there" (to the thread folder), an unsettled plan |
| `~/.local/state/ki/agents/<run>/thread.json` | The run's owning repository and thread folder | `ki agent` | No | No; each host rebuilds it | tools-ki `thread.ts` | Machine-local state | Holds the absolute repository path, which is right for state |
| `~/.local/state/ki/agents/_archive/` | Closed run folders or tarballs | `ki agent close` | No | No | Decisions log close gate | Machine-local state with retention | Has no retention period; absent on this host |
| Knowledge left in state (`mac-studio-setup` 106 reports and about 15 evidence files, `desk-kit` 3 reports, `ways-of-working` 1 patch) | Reports and evidence written before the split, and one work product | Earlier launchers and agents | No | No | None; contrary to the 14 October split | Should be in Git or deleted | Knowledge in state: the test "if the state folder is lost, you shouldn't lose any knowledge" fails until it is adopted or confirmed homed |
| Proposed `~/.local/state/ki/threads/<repository>/<stem>.json` | Native session IDs bound to the logical thread | Launcher, `SessionStart` hook, bind command, `ki-pmo` hold and DONE | No | No; each host builds its own | SESSION-IDENTITY (BINDING-HOME option a)) | Machine-local state | None; it names a host only in machine-local state, which is allowed |
| `<checkout>/tmp/<run>/<name>/` | Agent scratch: scripts, intermediate lists | The agent | No (ignored by the `ki-repo` block) | No | THREADS-TMP-HOME; TMP-CLOSE under ROUTINE | Scratch (`tmp`) | A parked patch in `ki-agentic-harness/tmp/registry-model/`; `ki-principal/tmp/digest-churn/` outside the run layout; no tools-ki support yet |
| `~/.config/ki/config.toml` | Skill activation configuration | User, bootstrap | Through chezmoi where managed | Through chezmoi | tools-ki `paths.config` | Configuration (XDG config) | None |
| `~/.local/state/ki/registry.toml`, `locks`, `managed-artifacts/` | Machine-local repository registry, locks, managed-artifact ledger | tools-ki | No | No; rebuilt per host | tools-ki `paths.state`; the local registry owns physical paths | Machine-local state | None |
| `~/.local/share/ki/harnesses/` | Installed harness payloads | `ki` bootstrap | No | Reinstalled | tools-ki `paths.data` | XDG data (installed payload); regenerable, but data is the conventional home | None (empty on this host) |
| `~/.cache/ki` | KB search model cache only, when used | `ki kb search` | No | No | tools-ki `paths.cache` | Regenerable cache | Absent here; correct |
| `~/.claude/projects/<slug>/<uuid>.jsonl`, `~/.codex/sessions/...`, `~/.codex/*.sqlite` | Vendor transcripts and indexes | The client | No | No | Vendor | Vendor machine-local state, outside the KI model | Transcripts are the evidence for "verify later quotations from the file", so decisions must be logged in the turn they arrive; they are never referenced from a portable record |

### Proposed target model

| Class | Home | Holds |
| --- | --- | --- |
| Durable lifetime record | The Project's folder in Git | The decisions log |
| Durable working input | `+/_THREADS/<run>/` and `+/_CHECKPOINTS/` | Open reports and the checkpoint only |
| Machine-local state | `$XDG_STATE_HOME/ki/` | Everything a process or host needs at runtime, rebuildable or losable without losing knowledge |
| Configuration | `$XDG_CONFIG_HOME/ki/` | As today |
| Cache | `$XDG_CACHE_HOME/ki/` | Regenerable indexes only |
| Scratch | `<checkout>/tmp/<run>/<name>/` | Disposable output only |

- **What stays in `+/_THREADS/<run>/`.** Only `<name>.report.md` files that are unanswered or not yet homed. The folder becomes a pure inbox and may be empty. `ki-pmo` declares it as a specialist `+` subarea with a README scaffold, as `ki-checkpoint` does for `+/_CHECKPOINTS/`, so that `ki-repo` and the PMO rubric can check it.
- **Where the decisions log goes.** It moves to the Project it belongs to, as `decisions.md` in the Project's folder. That makes the "one decisions list for its whole life" a Project artefact, outside the `+` staging area, and it survives thread close and Project close with the Project note. `ki-delegation`'s wording changes to match: the log is the Project's record, consolidated at each mark under the decision classes, and never deleted with the thread folder. A thread with no Project, such as a state-of-play or conversational thread that delegates, still needs a home; its placement follows REGISTRY-SHAPE (see below).
- **What the checkpoint carries.** Unchanged, plus one addition: at a hold, each queued brief goes into the checkpoint as re-queue work, because it is the only portable copy of pending authorised work. The hold step "copy into the thread folder what resuming needs from the run's state folder" becomes "write it into the checkpoint". Open queries already park there.
- **What moves to XDG state, cache or config.** No move is needed for config or cache. State stays as it is, and the run-packet table lists every file the launcher actually writes. `<name>.md` and `<name>.queued.md` stop being duplicates, with one brief file per name. `_archive/` gets a retention period. Knowledge already sitting in state is adopted into Git or confirmed homed and deleted.
- **What `tmp/` is for.** Only what `ki-repo` says: disposable, rebuildable output, in `<checkout>/tmp/<run>/<name>/`. A draft or patch that must survive goes to its owning collection, or to `-/` while it awaits delivery. It is never parked in `tmp/`. That is consistent with TMP-CLOSE option a), already taken under ROUTINE, where close keeps a non-empty folder only until it is homed.
- **How a host move works.** Every durable item (checkpoint, decisions log, open reports) is in Git, so a move is: hold, commit and push, pull level on the new host, resume from the checkpoint, re-queue from the checkpoint. Each host's XDG state (run packets, session bindings, registry, worktrees) is built fresh there and never travels. No portable file names a host. KI-HARNESS-GOV-189 should drop step 3 and the "names the host" and "points to the host that took over" wording, and say instead that the old instance closes DONE once the new instance's resume is pushed.
- **Interaction with REGISTRY-SHAPE.** This model assumes every Project with a coordination thread is a folder, which REGISTRY-SHAPE proposes (`Streams/Initiatives/<initiative>/<project>/<project>.md`). Today most ki-principal Projects are single files (`Streams/Projects/tools-burndown.md` and others), so the log move should land with or after the registry move, not before. Where state-of-play and Project-less threads keep their logs, and whether REGISTRY-SHAPE's proposed `+/_DESIGN/` subarea and `+/_THREADS/` should share one declaration pattern, are for REGISTRY-SHAPE to settle. Nothing here designs them.

### Migration, rough size

- **Standards (ki-agentic-harness).** About 15 to 20 passages need changing:
  - `ki-delegation`: Run packet table, Decisions log section, `SKILL.md` line 75 and `run-prompt.md` line 3.
  - `ki-pmo`: the thread-type table, the decisions-list paragraph, Committing the thread folder, Tidying the thread folder, the hold step, PMO-9, and a new scaffold declaration for `+/_THREADS/README.md`.
  - `ki-checkpoint`: a `Decisions log:` line beside `Thread folder:`.
  - `ki-repo`: one line naming the `+/_THREADS/` owner.
  - KI-HARNESS-GOV-189: the amendments above.
- **tools-ki.** Medium sized:
  - `src/core/agent/thread.ts` resolves the decisions log through the registry to the Project folder instead of `+/_THREADS/<run>/decisions.md`.
  - `close.ts` adoption and the `runs.ts` `<decisions log path>` placeholder follow it.
  - One brief file per name; `_archive/` retention.
  - The tmp home, already [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md).
  - Contract tests for each.
- **Capitals and other thread homes.** 17 decisions logs, about 4,400 lines:
  - ki-principal: 10 logs, in 12 folders.
  - hnr-principal: 4 logs.
  - legal-principal: 1.
  - acquire: 1.
  - ki-agentic-harness: 1.
  - personal-principal: 1 folder with no log.

  Each owning thread does its own move at its next mark, as THREADS-CLEAR already prescribes for clearing. Separately, about 274 files outside the closed list in 9 folders, and the knowledge left in the `mac-studio-setup`, `desk-kit` and `ways-of-working` state folders, are cleared under THREADS-CLEAR as already decided.
- **Records proposed, not captured:**
  - a ki-agentic-harness GOV record for the state-homes model across `ki-delegation`, `ki-pmo`, `ki-checkpoint` and `ki-repo`;
  - a tools-ki CLI record for the decisions-log resolution, brief de-duplication and archive retention, alongside KI-TOOL-KI-CLI-137;
  - an amendment to KI-HARNESS-GOV-189;
  - one ki-principal Streams record for the estate sweep, sequenced after REGISTRY-SHAPE.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- REGISTRY-SHAPE is under review in parallel. The decisions-log move depends on Projects becoming folders.
- Uncommitted changes from another session are in ki-principal and were left untouched: `+/_THREADS/chezmoi/decisions.md`, about 60 reports under `+/_THREADS/mac-studio-setup/`, `+/_THREADS/state-of-play/`, `+/_THREADS/techne/`, `+/_THREADS/knowledge-acquisition/` and `+/_THREADS/ways-of-working/`, `Admin/Governance/Decisions/ADR-KI-PRINCIPAL-007-territory-seats-on-hosts.md`, and the untracked `+/_THREADS/desk-kit/setup-note.report.md`.

## Queries

### STATE-AGREE - agree the state-homes model

**Context:** The review finds one real homing error: the decisions log, a lifetime Project record, sits in the `+` staging area, and the two standards disagree on what it is. It also finds leaks: about 274 files outside the closed list, and reports and a patch left in state folders. Everything else is correctly placed under XDG: runtime in state, configuration in config, and almost nothing is cache. Reports and checkpoints are genuine `+` inputs. A host move needs only Git, because no portable file names a host.

**Query:** Do you agree the model in this report as the target for ways of working?

**Options:**

a) (recommended) Agree it: `+/_THREADS/<run>/` holds open reports only and is declared with a README; the decisions log is a Project artefact; the checkpoint carries queued briefs at a hold; XDG state holds runtime only, with the packet table completed and briefs de-duplicated; cache stays limited to regenerable indexes; `tmp/` stays disposable-only, with surviving drafts going to their owning collection or `-/`; and KI-HARNESS-GOV-189 drops every host-naming step.

b) Agree it except the decisions-log move, keeping the log in `+/_THREADS/<run>/` and fixing `ki-pmo` and `ki-delegation` to call it the Project's working log there (see DECISIONS-HOME).

c) Go further and keep reports in XDG state, committing to Git only reports that still carry an open query at a resting point, to cut the churn, at the cost of weakening "if the state folder is lost, you shouldn't lose any knowledge".

### DECISIONS-HOME - where the Project's decisions log lives

**Context:** `ki-pmo` says the log is "the Project's one decisions list for its whole life", while `ki-delegation` deletes the thread folder at close and says nothing durable may live only there. `+/` is for temporary inputs. 17 logs, about 4,400 lines, would move. Most ki-principal Projects are still single files, so a log can only sit beside its Project once REGISTRY-SHAPE makes Projects folders.

**Query:** Should each Project's decisions log move out of `+/_THREADS/` into the Project's own folder, after REGISTRY-SHAPE lands?

**Options:**

a) (recommended) Yes: `decisions.md` sits in the Project's folder from the REGISTRY-SHAPE move onwards, with `ki agent` resolving it through the registry. Each owning thread moves its own log at its next mark, and the home for Project-less threads (state-of-play, conversational) is settled with REGISTRY-SHAPE.

b) No: keep `decisions.md` in `+/_THREADS/<run>/`, declared by `ki-pmo` as the Project's working log, and amend `ki-delegation` so that thread close does not delete it while the Project is open.

### STATE-RECORDS - capture the migration records

**Context:** The model touches four harness skills, tools-ki and every thread home. KI-TOOL-KI-CLI-137 already covers the tmp home, and THREADS-CLEAR already covers clearing the closed-list leaks. KI-HARNESS-GOV-189 contradicts the no-host rule. Capturing records adopts nothing; each receiving repository owns priority.

**Query:** Should the coordinating thread capture the migration records once STATE-AGREE is answered?

**Options:**

a) (recommended) Capture four records once STATE-AGREE and DECISIONS-HOME are answered: a ki-agentic-harness GOV record for the model across `ki-delegation`, `ki-pmo`, `ki-checkpoint` and `ki-repo`; a tools-ki CLI record for decisions-log resolution, one brief file per name and `_archive/` retention, linked to KI-TOOL-KI-CLI-137; an amendment to KI-HARNESS-GOV-189 removing step 3 and the host-naming wording; and a ki-principal Streams record for the estate sweep, sequenced after REGISTRY-SHAPE. Leak clearing stays with each owning thread under THREADS-CLEAR.

b) Capture only the harness GOV record and the KI-HARNESS-GOV-189 amendment now, and leave tools-ki and the sweep until REGISTRY-SHAPE lands.

```text
STATE-AGREE

Agree the state-homes model in /Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/state-homes.report.md: +/_THREADS/<run>/ holds open reports only and is declared with a README; the decisions log is a Project artefact; the checkpoint carries queued briefs at a hold; XDG state holds runtime only, with the run-packet table completed and briefs de-duplicated; cache stays limited to regenerable indexes; tmp/ stays disposable-only, with surviving drafts going to their owning collection or -/; and KI-HARNESS-GOV-189 drops every host-naming step.

---

DECISIONS-HOME

Move each Project's decisions.md out of +/_THREADS/<run>/ into the Project's own folder from the REGISTRY-SHAPE move onwards, with ki agent resolving it through the registry; each owning thread moves its own log at its next mark, and the home for Project-less threads (state-of-play, conversational) is settled with REGISTRY-SHAPE.

---

STATE-RECORDS

Once STATE-AGREE and DECISIONS-HOME are answered, capture four records: a ki-agentic-harness GOV record for the state-homes model across ki-delegation, ki-pmo, ki-checkpoint and ki-repo; a tools-ki CLI record for decisions-log resolution, one brief file per name and _archive/ retention, linked to KI-TOOL-KI-CLI-137 (/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md); an amendment to KI-HARNESS-GOV-189 (/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) removing step 3 and the host-naming wording; and a ki-principal Streams record for the estate sweep, sequenced after REGISTRY-SHAPE. Leak clearing stays with each owning thread under THREADS-CLEAR.
```

```text
╭─ run report · 2026-10-16T21:26:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] STATE-AGREE
- [waiting] DECISIONS-HOME
- [waiting] STATE-RECORDS
- [unpushed] run report committed locally; the brief forbids push

```text
Resume KI > Model > ways of working under current ki-pmo and ki-delegation since 2026-10-15T15:09:48Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
