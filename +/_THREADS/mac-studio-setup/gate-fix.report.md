---

---

---

# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › gate-fix

**Run report at 00:50 BST · last mark 17:47 BST**

---

## Done

- GATE-FIX, Project note: the two Rig note bullets in the [Project note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) now name no records. Their references to the rig-guide differences D2 and D21, the RIG-UX idea and "captured as separate records" are gone, and they point to Rig's own roadmap instead. The audit's actual STREAM-9 failure came from a third bullet, the GitHub Desktop Rig difference, which named a tools-rig record and cited a decision by number. It now says the step "is captured in Rig's roadmap on Kris's approval of 2026-10-15". I changed this third bullet because the brief asks for the note to pass the audit.
- GATE-REMAIN, [checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.mac-studio-setup.md): the checkpoint now has the exact H1 and the six sections in order. The Master message block and the "Resuming on sol" section are removed, and the thread working rules sit inside Objective as a bold paragraph rather than a heading. Every live fact is kept:
  - the label and the 2026-10-14T16:47Z mark, plus the earlier marks
  - `ki-pmo read at dfa52a12`
  - the Reporting bullet in the current ki-pmo shape: Done, In Progress, Queries with Context, Query and Options, BST times
  - the machine facts, the firewall facts and what has been handed on
- Current state is condensed into one picture of where things stand. Open with Kris: SOL-APPLY; SOL-CLT, a single session that also covers `brew reinstall pkgconf`, `rig upgrade`, KB-DOTFILES-UE-086 section C, the mise prune and SOL-TELEGRAM (now the Homebrew cask route); and TERRA-READ. Running: `local-push`. Settled questions are dropped and the parked list is kept. RIG-SOL-BREW, the cask route and LOCAL-PUSH are added to Decisions made.
- Link corrections: the old checkpoint linked four records that have since closed. I checked each one and now link it to its last revision:
  - [KI-TOOL-RIG-CORE-051 (pruned)](https://github.com/knowledgeislands/tools-rig/blob/06da52aec5de300f03386efbdb637af1873c18d0/docs/roadmap/KI-TOOL-RIG-CORE-051-linux-tailnet-only-firewall.md) is accepted.
  - [KI-TOOL-RIG-CORE-046 (pruned)](https://github.com/knowledgeislands/tools-rig/blob/06da52aec5de300f03386efbdb637af1873c18d0/docs/roadmap/KI-TOOL-RIG-CORE-046-remote-access-and-continuity.md) was cancelled, and its substance is the idea in the Project note.
  - [KI-TECHNE-OPS-026 (pruned)](https://github.com/knowledgeislands/ki-techne-harness/blob/e2a1f48a845b649546d930eac92ab8f321f7d06b/docs/roadmap/KI-TECHNE-OPS-026-agent-host-tailnet-only-firewall.md) is merged into [KI-TECHNE-OPS-018](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-018-converge-tools-through-rig.md).
  - [KI-HARNESS-GOV-117 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/924b420d3497584b209fcaab0191fc2ad29f2b04/docs/roadmap/KI-HARNESS-GOV-117-govern-hooks-beyond-packages.md) is done.

  The [KB-DOTFILES-UE-090](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-090-close-rig-bring-up-gaps.md) link uses the record's real filename.
- Checks: `ki repo audit` no longer reports RECORD-2, BOUNDARY-1 or STREAM-9 for these two files, and the Markdown mechanical check flags neither file. The audit as a whole still fails, but only on findings that were already there and are unrelated; none was fixed:
  - ki-authoring MD-mech, on line length in other thread reports and `+/_THREADS/ways-of-working/decisions.md`
  - ki-checkpoint LIFECYCLE-1 on `knowledge-islands-model.observatory.md`
  - ki-decision-records BODY-11 on ADR-KI-PRINCIPAL-007
  - ki-engineering TSC-1 and KNIP-2
- Commits on ki-principal `main`, both pushed fast-forward to origin and now level, with the commit gate passing and no `--no-verify`:
  - `07dc0e7` docs(checkpoint): conform rig.mac-studio-bootstrap and unname records in its Project note
  - `30e4835` corrects both files' update times to the commit time. The first commit had stamped them a few minutes ahead of the clock.

## In Progress

Nothing is running in this run. The thread's `local-push` run, started separately, is still listed as running in the checkpoint.

Outstanding - no action requested now: SOL-APPLY, SOL-CLT (with SOL-TELEGRAM) and TERRA-READ are open with Kris, as the checkpoint records. The pre-existing audit failures listed under Done belong to other threads and records.

## Queries

No outstanding queries

```text
No reply needed.
```

```text
╭─ run report · 2026-10-14T23:50:31Z ──────────────╮
│                                                  │
│  █▀▀▄ █  █ █▀▀▀ █  █   · thread busy             │
│  █▀▀▄ █  █ ▀▀▀█  ▀█▀   · running or queued work  │
│  █▄▄▀ █▄▄█ ▄▄▄█   █    · lines below say which   │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [running] local-push - push chezmoi and tools-rig from sol
- [committed] checkpoint and Project note, pushed
