# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › territory-hold

**Run report at 16:17 BST · last mark 16:14 BST**

---

## Done

- **Sweep:** all 23 repositories fetched (21 under `~/workspaces/knowledge-islands/`, chezmoi and acquire). None was ahead, none had a rebase or merge in progress, and none had a stash.
- **chezmoi:** it was 9 commits behind and clean, so I fast-forwarded it with Git only. I ran no `chezmoi apply` or `rig apply`. The commits it took include `feat(ssh): allow key logins only to each Mac's sshd`, so **a plain `chezmoi apply` on terra now turns SSH key-only on**. SSH-SPARE-KEY in the checkpoint now says so.
- **Checkpoints set to drained:** [KI Model: command-centre](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.command-centre.md), [registry-removal](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/registry-removal.md), [Techne: agent-host](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/techne.agent-host.md) and [Observatory: product](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.observatory.md). Each has a dated territory-hold line and Running: nothing. Techne: agent-host had already drained itself on 15 October, so its line says the hold only aligned its frontmatter. The other drained checkpoints are unchanged. ways-of-working had no uncommitted leftovers.
- **[Master: state-of-play checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/_state-of-play.md):**
  - It has a pick-up block first: status hold, mark 2026-10-15T15:14:39Z, the resume line and the four next steps.
  - Four queries are parked: FW-DECLARE-NOW, SSH-SPARE-KEY, ESTATE-MAP-OBSERVATORY and STASH-DROP.
  - FW-TERRA-OFF and FW-SSH-KEYONLY are marked answered.
  - "on sol" is gone from HOLD-MODEL, and the checkpoint reads drained with Running: nothing.
  - FW-DECLARE-NOW was not recorded anywhere, so I wrote it from the facts. The declaration is still absent from the chezmoi source.
- **Thread folder:** I deleted `fw-exposure.report.md` and `fw-rollout.report.md`, because their queries are answered in the decisions log. `ssh-keyonly.report.md` stays, because SSH-SPARE-KEY is still open.
- **Correction, decisions log:** the brief said to copy the machine-local log over the thread folder copy, but the thread folder copy was the newer one. My copy briefly removed Decision 238 (TERRITORY-HOLD) and Decision 239 (HOLD-PERSIST). I restored both word for word from the session record, and both copies now match through Decision 239.
- **Commit:** `465257f6 docs(checkpoint): drain state-of-play to the territory hold`, made through a private index by explicit path. The scoped gate passed on all 8 paths. The tree-wide audit still fails NOTE-1a on three `mac-studio-bootstrap` reports, which is outside this run's scope. Pushed fast-forward; nothing needed pulling.
- **Last check:** after the push, every repository reads ahead 0 and behind 0, with no rebase or merge in progress.

| Repo | Branch | Ahead | Behind | Dirty | Note |
| --- | --- | --- | --- | --- | --- |
| apps-knowledgeislands.info | main | 0 | 0 | 0 | |
| apps-observatory.local | main | 0 | 0 | 0 | |
| homebrew-tap | main | 0 | 0 | 0 | |
| ki-agentic-harness | main | 0 | 0 | 1 | untracked `+/_THREADS/skill-reviews/` |
| ki-principal | main | 0 | 0 | 1 | Rig: mac-studio-bootstrap's `chezmoi-fix.report.md`; ref `refs/rebase-repair/autostash-f091d468` kept |
| ki-specifications | main | 0 | 0 | 0 | |
| ki-techne-harness | main | 0 | 0 | 0 | |
| kw-website | main | 0 | 0 | 0 | |
| mcp-acquire-whatsapp | main | 0 | 0 | 0 | |
| mcp-git-audit | main | 0 | 0 | 0 | |
| mcp-gsuite | main | 0 | 0 | 0 | |
| mcp-housekeeping-chatgpt | main | 0 | 0 | 0 | |
| mcp-housekeeping-claude | main | 0 | 0 | 0 | |
| mcp-ki-kb-fs | main | 0 | 0 | 0 | |
| mcp-ki-kb-notion-mirror | main | 0 | 0 | 0 | |
| mcp-m365 | main | 0 | 0 | 0 | |
| tools-git-almanac | main | 0 | 0 | 0 | |
| tools-ki | main | 0 | 0 | 0 | |
| tools-mgit | main | 0 | 0 | 0 | |
| tools-rig | main | 0 | 0 | 0 | |
| tools-techne | main | 0 | 0 | 0 | |
| chezmoi | main | 0 | 0 | 0 | fast-forwarded 9 commits, not applied |
| acquire | main | 0 | 0 | 0 | |

