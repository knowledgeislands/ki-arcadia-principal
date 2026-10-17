# [Rig](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md>) › [chezmoi](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/chezmoi.md>) › source-preflight-20261017

**Run report at 01:31 BST · last mark 15:59 BST (15 October 2026)**

---

## Done

Corrected the [checkpoint](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.chezmoi.md>) authority, rest status and pick-up block in `156122c` (published to origin/main). Preserved mark `2026-10-15T14:59Z`, every Master direction including the later SEAT-CHANGE, and the four actual parked choices. FW-DECLARE-NOW and SEAT-BIND/SEAT-HOSTS remain authorised. SOURCE-RESTART is prerequisite tracking; SSH-CONSOLE is approved documentation delivery; RIG-063 release discovery is complete. None is an unanswered approval query. The both-Mac rig-apply hold remains in force without reconfirmation.

Recovered the missing firewall report read-only from `24eb390:+/_THREADS/state-of-play/fw-rollout.report.md` (deleted by `465257f`). A byte-for-byte recovery is in the [launcher evidence file](</Users/krisbrown/.local/state/ki/agents/chezmoi/source-preflight-20261017.fw-rollout.recovered.md>); Git history is the portable source. Parsed its TOML rather than relying on transformed output. The exact declaration is at lines 27-36 of that recovery: `[firewall.screen-sharing-tailnet]`, provider macos-pf, locator uk.me.kris.rig.firewall.screen-sharing, macOS only, TCP/UDP 5900, allow tailnet, profiles laptop only. Commit destination remains `dot_config/rig/conf.d/private_45-firewall.toml`; that source is still absent. Port 22 is excluded; studio is not part of this first declaration.

Inspected the restore procedure at lines 43-47 of the recovered report. It uses terra's physical admin console; sol uses tailnet SSH with physical admin console fallback. The rehearsal is an attended read-only sudo anchor query on each target, with NordVPN on/off SSH survival checked on sol. Emergency recovery stops the Rig firewall daemon before flushing only its anchor, under sudo, without Rig. Removing the catalogue table plus an attended retirement is the durable follow-up; profile deselection alone does not retire it. The historical report describes a rehearsal to perform and supplies no completed same-machine restore evidence. Fixture tests in [KI-TOOL-RIG-CORE-047](</Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md>) do not prove reconnection. This is a missing delivery prerequisite under the existing connection-critical rule, not a new owner approval choice. No live rehearsal or network command was run here.

Assessed the two captured repair plans. [KB-DOTFILES-UE-092](</Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-092-restore-local-skill-projection.md>) correctly restores only the ignored relative Claude projection to the tracked ki-self source, refuses existing content, documents the repeatable setup and verifies byte identity, ignore/tracking and the focused test. It correctly avoids claiming that ki repo repair restores this repository-local projection. The canonical skill exists and the Claude projection remains absent. [KB-DOTFILES-UE-093](</Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-093-restore-emerge-test-prerequisites.md>) follows it sequentially and uses the existing frozen Bun workspace dependency contract with lifecycle scripts disabled, then explicit dependency diagnostics and fixture cleanup while retaining the real missing-session recovery assertion. Node resolution anchored at the real sync-cache.ts still reports MODULE_NOT_FOUND for json5. Both records remain draft Next with preparation-only authority in their current text; this preflight does not promote them, install dependencies or implement test changes. Their verification plans are coherent and bounded; source gates are not currently proven green.

Inspected every divergent chezmoi commit and actual changed paths. The three local commits are `673b999` (reserve the roadmap serial in docs/roadmap/_ISSUES.md), `d81a80c` (capture [KB-DOTFILES-UE-096](</Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-096-thread-identity-hook-registration.md>)) and `d1a6e6d` (reporting wording in dot_claude/private_communication.md, dot_claude/private_delegation.md.tmpl and dot_codex/private_AGENTS.md.tmpl). Incoming `132dd2d` changes .chezmoiignore, tests/codex-trusted-projects.test.mjs, workspaces/personal/dot_mgit.toml and adds workspaces/personal/symlink_dotfiles.tmpl. It registers the existing source as a workspace member, permits rendering its symlink and narrows the test's root-member matcher. It is not documentation-only publication. Paths are disjoint, so a merge preserving both histories is a reasonable recommendation, subject to integration checks; disjoint paths alone do not establish behavioural safety. Chezmoi Git is clean, ahead three/behind one against the existing origin/main tracking ref; no fetch, merge or push was made there. `chezmoi status` succeeded and reports only pending .claude/communication.md, .claude/delegation.md and .codex/AGENTS.md. No full rendering diff was printed because it may expose secrets or invoke credential prompts.

Principal's previous `5ccc8d7` publication block is stale. At first inspection the shared checkout acquired `c2237da` (state-of-play SEAT-CHANGE instruction) and `8d1d2e6` (checkpoint, seat decision, Known Lands, World and Host network update). Another session published those while this preflight ran; this run did not push them. Fresh fetch confirmed Principal level before its own commit and only `156122c` unpublished before its authorised fast-forward push. No other-session commit was merged or pushed by this run.

Checks: scoped Markdown and git diff --check pass; exact checkpoint field set, heading order, non-empty sections, active coordination role, unchanged mark and four parked tags pass. Hook-backed checkpoint commit passed its staged-path gate; post-commit name-status confirmed only the owned checkpoint. The repository-wide checkpoint audit still fails eight existing findings in three other checkpoints; it names no finding in rig.chezmoi. Hook output also exposes unrelated desk-kit note-shape findings and Project close-out warnings outside the staged scope. These are not reported as a clean whole-repository audit. No expensive full source gate was rerun; its two known prerequisites remain absent. The coordinator-owned uncommitted resume decision in [decisions.md](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/chezmoi/decisions.md>) and untracked desk-kit setup-note report are byte-preserved and excluded from this run's commits.

