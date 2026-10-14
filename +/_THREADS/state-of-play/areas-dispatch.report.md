# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › areas-dispatch

**Run report at 22:03 BST · last mark 21:19 BST**

---

## Done

- **Committed and pushed `70fa1e6`** in ki-principal, `docs(streams): dispatch the 14 October area findings to their owning notes`. The commit went through a private index by explicit path (8 paths). The scoped gate (`ki repo audit --staged`) passed with no findings in scope: FAIL=0 and WARN=0 for the 8 paths. It still reports two findings outside the scope, which belong to other threads: STREAM-9 on the mac-studio-bootstrap Project note, and NOTE-1a frontmatter in two ways-of-working reports. The push was a fast-forward, `57f6100..70fa1e6`. origin/main..HEAD held only this commit, and nothing came down on the pull.
- **Topics added to the existing notes as ideas for evaluation**, quoting Kris where possible, with no records and no record identifiers:
  - [Command centre](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/command-centre.md) gained a new `### Ideas for evaluation, 2026-10-14` block under Notes. It covers the Observatory as host command centre, inter-agent pub-sub (the ntfy interim question and a decentralised per-host endpoint), the single pane of glass with agents advertising themselves (a read-only Sessions Instrument, never a harness GUI), and the display side of token economics.
  - [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) gained one Notes bullet. It covers the agent-advertisement fields in the run-events contract, and acting on token use: usage and a `limit` stop reason, a fallback ladder starting from Kris's "claude-opus-5-5 at their same effort", and a concurrency gate driven by account windows.
  - **Host network** went into the Notes of the [Rig Initiative](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md). **AI-tooling observability (OTLP), including how token use is measured**, went into the Notes of the [Platform foundations Initiative](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md).
- **Deviation from the brief.** The proposal's owners for host network and OTLP are `host-network` and `ai-observability`, and neither Project exists. Creating them is Kris's NEW-AREAS decision. I therefore applied the proposal's own fallback, "in the Initiative's Notes if no Project fits", rather than writing into a Project note. If Kris accepts NEW-AREAS a), those two bullets become the seed Notes of the new Projects.
- **The four reports were copied** into [+/_THREADS/state-of-play/](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/) and are in the same commit:
  - [areas-proposal](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/areas-proposal.report.md)
  - [areas-glass](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/areas-glass.report.md)
  - [areas-tokens](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/areas-tokens.report.md)
  - [sync-telemetry](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/sync-telemetry.report.md)
- **Checkpoint messages written, both uncommitted.** I added a dated AREAS-DISPATCH line pointing to the Project note change in two checkpoints:
  - [knowledge-islands-model.command-centre](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.command-centre.md): it had no block, so I created one in the `rig.mac-studio-bootstrap` form under the `#` heading.
  - [knowledge-islands-model.ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md): I put the line at the top of its existing block.
  - Both files already carried other threads' uncommitted edits: the command-centre thread's own re-bootstrap update, and the earlier state-of-play messages in ways-of-working. I therefore left both uncommitted, as the brief requires.
- **No other checkpoints.** No owning Project for host network or OTLP has a thread. The Observatory product thread owns no Project, and command-centre is the owner, so I left its checkpoint alone.
- **Hook defect, now repaired.** After the commit, the pre-commit hook's cleanup step removed my four untracked report copies from the working tree. They were already committed, so I restored them from HEAD. Other threads' untracked files were not affected.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- The two checkpoint messages will be committed by whichever thread next commits each checkpoint. Each line is self-contained.
- SYNC-GUARD and CHANNEL-TELEMETRY from the sync-telemetry report were answered in Kris's 14 October replies. The report copy still shows them open; it is kept for the three area queries below.
- [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) is still awaiting review. Every tailnet listener in these areas depends on it.

## Queries

### AREAS-PATTERN - How evaluation areas are held

**Context:** Kris wants new areas held as Projects full of ideas but without roadmap records, and without "hundreds of projects". The registry standard already allows a `planned` Project whose Notes and `design/` folder hold the ideas, and [delta-evaluation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/delta-evaluation.md) already works this way. What is missing is a written threshold, a cap, and rules for graduating or folding, as set out in section 1 of [areas-proposal](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/areas-proposal.report.md).

**Query:** Should the evaluation-stage pattern in areas-proposal section 1 become the rule?

**Options:**

