# chatgpt-bind report

Authority: knowledge-acquisition Decision 1 (2026-10-14). Record: [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md), still `in-progress`.

## Done

- **Project names preserved.** I copied the pre-rename project list unchanged into the `sources-personal` store as `+/chatgpt-export-project-names-2026-10-12.tsv`. Its SHA-256 matches the source file: `eaeb39a71221ed78a668bf1b5afa09c48fdc266ac4cabddf5e315c06e195b268`.
- **All 17 project identifiers bound.** Each one now has its current name, its prior names and a territory key, in the record's routing inventory. Three bindings are provisional, listed under Needs below. One of them, Equal Remedy, binds to `equal-remedy`: the plan to rename it Legal: Financial Remedy was never applied, and its chats are about the Equal Remedy organisation.
- **Whole export converted and staged.** All 334 conversations are in `krisb/acquire`, one checksummed package each. The existing `ki acquire import --adapter chatgpt` did the staging, so no tools-ki code was needed. They are under `captures/<territory>/chatgpt/account-export-2026-09-22/`:

  | Territory | Conversations |
  | --- | --- |
  | personal | 85 |
  | legal | 102 |
  | humans-not-robots | 66 |
  | knowledge-islands | 55 |
  | equal-remedy | 5 |
  | `_review` | 21 |

  The `_review` count is The Tower Game's 15 conversations plus the 6 that sit outside any project. No read failed and no mappings overlapped.
- **What each package holds:**
  - the original conversation;
  - a readable record, including any side branches of the conversation;
  - project evidence and timestamps;
  - source hashes;
  - the attachments that were in the export;
  - an explicit omission for every missing asset.

  A record of the whole run sits outside `captures/`.
- **Assets.**
  - 69 assets are included.
  - 1,669 referenced assets are missing from the export, mostly voice recordings. Each is listed as an omission in its conversation's record.
  - One 174.6 MB legal PDF is too large for GitHub, so it stays only in the source store.
  - 77 export files (about 106 MB) belong to no conversation. They are listed with hashes but not staged.
- **Checks.**
  - The export is unchanged since the 2026-10-04 inspection.
  - All 334 packages verify against their checksums from a clean checkout. The global Git line-ending setting first rewrote some bytes, so I added a scoped `.gitattributes` and committed again.
  - 334 staged plus 0 exceptions equals 334.
- **`ki repo audit` does not pass in either repository**, because of findings that were already there. My changes add no new findings:
  - In acquire, the failures are GitHub settings, one older capture's front matter, and runtime activation that a worktree never has. The same categories fail on the unchanged checkout.
  - In the harness, a full audit can't run from a worktree based on origin/main, because the installed harness doesn't match it. Against a copy of local `main`, the focused roadmap and authoring audits pass for the record. The only roadmap failure is the existing `KI-HARNESS-GOV-181` body shape.
- **Commits, pushed fast-forward to `origin/main`:**
  - acquire: `b5158e6` enables the ChatGPT adapter and adds the converter; `bc23689` stages the captures.
  - ki-agentic-harness: `b99a0883` adds the bindings, the ticked steps and a dated checkpoint.

  My temporary worktrees and branches are removed. Nothing was read from or changed in ChatGPT or OpenAI, and nothing was written to ki-principal.

## In progress

Nothing is running.

The other session needs to reconcile two primary checkouts I didn't touch:

- ki-agentic-harness `main` is 16 ahead and 1 behind `origin/main`, so it must rebase or merge `b99a0883` before it pushes.
- acquire `main` is 2 behind and can fast-forward.

Out of scope and still open in the record:

- incremental acquisition and project enumeration;
- handling conversations that change after this export;
- triage in each receiving territory;
- one verified complete project move;
- the source-retirement gate.

## Needs

- **Needs-TOWER** - The Tower Game (15 conversations) is in `_review`, because the record left its receiver unresolved. Its chats are about the mobile idle game. Should it move to `personal`, which also holds `apps-tower.midnight.ninja`, or stay in `_review` until a game repository exists?
- **Needs-SPIRIT** - Personal - Spirituality (18 conversations) is in `personal` by its current name. The rename report offered `Sacred Inquiry - Spirituality`. Should it stay in personal, or move to sacred-inquiry?
- **Needs-ORPHANS** - 77 export files (about 106 MB: 47 PNG, 8 PDF, 6 JPEG, 6 text, 2 SVG, 1 MP4 and 7 unidentified) belong to no conversation. They stay in the source store and are listed in the receiver checkpoint. Should they be staged into `captures/_review/`, or left listed only?

```text
Needs-TOWER: personal | keep _review
Needs-SPIRIT: personal | sacred-inquiry
Needs-ORPHANS: stage to _review | list only
```
