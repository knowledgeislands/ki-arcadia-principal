# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › chezmoi › mark-tidy

**Run report at 21:27 BST · last mark 21:18 BST**

---

## Done

- **Paths compared with `origin/main`, and they are level.** `+/_CHECKPOINTS/rig.chezmoi.md` and `+/_THREADS/chezmoi/` match `origin/main`. `origin/main` is one commit ahead of the primary checkout, and that commit touches only mac-studio-bootstrap files. So there was nothing to take. `decisions.md` has nothing that exists only on `origin/main`: the working tree's copy only adds Kris's instruction of 2026-10-14 20:18Z. **Limitation:** I did not fetch. The run rules forbid any Git fetch, so this compares against the local `origin/main` ref as it last stood (latest commit 20:38 BST, 2026-10-14).
- **Checkpoint updated** in [rig.chezmoi.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.chezmoi.md):
  - The header now reads `Mark: 2026-10-14T20:18Z` and `ki-pmo read at daa63224`.
  - Current state adds two deliveries, taken from the `coord-style` and `apply-groups` reports. The first is the deployed `ki-coordinator` output style for [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md). The second is the Codex template fix, which also lists the changes the next apply will make.
  - The SVG handler is recorded as committed in Kris's `chore: update mgit config`.
  - GATE-PUSH is gone everywhere.
  - Decisions are described by their words and date.
  - The Thread working rules now follow the current ki-pmo:
    - the report heading;
    - the Context, Query and Options shape for queries;
    - the stacked reply block and the footer banner;
    - the cadence and the 5-minute heartbeat;
    - THREAD-TIDY;
    - committing everything the thread oversees, with the ki-principal gate exception.
  - Open queries: PUSH, RIGTEST and APPLY are added, and PUBLIC-VIEW, B-START, RIG-DECLARE and PROJECT-REG are kept. FORM and VAULT-LEFTOVERS are also added (see Queries). RIG-CASKS, PAPERCLIP-DRIFT and the two handoffs are kept as other open questions.
- **Thread folder tidied.** 31 answered and homed reports were deleted with `git rm` by explicit path: `codexbar`, `cswap-service`, `gate-baseline`, `hk-004-apply`, `hk-004`, `item2-handle`, `keychain-ssh`, `op-gsuite-rig`, `op-gsuite`, `plan-062`, `prep-062b`, `recategorise`, `rig-mise-locator`, `rig-vocab`, `secrets-project`, `triage-routine`, `ue-072`, `ue-079-declare`, `ue-085`, `ue077-approach`, `ue077-session`, `ue077-vaults`, `ue086-plan`, `vault-apply-2`, `vault-capture`, `vault-categories-2`, `vault-design-2`, `vault-inventory`, `vault-items`, `vault-plan` and `vault-revise`. Their queries are answered in the log, done in pruned or accepted records, or overtaken:
  - The `item2-handle` handle edit landed in a chezmoi commit.
  - The push queries are all on `origin/main`.
  - The `op-gsuite` orphaned cache file no longer exists.
  - The `_state-of-play.md` file that `secrets-project` asked about no longer exists.
  - `vault-apply-2` was a byte-identical copy of `vault-apply-3`.
- **Kept, with the reason:**
  - [decisions.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/chezmoi/decisions.md): always kept.
  - [apply-groups.report.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/chezmoi/apply-groups.report.md): PUSH, RIGTEST and APPLY. It is untracked, so it would need adding rather than deleting.
  - [coord-style.report.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/chezmoi/coord-style.report.md): FORM has no answer in the log.
  - [pmo-adopt2.report.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/chezmoi/pmo-adopt2.report.md): PROJECT-REG.
  - [ue086-a.report.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/chezmoi/ue086-a.report.md): PUBLIC-VIEW and B-START.
  - [vault-apply-3.report.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/chezmoi/vault-apply-3.report.md): its owner items have no logged answer and no durable home (VAULT-LEFTOVERS). I kept it rather than home them in haste.
- **Decided list drafted** at [decided-draft.md](/Users/krisbrown/.local/state/ki/agents/chezmoi/decided-draft.md). It has 55 rows covering every log entry in order, with consecutive entries on the same topic merged. Each row links to the decisions log, says where the decision now lives and notes when a later decision superseded it. It uses no decision numbers.
- **Checks:**
  - `rumdl check` passed on the checkpoint, the thread folder and the draft, after one line-length fix in the draft.
  - `ki repo audit --repo . --skill ki-checkpoint` has no finding for `rig.chezmoi.md`. It fails on four findings, all in other threads' checkpoints:
    - RECORD-2 in [platform-foundations.estate-factorisation.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/platform-foundations.estate-factorisation.md);
    - RECORD-2 and BOUNDARY-1 in [rig.mac-studio-bootstrap.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.mac-studio-bootstrap.md);
    - LIFECYCLE-1 in [knowledge-islands-model.observatory.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.observatory.md).
