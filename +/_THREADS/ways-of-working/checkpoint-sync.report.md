# checkpoint-sync - owner report (2026-10-14, 00:45 UTC)

Thread: KI Model: ways-of-working (`knowledge-islands-model.ways-of-working`). Repository: `ki-principal`, branch `main`.

## What has been done

- Rewrote the checkpoint [knowledge-islands-model.ways-of-working.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md) to match the decisions log and the seven finished agent reports. Settled questions are now described in words, with no decision numbers. `updated_at` is 2026-10-14T00:45:00Z; `created_at` is unchanged.
- Committed `42391ea` docs(checkpoint): sync ways-of-working thread with settled answers and agent reports. Staged by explicit path. Pushed fast-forward: `b203b70..42391ea` on `origin/main`. A first commit attempt was rejected by the commit-message hook for a body line over 100 characters; it was re-committed with the body wrapped, and no amend was used.
- Checks: rumdl fixed and passed; `ki repo audit` on `ki-principal` PASS=3 WARN=1 FAIL=0. The two STREAM-10 warnings (close-out assessments for the `paperclip-bootstrap-and-recovery` and `website` Projects) are pre-existing and unrelated. No en or em dashes, no decision numbers.
- Repository state checked: `ki-principal` level with origin before and after. `chezmoi` and `tools-ki` level with origin. `ki-agentic-harness` is ten commits ahead of `origin/main` (not pushed, see handoff).
- Pending handoff recorded in the checkpoint: `ki-agentic-harness`, this machine, branch `main`, ten unpushed commits.
- Not touched: any other checkpoint, `Admin`, `Pillars`, `Resources`, the decisions log, the agent run folders, and the untracked `+/diagrams/` folder in `ki-principal`.

## What is in progress

Nothing running. The checkpoint is in place for a fresh session to resume from.

Outstanding - no action requested now:

- Receiver-owned: the other session's commits `49fde031` and `df08e1e5` on the harness `main`, and its uncommitted harness skill-graph and rubric files. Left alone.
- Verification limitation: the checkpoint was not re-read by a fresh agent, so resume quality is not independently verified.
- Retained: `HEADROOM_COMPRESS_USER_MESSAGES` takes effect only after the Headroom restart that Kris will do.

## Outstanding queries

### ADOPT-181 - adopt KI-HARNESS-GOV-181

- Summary: [KI-HARNESS-GOV-181](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md) is in triage. Kris's words on the route were "EXPORT-ROUTE - (a) reuse Archify's Chrome route; open the deliver record."
- Need you: whether to adopt it now and at which horizon, or leave it in triage.
- Recommendation: adopt as `draft` at `next`, `kind: deliver`.

### PUSH-HARNESS-MAIN - push the harness main

- Summary: `ki-agentic-harness` `main` is ten commits ahead of origin. Eight are ours (`3beced0a` to `c44623ee`, and `71d7a0fd`); two are another session's (`49fde031`, `df08e1e5`). Kris's words: "wait for the other session; push ours once its commits land."
- Need you: push `main` as it stands, which publishes the other session's two commits as well, or wait until that session pushes.
- Recommendation: keep the hold.

### HOUSEKEEPING-DECLS - rename the old housekeeping declarations

- Summary: five repositories still declare `[skills.ki-work-housekeeping]`: legal-principal, apps-midnight.ninja, apps-rig.midnight.ninja, apps-tower.midnight.ninja, and the chezmoi source.
- Need you: rename in one sweep now, or in the naming wave.
- Recommendation: one sweep now, since it is mechanical.

### KI-RELEASE - release tools-ki

- Summary: installed `ki` 0.10.1 still requires `ki-design-loop` in its bootstrap list. The tools-ki fix (`f6d65d8`) is on origin but unreleased.
- Need you: release now.
- Recommendation: release now, so `ki bootstrap` works against the renamed harness.

### PRINCIPAL-ENACT - enact protected-zone renames

- Summary: protected-zone references to the old skill names need enactment through the Enactment Process: `Admin/Governance/Conventions/Streams Conventions/Streams Conventions.md:26`, `Admin/Governance/Decisions/GDR-KI-PRINCIPAL-005-the-roadmap-model.md:34`, `Admin/Operations/Processes/Enactment Process.md:25`, `Pillars/Philosophy/Model/Conventions/Structure/Structure.md:140`, `Pillars/Philosophy/Model/Processes/Enactment Process/Enactment Process.md:46`. Checkpoints `knowledge-islands-model.command-centre.md:42`, `platform-foundations.baseline-rollout.md:39` and `techne.agent-host.md:43` also name them, as does the website skills-by-outcome guide.
- Need you: approval to enact these as one bounded change, which needs a record under `ki-repo-kb-streams`.
- Recommendation: approve.

### PLAN-APPROVE - approve KI-PRINCIPAL-ECO-013

- Summary: [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) is planned to the Ready shape and stays `draft`. Kris's words: "review before grant."
- Need you: approve as written, or change with a note.
- Recommendation: approve, then grant delivery separately once the Headroom restart is done.

### CAPITALS - which Capitals declare ki-pmo

- Summary: with the coordinator hook now keyed to the `ki-pmo` declaration, a Capital that does not declare it loses the reminder on its master thread.
- Need you: (a) this island and the harness only, with the other territories waiting for Wave F; or (b) every Capital now, by a one-line handoff each.
- Recommendation: (a).

### STYLE-NAME - name the coordinator output style

- Summary: the plan uses `ki-coordinator` as the shipped output style name, so the per-turn style reminder reads as "coordinator style active".
- Need you: keep `ki-coordinator`, or name another.
- Recommendation: keep `ki-coordinator`.

Held: PAPERCLIP-REQ, until Wave F. No query raised.

```text
ADOPT-181 - adopt as draft at next, kind deliver | leave in triage
PUSH-HARNESS-MAIN - keep the hold | push main now
HOUSEKEEPING-DECLS - sweep now | leave for naming wave
KI-RELEASE - release now | hold
PRINCIPAL-ENACT - approve as one bounded change | hold
PLAN-APPROVE - approve | change: <note>
CAPITALS - (a) | (b)
STYLE-NAME - ki-coordinator | <other>
```
