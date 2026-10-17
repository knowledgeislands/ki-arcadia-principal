---
type: ki-checkpoint
thread: knowledge-islands-model.observatory
label: 'Observatory: product'
state: active
created_at: 2026-10-13T23:50:00Z
updated_at: 2026-10-14T00:01:00Z
---

# knowledge-islands-model.observatory

**Messages from Master: state-of-play** - the receiving thread acts on each line, then removes it.

- 2026-10-17 · INTERIM-MESSAGING · Master: state-of-play, on Kris's DISPATCH-ORDER of 17 October: "Until ways of working sets the standard, re-read this Messages block at every Summary as well as at bootstrap, act on each line, then remove it; any coordination thread may write a line into another's block." Kind: ready · detail: [themes.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/themes.md)
- 2026-10-17 · DIAGRAMS-NOW · Kris, 17 October 13:30 BST: "a picture or a diagram, just like we've got in KI diagrams, or whatever it's called, diagramming, is worth a thousand words. So if you're going to do something, I'm more than happy to see a markdown file with some of those embedded in it so that I can better understand what's going on." Kind: ready, applies to every design or consolidation this thread writes · logged in the [state-of-play decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/decisions.md) · detail: [themes.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/themes.md)
- 2026-10-17 · RESTART-ORDER · Master: state-of-play, on Kris's DISPATCH-ORDER of 17 October ("before you start any of the threads up, you should get this list of yours dispatched to all the right places. And then the next thing to work up will be the ways of working"): "Do not restart until ways of working reports ready to Kris and Master: state-of-play" · restart order in the [consolidate report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/consolidate.report.md) · detail: [themes.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/themes.md)
- 2026-10-17 · FAVICONS · Kris, 17 October: "on the observatory or even headroom, which both run as local host services. Can we get some kind of fav icon on those? ... I often pin these ... a really good, clear icon that can be seen at that size". Kind: query; the Observatory icon is on `origin/main` of apps-observatory.local awaiting a service restart, nothing new to build; OBS-RESTART and HEADROOM-ICON are open in the [favicons report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-setup/favicons.report.md); captured; waits on Kris's FAVICON-FOLLOWUPS · logged in the [state-of-play decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/decisions.md) · detail: [themes.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/themes.md)
- 2026-10-15 · GATE-REMAIN · `ki repo audit` still fails this checkpoint, and the fix is this thread's: LIFECYCLE-1, a checkpoint in `+/_CHECKPOINTS/` must have `state: active` (it reads `resting`)

2026-10-15: the state-of-play territory hold set this checkpoint to drained without the thread's own drain; the next steps are those already in this checkpoint.

## Objective

Reconstruct the `Observatory: product` thread if its session is lost. The thread owns product work in `apps-observatory.local` (`knowledgeislands/apps-observatory.local`, working directory `~/workspaces/knowledge-islands/apps-observatory.local`), opened by the state-of-play master under Decision 157. It sits in the [[knowledge-islands-model|Knowledge Islands model]] Initiative. No Observatory Project note exists in the registry; the related [[command-centre]] Project consumes the Observatory for its state-of-play view but does not own the product.

Focus (Decision 158): burn the Observatory roadmap down. No new feature records; capture only blockers, defects or items Kris asks for, and prefer closing, merging or rejecting existing records.

## Current state

Mark: 2026-10-14T00:01Z, state-of-play decisions log at Decision 160

- **Running.** Nothing.
- **Roadmap.** Empty: no open records in `docs/roadmap/`. The repository is level with origin at `74a0eea`.
- **KI-OBSERVA-INT-002 accepted.** Kris reviewed it in the Observatory and in Cowork and passed it (Decision 160). Closed as done in `0cf59ec` ([record at that commit](https://github.com/knowledgeislands/apps-observatory.local/blob/0cf59ec/docs/roadmap/KI-OBSERVA-INT-002-portable-live-artifact-interface.md)) and pruned in `74a0eea`. Its follow-on work was not captured as records, under Decision 158; the ChatGPT publication server and a confirmed write operation joined the deferrals under Gaps in `docs/specs/artifacts.md`.
- **Resting.** Under Decision 158 the thread rests until a defect or Kris's request arrives.
- **Restart due.** The local service may still serve an earlier build; the accept commits changed documents only.
- **Run material.** The `observa-002`, `observa-002-build`, `observa-tabfix` and `observa-accept` reports in `~/.local/state/ki/agents/state-of-play/` hold the delivery and acceptance evidence.

Thread rules:

- Background agents run through `ki agent` under run name `observatory`, with status, reports and the thread's decisions log in `~/.local/state/ki/agents/observatory/`.
- Commit with explicit paths only; push own commits fast-forward only.
- `ki-accept` closes a record only with Kris's approval.
- Cross-repository needs go to the receiving repository's roadmap as a handoff, or through state-of-play.

## Decisions made

- The thread exists to burn the Observatory roadmap down, starting with KI-OBSERVA-INT-002 (state-of-play Decisions 157 and 158).
- KI-OBSERVA-INT-002 accepted on Kris's review pass (state-of-play Decision 160).

## Files touched

- `apps-observatory.local`: `docs/roadmap/KI-OBSERVA-INT-002-portable-live-artifact-interface.md` (closed, then pruned) and `docs/specs/artifacts.md` (two Gaps).

## Open questions

None.

## Next step

Rest. On a defect report or Kris's request, capture it under Decision 158, plan and deliver it, and take it through Kris's review and `ki-accept`.