a) (recommended) Adopt section 1 as written. An evaluation-stage Project is a `planned` Project whose Outcome is a decision, with ideas kept in Notes or `design/` and no records or thread. It opens only when all three threshold conditions hold, with at most one per Initiative and three across the territory. It graduates to `active`, or folds after a close-out. ways-of-working writes the pattern into the `ki-work` Project registry standard under an existing record.

b) Do (a) without the numeric cap, and have state-of-play review the evaluation-stage Projects at each mark instead.

### OBS-MERGE - command-centre holds the Observatory, the glass and agent advertisement

**Context:** The ideas now sit in the Notes of [Command centre](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/command-centre.md). Its Outcome already promises "one read-only state-of-play view" and names the Observatory Beacon and Bridge. Kris wants a single pane of glass over every agentic session, where agents advertise themselves, but not as a harness GUI. Today's Fable limit and `sol`'s spent account show that the glass also needs each run's token use and each account's windows.

**Query:** Should command-centre absorb the Observatory as command centre, inter-agent communication, the single pane of glass and agent advertisement, and reshape its Outcome to match?

**Options:**

a) (recommended) Keep one Project, `command-centre`, and reshape its Outcome so the model is realised as the Observatory on each host. That means its Instruments, Beacon and Bridge; a read-only Sessions Instrument as the single pane of glass, showing per-run and per-thread token use and each account's 5-hour and 7-day windows; and a per-host communication endpoint peered over the tailnet later, with ntfy as the interim question in Notes. ways-of-working keeps the event contract, including the advertisement and usage fields. `apps-observatory` keeps product ownership.

b) Do (a) but defer the glass, keeping it as a Notes idea until the run-events and live-threads listing work in tools-ki is delivered.

c) Open a separate `observatory` Project under Platform foundations for the product, the glass and communication, leaving command-centre as vocabulary only.

### NEW-AREAS - Host network, and AI observability with token economics

**Context:** Kris asked for AI-tooling observability (OTLP) as its own Project under Platform foundations, said that token economics is part of it, and said that setting up hosts "needs its own thought". Both topics are now held as Notes in the [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md) and [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) Initiatives, because neither Project exists. No record measures token use today.

**Query:** Should `host-network` and `ai-observability` open now as evaluation-stage Projects, seeded from those Initiative Notes?

**Options:**

a) (recommended) Open `host-network` under Rig and `ai-observability` under Platform foundations, both `planned`, each with an Outcome that is a decision. ai-observability's decision covers how token use is measured and attributed per run, per thread and per account, OTLP included, with `ki-tokenomics` keeping policy. Move the two Initiative Notes bullets into the new Projects' Notes through one ki-principal commit by explicit path, and open no thread for either.

b) Open only `ai-observability` now, with token economics, and leave host network as Notes in the Rig Initiative until a research run meets the threshold.

c) Open neither, and keep both as Initiative Notes until AREAS-PATTERN is settled.

```text
AREAS-PATTERN

Adopt the evaluation-stage pattern as written in areas-proposal section 1: a planned Project whose Outcome is a decision, with ideas kept in Notes or design/ and no records or thread. It opens only when all three threshold conditions hold, with at most one per Initiative and three across the territory, and it graduates to active or folds after a close-out. ways-of-working writes this into the ki-work Project registry standard under an existing record.

---

OBS-MERGE

Keep one Project, command-centre, and do not open an observatory Project. Reshape its Outcome so the model is realised as the Observatory on each host: Instruments, Beacon and Bridge; a read-only Sessions Instrument as the single pane of glass over this machine's ki agent runs and live Claude Code sessions (metadata only, never a harness GUI), showing per-run and per-thread token use and each account's 5-hour and 7-day windows with reset times; a per-host communication endpoint peered over the tailnet later; ntfy as the interim question in its Notes. ways-of-working keeps the event contract including the advertisement and usage fields; apps-observatory keeps product ownership.

---

NEW-AREAS

Open host-network under Rig and ai-observability under Platform foundations as planned evaluation-stage Projects, each with an Outcome that is a decision; ai-observability's decision covers how token use is measured and attributed per run, per thread and per account, OTLP included, with ki-tokenomics keeping policy. Move the two 2026-10-14 Initiative Notes bullets (Rig: host network; Platform foundations: AI-tooling observability) into the new Projects' Notes through one ki-principal commit by explicit path. Open no thread for either.
```

```text
╭─ run report · 2026-10-14T21:03:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] AREAS-PATTERN
- [waiting] OBS-MERGE
- [waiting] NEW-AREAS
- [committed] Project and Initiative notes and report copies, pushed
- [uncommitted] command-centre and ways-of-working checkpoint messages, in files carrying other threads' edits
