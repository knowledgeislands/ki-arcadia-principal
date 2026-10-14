# reply-stack: stacked reply block in owner reports

Project [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md). Background agent `reply-stack`, finished 2026-10-14T16:34Z.

## What has been done

- Opened [KI-HARNESS-GOV-190](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-190-stacked-reply-block.md) at horizon now as the deliver record for Kris's request, quoted in it: "Can we see the way that the default copy block is? So it's easier to use it. There's often quite a lot of detail now on per line."
- Rewrote the reply-block rule in `ki-delegation`'s Reporting section: one `text` block, each entry the Needs tag alone, a blank line, then the recommended instruction, entries separated by a blank line, `---` and a blank line, no `---` after the last, `No reply needed.` when there are no queries, with Kris's two-query example as the illustration. The Needs-tags paragraph now says a returned reply pairs each tag line with the instruction paragraph beneath it and that a bare "BOT-1 do it" still names its query. The owner-side reading needs no code change: nothing in the harness or `tools-ki` parses the reply block.
- Made the same change in `ki-pmo`'s standard, including the full summary's reply block and the `DEFAULTS` entry, in the `ki-coordinator` output style, in the hook line of `hooks/coordinator-reminder.sh` and its test, in `scripts/banner.test.ts`, which now asserts the stacked wording, and in RUN-4, with the `ki-delegation` rubric regenerated. Both skills' sources carry the review.
- PMO-6 was left as it is: no `ki-pmo` rubric item reviews the reply block, so there was nothing to reword and its generated rubric is already in sync.
- A search found no remaining `TAG - instruction` one-line example outside the rule text itself, and the catalogue and diagram stamps did not change because no skill frontmatter changed.
- Gates passed on the combined result: `bun run test` (1142 pass, 0 fail), `bunx tsc --noEmit`, the skill-graph check, the hook and banner tests (19 pass), and `ki repo audit --skill` for `ki-delegation`, `ki-pmo`, `ki-skills` and `ki-work-roadmap`. The `ki-skills` audit carries two pre-existing refresh-cadence warnings outside this scope.
- Closed KI-HARNESS-GOV-190 as done on the brief's "close it if verified". Committed as `b8d92be9` (ledger reserve) and `9caa7d67` (delivery) and pushed fast-forward to `origin/main`; origin carried nothing from anyone else.
- Untouched, as instructed: [KI-HARNESS-GOV-187](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-187-thread-model-and-banner.md) and [KI-HARNESS-GOV-188](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-188-report-record-links.md). The pre-existing untracked `+/diagrams/` folder from another session was left alone.

## What is in progress

Nothing is running.

Outstanding - no action requested now

- Coordinating threads already running adopt the stacked form at their next owner report; reports already written stay as they are.
- The hook line injected on each owner message is one clause longer.

## Outstanding queries

### REPLY-STACK - confirm the stacked reply block as delivered

**Summary:** [KI-HARNESS-GOV-190](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-190-stacked-reply-block.md) is closed as done on the brief's "close it if verified"; this report's reply block is the first live example of the form.

**Need from you:** confirmation that the stacked layout reads as you intended, or an edit to it.

**Recommendation:** confirm as delivered.

```text
REPLY-STACK

confirmed as delivered
```
