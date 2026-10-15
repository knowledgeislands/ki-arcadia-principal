---

---

---

# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › hold-branches

**Run report at 22:15 BST · last mark 16:14 BST**

---

## Done

- **ki-agentic-harness `hold/2026-10-15/working-state`: folded the decisions log, discarded the rest, deleted.** I folded the archived skill-reviews thread's `decisions.md` to main as `+/_THREADS/skill-reviews/decisions.md` (`b868812e`, hooks passed, pushed fast-forward; the only commit in the push was mine). It holds Kris's verbatim review notes, and one of them (SRC-BADGE) is still open with no other home. I discarded the reports, briefs, screens and scratch. Their outcomes are on main: [KI-HARNESS-GOV-193 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/c0924316/docs/roadmap/KI-HARNESS-GOV-193-area-diagrams-with-html.md) was accepted (`c0924316`) after its functional-area and capability-group commits (`9a495773`, `58d41ccc`), and the catalogue was regenerated (`5ec6ad28`). Full `ki-` names now show on every diagram box. The ways-of-working decisions log holds the handover decisions. I deleted the remote branch. There was no local ref to delete.
- **ki-agentic-harness `hold/2026-10-15/retirement-preserved-territory-selection`: discarded and deleted.** All four commits are already on main in newer form: `68569d8a` closes the same 9 records and `58dbf350` prunes them (KI-HARNESS-OPS-005 keeps the merged Obscura trial section), `2ea38e86` drops the remote-adapter dependency, the roadmap focus commit is patch-identical on main, and `2a249ac4` is the rebased territory-membership commit. I deleted the remote branch. The source ref `refs/ki/retirement-preserved/territory-selection-codex-20261007-2133/harness` is no longer in the sol checkout.
- **ki-principal `hold/2026-10-15/working-state`: kept.** It holds Rig: mac-studio-bootstrap's uncommitted `+/_THREADS/mac-studio-bootstrap/chezmoi-fix.report.md`. That differs from main only in that each query's Summary, Need you and Recommendation are run together on one line, which reads like a formatter regression. The thread is live on sol, so I did not fold it. I left it entry 1 in `/Users/krisbrown/.local/state/ki/agents/mac-studio-bootstrap/inbox.md`, asking it to commit or discard from sol and tell state-of-play.
- **ki-principal `hold/2026-10-15/rebase-repair-autostash`: discarded and deleted.** The stash's working tree holds the same `chezmoi-fix.report.md` blob as the kept working-state branch (`a7ce2e6f`). Its index held only a staged deletion of `+/_THREADS/state-of-play/fw-exposure.report.md`, which main has since made in `465257f`. I deleted the remote branch.
- **`refs/rebase-repair/autostash-f091d468`: it can go.** Everything in it is either on main or on the kept working-state branch. The ref is no longer in the sol ki-principal checkout, so a drop may already have happened, or the ref lives in another checkout. I left it alone, because STASH-DROP is Kris's call.
- **ki-agentic-harness `automation/ki-v0.10.0` (reported only, not touched).** It has one commit, `5394d050 chore(ci): install ki v0.10.0` (2026-10-08), which changes only `.github/ki-version`. Main now pins `v0.10.4` (`2f85c068`), so the commit is stale. `automation/ki-v0.10.2` (pins `v0.10.2`) is stale for the same reason.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- ki-principal `hold/2026-10-15/working-state` stays until Rig: mac-studio-bootstrap commits or discards its `chezmoi-fix.report.md` from sol. Once it does, deleting the branch needs no further decision.

## Queries

### SRC-BADGE - capture the skill-diagram SRC badge replacement as a harness record

**Context:** on 2026-10-14 Kris reviewed the skill-area diagrams and said "there might be a better thing to use in the box rather than SRC1 ... the amount of code that's in them, or rubric rule sizes ... or stats about the thing". The skill-reviews thread turned this into SRC-BADGE, "replace the viewer's SRC badge with stable stats". The SRC badge is still in every `docs/diagrams/skill-area-*.html` on ki-agentic-harness main, and no roadmap record carries it. The only durable copy of Kris's words is now the folded `+/_THREADS/skill-reviews/decisions.md` (`b868812e`). The other review notes are done: the full `ki-` names and the Signals grouping are on main.

**Query:** should SRC-BADGE be captured as a ki-agentic-harness triage record?

**Options:**

a) (recommended) Ways-of-working captures it with `ki-next` as an unadopted KI-HARNESS triage record that cites the folded decisions log, and the record sets its own priority.
b) Drop it. The badge stays, and the folded log keeps the note as history only.

### STASH-DROP - drop `refs/rebase-repair/autostash-f091d468`

**Context:** the autostash ref in ki-principal holds two things. Its working-tree change to `chezmoi-fix.report.md` is byte-identical to the kept ki-principal `hold/2026-10-15/working-state` branch. Its staged deletion of `fw-exposure.report.md` is already on main (`465257f`). Nothing in it is unique. The ref is no longer in the sol checkout. Its remote copy, `hold/2026-10-15/rebase-repair-autostash`, has been deleted as superseded.

**Query:** may the ref be dropped wherever it still exists?

**Options:**

a) (recommended) Drop it. Any checkout that still holds `refs/rebase-repair/autostash-f091d468` deletes it with `git update-ref -d`, because main and the kept working-state branch hold all its content.
b) Keep it until Rig: mac-studio-bootstrap has settled `chezmoi-fix.report.md`, then drop it.

### AUTOMATION-BRANCHES - delete the stale ki pin branches in ki-agentic-harness

**Context:** `origin/automation/ki-v0.10.0` (`5394d050`) and `origin/automation/ki-v0.10.2` (`f6e44187`) each change only `.github/ki-version`, to `v0.10.0` and `v0.10.2`. Main already pins `v0.10.4` (`2f85c068`, "install ki v0.10.4 (#28)"). Merging either would downgrade the pin. On 2026-10-15 the hold-persist run pushed `automation/ki-v0.10.0` back to origin only to preserve it.

**Query:** may both remote automation branches be deleted?

**Options:**

a) (recommended) Delete `origin/automation/ki-v0.10.0` and `origin/automation/ki-v0.10.2` in ki-agentic-harness, because main's `v0.10.4` pin supersedes both.
b) Keep them as history. The pin automation that opens these branches ([KI-HARNESS-GOV-141 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/678a9b06/docs/roadmap/KI-HARNESS-GOV-141-auto-bump-released-ki-pin.md)) is done, and nothing in it deletes them.

```text
SRC-BADGE

Ways-of-working captures SRC-BADGE ("replace the viewer's SRC badge with stable stats", Kris 2026-10-14) with ki-next as an unadopted KI-HARNESS triage record citing ki-agentic-harness +/_THREADS/skill-reviews/decisions.md (b868812e), priority left to the record.

---

STASH-DROP

Drop refs/rebase-repair/autostash-f091d468 wherever it still exists (git update-ref -d), because main and ki-principal hold/2026-10-15/working-state hold all its content.

---

AUTOMATION-BRANCHES

Delete origin/automation/ki-v0.10.0 and origin/automation/ki-v0.10.2 in ki-agentic-harness, because main's v0.10.4 pin supersedes both.
```

```text
╭─ run report · 2026-10-15T21:13:52Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] SRC-BADGE
- [waiting] STASH-DROP
- [waiting] AUTOMATION-BRANCHES
- [held] ki-principal hold/2026-10-15/working-state until Rig: mac-studio-bootstrap settles chezmoi-fix.report.md
- [uncommitted] this report

```text
Resume state-of-play under current ki-pmo and ki-delegation since 16:14 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
