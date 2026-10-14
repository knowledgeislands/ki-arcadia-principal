# territory-masters report

## Done

- **ki-agentic-harness** — `6a7df764` docs(ki-delegation): add the territory master thread and thread openers; `3d8f3b6a` docs(ki-delegation): give each territory master its own run name. Both pushed to `main`; primary fast-forwarded. New § Territory master thread and § Opening a thread (with master and Project openers) in [the background-run standard](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md); RUN-3 wording and `references/rubric.md` updated (`ki dev skill rubric` reports in sync); `ki-checkpoint` names `_state-of-play` as the territory Capital's master. Checks: `bun run test` 1072 pass / 0 fail; `tsc` clean; `ki repo audit` ki-delegation PASS, ki-checkpoint PASS, ki-authoring PASS, ki-skills WARN only (LONG-3 refresh cadence, pre-existing).
- Each Capital below: `+/_CHECKPOINTS/_state-of-play.md` created (six sections), `ki repo audit --skill ki-checkpoint` PASS (kit-hnr: WARN only, missing `label` on four existing checkpoints), committed `docs(checkpoint): open the territory master thread` and pushed fast-forward:
  - **kit-hnr** — `7cebd7a`, pushed. [checkpoint](/Users/krisbrown/workspaces/hnr/kis/kit-hnr/+/_CHECKPOINTS/_state-of-play.md)
  - **er-research** — `f33798f`, pushed. [checkpoint](/Users/krisbrown/workspaces/kit/equalremedy/er-research/+/_CHECKPOINTS/_state-of-play.md)
  - **vallearmonia-principal** — `f2cf54d`, pushed. [checkpoint](/Users/krisbrown/workspaces/kit/vallearmonia/vallearmonia-principal/+/_CHECKPOINTS/_state-of-play.md)
  - **kit-techmedix** — `de0eae7`, pushed. [checkpoint](/Users/krisbrown/workspaces/kit/techmedix/kit-techmedix/+/_CHECKPOINTS/_state-of-play.md)
  - **kit-legal** — `4ecd5d4f`, pushed. [checkpoint](/Users/krisbrown/workspaces/kit/legal/kit-legal/+/_CHECKPOINTS/_state-of-play.md)
  - **kit-principal** — `7403078`, pushed. [checkpoint](/Users/krisbrown/workspaces/kit/personal/kit-principal/+/_CHECKPOINTS/_state-of-play.md)
- Config: `[skills.ki-checkpoint]` added to er-research, vallearmonia-principal, kit-techmedix, kit-legal, kit-principal; `[skills.ki-delegation]` added to kit-hnr, er-research, vallearmonia-principal, kit-principal (kit-legal already had it). Canonical `+/_CHECKPOINTS/README.md` scaffold added where missing and restored in kit-hnr (it was the older text and failed STRUCTURE-1).
- Primaries fast-forwarded: er-research, kit-techmedix, kit-legal, kit-principal. Worktrees and branches removed.

## Failed

- None. (`ki registry list --territory` does not exist in this `ki`; used `ki territory show -t` instead.)

## Needs Kris

- **TMX-DELEG** — kit-techmedix does not declare `ki-delegation`: declaring it makes the audit fail (48 PACKET-1 findings) on the incomplete `## Delegation` packet in [TMX-CO-002](/Users/krisbrown/workspaces/kit/techmedix/kit-techmedix/Streams/Roadmap/TMX-CO-002-finance-evidence-register.md). Recommend: the techmedix master thread completes or removes that packet, then declares the skill.
- **HNR-PRIMARY** — kit-hnr primary is ahead 1 (`d81fead`, checkpoints) and behind 2; not fast-forwarded. Pull with rebase before opening its master thread.
- **VA-PRIMARY** — vallearmonia-principal primary (owned by another thread) is ahead 3, behind 3; untouched. Its unpushed commits add the same `[skills.ki-checkpoint]` line at the same place and the same README, so its rebase should be clean; the master checkpoint links its unpushed community-presence checkpoint.
- **HNR-LABELS** — kit-hnr's four existing checkpoints lack `label` and the `<initiative>.<project>` name; rename them once their Initiatives exist.
- **TM-CONFIRM** — confirm each Capital's proposed Initiatives and Projects (below), then paste its opener into a fresh thread in that Capital in Zed:

### Humans Not Robots — kit-hnr

**5G-EMERGE** (Projects phase2, phase3, demos — the existing phase2/phase3 checkpoints become their threads); **Company** (finance, knowledge-base incl. HNR harness and hnr-principal-consolidation); **Product** (product-strategy, infoschematics).

```text
Bootstrap as the state-of-play territory master thread for humans-not-robots under ki-delegation.
Label: Master: state-of-play. Checkpoint: +/_CHECKPOINTS/_state-of-play.md in kit-hnr (/Users/krisbrown/workspaces/hnr/kis/kit-hnr).
Project management only: priorities, the Project-thread queue (cap three or four), decisions and releases; route real work to Project threads.
Background agents: run substantive work through `ki agent` in run `humans-not-robots-state-of-play`; stay responsive.
Steering: my messages steer; stop or abort only when I expressly say so, naming the work.
First step: follow the Bootstrap in ki-delegation, then report in three lines and ask me to confirm the proposed Initiatives and Projects in the checkpoint's Open questions.
```

