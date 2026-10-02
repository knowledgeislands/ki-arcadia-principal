# Delta and Paperclip - initial KI assessment

Date: 2026-10-02

## Finding

[Delta](https://delta.dev/) occupies part of the same agent coordination space as [Paperclip](https://github.com/PaperclipAI/paperclip), but addresses a different layer. Paperclip coordinates companies, agents, tasks, execution and operational approvals. Delta centres a collaborative coding thread that holds the conversation, file changes, comments and review together. Paperclip explicitly leaves code review to a separate process. Delta could therefore complement the present KI coordination arrangement as a delivery and review interface; the available evidence does not support treating it as a Paperclip replacement.

This is a documentation-based assessment, not a product trial or an adoption decision.

## Fit against KI delivery criteria

- **Isolated execution.** Delta normally gives each thread a separate checkout and can use an existing Git worktree. Its managed checkout is nested under `.delta` in the local clone when one is connected. The KI delivery arrangement requires task-specific isolation and an authorised path into the designated primary checkout.
- **Independent review.** Delta supports contextual comments and review threads with approval or change-request verdicts. A KI trial must still establish that an independent reviewer assessed the exact candidate commit and that required verification ran against the proposed combined result.
- **Repository authority.** Delta's continuous history and Git commits are distinct. KI work records, decisions, acceptance and integration authority must remain in their owning repositories. A Delta review verdict cannot itself accept a KI work item or advance local `main`.
- **Data boundary.** Adding a project stores repository contents and thread history on Delta's servers. Sharing a thread can also grant access to other Delta worktree histories for its attached repository. This needs an explicit repository and data-scope choice before any KI project is connected.
- **Operational maturity.** Delta is in public beta. Repository-based access, remote runtime, CLI handoff, MCP and ACP support are listed as in progress. An evaluation should rely only on demonstrated features.

## Proposed evaluation boundary

If selected for a trial, use a non-sensitive test repository and one bounded delivery. Check the checkout location, starting revision, exact-commit review, verification evidence, handoff into the designated local checkout, and whether the resulting record is recoverable independently of Delta. Keep Paperclip's current company coordination and KI repository authority unchanged during that trial. No Delta installation, repository upload or live trial was performed for this assessment.

## Evidence

- [Paperclip overview](https://github.com/PaperclipAI/paperclip) - company orchestration, work system, governance, and explicit code-review boundary.
- [Delta core concepts](https://delta.dev/docs/concepts/core-concepts), [worktrees](https://delta.dev/docs/concepts/worktrees), and [Delta and Git](https://delta.dev/docs/concepts/delta-and-git) - thread, checkout, and Git relationships.
- [Delta on the web](https://delta.dev/docs/collaboration/delta-on-the-web) - review threads and verdicts.
- [Delta data storage](https://delta.dev/docs/privacy-and-security/data-storage) - server storage and shared-thread access scope.
- [Delta roadmap](https://delta.dev/roadmap) - public-beta status and features still in progress.
- [KI Agentic Harness operating choice](https://github.com/knowledgeislands/ki-agentic-harness/blob/51ae68eb0c49262a69ed915fb1ad43ff60f7185e/AGENTS.md) - current local delivery, review, integration and authority requirements.

## Disposition

Retain as incoming evaluation evidence. Promotion into Arcadia's canonical knowledge or a tool-adoption decision follows the [[Enactment Process]].