- **Nothing committed.** `git rm` stages its own deletions, so the 31 deletions are in the primary checkout's index, which already held other threads' staged files. Nothing else is staged. The checkpoint, `decisions.md`, this report and `apply-groups.report.md` are unstaged and uncommitted.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- Once ki-principal's gate passes, the coordinator commits the checkpoint, the 31 deletions, `decisions.md`, `apply-groups.report.md` and this report through a private index.
- The chezmoi primary checkout is 11 commits behind its local `origin/main` ref and has no local commits. The coordinator can fast-forward it when it is clean.
- Open queries carried in the checkpoint, unchanged by this run: RIGTEST, APPLY, PUBLIC-VIEW, B-START, RIG-DECLARE and PROJECT-REG. RIG-CASKS is with state-of-play, and PAPERCLIP-DRIFT is parked.

## Queries

### PUSH - close the apply-groups push query

**Context:** The `apply-groups` report asked to push the Codex-template fix, along with the output-style commit and the Paperclip-profile commit. The chezmoi source's local `origin/main` ref already holds all three, and the primary checkout is behind it with nothing unpushed. So someone has already pushed them, but I read this without a fetch.

**Query:** May the thread close PUSH as done?

**Options:**

a) (recommended) Close PUSH: the three commits are on `origin/main`.

b) Have a background agent fetch and confirm before closing.

### FORM - keep the output style as a symlink

**Context:** `~/.claude/output-styles/ki-coordinator.md` is deployed as a chezmoi symlink to the harness checkout for [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md). It never drifts from the harness. It dangles on a machine without `~/workspaces/knowledge-islands/ki-agentic-harness`, but the coordinator hook already has the same dependency. The `coord-style` report asked this and the log has no answer. The brief did not list FORM, so I added it to the checkpoint rather than lose it.

**Query:** Should the output style stay a symlink?

**Options:**

a) (recommended) Keep the symlink, then delete the `coord-style` report at the next mark.

b) Switch to a rendered copy through a background agent.

### VAULT-LEFTOVERS - give the remaining 1Password owner items a home

**Context:** The `vault-apply-3` report left items for Kris that have no logged answer:

- Move Tailscale, Zed and Git-radar out of the Personal inbox, and Claude out of Rig, into Personal - Kris.
- Say whose `Google` item is in Howden Browns, whose `Microsoft` item is in Retford Browns, and where the Directline business item belongs.
- Tick or drop the deferred plan sections 3 and 2c.

Two deleted reports also made suggestions: conceal the Telegram Valle Armonia Bot's plain-text fields, and check the categories of the signing-key and key-holding items. None of this is in a record yet.

**Query:** Where should these items live?

**Options:**

a) (recommended) Add them to the repeatable-triage idea in the [secrets-hygiene](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/secrets-hygiene.md) Project, then delete the `vault-apply-3` report at the next mark.

b) Answer them now in chat, and the thread logs the answers.

```text
PUSH

Close PUSH: the Codex-template fix, the output-style commit and the Paperclip-profile commit are already on chezmoi origin/main.

---

FORM

Keep ~/.claude/output-styles/ki-coordinator.md as a chezmoi symlink to the harness checkout for KI-PRINCIPAL-ECO-013, and delete the coord-style report at the next mark.

---

VAULT-LEFTOVERS

Add the vault-apply-3 owner items (the in-app moves, the Howden Browns Google and Retford Browns Microsoft owners, the Directline business item, the deferred sections 3 and 2c) and the Telegram bot field and key-category suggestions to the repeatable-triage idea in the secrets-hygiene Project, then delete the vault-apply-3 report at the next mark.
```

```text
╭─ run report · 2026-10-14T20:26:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] PUSH
- [waiting] FORM
- [waiting] VAULT-LEFTOVERS
- [waiting] RIGTEST
- [waiting] APPLY
- [waiting] PUBLIC-VIEW
- [waiting] B-START
- [waiting] RIG-DECLARE
- [waiting] PROJECT-REG
- [uncommitted] checkpoint and thread folder, held by the ki-principal gate; 31 deletions staged by `git rm`
- [held] `rig apply` on both Macs until a Rig release with the RIG-CASKS fix
- [parked] 1

```text
Resume Rig: chezmoi under current ki-pmo and ki-delegation since 2026-10-14T20:18Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
