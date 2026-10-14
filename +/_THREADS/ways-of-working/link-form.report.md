# link-form - owner report

Background run `link-form` for Project [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md). Window: the whole run. State: finished.

## What has been done

- **The pruned-record link form is now one rule everywhere in the harness.** Under Kris's decision of 2026-10-14, as received, "LINK-FORM / clickable GitHub link to the file at its last revision; KI-HARNESS-GOV-188's check accepts it. Perhaps the link text can be `KI-HARNESS-GOV-188 (pruned)`", a pruned record is linked as `[<FULL-ID> (pruned)](https://github.com/<owner>/<repo>/blob/<last revision>/<path>)`, the last revision being the last commit in which the file existed, usually the parent of the prune commit. The Project-note alternative is dropped on every surface.
- **Surfaces updated in `ki-agentic-harness`:** the `ki-pmo` standard's Links practice and Linking records section, which now quotes the decision; `ki-pmo`'s `SKILL.md`, sources review, PMO-7 rubric item and regenerated `rubric.md`; the PMO-7 context's comment and finding message; the coordinator reminder hook line, its test and the hook README; the `ki-coordinator` output style; and the `ki-delegation` owner-report Links rule, which restated the linking rule and now states the pruned form too.
- **The PMO-7 check accepts the new form and still flags the failures.** Its fixture now links two pruned records as `<FULL-ID> (pruned)` to GitHub blob URLs and passes; a pruned record left bare or linked to its missing local file remains a violation. No change to the check's logic was needed: a GitHub target is not a local path, so it is not tested for existence.
- **[KI-HARNESS-GOV-188](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-188-report-record-links.md)** quotes the decision in its Requirements and Current state, and its Goal, Steps and Review say the new form. Its status stays `awaiting-review`; this run accepted nothing.
- **Harness commit `8a8b2618`** on `main`, `docs(ki-pmo): link a pruned record as FULL-ID (pruned) to GitHub (KI-HARNESS-GOV-188)`, staged by explicit path and pushed fast-forward; `git log origin/main..HEAD` held only that commit before the push. The first commit attempt failed commitlint's header length and was retried with a shorter header before anything was recorded.
- **[KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md)** now sets the link printer's pruned-record output to the same form, replacing the `git show` locator in its requirement, step, acceptance line and open question, and quotes the decision. Commit `a41daf7` on `tools-ki` `main`, `docs(roadmap): set the link printer's pruned-record form (KI-TOOL-KI-CLI-127)`, pushed fast-forward after `git log origin/main..HEAD` showed only that commit.
- **Gates in `ki-agentic-harness`:** `bun run test` 1149 pass, 0 fail; `bunx tsc --noEmit` clean; the hook test and the PMO-7 fixtures 34 pass; `ki repo audit --skill` for `ki-pmo`, `ki-delegation` and `ki-work-roadmap` pass; `ki-skills` passes with the two pre-existing refresh-cadence warnings only. The skill-graph check ran through `ki repo audit --skill ki-repo-harness` and `ki-diagrams`, which pass with the two pre-existing DIAG-4 freshness warnings on the skill map and skill graph, the same ones recorded in [KI-HARNESS-GOV-188](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-188-report-record-links.md)'s verification.
- **Gate in `tools-ki`:** `ki repo audit --skill ki-work-roadmap` passes.
- **Not changed:** the personal communication rule in chezmoi defers to `ki-delegation` for how records are linked and does not restate the pruned form, so it needed no edit. The untracked `+/diagrams/` folder in the harness, which belongs to another session, was left alone.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- The chezmoi-managed copy of the `ki-coordinator` output style is a symlink template into the harness, so the new wording reaches Rig on the next `chezmoi apply`; this run made no chezmoi change.
- Existing reports under `+/_THREADS/` in the Capital that link pruned records to Project notes still pass PMO-7, because the check tests a local target only for existence; it does not yet insist on the `(pruned)` text or the GitHub form. Tightening it is a one-line change if Kris wants the check to enforce the form rather than accept it.

## Outstanding queries

No outstanding queries.

```text
No reply needed.
```
