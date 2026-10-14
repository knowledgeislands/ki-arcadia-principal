# Capture-sweep-2 report (2026-10-09)

Authority: Decision 23 in the state-of-play decisions log (everything captured in Projects and threads). My only changes were the small fixes that brief allows: adding `project` fields.

## Done

- **Owning Project added to 13 records, pushed fast-forward:**
  - ki-agentic-harness `f70599fc`: KI-HARNESS-GOV-158, KI-HARNESS-GOV-163 and KI-HARNESS-GOV-168 → baseline-rollout; KI-HARNESS-GOV-169 → ways-of-working (Decision 18; clears ways-of-working's STREAM-10 warning).
  - ki-arcadia-principal `d78645d`: KI-ARCADIA-MOD-007 → island-model-and-tending (Decision 18).
  - tools-techne `7e8ee23`: TECHNE-TOOL-CLI-006, TECHNE-TOOL-CLI-007 and TECHNE-TOOL-CLI-008 → agent-host.
  - tools-ki `6b8954d`: KI-TOOL-CLI-115 → agent-host.
  - tools-rig `a1cc074`: RIG-CORE-041, RIG-CORE-042 and RIG-DIST-010 → mac-studio-bootstrap (the thread that raised them).
  - chezmoi `ed321f8`: DOTFILES-UE-076 → mac-studio-bootstrap.
  - On GOV-163, GOV-168 and GOV-169 the new `project` replaced the old `initiative: platform-foundations`. The standard treats naming both as redundant, and GOV-169's Initiative would otherwise contradict its Project's.
- **Checks:** the `ki-work-roadmap` audit passes in all six worktrees. chezmoi has one existing ITEM-2 warning, which is the same on its primary. The Arcadia `ki-repo-kb-streams` audit has no failures. The harness commit gate passed.
- **Open records in Knowledge Islands repositories (open count, then how many name a Project):**

| Repository | Open before → after | Named a Project before → after |
| --- | --- | --- |
| [chezmoi](/Users/krisbrown/.local/share/chezmoi/docs/roadmap) † | 14 → 11 | 5 → 6 (3 more are Rig upkeep) |
| [ki-agentic-harness](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap) | 6 → 6 | 2 → 6 |
| [ki-arcadia-principal](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap) | 6 → 6 | 5 → 6 |
| [ki-techne-harness](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap) † | 8 → 7 | 8 → 7 (all) |
| [tools-techne](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-techne/docs/roadmap) | 3 → 3 | 0 → 3 |
| [tools-rig](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap) | 3 → 3 | 0 → 3 |
| [tools-ki](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/docs/roadmap) | 1 → 1 | 0 → 1 |
| [ki-website](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-website/docs/roadmap) | 3 → 3 | 2 → 2 |
| [apps-observatory](/Users/krisbrown/workspaces/kit/knowledgeislands/apps-observatory/docs/roadmap) | 1 → 1 | 0 → 0 |
| **Total** | **45 → 41** | **22 → 34** |

† The other threads closed records during the sweep; I closed none.

- **Other territories, counted and flagged only (none has a Project registry):**

| Repository | Open | Not updated since August |
| --- | --- | --- |
| er-agentic-harness | 22 | 22 |
| kit-principal | 28 | 4 |
| kit-legal | 19 | 7 |
| kit-hnr | 14 | 0 |
| 5g-emerge-phase3 | 12 | 0 ‡ |
| infoschematics | 8 | 0 |
| vallearmonia-website | 8 | 3 |
| 5g-emerge-phase2 | 5 | 0 |
| kit-techmedix | 4 | 1 |
| hnr-agentic-harness | 4 | 0 |
| mark-markhowarth.com | 4 | 0 |
| vallearmonia-principal | 3 | 0 |
| er-research | 6 | 0 |
| 5g-emerge-demos | 1 | 0 |

‡ The roadmap audit fails across the repository (ITEM-1 and ITEM-2); see close-other's report.

## Failed

- None.

## Needs Kris

Each item has a tag so you can approve them in batches ("approve IDEA-1 to IDEA-4", for example).

### Threads and Projects

- **THREAD-1: Rig: chezmoi thread has no Project.** All its current work is the two secrets-hygiene records, [DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-077-reorganise-1password-vaults-safely.md) and [DOTFILES-UE-078](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-078-repeatable-1password-triage.md), but [secrets-hygiene](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/secrets-hygiene.md) still says `planned`. _Recommend:_ make secrets-hygiene `active` and record that the Rig: chezmoi thread is its thread. The four Kris-gated Rig upkeep records stay Initiative-level and need no Project: DOTFILES-UE-027, DOTFILES-UE-062, DOTFILES-UE-065 and DOTFILES-UE-071.
- **THREAD-2: Projects with open records but no thread or queue place.**
  - [knowledge-acquisition](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/knowledge-acquisition.md): KI-HARNESS-OPS-005 is in progress, KI-ARCADIA-MOD-006 is ready and DOTFILES-UE-035 is on hold.
  - [paperclip-bootstrap-and-recovery](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/paperclip-bootstrap-and-recovery.md): KI-HARNESS-RTP-015 is ready.
  - [estate-factorisation](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/estate-factorisation.md): KI-ARCADIA-GOV-030 is waiting on your note edit.
  - [delta-evaluation](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/delta-evaluation.md): KI-ARCADIA-OPS-013 is due on or after 2026-10-13.

  _Recommend:_ add knowledge-acquisition to the queue as number 4, because it has work in flight. Keep the other three as master-held decisions with no thread.
- **THREAD-3: master checkpoint is out of date.** [_state-of-play](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/_state-of-play.md) says delta-evaluation has no open records, but KI-ARCADIA-OPS-013 names it. _Recommend:_ the master corrects this line.
- **THREAD-4: the [specifications](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/specifications.md) Project is paused with no open records** (it warns STREAM-10). _Recommend:_ write its close-out assessment or mark it `cancelled`. Its remaining work now sits in specification-review.

### Records with no Project (ORPHAN)

- **ORPHAN-1:** [DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) belongs to mac-studio-bootstrap. I skipped it because it is mid-edit on the chezmoi primary. _Recommend:_ the mac-studio-bootstrap thread adds the field.
- **ORPHAN-2:** [DOTFILES-UE-071](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-071-audit-macos-privacy-permissions.md) has no Project and no Initiative. _Recommend:_ `initiative: ki-arcadia-principal/rig`, as Rig upkeep.
- **ORPHAN-3:** [DOTFILES-UE-072](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-072-machine-neutral-two-checkout-rule.md) (held) has no Project. Agent-host Decisions 10 and 11 put the two-checkout rules in the recipe itself. _Recommend:_ cancel it as superseded by the agent-host recipe, or give it `project: ki-arcadia-principal/agent-host` if you still want the personal wording.
- **ORPHAN-4:** [KI-OBS-OPS-002](/Users/krisbrown/workspaces/kit/knowledgeislands/apps-observatory/docs/roadmap/KI-OBS-OPS-002-adopt-ki-diagrams-for-the-diagram-set.md) (adopt `ki-diagrams`) has no Project. _Recommend:_ do it as a minor rollout change without a record, then cancel the record, or give it `project: baseline-rollout`.
- **ORPHAN-5:** [KI-WEB-SITE-043](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-website/docs/roadmap/KI-WEB-SITE-043-add-a-skills-by-outcome-entry-for-keeping-diagrams.md) (one row in the skills-by-outcome table) has no Project, and the paused website Project does not cover it. _Recommend:_ make it a minor direct change and cancel the record, together with ORPHAN-4.

### Records better kept as a one-line idea (IDEA)

- **IDEA-1:** [KI-HARNESS-GOV-163](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-163-bun-boundary-proof-adapter.md) (Bun boundary proof adapter, deferred in Decision 10). _Recommend:_ cancel it and keep it as an idea in the baseline-rollout note.
- **IDEA-2:** [TECHNE-TOOLS-OPS-021](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-021-owned-host-provider.md) and its pair [TECHNE-TOOL-CLI-007](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-techne/docs/roadmap/TECHNE-TOOL-CLI-007-owned-host-adapter.md) (the owned-host provider). Both are triage with no owned host planned. _Recommend:_ cancel both and keep them as one "owned-host provider" idea in the agent-host note.
- **IDEA-3:** [TECHNE-TOOLS-OPS-020](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-020-split-the-operator-guide.md) (split the operator guide), a small docs tidy. _Recommend:_ do it as a minor change in the agent-host thread, or keep it as an idea.

### Possible duplicates (DUP)

- **DUP-1:** [KI-ARCADIA-ECO-011](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-ECO-011-assess-the-estate-baseline.md) (assess the estate baseline, deferred) overlaps the baseline-rollout outcome and the "fresh audit evidence" stage of KI-HARNESS-GOV-158. _Recommend:_ the baseline-rollout thread merges it into GOV-158's convergence stage, or keeps it as the Project's measurement record. Decide when that thread opens.

### Tangents with no durable home (TANGENT)

These exist only in checkpoints, which are temporary.

- **TANGENT-1:** two tangents parked on 2026-10-09 in the [island-model-and-tending checkpoint](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/knowledge-islands-model.island-model-and-tending.md), review tags and Admin conventions. _Recommend:_ add each as an idea line in the island-model-and-tending Project note.
- **TANGENT-2:** the Markdown-flavour tangent in the [ways-of-working checkpoint](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md), plus the three-thread cap, which is not yet in `ki-delegation`. _Recommend:_ add both as idea lines in the ways-of-working note.
- **TANGENT-3:** the machine-naming convention in the [agent-host checkpoint](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/techne.agent-host.md), Decision 29(a): solar-system names for machines and moons for peripherals. It is waiting to be handed to Rig and has no home. _Recommend:_ add it as a line in the Rig Initiative note.
- **TANGENT-4:** the Granola "dropped meeting" disposition idea sits in the baseline-rollout note, where it does not belong. _Recommend:_ move it to the knowledge-acquisition note.
- **TANGENT-5:** rolling the Knowledge Islands shape out to your other territories ([territory-rollout checkpoint](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/knowledge-islands-model.territory-rollout.md)) still has no Project. This is known and you deferred it. No action now.

### Other territories (flag only, for later)

- **OTHER-1:** all 22 records in er-agentic-harness have been untouched since before September. They look stale and are the first candidates for a bulk review when other territories start.

### Housekeeping

- **SYNC-1:** three primary checkouts are one commit behind origin, because other threads have uncommitted edits to the same records I changed. Their owners should pull when they commit; I left them alone.
  - ki-arcadia-principal: `rig.mac-studio-bootstrap.md`.
  - tools-rig: RIG-CORE-042.
  - chezmoi: DOTFILES-UE-062, DOTFILES-UE-076 and DOTFILES-UE-079.

  My changes touch only the front matter, so the pulls should merge cleanly.
- The first `capture-sweep` run's status still says "launched" and it wrote no report. It looks superseded by this run.
