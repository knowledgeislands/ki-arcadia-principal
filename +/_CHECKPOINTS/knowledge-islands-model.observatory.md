---
type: ki-checkpoint
thread: knowledge-islands-model.observatory
label: 'Observatory: product'
state: active
created_at: 2026-10-13T23:50:00Z
updated_at: 2026-10-13T23:50:00Z
---

# knowledge-islands-model.observatory

## Objective

Reconstruct the `Observatory: product` thread if its session is lost. The thread owns product work in `apps-observatory.local` (`knowledgeislands/apps-observatory.local`, working directory `~/workspaces/knowledge-islands/apps-observatory.local`), opened by the state-of-play master under Decision 157. It sits in the [[knowledge-islands-model|Knowledge Islands model]] Initiative. No Observatory Project note exists in the registry; the related [[command-centre]] Project consumes the Observatory for its state-of-play view but does not own the product.

Focus (Decision 158): burn the Observatory roadmap down. No new feature records; capture only blockers, defects or items Kris asks for, and prefer closing, merging or rejecting existing records.

## Current state

Mark: 2026-10-13T23:50Z, state-of-play decisions log at Decision 158

- **Roadmap.** One open record: [KI-OBSERVA-INT-002](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/roadmap/KI-OBSERVA-INT-002-portable-live-artifact-interface.md) (horizon `now`, `awaiting-review`). The repository is level with origin at `aa11699`.
- **KI-OBSERVA-INT-002.** Delivered with the MCP Apps bridge, then fixed for the artifacts view overlapping other views (pushed `80fbb8a..aa11699`; tests, typecheck, build, browser smoke and `ki repo audit` pass). Opening the two proof artifacts in Cowork was not tested and is left for Kris's review.
- **Run material.** The `observa-002`, `observa-002-build` and `observa-tabfix` reports in `~/.local/state/ki/agents/state-of-play/` hold the delivery evidence and the review steps.

Thread rules:

- Background agents run through `ki agent` under run name `observatory`, with status, reports and the thread's decisions log in `~/.local/state/ki/agents/observatory/`.
- Commit with explicit paths only; push own commits fast-forward only.
- `ki-accept` closes a record only with Kris's approval.
- Cross-repository needs go to the receiving repository's roadmap as a handoff, or through state-of-play.

## Decisions made

- The thread exists to burn the Observatory roadmap down, starting with KI-OBSERVA-INT-002 (state-of-play Decisions 157 and 158).

## Files touched

None yet beyond this checkpoint.

## Open questions

For Kris:

- **OBSERVA-002-REVIEW:** review [KI-OBSERVA-INT-002](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/roadmap/KI-OBSERVA-INT-002-portable-live-artifact-interface.md).
  1. Restart the service: `launchctl kickstart -k "gui/$(id -u)/uk.me.kris.rig.observatory"`.
  2. Open `http://127.0.0.1:1675/?view=artifacts`, open HNR Council, switch to another view and back, use Back and Forward, and reload: each view stands alone.
  3. Open the two proof artifacts, `hnr-council` (hnr-principal) and `legal-activity-status` (legal-principal), in Cowork and confirm they still draw.
  4. Accept, or name what to fix.

## Next step

Shepherd KI-OBSERVA-INT-002 through Kris's review in that order, then run `ki-accept` on approval and work the roadmap to zero.