### Equal Remedy — er-research

**Legal practice capabilities** (capability-portfolio: `ER-HARNESS-001` to `-022`); **Campaign research** (policy-and-parliament, media-outreach: `ER-RESEARCH-004` to `-008`). Nearly all Future, so one thread now.

```text
Bootstrap as the state-of-play territory master thread for equal-remedy under ki-delegation.
Label: Master: state-of-play. Checkpoint: +/_CHECKPOINTS/_state-of-play.md in er-research (/Users/krisbrown/workspaces/kit/equalremedy/er-research).
Project management only: priorities, the Project-thread queue (cap three or four), decisions and releases; route real work to Project threads.
Background agents: run substantive work through `ki agent` in run `equal-remedy-state-of-play`; stay responsive.
Steering: my messages steer; stop or abort only when I expressly say so, naming the work.
First step: follow the Bootstrap in ki-delegation, then report in three lines and ask me to confirm the proposed Initiatives and Projects in the checkpoint's Open questions.
```

### Valle Armonia — vallearmonia-principal

**Community presence** (website, social-and-identity — the existing community-presence checkpoint is the first thread); **Mark Howarth site** (`VA-MARK-*`, if it belongs here); **Company** (operations).

```text
Bootstrap as the state-of-play territory master thread for valle-armonia under ki-delegation.
Label: Master: state-of-play. Checkpoint: +/_CHECKPOINTS/_state-of-play.md in vallearmonia-principal (/Users/krisbrown/workspaces/kit/vallearmonia/vallearmonia-principal).
Project management only: priorities, the Project-thread queue (cap three or four), decisions and releases; route real work to Project threads.
Background agents: run substantive work through `ki agent` in run `valle-armonia-state-of-play`; stay responsive.
Steering: my messages steer; stop or abort only when I expressly say so, naming the work.
First step: follow the Bootstrap in ki-delegation, then report in three lines and ask me to confirm the proposed Initiatives and Projects in the checkpoint's Open questions.
```

### TechMedix — kit-techmedix

**Company record** (finance-and-compliance: `TMX-CO-002`, `-006`; commercial-spine: `TMX-CO-001`). One thread is enough.

```text
Bootstrap as the state-of-play territory master thread for techmedix under ki-delegation.
Label: Master: state-of-play. Checkpoint: +/_CHECKPOINTS/_state-of-play.md in kit-techmedix (/Users/krisbrown/workspaces/kit/techmedix/kit-techmedix).
Project management only: priorities, the Project-thread queue (cap three or four), decisions and releases; route real work to Project threads.
Background agents: run substantive work through `ki agent` in run `techmedix-state-of-play`; stay responsive.
Steering: my messages steer; stop or abort only when I expressly say so, naming the work.
First step: follow the Bootstrap in ki-delegation, then report in three lines and ask me to confirm the proposed Initiatives and Projects in the checkpoint's Open questions.
```

### Legal — kit-legal

New **Casework** Initiative (family-court, evidence); existing **Repository Operations** Initiative (bounded-legal-tidy — existing Project, command-centre, intake).

```text
Bootstrap as the state-of-play territory master thread for legal under ki-delegation.
Label: Master: state-of-play. Checkpoint: +/_CHECKPOINTS/_state-of-play.md in kit-legal (/Users/krisbrown/workspaces/kit/legal/kit-legal).
Project management only: priorities, the Project-thread queue (cap three or four), decisions and releases; route real work to Project threads.
Background agents: run substantive work through `ki agent` in run `legal-state-of-play`; stay responsive.
Steering: my messages steer; stop or abort only when I expressly say so, naming the work.
First step: follow the Bootstrap in ki-delegation, then report in three lines and ask me to confirm the proposed Initiatives and Projects in the checkpoint's Open questions.
```

### Personal — kit-principal

**Knowledge acquisition** (personal-capture, incl. `KIT-036`); **Life admin** (household-and-finance, family-and-friends); **Thinking and research** (intentional-life). chezmoi `DOTFILES-UE-*` records stay with Arcadia's threads.

```text
Bootstrap as the state-of-play territory master thread for personal under ki-delegation.
Label: Master: state-of-play. Checkpoint: +/_CHECKPOINTS/_state-of-play.md in kit-principal (/Users/krisbrown/workspaces/kit/personal/kit-principal).
Project management only: priorities, the Project-thread queue (cap three or four), decisions and releases; route real work to Project threads.
Background agents: run substantive work through `ki agent` in run `personal-state-of-play`; stay responsive.
Steering: my messages steer; stop or abort only when I expressly say so, naming the work.
First step: follow the Bootstrap in ki-delegation, then report in three lines and ask me to confirm the proposed Initiatives and Projects in the checkpoint's Open questions.
```