## Parked

- **Next steps (pick-up block):**
  1. SOL-FIRST-CHURN.
  2. Work out the RESTART-SET pick-up model, then hand HOLD-MODEL, HOLD-VERBS, HOST-ROLES' write-up and RESTART-SET to KI Model: ways-of-working.
  3. Reinstate KI Model: ways-of-working, Rig: chezmoi and Acquire: acquire-intake; Rig: mac-studio-bootstrap carries on.
  4. Put the open queries back to Kris.
- **FW-DECLARE-NOW:** the firewall declaration is still uncommitted in chezmoi. Recommended: Rig: chezmoi commits it first on reinstatement.
- **SSH-SPARE-KEY:** add a second ed25519 key by hand to both Macs before any apply that turns SSH key-only. terra's source is now level, so the next apply would do it.
- **ESTATE-MAP-OBSERVATORY:** the Estate Map is not captured for the Observatory. Recommended: add it as an idea in the Command centre Project's Notes.
- **STASH-DROP:** drop the autostash ref once Rig: mac-studio-bootstrap commits its report. The stash list was already empty; only the ref remains.

## Left over

- **ki-principal:** `+/_THREADS/mac-studio-bootstrap/chezmoi-fix.report.md` is modified on terra. It belongs to Rig: mac-studio-bootstrap, which is live on another host, and I left it untouched. The same edit is kept in `refs/rebase-repair/autostash-f091d468`.
- **ki-agentic-harness:** the untracked `+/_THREADS/skill-reviews/` folder, last changed 14 October at 23:08, belongs to the archived skill-reviews thread. It holds briefs, reports, `decisions.md` and screenshots.
- No unpushed commits and no stashes anywhere.

## In Progress

Nothing is running.

## Queries

### HOLD-PERSIST-LEFTOVERS - persist the two leftover working files

**Context:** Kris's HOLD-PERSIST decision, logged after this brief, asks that no local working versions remain and that everything is committed and pushed, if necessary to branches. The brief told this run not to commit other threads' files, so two items remain on terra: the archived skill-reviews thread folder in ki-agentic-harness (untracked) and Rig: mac-studio-bootstrap's modified `chezmoi-fix.report.md` in ki-principal (that thread is live elsewhere, and a Git ref already keeps its edit).

**Query:** Should a run push the skill-reviews folder to a hold branch and leave the mac-studio-bootstrap edit to its own live thread?

**Options:**

a) (recommended) A run commits `+/_THREADS/skill-reviews/` in ki-agentic-harness on a new branch `hold/skill-reviews` and pushes that branch only, leaving `main` and the working tree untouched; Rig: mac-studio-bootstrap commits its own report.

b) Leave both as they are and name them at the baseline commit.

```text
HOLD-PERSIST-LEFTOVERS

A run commits the untracked +/_THREADS/skill-reviews/ folder in ki-agentic-harness on a new branch hold/skill-reviews, pushes only that branch to origin, and leaves main and the working tree untouched; Rig: mac-studio-bootstrap commits its own +/_THREADS/mac-studio-bootstrap/chezmoi-fix.report.md.
```

```text
╭─ run report · 2026-10-15T15:17:03Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▄ ▄▀▀▄ ▀█▀ █▄ █   · thread drained      │
│  █  █ █▀▀▄ █▄▄█  █  █ ▀█   · queries parked      │
│  █▄▄▀ █  █ █  █ ▄█▄ █  █   · ready to archive    │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [drained] nothing running or queued; committed and pushed
- [parked] 4 queries in the checkpoint
- [waiting] HOLD-PERSIST-LEFTOVERS
- [left over] mac-studio-bootstrap report in ki-principal; skill-reviews folder in ki-agentic-harness

```text
Resume Master: state-of-play from its checkpoint under current ki-pmo and ki-delegation since 2026-10-15T15:14:39Z: re-bootstrap, read the parked queries, take stock, restart authorised work, then banner.
```
