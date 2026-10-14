# trades-delta - trades hold and delta trial status (read-only), 2026-10-14 00:50 BST

Authority: Decision 157 (TRADES-DELTA), with Decision 158 (burn the roadmap down) as the lens. Read-only: nothing was changed, committed or pushed, and no remote call was made, so Delta's current release and roadmap were not re-read.

## What has been done

### Trades hold

- **What it is.** Since 2026-10-07 no new trades are sent between Knowledge Islands repositories. Work goes directly into the receiving repository or is recorded there, and every `.ki.toml` trade policy is stripped back to a bare `[skills.ki-trades]`. The full policy is kept in Git at ki-principal `76e399b`.
- **Where it stands.** The notice in ki-agentic-harness `skills/governance/ki-trades/SKILL.md` says "due for review by 2026-10-14" and was last changed on 2026-10-07 (`703f3d66`). From 2026-10-15, `HOLD-1` raises a WARN in every `ki repo audit` that includes ki-trades. The review is carried by the [skill-refresh](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/skill-refresh.md) Project. The reshape it would unlock, [trades-revamp](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/trades-revamp.md), is `planned` and waits on Kris agreeing a succinct policy form and retiring `map_bonus`.
- **Since 11 October.** No trade-related commits in ki-agentic-harness or tools-ki. The ki-principal commits only renamed the Capital and the identity, and aligned the follow-up date (`551a7e5`). Across all workspaces, one trade record is still on disk: [TRD-4c4d8f6c](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_TRADES/knowledgeislands/ki-agentic-harness/TRD-4c4d8f6c.md>), inbound from the harness. It is `received`, decided `retained` as GDR-KI-PRINCIPAL-005 on 2026-10-07, and can be released and pruned. No trade has been sent during the hold.

### Delta trial

- **What it is.** [delta-evaluation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/delta-evaluation.md) asks whether Delta, a hosted collaborative coding and review tool, earns one bounded trial next to Paperclip. Its outcome is met once Kris answers yes or no and the assessment has a durable home.
- **Where it stands.** `lifecycle: paused` since 2026-10-11 (Decisions 38 and 41), with no thread and no work record. The assessment is written in the Project Notes, and the decision is kept there as an idea. The Notes list the blockers: the Techne Programme Hold on remote agent execution; Delta storing repository contents and thread history on its servers; Delta being in public beta with CLI, MCP and remote runtime still in progress; and no test repository chosen.
- **Since 11 October.** Nothing. The re-evaluation from the 2026-10-06 baseline (Delta `0.18.2`), due at the 2026-10-13 decision point, did not happen. The only commit touching the note is `bb710a2` (Capital rename, 2026-10-13).

### Roadmap count, Knowledge Islands territory

From `ki repo -t knowledge-islands roadmap summary` (20 repositories, chezmoi not included):

| Measured | Source | Open (not done or cancelled) |
| --- | --- | --- |
| 2026-10-10 15:48 | `roadmap-triage` report | 25 (35 minus chezmoi 10) |
| 2026-10-12 05:48 | `ki-roadmap` report | 22 |
| 2026-10-12 07:01 | `roadmap-census` report | 19 |
| **2026-10-14 00:50** | **this run** | **33** (36 records, minus 3 done) |

- **Now, by state:** triage 12, draft 13, ready 3, in-progress 2, awaiting-review 3, done 3. If awaiting-review counts as done, as the standing rule says, 30 are open and 6 can be accepted and pruned.
- **Now, by repository:** ki-agentic-harness 11, tools-rig 7, ki-principal 5, ki-techne-harness 5, tools-ki 4, tools-techne 2, apps-observatory.local 1, ki-specifications 1. The other 12 repositories have none.
- **Trend:** 19 to 33 since the census, up 74%. That matches Decision 158's "about 50% growth" from the earlier 22 measure. The growth is mostly new triage: 12 triage records now, against none left after the census batches. The boundary-handoffs captures (Decision 155) account for at least four.

## What is in progress

Nothing. This run is finished.

## Outstanding queries

### TRADES-HOLD - release, extend or close the trades hold

- **Summary:** The hold's review date is today, and `HOLD-1` warns from tomorrow. Releasing it needs the trades-revamp policy reshape and a ki-trades refresh first, which is new work and runs against Decision 158. Closing trades for good would be a standards change across the harness, tools-ki and the Charter. Nobody has needed a trade during the hold.
- **Need from you:** release, extend with a date, or close.
- **Recommendation:** Extend to 2026-11-12, alongside the other hold reviews: one date edit in the ki-trades `SKILL.md` notice, done by a background agent in ki-agentic-harness. Keep trades-revamp `planned` with no records. In the same run, release and prune the retained TRD-4c4d8f6c, which is already done.

### DELTA-TRIAL - release, extend or close the Delta trial

- **Summary:** No trial can run under the Techne Programme Hold without a policy exception. Delta keeps repository contents on its servers and is still in beta. The re-evaluation due on 13 October did not happen, and a trial would be new scope under Decision 158.
- **Need from you:** release, extend with a date, or close.
- **Recommendation:** Close with the answer "no trial for now". Record the answer and the reasons in the Project's close-out, which gives the assessment its durable home and meets the outcome. Set delta-evaluation to `closed` and remove its idea. Revisit only if Paperclip's lack of code review becomes a real blocker. One background agent run in ki-principal; Kris's instruction stands in for an Enactment record.

```text
TRADES-HOLD: extend to 2026-11-12 and prune TRD-4c4d8f6c / release / close / other:
DELTA-TRIAL: close (no trial) / extend to <date> / release / other:
```
