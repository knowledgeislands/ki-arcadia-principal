# mark-tidy (MARK-RULE capture and DIAGRAMS-TIDY) - report

## What has been done

- Kris's decision "MARK-RULE - yes, that reading; capture as a harness deliver record at next." is enacted as a capture only: [KI-HARNESS-GOV-184](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-184-working-area-marks.md>), kind deliver, horizon Next, status draft, baseline unset. It carries Goal, Context, Boundary, the six execution sections Next requires, and Discussion; Kris's words are quoted inline and no decision numbers appear. Nothing in `ki-delegation` or `ki-diagrams` was changed.
- Identifier taken from the ledger after a fetch: origin's high-water mark was 183, so the ledger advanced to 184 on its own commit before the record was written, as the ledger rule requires.
- Commits in `ki-agentic-harness`, explicit paths, co-author trailer, pre-commit hook passing (rumdl, `ki repo audit`): `d8f74e5f` chore(roadmap): reserve KI-HARNESS-GOV-184 work identifier; `46710fe7` docs(roadmap): capture KI-HARNESS-GOV-184 working-area marks. `ki repo audit --skill ki-work-roadmap` PASS with the record in place. `git pull --rebase` was a no-op; pushed fast-forward `86744bfd..46710fe7` to `origin/main`; the checkout is level with origin.
- Kris's decision "DIAGRAMS-TIDY - (b) delete scratch and rebuild the stale HTML after the push; keep +/diagrams/ visible." is enacted with one material finding: **the scratch was already gone when I started.** Neither `+/diagrams/` folder existed in `ki-agentic-harness` or `ki-principal`, and the harness-root `shot.ts` was absent; both `+/` directories carry an 08:06 modification time today, so something removed them before this run. No report in the thread's run folder claims the deletion. There was therefore nothing for me to delete, including the review rounds, the stale root receipts and `shot.ts`, and I can confirm only that `shot.ts` is not tracked (it never appears in Git history) and is referenced by nothing in the repository.
- Rebuilt the two stale HTML files from their committed sources by the `ki-diagrams` local route: `archify finalize architecture docs/diagrams/<slug>.architecture.json +/diagrams/<slug>/<slug>.html --repo-root <harness> --quality showcase --json`, with Archify's update check disabled so the run made no network call. Both pass all four gates (validate, deliver, check, browser-check) with zero diagnostics: [skill-graph.html](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/+/diagrams/skill-graph/skill-graph.html>) and [skill-map.html](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/+/diagrams/skill-map/skill-map.html>). Each folder holds the fresh finalize, finalize-summary, delivery and browser-check receipts beside its HTML; these are the rebuild's own evidence, not the stale root receipts the decision named.
- Early application of the mark rule: each rebuilt folder has a `mark.toml` sidecar naming the thread `KI Model: ways-of-working`, run `ways-of-working`, agent `mark-tidy`, the UTC time written and the committed source it was rebuilt from: [skill-graph/mark.toml](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/+/diagrams/skill-graph/mark.toml>), [skill-map/mark.toml](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/+/diagrams/skill-map/mark.toml>). KI-HARNESS-GOV-184 points at them as the worked example for the implementer.
- `+/diagrams/` stays visible: `.gitignore` untouched, the folder shows as untracked in the harness, nothing committed for this task.
- `ki-principal`: nothing to do and nothing touched. Its `change-management-skills` HTML, which the brief said to leave as current, was also already gone with the rest of `+/diagrams/`; I did not rebuild it, because the brief did not ask for it. The one dirty file there, `+/_CHECKPOINTS/platform-foundations.estate-factorisation.md`, belongs to another session and was left alone.
- Not touched: any checkpoint, `Admin`, `Pillars`, `Resources`, the decisions log, other repositories. No `--no-verify`, no force, no package install, no remote call other than the fetch and the one fast-forward push.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- Agent work: none remaining from this run.
- Receiver-owned: KI-HARNESS-GOV-184 waits at Next for `ki-plan` to shape it to Ready; its two open questions (one `writer` field or separate `run`/`agent`/`session`; TOML sidecar or front-matter-only Markdown) are in its Discussion for the plan to settle.
- Verification limitation: I did not re-export the SVGs from the rebuilt HTML or compare them with the committed SVGs; the brief asked for the HTML rebuild only. The committed SVGs are from this morning's Wave E re-export and the sources are unchanged since, so the HTML and SVG share a source.
- Retained material: the two rebuilt folders with receipts and marks, on disk and out of Git.

## Outstanding queries

### [PRINCIPAL-HTML](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-skills.architecture.json>) - the Principal's change-management-skills HTML is gone too

- Summary: the brief said to leave `ki-principal`'s `change-management-skills` interactive HTML in place as current. It had already been removed along with every other `+/diagrams/` folder in both repositories before this run started, by something that left no report. Its committed source and SVG are intact in the Project's design folder, so a rebuild by the same local route takes one command.
- Need from you: whether to rebuild it now, or leave it unbuilt until someone wants the interactive view.
- Recommendation: rebuild it, with a `mark.toml` sidecar like the harness ones, so the three living diagrams are all browsable and all marked; it is a one-command local step with no network.

```text
PRINCIPAL-HTML - <rebuild / leave> the ki-principal change-management-skills HTML under +/diagrams/ from Streams/Projects/ways-of-working/design/change-management-skills.architecture.json, with a mark.toml sidecar.
```
