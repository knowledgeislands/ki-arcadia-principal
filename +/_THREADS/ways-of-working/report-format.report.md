# report-format: reconcile the owner-reporting format into its canonical owner

## What has been done

- The canonical owner is the Reporting section of the `ki-delegation` background-run standard, [standards-background-runs.md](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md>), under `Owner report`, `Needs tags` and `Coordinating threads`. Reasoning: it already owned the Summary, Needs tags, resting point and linking rules for every coordinating thread and every background agent, it is installed in every territory's harness, and the ways-of-working design plans to move it with the rest of the thread material into `ki-pmo`, so one home moves as a unit. `communication.md` and the Codex equivalent keep only the level setting and point at it.
- Kris's text was recovered in full from the transcript (line 586, 08:19 UTC) and saved at `report-format.verbatim.md` in this run folder; the standard quotes it as a blockquote, keeping the two em dashes and the curly quotes inside the quotation only. The standard's own text writes `Outstanding - no action requested now` and `<tag> - <title>` with a spaced ASCII hyphen. Kris's field name is `Need from you`; the brief's `Need you` was a paraphrase, so the verbatim form is used.
- The standard now covers the three sections in order, the placement of routine open matters, per-query Summary, Need from you and Recommendation, the closing fenced reply block as a suggestion and not approval, the linking requirement with full identifiers and no invented links, Needs tags as the single query vocabulary, and how `quiet`, `standard` and `detailed` change only depth, with the per-update cadence under `quiet` unchanged.
- Background `.report.md` files adopt the shape, because the standard already states that the owner reads each agent's final report directly. Commit identifiers and check results stay in the report under `What has been done`. The run-packet file layout and the status line are unchanged, since they are not owner reports.
- Duplicates and conflicts replaced with pointers, one commit per repository, all pushed fast-forward:
  - `ki-agentic-harness` `70606d77`: standard, `SKILL.md`, four authority footers, `assets/run-prompt.md`, RUN-5 in `scripts/rubric/items/background-runs.ts`, regenerated `references/rubric.md`, `references/sources.md`.
  - chezmoi `c9010ff`: `dot_claude/private_communication.md`, `dot_claude/private_delegation.md.tmpl`, `dot_codex/private_AGENTS.md.tmpl`. `chezmoi diff` on the three targets showed only the four replaced report lines; applied to those targets only, and the diff is now empty.
  - `ki-principal` `70872d3`: [change-management-report.md](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-report.md>) PMO unit adopts the owner by reference, and the changes-after-review log records Decision 14.
  - `tools-ki` `e9d93d4`: the progress protocol `ki agent launch` appends (`src/core/agent/runs.ts`) now names the owner report instead of Done / Failed / Needs the owner. Prompt text only; `ki` runs from this checkout, so no release is needed.
- Checks: harness `bun run test` 1072 pass; `bunx tsc --noEmit` clean in the harness and `tools-ki`; `ki repo audit --skill ki-delegation`, `ki-skills` and `ki-authoring` pass in the harness (two pre-existing `ki-skills` refresh-cadence WARNs on other skills); `tools-ki` `bun run test` 1144 pass; `ki repo audit --repo .` in `ki-principal` shows the same two FAILs before and after the change, PRINCIPAL-2 and TOPICS-1, so nothing new. Every pre-commit hook ran and passed; no `--no-verify`.
- Limitations: `ki-checkpoint`, `ki-recap`, `ki-pulse`, `ki-tokenomics` and `ki-principal/Admin/Governance/` define no report shape, so nothing changed there; `ki-recap` keeps its own single-session Actions list, which the standard already distinguishes. The `ki-principal` audit the brief asked for reads GitHub live state for TOPICS-1; that is the audit's own call, not one I made. The brief asked for the `Claude Opus 5.5` co-author trailer and it was used as instructed.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- Receiver-owned work: the ways-of-working pilot moves the Reporting section into `ki-pmo`; when it does, the four pointers that name `ki-delegation` (`communication.md`, `delegation.md`, the Codex `AGENTS.md` and the `tools-ki` progress protocol) need re-pointing in that change.
- Receiver-owned work: the Equal Remedy master checkpoint [_state-of-play.md](</Users/krisbrown/workspaces/equal-remedy/er-principal/+/_CHECKPOINTS/_state-of-play.md>) line 32 still says "concise Done/Failed/Needs reporting". Checkpoints were excluded from this change; that thread's refresh rule picks up the new standard at its next checkpoint update.
- Verification limitation: the rubric's RUN-5 is a judgment item, so conformance of live reports is reviewed, not mechanically checked.
- Retained material: `report-format.verbatim.md` in this run folder holds Kris's full message for the archive step when the run closes.

## Outstanding queries

No outstanding queries.

```text
report-format: nothing to return - no instruction needed.
```
