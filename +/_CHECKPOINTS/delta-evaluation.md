---
type: ki-checkpoint
thread: delta-evaluation
state: active
created_at: 2026-10-06T20:30:00Z
updated_at: 2026-10-06T20:35:00Z
---

# delta-evaluation

## Objective

Decide whether [Delta](https://delta.dev/) earns a bounded trial as a delivery and review interface alongside Paperclip, and route the outcome to its durable owner. Delta is assessed as a possible complement to the present KI coordination arrangement, not a Paperclip replacement.

## Current state

A documentation-only assessment was completed on 2026-10-02. No Delta installation, repository upload or live trial has been performed, and no adoption decision exists.

- **Layer.** Paperclip coordinates companies, agents, tasks, execution and operational approvals, and explicitly leaves code review to a separate process ([overview](https://github.com/PaperclipAI/paperclip)). Delta centres a collaborative coding thread that holds the conversation, file changes, comments and review together ([core concepts](https://delta.dev/docs/concepts/core-concepts)).
- **Isolated execution.** Delta normally gives each thread a separate checkout and can use an existing Git worktree; its managed checkout nests under `.delta` in a connected local clone ([worktrees](https://delta.dev/docs/concepts/worktrees)). KI delivery requires task-specific isolation and an authorised path into the designated primary checkout.
- **Independent review.** Delta supports contextual comments and review threads with approval or change-request verdicts ([Delta on the web](https://delta.dev/docs/collaboration/delta-on-the-web)). A trial must still show that an independent reviewer assessed the exact candidate commit and that required verification ran against the proposed combined result.
- **Repository authority.** Delta's continuous history and Git commits are distinct ([Delta and Git](https://delta.dev/docs/concepts/delta-and-git)). A Delta verdict cannot accept a KI work item or advance local `main`; work records, decisions, acceptance and integration stay in owning repositories, per the [harness operating choice](https://github.com/knowledgeislands/ki-agentic-harness/blob/51ae68eb0c49262a69ed915fb1ad43ff60f7185e/AGENTS.md).
- **Data boundary.** Adding a project stores repository contents and thread history on Delta's servers, and sharing a thread can grant access to other worktree histories for the attached repository ([data storage](https://delta.dev/docs/privacy-and-security/data-storage)).
- **Maturity.** Delta is in public beta; repository-based access, remote runtime, CLI handoff, MCP and ACP support are listed as in progress ([roadmap](https://delta.dev/roadmap)). Evaluation should rely only on demonstrated features.

Baseline for the re-evaluation, checked 2026-10-06:

- **Release.** Latest is `0.18.2` (2026-10-02, Windows crash diagnostics), after `0.18.1` (2026-10-02, subagent-merge memory and Grok fixes) and `0.18.0` (2026-09-30: subthread search, bookmarks, custom OpenAI- and Anthropic-compatible providers, Gemini via Google AI Studio, a terminal `delta` CLI, and subthreads no longer posting progress to their parent), per the [release notes](https://delta.dev/docs/whats-in-the-latest). Public beta began 2026-09-16 under the Delta Early Access Agreement.
- **Roadmap.** In progress: repository-based access, remote runtime, Delta CLI, MCP support, @mentions, ACP support. Up next: repository-level context, sandboxing, WSL support, conversation branching, graph view, read and view permissions. The roadmap still lists the CLI as in progress although `0.18.0` shipped a terminal `delta` command; check what that command covers before relying on it for handoff.

## Decisions made

- Paperclip's company coordination and KI repository authority stay unchanged during any trial.
- No KI project is connected to Delta without an explicit repository and data-scope choice.
- Kris decided on 2026-10-06 to wait a week and re-evaluate from the recorded baseline before deciding on a trial.

## Files touched

This record replaces the loose incoming note `+/delta-paperclip-assessment-2026-10-02.md`, which is removed; Git retains the original. No canonical KB content, roadmap record, tool configuration or Paperclip state is changed.

## Open questions

- Is a trial worth running now, given the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) on remote agent execution? Delta's hosted threads and server-side storage need checking against that policy before any trial.
- Which non-sensitive test repository and bounded delivery would exercise the criteria without exposing private content?
- Should the assessment be promoted into `Resources` as tool reference, or does it only become durable as part of an adoption or rejection decision?

## Next step

On or after 2026-10-13, re-read the release notes from `0.18.2` onwards and the roadmap, and report what changed against the baseline, especially for the in-progress items above, sandboxing, and the data-storage terms. Then ask Kris whether to trial Delta. If yes, capture a draft roadmap record through the [Enactment Process](<../../Admin/Operations/Processes/Enactment Process.md>) for one bounded delivery in a non-sensitive test repository, checking checkout location, starting revision, exact-commit review, verification evidence, handoff into the designated local checkout, and whether the resulting record can be recovered independently of Delta. If no, route the assessment summary to its durable home through the Enactment Process and remove this checkpoint.