## In Progress

Nothing running or queued for source delivery. This preflight ends with the report handoff; it did not start a source worker or background subagent.

Outstanding - no action requested now: the concrete source sequence is to reconcile the two captured repair plans under their existing readiness/delivery boundaries, complete their sequential repairs and full source verification, and attach actual same-machine restore evidence to the firewall delivery brief. Then deliver the already authorised firewall declaration first, using the recovered table unchanged and laptop-only selection. Capture rig doctor before/after and read every finding, review a bounded non-secret rendering diff and run ki repo audit, the complete Node test glob and rumdl. Stop on an unexplained finding; do not substitute unchanged counts for a clean gate. Commit the verified source separately, then return terra's attended steps to the launcher. No new FW-DECLARE approval is needed.

Follow with SEAT-BIND/SEAT-HOSTS as one host-data change: terra home, sol hub; terra humans-not-robots; sol valle-armonia, sacred-inquiry, techmedix and equal-remedy; knowledge-islands, personal and legal on both, tipped to sol, following the 17 October SEAT-CHANGE. Then address PAPERCLIP-OFF safeguards: preserve the legacy declaration, plist and scripts; source already says stopped/manual and laptop-profile only, but that does not establish both-Mac live unload/non-use. Verify each host in its authorised session before claiming completion, and prevent apply/load until the per-host rebuild. No live service or environment operation belongs to this preflight.

Deliver the already approved physical-console fallback in the [macOS workstation guide](</Users/krisbrown/.local/share/chezmoi/docs/guides/user/macos-workstation.md>) as documentation, preserving the existing verified SSH rollout evidence and acknowledging that its requested before-terra ordering cannot be recreated retrospectively. No spare-key choice, SSH reapply or new owner gate is needed. The completed v0.6.3 lookup does not lift the existing both-Mac rig-apply hold. Sol must be verified at Rig 0.6.0 or later before any chezmoi apply carrying the firewall declaration; no apply is authorised here.

For chezmoi publication, recommend the owning session recheck/fetch its divergence, preserve the three documentation commits and incoming workspace registration through a merge, inspect the result and run its complete gate after prerequisite repair. Keep managed target application separately reviewed. This recommendation grants neither merge nor publication authority for those other-session commits; this run performs neither. Rig-vault, macOS-settings, held privacy/rationale work and existing receiver-owned dependencies remain outstanding in their owning records, without new feature capture, acceptance or pruning.

## Queries

The following four choices remain parked; no answer is required to preserve the existing firewall, host-binding or SSH-console authorisations.

### IWORK - [Finish the iWork source step](</Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md>)

**Context:** Keynote, Numbers and Pages remain catalogue-only in the approved burn-down report. The later native MAS fix does not by itself answer this completion choice.

**Query:** How should the iWork part of A8 finish?

**Options:**

a) (recommended) Keep Keynote, Numbers and Pages catalogue-only and complete the A8 source step, retaining owner review and acceptance.

b) Check App Store identifiers on sol and propose explicit MAS routes before changing the record.

### STYLE-LINK - [Warn about a missing output style](</Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-090-close-rig-bring-up-gaps.md>)

**Context:** The output-style link depends on the harness checkout. A read-only warning and an apply-time pull were offered; neither choice is approved.

**Query:** Which handling should be planned?

**Options:**

a) (recommended) Add a read-only dead-link check after apply, with no harness pull during apply.

b) Plan an apply-time harness fast-forward instead, subject to separate approval.

### DIR-PRUNE - [Remove retired managed directory entries](</Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-090-close-rig-bring-up-gaps.md>)

**Context:** The current merge unions additionalDirectories. Removal needs a declared ownership model so hand-added paths survive.

**Query:** Which pruning model should be planned?

**Options:**

a) (recommended) Record the previously managed additionalDirectories set in a state file and prune only entries that left that declaration.

b) Replace paths under workspaces and OneDrive, accepting loss of hand-added entries there.

### REST-HOLD - [Keep the remaining bring-up work parked](</Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-091-shared-dock-tool-links.md>)

**Context:** Dock work still waits on the Rig profile-filter implementation: its record remains ready, not delivered. The completed release lookup found v0.6.3; it did not resolve this dependency. The remaining bring-up gaps also depend on the Headroom profile work or fresh planning.

**Query:** Continue the recommended hold or plan independent gaps?

**Options:**

a) (recommended) Hold the Dock work and remaining bring-up work until CORE-042 is released and the Headroom profile work is delivered.

b) Plan bring-up gaps 7 to 9 separately for review.

```text
IWORK

Keep Keynote, Numbers and Pages catalogue-only and complete the A8 source step, retaining owner review and acceptance.

---

STYLE-LINK

Add a read-only dead-link check after apply, with no harness pull during apply.

---

DIR-PRUNE

Record the previously managed additionalDirectories set in a state file and prune only entries that left that declaration.

---

REST-HOLD

Hold the Dock work and remaining bring-up work until CORE-042 is released and the Headroom profile work is delivered.
```

```text
╭─ run report · 2026-10-17T00:31:01Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] no source delivery running or queued
- [prerequisite] source-gate repair delivery and tested firewall restore evidence
- [parked] IWORK, STYLE-LINK, DIR-PRUNE, REST-HOLD
- [held] rig apply on both Macs under the existing instruction
- [published] owned checkpoint documentation; companion report committed and published only if its own commit alone is unpublished

```text
Resume Rig: chezmoi under current ki-pmo and ki-delegation since 2026-10-15T14:59Z: re-bootstrap, read the pick-up block, take stock, carry forward the four parked choices, restart authorised work within its prerequisites, then banner. Do not move the mark without Kris asking.
```
